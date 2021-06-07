package com.su.leetCode.easy.multiple;

import java.util.Deque;
import java.util.LinkedList;

public class Problem111MinimumDepthBinaryTree {

	public static void main(String[] args) {
		TreeNode tn = new TreeNode(1);
		tn.left = new TreeNode(2);
		tn.right = new TreeNode(3);
		tn.left.left = new TreeNode(4);
		tn.left.right = new TreeNode(5);
		
//		tn.right.left = new TreeNode(6);
//		tn.right.right = new TreeNode(7);
		
		System.out.println(minDepth11(tn));

	}
	
	public static int minDepth1(TreeNode root) {
        if(root == null){
        	return 0;
        }
        
        return 1+Math.min(minDepth1(root.left), minDepth1(root.right));
    }
	
	public static int minDepth(TreeNode root) {
        int counter = 0;
        if(root == null){
        	return counter;
        }
        
        Deque<TreeNode> dq = new LinkedList<TreeNode>();
        dq.push(root);
        while(!dq.isEmpty()){
        	int size = dq.size();
        	while(size > 0){
        		size --;
        		TreeNode node = dq.pop();
        		if(node.left == null && node.right == null){
        			counter ++;
        			return counter;
        		}
        		if(node.left != null){
        			dq.addLast(node.left);
        		}
        		
        		if(node.right != null){
        			dq.addLast(node.right);
        		}
        	}
        	counter ++;
        }
        return counter;
    }
	
	public static int minDepth11(TreeNode root) {
		if(root == null){
			return 0;
		}
		int left = 1 + minDepth1(root.left);
		int right = 1 + minDepth1(root.right);
		return Math.min(left, right);
	}
	
}
