package com.su.leetCode.easy;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Problem349IntersectionTwoArrays {

	public static void main(String[] args) {
	
	}
	
	public static int[] intersection(int[] nums1, int[] nums2) {
        List<Integer> common = new ArrayList<Integer>();
        Map<Integer, Boolean> num2Map = new HashMap<Integer, Boolean>();
        
        for(int i : nums2){
        	num2Map.put(i, true);
        }
        
        for(int i : nums1){
        	if(num2Map.containsKey(i)){
        		common.add(i);
        		num2Map.remove(i);
        	}
        }
        
        int []n = new int[common.size()];
        int counter = 0;
        for(Integer i : common){
        	n[counter++] = i;
        }
        return n;
        
    }

}
