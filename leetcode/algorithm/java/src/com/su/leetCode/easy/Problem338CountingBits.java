package com.su.leetCode.easy;

public class Problem338CountingBits {

	public static void main(String[] args) {
		countBits(5);
//		for(int i : countBits(5))
//		System.out.println(i);
	}
	
	public static int[] countBits(int num) {
		int []bits = new int[num + 1];
		for(int i = 1; i<=num; i++) {
			bits[i] = bits[i>>1] + (i&1);
		}
		return bits;
    }
}
