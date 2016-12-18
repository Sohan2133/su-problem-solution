package com.su.hackerrank.easy.tree;

public class TopView {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}
	
	private static void top_view(Node root)
	{
	  if(root == null){
		  return ;
	  }
	  
	  top_view(root.left);
	  System.out.println(root.data);
	  right_top_view(root);
	}
	
	private static void right_top_view(Node root){
		if(root == null){
			return;
		}
		right_top_view(root.right);
		System.out.println(root.data);
	}

}
