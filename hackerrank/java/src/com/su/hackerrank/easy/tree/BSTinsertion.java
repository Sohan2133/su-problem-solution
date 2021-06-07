package com.su.hackerrank.easy.tree;

import java.util.Deque;
import java.util.LinkedList;

public class BSTinsertion {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}
	
	public static Node Insert1(Node root,int value)
    {
	   if(root == null){
		   root = new Node();
		   root.data = value;
		   return root;
	   }
	   
	   Deque<Node> eq = new LinkedList<Node>();
	   eq.push(root);
	   while(!eq.isEmpty()){
		   Node currNode = eq.pop();
		   if(currNode.left == null && currNode.data >= value){
			   currNode.left = new Node();
			   currNode.left.data = value;
			   break;
		   }
		   if(currNode.left != null){
			   eq.add(currNode.left);
		   }
		   if(currNode.right == null && currNode.data < value){
			   currNode.right = new Node();
			   currNode.right.data = value;
			   break;
		   }
		   if(currNode.right != null){
			   eq.add(currNode.right);
		   }
	   }
       return root;
    }
	
	public static Node Insert(Node root,int value){
		if(root == null){
			Node node = new Node();
			node.data = value;
			node.left = null;
			node.right = null;
			root = node;
		}
		
		if(root.data >= value){
			root.left = Insert(root.left, value);
		}
		
		if(root.data < value){
			root.right = Insert(root.right, value);
		}
		return root;
		
	}
	
}
