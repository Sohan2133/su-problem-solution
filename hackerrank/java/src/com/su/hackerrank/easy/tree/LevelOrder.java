package com.su.hackerrank.easy.tree;

import java.util.Deque;
import java.util.LinkedList;
import java.util.Queue;

public class LevelOrder {

	public static void main(String[] args) {
	}
	
	private static void LevelOrder(Node root)
    {
  
      Deque<Node> eq = new LinkedList<Node>();
      eq.push(root);
      while(!eq.isEmpty()){
		  Node currNode = eq.pop();
		  System.out.print(currNode.data + " ");
		  if(currNode.left != null){
			  eq.add(currNode.left);
		  }
		  if(currNode.right != null){
			  eq.add(currNode.right);
		  }
      }
      
    }
	
	private void test(Node root){
		Queue queue=new LinkedList(); 
		queue.add(root); 
		while(!queue.isEmpty()) 
		{ 
		Node tempNode=(Node)queue.poll(); 
		System.out.print(tempNode.data+" "); 
		if(tempNode.left!=null) 
		queue.add(tempNode.left); 
		if(tempNode.right!=null) 
		queue.add(tempNode.right); 
		}
	}

}
