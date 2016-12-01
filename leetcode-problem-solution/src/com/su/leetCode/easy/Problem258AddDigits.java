package com.su.leetCode.easy;

public class Problem258AddDigits {

	public static void main(String[] args) {
		System.out.println(addDigits(19));
	}
	
	public static int addDigits(int num) {
        int sum = 0;
        while (true){
	        for(; num > 0; num = num/10){
	        	int a = num%10;
	        	sum = sum + a;
	        }
	        if(sum < 10)
	        	break;
	        num = sum;
	        sum = 0;
        }
        return sum;
    }

}
