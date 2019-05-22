using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class basicMelee : basicAttack
{
	public basicMelee(){
		attackName = "Bash";
		attackDescription = "An ordinary attack.";
		attackDamage = 10f;
		attackCD = 0f;
	}
}
