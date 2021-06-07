package com.su.leetCode.easy;

import java.util.ArrayList;
import java.util.List;

public class Problem415AddStrings {

	public static void main(String[] args) {
		System.out.println(addStrings("0", "0"));
	}
	
	public static String addStrings(String num1, String num2) {
        StringBuilder sb = new StringBuilder();
        int i = num1.length() - 1;
        int j = num2.length() -1;
        List<Character> resChar = new ArrayList<Character>();
        int carray = 0;
        
        while(i >= 0 || j >= 0){
        	int chAsInt1 = 0;
        	int chAsInt2 = 0;
        	if(i >= 0){
        		chAsInt1 = num1.charAt(i) - '0';
        	}
        	
        	if( j >= 0){
        		chAsInt2 = (num2.charAt(j) - '0');
        	}
        	
        	int sum = chAsInt1 + chAsInt2 + carray;
        	carray = sum/10;
        	resChar.add((char)(sum%10 + '0'));
        	i--;
        	j--;
        }
        
        if(carray > 0){
        	resChar.add((char)(carray + '0'));
        }
        
        for(int k = resChar.size() - 1; k >= 0; k--){
        	sb.append(resChar.get(k));
        }
        
        return sb.toString();
    }
	
	public static String addStrings1(String num1, String num2) {
		StringBuilder sb = new StringBuilder();
		int carry = 0;
		for(int i = num1.length() - 1, j = num2.length() ; i >=0 || j >= 0 || carry == 1; i--, j--){
			int x = (i < 0 ) ? 0 : num1.charAt(i) - '0';
			int y = (j < 0) ? 0 : num2.charAt(j) - '0';
			sb.append((x + y + carry) / 10);
			carry = (x + y + carry) % 10;
			
		}
		return sb.reverse().toString();
	}

}
