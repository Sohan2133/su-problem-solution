package com.su.hackerrank.easy.tree;

public class Inorder {

	public static void main(String[] args) {
		Node node = new Node();
		node.data = 3;
		node.left = new Node();
		node.left.data = 5;
		node.right = new Node();
		node.right.data = 6;
		inOrder(node);
	}
	
	public static void inOrder(Node root) {
		if(root == null){
			return;
		}
		
		inOrder(root.left);
		System.out.print(root.data + " ");
		inOrder(root.right);
		
	}

}
