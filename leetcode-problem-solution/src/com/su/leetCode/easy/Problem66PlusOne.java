package com.su.leetCode.easy;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Problem66PlusOne {

	public static void main(String[] args) {
		
	}
	
	public static int[] plusOne(int[] digits) {
		List<Integer> plusOne = new ArrayList<Integer>();
		int carray = 1;
		for(int i = digits.length - 1; i >= 0; i--){
			int digit = digits[i] + carray;
			carray = digit /10;
			plusOne.add(digit % 10);
		}
		if(carray > 0){
			plusOne.add(carray);
		}
		Collections.reverse(plusOne);
		int []resDigits = new int[plusOne.size()];
		int index = 0;
		for(int i  : plusOne){
			resDigits[index ++] = i;
		}
        return resDigits;
    }
	
	public static int[] plusOne1(int[] digits) {
		int n = digits.length;
		for(int i = n - 1; i>=0; i--){
			if(digits[i] < 9){
				digits[i] ++;
				return digits;
			}
			digits[i] = 0;
		}
		
		int []newNumber = new int[n+1];
		newNumber[0] = 1;
		return newNumber;
	}
}
