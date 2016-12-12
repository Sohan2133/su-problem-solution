package com.su.leetCode.easy.multiple;

import java.util.Deque;
import java.util.LinkedList;

public class Problem226InvertBinaryTree {

	public static void main(String[] args) {
		TreeNode tn = new TreeNode(1);
		tn.left = new TreeNode(2);
		tn.right = new TreeNode(3);
		tn.left.left = new TreeNode(4);
		tn.left.right = new TreeNode(5);
		
		tn.right.left = new TreeNode(6);
		tn.right.right = new TreeNode(7);
		
		TreeNode ivn = invertTree1(tn);
		System.out.println(ivn.val);
		System.out.println(ivn.left.val);
		System.out.println(ivn.right.val);
		
		System.out.println(ivn.left.left.val);
		System.out.println(ivn.left.right.val);
		System.out.println(ivn.right.left.val);
		System.out.println(ivn.right.right.val);
	}
	
	public static TreeNode invertTree(TreeNode root) {
		if(root == null){
			return root;
		}
        Deque<TreeNode> stack = new LinkedList<TreeNode>();
        stack.push(root);
        while(!stack.isEmpty()){
        	TreeNode curNode = stack.pop();
        	if(curNode.left != null){
        		stack.addLast(curNode.left);
        	}
        	
        	if(curNode.right != null){
        		stack.addLast(curNode.right);
        	}
        	
        	TreeNode tmpNode = curNode.left;
        	curNode.left = curNode.right;
        	curNode.right = tmpNode;
        }
        return root;
    }
	
	public static TreeNode invertTree1(TreeNode root) {
		if(root == null){
			return null;
		}
		
		TreeNode left = root.left;
		TreeNode right = root.right;
		root.right = invertTree1(left);
		root.left = invertTree1(right);
		return root;
	}
}
