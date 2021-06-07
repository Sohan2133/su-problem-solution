package com.su.leetCode.easy;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Problem350IntersectTwoArrays2 {

	public static void main(String[] args) {
		int []nums1 ={1, 2, 2, 1};
		int []nums2 = {2,2,3,1,2};
		for(int nums : intersect(nums1, nums2))
			System.out.println(nums);
	}
	
	public static int[] intersect(int[] nums1, int[] nums2) {
        List<Integer> res = new ArrayList<Integer>();
        Map<Integer, Integer> rootCount = new HashMap<Integer, Integer>();
        for(int num : nums1){
        	Integer count = rootCount.get(num);
        	count = (count == null) ? 1 : count + 1;
        	rootCount.put(num, count);
        }
        
        for(int num : nums2){
        	Integer count = rootCount.get(num);
        	if(count > 0){
	        	count --;
	        	rootCount.put(num, count);
	        	res.add(num);
        	}
        }
        
        int []n = new int[res.size()];
        int i = 0;
        for(Integer num : res){
        	n[i] = num;
        	i++;
        }
        return n;
    }
}
