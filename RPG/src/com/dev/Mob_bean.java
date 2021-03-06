package com.dev;

public class Mob_bean {
	private int mob_code;
	private String mob_name;
	private int mob_lv;
	private int mob_str;
	private int mob_dex;
	private int mob_prop;
	private int mob_sk1;
	private int mob_sk2;
	private int mob_sk3;
	private String mob_sub;
	private int mob_atk;
	private int mob_def;
	private int mob_hp;
	private int mob_exp;
	public Mob_bean(int mob_code, String mob_name, int mob_lv, int mob_str, int mob_dex, int mob_prop, int mob_sk1,
			int mob_sk2, int mob_sk3, String mob_sub, int mob_atk, int mob_def, int mob_hp, int mob_exp) {
		super();
		this.mob_code = mob_code;
		this.mob_name = mob_name;
		this.mob_lv = mob_lv;
		this.mob_str = mob_str;
		this.mob_dex = mob_dex;
		this.mob_prop = mob_prop;
		this.mob_sk1 = mob_sk1;
		this.mob_sk2 = mob_sk2;
		this.mob_sk3 = mob_sk3;
		this.mob_sub = mob_sub;
		this.mob_atk = mob_atk;
		this.mob_def = mob_def;
		this.mob_hp = mob_hp;
		this.mob_exp = mob_exp;
	}
	public int getMob_code() {
		return mob_code;
	}
	public void setMob_code(int mob_code) {
		this.mob_code = mob_code;
	}
	public String getMob_name() {
		return mob_name;
	}
	public void setMob_name(String mob_name) {
		this.mob_name = mob_name;
	}
	public int getMob_lv() {
		return mob_lv;
	}
	public void setMob_lv(int mob_lv) {
		this.mob_lv = mob_lv;
	}
	public int getMob_str() {
		return mob_str;
	}
	public void setMob_str(int mob_str) {
		this.mob_str = mob_str;
	}
	public int getMob_dex() {
		return mob_dex;
	}
	public void setMob_dex(int mob_dex) {
		this.mob_dex = mob_dex;
	}
	public int getMob_prop() {
		return mob_prop;
	}
	public void setMob_prop(int mob_prop) {
		this.mob_prop = mob_prop;
	}
	public int getMob_sk1() {
		return mob_sk1;
	}
	public void setMob_sk1(int mob_sk1) {
		this.mob_sk1 = mob_sk1;
	}
	public int getMob_sk2() {
		return mob_sk2;
	}
	public void setMob_sk2(int mob_sk2) {
		this.mob_sk2 = mob_sk2;
	}
	public int getMob_sk3() {
		return mob_sk3;
	}
	public void setMob_sk3(int mob_sk3) {
		this.mob_sk3 = mob_sk3;
	}
	public String getMob_sub() {
		return mob_sub;
	}
	public void setMob_sub(String mob_sub) {
		this.mob_sub = mob_sub;
	}
	public int getMob_atk() {
		return mob_atk;
	}
	public void setMob_atk(int mob_atk) {
		this.mob_atk = mob_atk;
	}
	public int getMob_def() {
		return mob_def;
	}
	public void setMob_def(int mob_def) {
		this.mob_def = mob_def;
	}
	public int getMob_hp() {
		return mob_hp;
	}
	public void setMob_hp(int mob_hp) {
		this.mob_hp = mob_hp;
	}
	public int getMob_exp() {
		return mob_exp;
	}
	public void setMob_exp(int mob_exp) {
		this.mob_exp = mob_exp;
	}
}