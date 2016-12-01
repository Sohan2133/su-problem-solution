package com.su.leetCode.easy;

public class Problem344ReverseString {

	public static void main(String[] args) {
		System.out.println(reverseString("hello"));
		char []ch = new char[1];
		ch[0] = 'i';
		ch[0] = (char) (ch[0] ^ ch[0]);
		ch[0] = (char) (ch[0] ^ ch[0]);
		ch[0] = (char) (ch[0] ^ ch[0]);
		System.out.println(ch[0]);
	}
	
	public static String reverseString(String s) {
        char[]ch = s.toCharArray();
        int begin = 0; 
        int end = s.length() - 1;
        while(end > begin){
        	ch[begin] = (char) (ch[begin] ^ ch[end]);
        	ch[end] = (char)(ch[begin] ^ ch[end]);
        	ch[begin] = (char)(ch[end] ^ ch[begin]);
        	begin ++;
        	end --;
        	
        }
        return new String(ch);
    }

}
