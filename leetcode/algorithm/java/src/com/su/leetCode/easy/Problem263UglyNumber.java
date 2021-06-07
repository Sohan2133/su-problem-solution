package com.su.leetCode.easy;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class Problem263UglyNumber {

	public static void main(String[] args) {
		System.out.println(isUgly(1));
	}
	
	public static boolean isUgly(int num) {
        boolean isUgly = true;
        Set<Integer> factors = new HashSet<Integer>();
        
        if(num < 1){
        	isUgly = false;
        }
        
        while(num > 1){
        	if(num % 2 == 0){
        		factors.add(2);
        		num = num/2;
        	}
        	
        	else if(num % 3 == 0){
        		factors.add(3);
        		num = num/3;
        	}
        	
        	else if(num % 5 == 0){
        		factors.add(5);
        		num = num/5;
        	}
        	
        	else{
        		factors.add(num);
        		break;
        	}
        }
        
        for(Integer factor : factors){
        	if(factor != 2 && factor != 3 && factor != 5){
        		isUgly = false;
        	}
        }
        
        return isUgly;
    }
}
