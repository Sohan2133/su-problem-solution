package com.su.leetCode.easy;

public class Problem326PowerThree {

	public static void main(String[] args) {
		System.out.println(isPowerOfThree1(821));
	}
	
	public static boolean isPowerOfThree(int n) {
		
		while ((n > 1) && (n % 3 == 0)){
			n /= 3;
		}
		
		return (n == 1);
    }
	
	public static boolean isPowerOfThree1(int n) {
		return (n > 0 && (Math.pow(3, 19) % n == 0));
	}
}
