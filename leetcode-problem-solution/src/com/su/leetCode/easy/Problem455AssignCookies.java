package com.su.leetCode.easy;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public class Problem455AssignCookies {

	public static void main(String[] args) {
		int [] g = {1,2,3};
		int [] s = {1,1};
		int n = findContentChildren(g,s);
		System.out.println(n);
	}
	
	public static int findContentChildren(int[] g, int[] s) {
		int child = 0;
		List<Integer> gList = new ArrayList<Integer>();
		List<Integer> sList = new ArrayList<Integer>();
		for(int i = 0, j = 0; (i< g.length || j < s.length); i++, j++){
			if(i < g.length){
				gList.add(g[i]);
			}
			if(j < s.length){
				sList.add(s[j]);
			}
		}
		
		Collections.sort(gList);
		Collections.sort(sList);
		
		int index = 0;
		for(Integer gi : gList){
			while(index < sList.size()){
				
				if(gi <= sList.get(index)){
					child ++;
					index ++; 
					break;
				}
				index ++;
			}
			
			if(index >= sList.size())
				break;
			
		}
		
		
		return child;
    }
}
