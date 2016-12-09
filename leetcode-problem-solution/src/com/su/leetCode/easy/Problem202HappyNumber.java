package com.su.leetCode.easy;

import java.util.HashSet;
import java.util.Set;

public class Problem202HappyNumber {

	public static void main(String[] args) {
		System.out.println(isHappy(12));
	}
	
	public static boolean isHappy(int n) {
		Set<Integer> res = new HashSet<Integer>();
		res.add(n);
		
		while(n != 1){
			int squareSum = 0;
			while(n != 0){
				squareSum += (n%10)*(n%10);
				n /=10;
			}
			n = squareSum;
			if(res.contains(n)){
				break;
			}
			
			res.add(n);
		}
        return (n == 1);
    }
}
