using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemyStateMachine : MonoBehaviour
{
	public BaseEnemy enemy;
	private BattleStateMachine machine;
	public enum State{
		processing,
		waiting,
		chooseAction,
		acting,
		dead,

	}
	public State currentState;
	//ATB references
	private float cur_CD = 0f;
	private float max_CD = 5f;
	public bool isAlive = true;
	private Vector3 startingPos;
	private bool actionStarted = false;
	public GameObject target;
	private float animSpeed = 5f;
    // Start is called before the first frame update
    void Start()
    {
		currentState = State.processing;
		machine = GameObject.Find("BattleManager").GetComponent<BattleStateMachine>();
		startingPos = transform.position;
    }

    // Update is called once per frame
    void Update()
    {
		switch(currentState){
			case(State.processing):
				UpgradeProgressBar();
				break;
			case(State.waiting):

				break;
			case(State.chooseAction):
				ChooseAction();
				currentState = State.waiting;
				break;
			case(State.acting):
				StartCoroutine(performAction());
				break;
			case(State.dead):
				onDeath ();
				break;
		}
    }
	void UpgradeProgressBar(){
		cur_CD = cur_CD + Time.deltaTime;
		float calc_CD = cur_CD / max_CD;
		if(cur_CD >= max_CD){
			currentState = State.chooseAction;
		}

	}
	void ChooseAction(){
		TurnHandler attack = new TurnHandler();
		attack.Attacker = enemy.name;
		attack.label = "Enemy";
		attack.AttackersGO = this.gameObject;
		attack.Target = machine.UnitsInGame[Random.Range(0, machine.UnitsInGame.Count)];
		int atkIndex = Random.Range (0, enemy.movePool.Count);
		attack.chosenAction = enemy.movePool [atkIndex];
		Debug.Log (this.gameObject.name + " has chosen " + attack.chosenAction + " and does " + attack.chosenAction.attackDamage + " to " + attack.Target);
		machine.CollectAction(attack);
	}
	private IEnumerator performAction(){
		if(actionStarted){
			yield break;
		}
		actionStarted = true;
		Vector3 targetPos = new Vector3(target.transform.position.x - 1.0f, target.transform.position.y , target.transform.position.z);
		while(MoveToEnemy(targetPos)){
			yield return null;
		}
		yield return new WaitForSeconds(0.5f);
		DoDamage ();
		Vector3 firstPos = startingPos;
		while(MoveToEnemy(firstPos)){
			yield return null;
		}
		machine.turnList.RemoveAt(0);
		machine.battleState = BattleStateMachine.Act.wait;
		actionStarted = false;
		cur_CD = 0f;
		currentState = State.processing;
	}
	private bool MoveToEnemy(Vector3 target){
		//Debug.Log(enemy.name + " has taken action");
		return target != (transform.position = Vector3.MoveTowards(transform.position, target, animSpeed * Time.deltaTime));
	}

	void DoDamage(){
		float damage = enemy.currATK * machine.turnList[0].chosenAction.attackDamage - (machine.turnList[0].Target.GetComponent<UnitStateMachine>().unit.currDEF * 2);
		target.GetComponent<UnitStateMachine> ().takeDamage (damage);
	}
	public void takeDamage(float damage){
		enemy.curHP -= damage;
		if(enemy.curHP <= 0){
			currentState = State.dead;
		}
	}
	public void onDeath(){
		if (!isAlive) {
			return;
		} else {
			this.gameObject.tag = "DeadEnemy";
			machine.EnemiesInGame.Remove (this.gameObject);
			//implement cant activate skill
			for (int i = 0; i < machine.turnList.Count; i++) {
				if (machine.turnList [i].AttackersGO == this.gameObject) {
					machine.turnList.Remove (machine.turnList [i]);
				}
			}
			SpriteRenderer thisSprite = gameObject.GetComponentInChildren<SpriteRenderer> ();
			thisSprite.enabled = false;
			isAlive = false;
		}
	}
}