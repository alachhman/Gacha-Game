using System.Collections;
using System.Collections.Generic;
using UnityEngine.UI;
using UnityEngine;

public class UnitStateMachine : MonoBehaviour
{
	public BaseUnit unit;
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
	public Image progressBar;
	public Image HPBar;
	public Text HPText;
	private Vector3 startingPos;
	private bool actionStarted = false;
	public GameObject target;
	private float animSpeed = 5f;
	private bool isAlive = true;
    void Start()
    {
		currentState = State.processing;
		machine = GameObject.Find("BattleManager").GetComponent<BattleStateMachine>();
		startingPos = transform.position;
		UpgradeHPBar ();
    }
    void Update()
    {
		switch(currentState){
			case(State.processing):
				UpgradeProgressBar();
				break;
			case(State.waiting):

				break;
			case(State.chooseAction):
				ChooseAction ();
				currentState = State.waiting;
				break;
			case(State.acting):
				StartCoroutine (performAction ());
				break;
			case(State.dead):
				onDeath ();
				break;
		}
    }
	void UpgradeProgressBar(){
		cur_CD = cur_CD + Time.deltaTime;
		float calc_CD = cur_CD / max_CD;
		progressBar.transform.localScale = new Vector3(Mathf.Clamp(calc_CD, 0, 1), progressBar.transform.localScale.y, progressBar.transform.localScale.z);
		if(cur_CD >= max_CD){
			currentState = State.chooseAction;
		}
	}
	void UpgradeHPBar(){
		float calc_HP = unit.curHP / unit.maxHP;
		HPBar.transform.localScale = new Vector3(Mathf.Clamp(calc_HP, 0, 1), HPBar.transform.localScale.y, HPBar.transform.localScale.z);
		HPText.text = unit.curHP.ToString () + "/" + unit.maxHP.ToString();
	}
	void ChooseAction(){
		TurnHandler attack = new TurnHandler();
		attack.Attacker = unit.name;
		attack.label = "Hero";
		attack.AttackersGO = this.gameObject;
		attack.chosenAction = new basicMelee ();
		attack.Target = machine.EnemiesInGame[Random.Range(0, machine.EnemiesInGame.Count)];
		//print (target.name);
		machine.CollectAction(attack);
	}
	private IEnumerator performAction(){
		if(actionStarted){
			yield break;
		}
		actionStarted = true;
		Vector3 targetPos = new Vector3(target.transform.position.x + 1.0f, target.transform.position.y , target.transform.position.z);
		while(MoveToEnemy(targetPos)){
			yield return null;
		}
		yield return new WaitForSeconds(1f);
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
		//Debug.Log(unit.name + " has taken action");
		return target != (transform.position = Vector3.MoveTowards(transform.position, target, animSpeed * Time.deltaTime));
	}
	void DoDamage(){
		float damage = unit.currATK * machine.turnList[0].chosenAction.attackDamage - (machine.turnList[0].Target.GetComponent<EnemyStateMachine>().enemy.currDEF * 2);
		target.GetComponent<EnemyStateMachine> ().takeDamage (damage);
		Debug.Log (unit.name + " deals " + damage + " to " + target.name);
	}

	public void takeDamage(float damage){
		unit.curHP -= damage;
		UpgradeHPBar ();
		if(unit.curHP <= 0){
			currentState = State.dead;
		}
	}
	public void onDeath(){
		if (!isAlive) {
			return;
		} else {
			this.gameObject.tag = "DeadUnit";
			machine.UnitsInGame.Remove (this.gameObject);
			//implement cant activate skill
			for (int i = 0; i < machine.turnList.Count; i++) {
				if (machine.turnList [i].AttackersGO == this.gameObject) {
					machine.turnList.Remove (machine.turnList [i]);
				}
			}
			this.gameObject.GetComponentInChildren<SpriteRenderer> ().color = new Color32 (105, 105, 105, 255);
			string SpriteName = "Sprites/" + unit.assetName + "/" + unit.id + "_dead";
			Sprite deathSprite = Resources.Load<Sprite> (SpriteName);
			this.gameObject.GetComponentInChildren<SpriteRenderer> ().sprite = deathSprite;

			isAlive = false;
		}
	}
}
