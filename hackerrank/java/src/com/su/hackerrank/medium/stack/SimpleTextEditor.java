package com.su.hackerrank.medium.stack;

import java.util.Scanner;
import java.util.Stack;

public class SimpleTextEditor {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int q = sc.nextInt();
		Stack<StackNode> backup = new Stack<>();
		StringBuilder sb = new StringBuilder("");
		for(int i = 0; i<q; i++){
			int type = sc.nextInt();
			int k = (type == 2 || type == 3) ? sc.nextInt() : 0;
			switch (type) {
			case 1:
				String s = sc.next();
				sb.append(s);
				backup.push(new StackNode(s, 1));
				break;
			case 2:
				int len = sb.length();
				backup.push(new StackNode(sb.substring(len - k), 2));
				sb.replace(len - k, len, "");
				break;
			case 3:
				System.out.println(sb.toString().charAt(k-1));
				break;
			case 4:
				StackNode node = backup.pop();
				len = node.str.length();
				if(node.query == 1){
					sb.replace(sb.length() - len, sb.length(), "");
				}
				else{
					sb.append(node.str);
				}
			}
		}
		sc.close();
	}
	
	public static class StackNode{
		String str;
		int query;
		public StackNode(String str, int query) {
			this.str = str;
			this.query = query;
		}
	}

}


