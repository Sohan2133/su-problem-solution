package com.su.leetCode.easy;

public class Problem342PowerFour {

	public static void main(String[] args) {

	}
	
	public boolean isPowerOfFour(int num) {
        return ((num &(num - 1)) == 0) && (num > 0) && ((num - 1) % 3) == 0;
    }

}
