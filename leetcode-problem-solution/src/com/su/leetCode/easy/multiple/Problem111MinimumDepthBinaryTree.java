package com.su.leetCode.easy.multiple;

import java.util.Deque;
import java.util.LinkedList;

public class Problem111MinimumDepthBinaryTree {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

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
	
}
