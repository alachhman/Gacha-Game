using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[System.Serializable]
public class BaseUnit{
	public string name;
	public string assetName;
	public string id;
	public int level;
	public float maxHP;
	public float curHP;

	public enum Element{
		Wind,
		Fire,
		Water,
		Light,
		Dark
	}
	public Element unitElement;

	public float baseATK;
	public float currATK; 
	public float baseDEF;
	public float currDEF;
	public float baseSPD;
	public float currSPD;

	public List<basicAttack> movePool = new List<basicAttack>();
}
