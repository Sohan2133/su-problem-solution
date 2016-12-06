package com.su.leetCode.easy;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Problem453MinimumArrayElements {

	public static void main(String[] args) {
		int []n = {5,3,3};
		System.out.println(minMoves(n));
	}
	
	public static int minMoves(int[] nums) {
        int totalMoves = 0;
        List<Integer> elements = new ArrayList<Integer>();
        
        for(int num : nums){
        	elements.add(num);
        }
        Collections.sort(elements);
        int counter = 1;
        
        for(int i = elements.size() - 1; i > 0; i--){
        	int diff = elements.get(i) - elements.get(i-1);
        	totalMoves += diff*counter;
        	counter ++;
        }
        return totalMoves;
    }

}
