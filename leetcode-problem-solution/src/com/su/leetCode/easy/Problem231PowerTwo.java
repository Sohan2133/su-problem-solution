package com.su.leetCode.easy;

public class Problem231PowerTwo {

	public static void main(String[] args) {
		System.out.println(isPowerOfTwo(256));
	}
	
	public static boolean isPowerOfTwo(int n) {
        return ( n > 0 && (Math.pow(2, 31) % n) == 0);
    }
}
