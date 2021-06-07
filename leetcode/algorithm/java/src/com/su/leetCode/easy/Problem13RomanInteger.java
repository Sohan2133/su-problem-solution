package com.su.leetCode.easy;

import java.util.HashMap;
import java.util.Map;

public class Problem13RomanInteger {

	public static void main(String[] args) {
		System.out.println(romanToInt("MCMXIV"));
	}
	
	public static int romanToInt(String s) {
		int intValue = 0;
		Map<String, Integer> rootRImap = new HashMap<String, Integer>();
		rootRImap.put("I", 1);
		rootRImap.put("IV", 4);
		rootRImap.put("V", 5);
		rootRImap.put("VI", 6);
		rootRImap.put("IX", 9);
		rootRImap.put("X", 10);
		rootRImap.put("XL", 40);
		rootRImap.put("L", 50);
		rootRImap.put("XC", 90);
		rootRImap.put("C", 100);
		rootRImap.put("CD", 400);
		rootRImap.put("D", 500);
		rootRImap.put("CM", 900);
		rootRImap.put("M", 1000);
		
		s = s.toUpperCase();
		char []chArray = s.toCharArray();
		char ch1 = 'I';
		char ch2 = 'V';
		int value = 0;
		for(int i = 0; i < chArray.length; ){
			ch1 = chArray[i];
			StringBuilder sb = new StringBuilder();
			sb.append(ch1);
			if(rootRImap.get(sb.toString()) != null){
				value = rootRImap.get(sb.toString());
				i++;
			}
			
			if(i < chArray.length){
				ch2 = chArray[i];
				sb.append(ch2);
				if(rootRImap.get(sb.toString()) != null){
					value = rootRImap.get(sb.toString());
					i++;
				}
			}
			intValue  += value;
		}
		return intValue;
    }
	
	public static int romanToInt1(String s) {
		int total = 0;
		char []chArray = s.toCharArray();
		int []nums = new int[s.length()];
		for(int i = 0; i < s.length(); i++){
			switch (s.charAt(i)) {
			case 'I':
				nums[i] = 1;
				break;
			case 'V':
				nums[i] = 5;
				break;	
			case 'X':
				nums[i] = 10;
				break;
			case 'L':
				nums[i] = 50;
				break;	
			case 'C':
				nums[i] = 100;
				break;
			case 'D':
				nums[i] = 500;
				break;
			case 'M':
				nums[i] = 1000;
				break;
			}
		}
		
		for(int i = 0; i < nums.length - 1; i++){
			if(nums[i] < nums[i + 1]){
				total -= nums[i];
			}
			else{
				total += nums[i];
			}
		}
		return total + nums[nums.length - 1];
	}
}
