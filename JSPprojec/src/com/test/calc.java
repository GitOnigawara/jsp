package com.test;

import java.util.*;

public class calc {
	
	public static String sum(List<Integer> num) {
		int total = 0;
		for(int i = 0; i < num.size(); i++) {
			total += num.get(i);
		}
		return String.valueOf(total);
	}
	
}