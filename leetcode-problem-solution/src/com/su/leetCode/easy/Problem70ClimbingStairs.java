package com.su.leetCode.easy;

public class Problem70ClimbingStairs {

	public static void main(String[] args) {
		System.out.println(climbStairs(120));
	}
	
	public static int climbStairs(int n) {
        int totalWays = 0;
        for(int i = n; i>=0; i--){
        	for(int j = 0; j <= n; j++){
        		int sum = i*1 + 2*j;
        		if(sum < n){
        			continue;
        		}
        		else if(sum == n){
        			totalWays ++;
        			break;
        		}
        		
        		else if(sum > n){
        			break;
        		}
        	}
        }
        return totalWays;
    }
}
