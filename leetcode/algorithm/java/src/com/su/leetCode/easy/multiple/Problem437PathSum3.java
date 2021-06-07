package com.su.leetCode.easy.multiple;

public class Problem437PathSum3 {
	/**
	 * Definition for a binary tree node.
	 * public class TreeNode {
	 *     int val;
	 *     TreeNode left;
	 *     TreeNode right;
	 *     TreeNode(int x) { val = x; }
	 * }
	 */
	
	public static void main(String[] args) {
		TreeNode tn = new TreeNode(10);
		tn.left = new TreeNode(12);
		tn.right = new TreeNode(13);
		tn.left.left = new TreeNode(12);
		tn.left.right = new TreeNode(13);
		int counter = 0;
		counter += pathSum(tn, 23);
		System.out.println(counter);
	}
	
	public static int pathSum(TreeNode root, int sum) {
        
		if(root == null){
        	if(sum == 0){
        		return 1; 
        	}
        	else{
        		return 0;
        	}
        }
		
        sum = sum - root.val;
        int counter1 =  pathSum(root.left, sum);
        int counter2 = pathSum(root.right, sum);
        return counter1 + counter2;
        
    }
}
