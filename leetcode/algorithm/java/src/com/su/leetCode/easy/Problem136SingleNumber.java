package com.su.leetCode.easy;

import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;


public class Problem136SingleNumber {

	public static void main(String[] args) {
		int []nums = {1,2,3,1,2,3,4};
		System.out.println(singleNumber1(nums));
	}
	
	public int singleNumber(int[] nums) {
        Map<Integer, Integer> countMap = new HashMap<Integer, Integer>();
        for(int i = 0; i < nums.length; i++){
        	
        	if(countMap.containsKey(nums[i])){
        		countMap.remove(nums[i]);
        	}
        	
        	else{
        		countMap.put(nums[i], 1);
        	}
        }
		
        for(Entry<Integer, Integer> entry : countMap.entrySet()){
        	return entry.getKey();
        }
        
        return 0;
    }
	
	public static int singleNumber1(int [] nums){
		for(int i = 1; i<nums.length; i++){
			nums[0] = nums[0]^nums[i];
		}
		
		return nums[0];
	}

}
