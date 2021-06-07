package com.su.leetCode.medium;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class problem422DissaperNumber {
	public static void main(String []args){
		int []nums = {4,3,2,7,8,2,3,1};
		for(Integer a : findDisappearedNumbers(nums)){
			System.out.println(a);
		}
	}
	
	public static List<Integer> findDisappearedNumbers(int[] nums) {
		List<Integer> res = new ArrayList<Integer>();
		int n = nums.length;
		int []unique = new int[n];
		for(int i = 0; i<n; i++){
			int index = nums[i];
			unique[index-1] = index;
		}
		
		for(int i = 0; i<n ;i++){
			if(unique[i] == 0)
				res.add(i+1);
		}
        return res;
    }
	
	public static List<Integer> findDisappearedNumbers1(int [] nums){
		List<Integer> res = new ArrayList<Integer>();
		for(int i = 0; i<nums.length; i++){
			int index = Math.abs(nums[i]) - 1;
			if(nums[index] > 0){
				nums[index] = -nums[index];
			}
		}
		
		for(int i = 0; i<nums.length; i++){
			if(nums[i] > 0){
				res.add(i+1);
			}
		}
		return res;
	}
}
