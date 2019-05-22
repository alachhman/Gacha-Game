using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class BattleStateMachine : MonoBehaviour
{
	public enum Act{
		wait,
		chooseAct,
		performAct,
		gameOver
	}
	public Act battleState;
	public Text winLoss;
	public List<TurnHandler> turnList = new List<TurnHandler>();
	public List<GameObject> UnitsInGame = new List<GameObject>();
	public List<GameObject> EnemiesInGame = new List<GameObject>();
    // Start is called before the first frame update
    void Start()
    {
		battleState = Act.wait;
		EnemiesInGame.AddRange(GameObject.FindGameObjectsWithTag("Enemy"));
		UnitsInGame.AddRange(GameObject.FindGameObjectsWithTag("Hero"));
    }

    // Update is called once per frame
    void Update()
    {
		endGame (EnemiesInGame, UnitsInGame);
		switch(battleState){
		case(Act.wait):
			if(turnList.Count > 0){
				battleState = Act.chooseAct;
			}
			break;
		case(Act.chooseAct):
			GameObject acter = GameObject.Find (turnList [0].Attacker);
			if (turnList [0].label == "Enemy") {
				EnemyStateMachine esm = acter.GetComponent<EnemyStateMachine> ();
				esm.target = turnList [0].Target;
				esm.currentState = EnemyStateMachine.State.acting;
			}
			if (turnList [0].label == "Hero") {
				UnitStateMachine usm = acter.GetComponent<UnitStateMachine> ();
				usm.target = turnList [0].Target;
				usm.currentState = UnitStateMachine.State.acting;
			}
			battleState = Act.performAct;
			break;
		case(Act.performAct):

			break;
		case(Act.gameOver):
			StartCoroutine (quit());
			break;
		}
    }
	public void CollectAction(TurnHandler turn){
		turnList.Add(turn);
	}
	public void endGame(List<GameObject> enemyList, List<GameObject> unitList){
		if(enemyList.Count == 0){
			winLoss.text = "Victory!";
			battleState = Act.gameOver;
		}
		if (unitList.Count == 0) {
			winLoss.text = "Loss...";
			battleState = Act.gameOver;
		}
	}
	IEnumerator quit(){
		yield return new WaitForSeconds (4);
		Application.Quit();
	}
}
