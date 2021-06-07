package com.su.leetCode.easy;

public class Problem371Summation {

	public static void main(String[] args) {
		System.out.println(getSum(2, 2));
	}
	
	public static int getSum(int a, int b) {
		if (a == 0) return b;
		if (b == 0) return a;

		while (b != 0) {
			int carry = a & b;
			a = a ^ b;
			b = carry << 1;
		}
		
		return a;
		
//		int x = 1;
//		int ci = 0;
//		int result = 0;
//		int mask = 0;
//		int i = 0; 
//		
//		while((a != 0) && (b!=0)){
//			int ai = x&a;
//			int bi = x&b;
//			int sumi = ai ^ bi ^ ci;
//			ci = ai&bi;
//			sumi = sumi << i;
//			result = result | sumi;
//			a = a>>1;
//			b = b>>1;
//			i++;
//		}
//		
//        return result;
    }

}
