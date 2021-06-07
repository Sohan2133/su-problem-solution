package com.su.leetCode.easy;

public class Problem283moveZeroe {

	public static void main(String[] args) {
		
	}
	
	public void moveZeroes(int[] nums) {
        int []temp = new int[nums.length];
        int counter = 0;
        for(int i = 0; i<nums.length; i++){
        	if(nums[i] != 0){
        		temp[counter] = nums[i];
        		++counter;
        	}
        }
        
        for(int i = 0; i<temp.length; i++){
        	nums[i] = temp[i];
        }
        
        for(int i = temp.length; i<nums.length; i++){
        	nums[i] = 0;
        } 
    }
	
	public void moveZeroes1(int []nums){
		int jump = 0;
		for(int i = 0; i<nums.length; i++){
			if(nums[i] == 0){
				jump ++;
			}
			else {
				nums[i - jump] = nums[i];
			}
		}
		
		for(int i = nums.length -1 ; i >= jump; i--){
			nums[i] = 0;
		}
	}

}
