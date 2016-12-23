package com.su.leetCode.medium;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;


public class ProblemMinimumMoves {

	public static void main(String[] args) {
		int []nums = {1,2,3,4};
		System.out.println(minMoves21(nums));
	}
	
	public static int minMoves2(int[] nums) {
        int minMove = 0;
        List<Integer> numList = new ArrayList<Integer>();
        for(int num : nums) numList.add(num);
        Collections.sort(numList);
        int mid = numList.get(nums.length / 2);
        for(Integer num : numList) minMove += Math.abs(mid - num);
        return minMove;
    }
	
	public static int minMoves21(int[] nums) {
        Arrays.sort(nums);
        int i = 0, j = nums.length-1;
        int count = 0;
        while(i < j){
            count += nums[j]-nums[i];
            i++;
            j--;
        }
        return count;
    }

}
