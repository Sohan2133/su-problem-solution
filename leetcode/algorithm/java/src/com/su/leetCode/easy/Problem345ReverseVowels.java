package com.su.leetCode.easy;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Problem345ReverseVowels {

	public static void main(String[] args) {
		System.out.println(reverseVowels("aA"));
	}
	
	public static String reverseVowels(String s) {
        char []charry = s.toCharArray();
        List<Character> vowels = new ArrayList<Character>(Arrays.asList('a', 'A', 'e', 'E', 'i', 'I', 'o', 'O','u', 'U'));
        for(int i = 0, j = s.length() - 1; i < j; ){
        	if(vowels.contains(charry[i]) && vowels.contains(charry[j])){
        		charry[i] = (char) (charry[i] ^ charry[j]);
        		charry[j] = (char) (charry[i] ^ charry[j]);
        		charry[i] = (char) (charry[i] ^ charry[j]);
        		i++;
        		j--;
        	}
        	else if(vowels.contains(charry[i]) && !vowels.contains(charry[j])) j--;
        	else if(!vowels.contains(charry[i]) && vowels.contains(charry[j])) i++;
        	else if(!vowels.contains(charry[i]) && !vowels.contains(charry[j])) {
        		i++;
        		j--;
        	}
        		
        }
        return new String(charry);
    }

}
