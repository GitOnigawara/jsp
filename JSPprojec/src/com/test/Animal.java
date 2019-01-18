package com.test;

public class Animal {

	private String	kind;
	private int 	leg;
	private String	food;
	
	public Animal() {
		
	}
	public Animal(String kind, int leg) {
		this.kind	= kind;
		this.leg	= leg;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public int getLeg() {
		return leg;
	}
	public void setLeg(int leg) {
		this.leg = leg;
	}
	public String getFood() {
		return food;
	}
	public void setFood(String food) {
		this.food = food;
	}
	
}
