package com.su.leetCode.easy;

public class Problem27RemoveElement {

	public static void main(String[] args) {
		int []n = {2,3,4,3};
		System.out.println(removeElement(n, 3));
	}
	
	public static int removeElement(int[] nums, int val) {
        int resLen = nums.length;
        for(int i = 0; i < resLen; i++){
        	while(nums[i] == val && i < resLen){
        		nums[i] = nums[--resLen];
        	}
        }
        return resLen;
    }
}
