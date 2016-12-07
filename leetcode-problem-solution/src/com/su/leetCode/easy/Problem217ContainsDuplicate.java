package com.su.leetCode.easy;

import java.util.HashMap;
import java.util.Map;

public class Problem217ContainsDuplicate {

	public static void main(String[] args) {
		int []n = {1,2,3,2};
		System.out.println(containsDuplicate(n));
	}
	
	public static boolean containsDuplicate(int[] nums) {
		Map<Integer, Integer> valueCount = new HashMap<Integer, Integer>();
		for(int num : nums){
			if(valueCount.get(num) !=null){
				return true;
			}
			valueCount.put(num, 1);
		}
        return false;
    }
}
