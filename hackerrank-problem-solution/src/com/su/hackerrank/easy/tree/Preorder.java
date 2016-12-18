package com.su.hackerrank.easy.tree;

public class Preorder {

	public static void main(String[] args) {
		Node node = new Node();
		node.data = 3;
		node.left = new Node();
		node.left.data = 5;
		node.right = new Node();
		node.right.data = 6;
		preOrder(node);
	}
	
	public static void preOrder(Node root) {
		if(root == null){
			return;
		}
		
		System.out.print(root.data + " ");
		preOrder(root.left);
		preOrder(root.right);
	}

}
