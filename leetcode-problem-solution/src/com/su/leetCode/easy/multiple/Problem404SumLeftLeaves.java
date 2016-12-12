package com.su.leetCode.easy.multiple;

import java.util.Deque;
import java.util.LinkedList;

public class Problem404SumLeftLeaves {

	public static void main(String[] args) {
		TreeNode tn = new TreeNode(1);
		tn.left = new TreeNode(2);
		tn.right = new TreeNode(3);
		tn.left.left = new TreeNode(4);
		tn.left.right = new TreeNode(5);
		
		tn.right.left = new TreeNode(6);
		tn.right.right = new TreeNode(7);
		
		System.out.println(sumOfLeftLeaves1(tn));
	}
	
	public static int sumOfLeftLeaves(TreeNode root) {
		if(root == null){
        	return 0;
        }
		int sum = 0;
		if(root.left != null){
        	if(root.left.left == null && root.left.right == null){
        		sum += root.left.val;
        	}
        	else{
        		sum += sumOfLeftLeaves(root.left);
        	}
        }
        sum  += sumOfLeftLeaves(root.right);
        return sum;
    }
	
	public static int sumOfLeftLeaves1(TreeNode root) {
		int sum = 0;
		if(root == null){
			return sum;
		}
		
		Deque<TreeNode> dq = new LinkedList<TreeNode>();
		dq.push(root);
		while(!dq.isEmpty()){
			int size = dq.size();
			while(size > 0){
				TreeNode curNode = dq.pop();
				size --;
				if(curNode.left != null){
					if(curNode.left.left == null && curNode.left.right == null){
						sum = sum + curNode.left.val;
					}
					else{
						dq.addLast(curNode.left);
					}
				}
				
				if(curNode.right != null){
					if((curNode.right.left != null) || (curNode.right.right != null)){
						dq.addLast(curNode.right);
					}
				}
			}
		}
		return sum;
	}

}
