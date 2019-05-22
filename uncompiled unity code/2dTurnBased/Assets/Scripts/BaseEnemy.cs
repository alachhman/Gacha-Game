 using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[System.Serializable]
public class BaseEnemy{
	public string name;

	public float maxHP;
	public float curHP;

	public enum Element{
		Wind,
		Fire,
		Water,
		Light,
		Dark
	}
	public enum Rarity{
		Normal,
		Rare,
		SuperRare,
		UltraRare
	}

	public Element enemyelement;
	public Rarity enemyRarity;

	public float baseATK;
	public float currATK; 
	public float baseDEF;
	public float currDEF;
	public float baseSPD;
	public float currSPD;

	public List<basicAttack> movePool = new List<basicAttack>();
}
