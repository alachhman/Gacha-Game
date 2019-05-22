using System.Collections;
using System.Collections.Generic;
using UnityEngine;
[System.Serializable]
public class TurnHandler{
    
	public string Attacker;
	public string label;
	public GameObject AttackersGO;
	public GameObject Target;

	//which attack is performed
	public basicAttack chosenAction;
}
