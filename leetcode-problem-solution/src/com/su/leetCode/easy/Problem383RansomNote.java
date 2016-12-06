package com.su.leetCode.easy;

import java.util.HashMap;
import java.util.Map;

public class Problem383RansomNote {

	public static void main(String[] args) {
		System.out.println(canConstruct("aab", "bbd"));
	}
	
	public static boolean canConstruct(String ransomNote, String magazine) {
       Map<Character, Integer> rMap = new HashMap<Character, Integer>();
       Map<Character, Integer> mMap = new HashMap<Character, Integer>();
       for(int i = 0, j = 0; i<ransomNote.length() || j < magazine.length(); i++, j++ ){
    	   
    	   if(i < ransomNote.length()){
    		   char ch = ransomNote.charAt(i); 
    		   int count = (rMap.get(ch) == null) ? 1 : rMap.get(ch) + 1;
    		   rMap.put(ch, count);
    	   }
    	   
    	   if(j < magazine.length()){
    		   char ch = magazine.charAt(i); 
    		   int count = (mMap.get(ch) == null) ? 1 : mMap.get(ch) + 1;
    		   mMap.put(ch, count);
    	   }
       }
       
       for(int i = 0; i<ransomNote.length(); i++){
    	   char ch = ransomNote.charAt(i);
    	   if(!mMap.containsKey(ch))
    		   return false;
    	   else if(rMap.get(ch) > mMap.get(ch))
    		   return false;
       }
       return true;
    }
}
