package com.su.leetCode.easy;

public class Problem171ExcelSheetColumnNumber {

	public static void main(String[] args) {
		System.out.println(titleToNumber1("CA"));
	}
	
	public static int titleToNumber(String s) {
        
        String s1 = s.toUpperCase();
        char []chArray = s1.toCharArray();
        int totalNum = (chArray[chArray.length - 1] - 'A') + 1;
        int d = 1;
        for(int i = chArray.length - 2; i >= 0; i--){
        	int charValue = (chArray[i] - 'A') + 1;
        	totalNum += charValue*Math.pow(26, d);
        	d++;
        }
        return totalNum;
    }
	
	public static int titleToNumber1(String s) {
	    
        int result  = 0;
        for (int i = 0; i < s.length(); i++){
            result *= 26;
            result += ((s.charAt(i) - 'A') + 1);    
        }
    
        return result;
    }

}
