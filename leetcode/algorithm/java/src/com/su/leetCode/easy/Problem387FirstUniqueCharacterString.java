package com.su.leetCode.easy;

public class Problem387FirstUniqueCharacterString {

	public static void main(String[] args) {
		System.out.println(firstUniqChar("loveleetcode"));

	}
	
	public static int firstUniqChar(String s) {
		int []n = new int[26];
		char []chArray = s.toCharArray();
		for(char ch : chArray){
			n[ch - 'a'] = n[ch - 'a'] + 1;
		}
		
		int index = 0;
		for(char ch : chArray){
			if(n[ch - 'a'] == 1){
				return index;
			}
			index ++;
		}
        return -1;
    }
}
