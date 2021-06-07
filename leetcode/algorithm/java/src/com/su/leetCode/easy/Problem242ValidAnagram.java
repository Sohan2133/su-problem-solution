package com.su.leetCode.easy;

public class Problem242ValidAnagram {

	public static void main(String[] args) {
		System.out.println(isAnagram("anagram", "nagaram"));
	}
	
	public static boolean isAnagram(String s, String t) {
		int sl = s.length();
		int tl = t.length();
        if(sl != tl)
        	return false;
        
        int []ns = new int[26];
        int []nt = new int[26];
        
        for(int i = 0; i<sl ; i++){
        	ns[s.charAt(i) - 'a'] += 1;
        	nt[t.charAt(i) - 'a'] += 1;
        }
        
        for(int i = 0; i<tl; i++){
        	if(ns[s.charAt(i) - 'a'] != nt[s.charAt(i) - 'a'])
        			return false;
        }
		return true;
    }
}
