package com.su.hackerrank.easy.stack;

import java.util.Scanner;
import java.util.Stack;

public class BalanceBracket {

	public static void main(String[] args) {
		Scanner in = new Scanner(System.in);
        int t = in.nextInt();
        for(int a0 = 0; a0 < t; a0++){
            String s = in.next();
            int len = s.length();
            if(len %2 == 1){
            	System.out.println("NO");
            	continue;
            }
            Stack<Character> stack = new Stack<>();
            char topElement = 0;
            for(int i = 0; i < len; i++){
            	if(!stack.isEmpty()) topElement = stack.peek();
            	stack.push(s.charAt(i));
            	if(stack.size() > 1){
            		if((topElement == '{' && stack.peek() == '}') 
            				|| (topElement == '(' && stack.peek() == ')') 
            				|| (topElement == '[' && stack.peek() == ']')){
            			stack.pop();
                		stack.pop();
            		}
            	}
            }
            
            if(stack.isEmpty())System.out.println("YES");
            else System.out.println("NO");
        }
        in.close();
	}
	

}
