package com.su.hackerrank.easy.tree;

public class TreeHeight {

	public static void main(String[] args) {

	}
	
	private static int getHeight(Node root) {
		if(root == null){
			return 0;
		}
		if(root.left == null && root.right == null){
			return 0;
		}
		return 1 + Math.max(getHeight(root.left), getHeight(root.right));
	}
}	
