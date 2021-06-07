package com.su.hackerrank.easy.tree;

public class Postorder {

	public static void main(String[] args) {
		Node node = new Node();
		node.data = 3;
		node.left = new Node();
		node.left.data = 5;
		node.right = new Node();
		node.right.data = 6;
		postOrder(node);
	}
	
	public static void postOrder(Node root) {
		if(root == null){
			return;
		}
		postOrder(root.left);
		postOrder(root.right);
		System.out.print(root.data + " ");
	}

}
