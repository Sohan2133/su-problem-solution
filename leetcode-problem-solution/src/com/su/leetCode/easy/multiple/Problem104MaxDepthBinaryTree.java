package com.su.leetCode.easy.multiple;

import java.util.Deque;
import java.util.LinkedList;

public class Problem104MaxDepthBinaryTree {
	static int length = 0;
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}
	
	public static int maxDepth(TreeNode root) {
		if(root == null){
			return 0;
		}
		
		return 1 + Math.max(maxDepth(root.left), maxDepth(root.right));
    }
	
	public static int maxDepth1(TreeNode root){
		int counter = 0;
		Deque<TreeNode> stack = new LinkedList<TreeNode>();
		if(root == null)
			return counter;
		stack.push(root);
		while(!stack.isEmpty()){
			int size = stack.size();
			TreeNode node = stack.pop();
			
			while(size > 0){
				size --;
				if(node.left != null){
					stack.add(node.left);
				}
				
				if(node.right != null){
					stack.add(node.right);
				}
				
			}
			counter++;
		}
		
		return counter;
	}
}
