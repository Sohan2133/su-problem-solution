package com.su.leetCode.easy;

public class Problem191NumberOneBits {

	public static void main(String[] args) {
		System.out.println(hammingWeight1(3));
	}
	
	public static int hammingWeight(int n) {
        int totalOneBits = 0;
        String bs = Integer.toBinaryString(n);
        for(char ch : bs.toCharArray()){
        	if(ch == '1')
        		totalOneBits ++;
        }
        return totalOneBits;
    }
	
	public static int hammingWeight1(int n){
		int total = 0;
		while(n != 0){
			total = total + (n & 1);
			n = n>>1;
		}
		return total;
	}
}
