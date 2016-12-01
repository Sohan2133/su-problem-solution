package com.su.leetCode.medium;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Problem422DuplicateInArray {

	public static void main(String[] args) {
		int []n = {4,3,2,7,8,2,3,1};
		for(int a : findDuplicates1(n)){
			System.out.println(a);
		}
	}
	
	public static List<Integer> findDuplicates1(int[] nums) {
		Map<Integer, Integer> countMap = new HashMap<Integer, Integer>();
		List<Integer> duplicate = new ArrayList<Integer>();
		
		for(int i = 0; i < nums.length; i++){
			
			if(countMap.containsKey(nums[i])){
				duplicate.add(nums[i]);
			}
			else {
				countMap.put(nums[i], 1);
			}
		}
        return duplicate;
    }
	
	public static List<Integer> findDuplicates2(int []nums){
		List<Integer> res = new ArrayList<Integer>();
		for(int i = 0; i<nums.length; ++i){
			int index = Math.abs(nums[i]) - 1;
			if(nums[index] < 0){
				res.add(index + 1);
			}
			nums[index] = - nums[index];
		}
		return res;
	}
}
