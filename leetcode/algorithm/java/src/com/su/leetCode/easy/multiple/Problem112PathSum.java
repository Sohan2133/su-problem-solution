package com.su.leetCode.easy.multiple;

import com.su.leetCode.easy.multiple.TreeNode;

public class Problem112PathSum {

	public static void main(String[] args) {
		TreeNode tn = new TreeNode(5);
		tn.left = new TreeNode(4);
		tn.left.right = new TreeNode(3);
		System.out.println(hasPathSum(tn, 5));
	}
	
	public static boolean hasPathSum(TreeNode root, int sum) {
        if(root == null){
        	return false;
        }
        
		if(root.left == null && root.right == null){
        	sum = sum - root.val;
        	if(sum == 0){
        		return true;
        	}
        	else{
        		return false;
        	}
        }
        
        sum = sum - root.val;
        boolean hasPathSum = false;
        
        if(root.left != null) {
        	hasPathSum = hasPathSum || hasPathSum(root.left, sum);
        }
        if(root.right != null){
        	hasPathSum = hasPathSum || hasPathSum(root.right, sum);
        }
        return hasPathSum;
    }
	
	public static boolean hasPathSum1(TreeNode root, int sum) {
		if(root == null)
			return false;
		if(root.left != null && root.right != null && sum-root.val == 0)
			return true;
		return hasPathSum(root.left, sum-root.val) || hasPathSum(root.right, sum - root.val);
	}

}
