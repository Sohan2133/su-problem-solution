package com.su.leetCode.easy;

import java.util.HashMap;
import java.util.Map;

public class Problem169MajorityElement {

	public static void main(String[] args) {
		int []n = {1, 2, 1, 3, 1};
		System.out.println(majorityElement1(n));
	}
	
	public static int majorityElement(int[] nums) {
        Map<Integer, Integer> eleValue = new HashMap<Integer, Integer>();
        int max = 0;
        int maxElement = nums[0];
        
        for(int num : nums){
        	int value = (eleValue.get(num) == null) ? 1 : eleValue.get(num) + 1;
        	eleValue.put(num, value);
        	
        	if(max < value){
        		maxElement = num;
        		max = value;
        	}
        }
		return maxElement;
    }
	
	//using more voting algorithm ...
	public static int majorityElement1(int[] nums) {
		int count = 1;
		int major = nums[0];
		
		for(int i = 1 ; i<nums.length; i++){
			if(count == 0){
				major = nums[i];
				count ++;
			}
			
			else if(major == nums[i])
				count ++;
			else
				count --;
			
		}
		
		return major;
	} 
}
