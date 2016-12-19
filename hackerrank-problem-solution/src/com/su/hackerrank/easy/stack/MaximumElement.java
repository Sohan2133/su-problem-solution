package com.su.hackerrank.easy.stack;

import java.util.Scanner;
import java.util.Stack;

public class MaximumElement {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		Stack<Integer> stack = new Stack<>();
		int max = Integer.MIN_VALUE;		
		int n = sc.nextInt();
		for(int i = 0; i<n ; i++){
			int type = sc.nextInt();
			switch (type) {
			case 1:
				int value = sc.nextInt();
				stack.push(value);
				max = Math.max(max, value);
				break;
			case 2:
				if(max == stack.pop()){
					max = Integer.MIN_VALUE;
					for(int x : stack) max = Math.max(max, x);
				}
				break;
			case 3:
				System.out.println(max);
			}
		}
		sc.close();
	}

}
