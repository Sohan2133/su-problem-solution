package com.su.leetCode.easy.multiple;

import java.util.Deque;
import java.util.LinkedList;

public class Problem100SameTree {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}
	
	public static boolean isSameTree1(TreeNode p, TreeNode q) {
		if((p == null && q != null) || (p != null & q == null)){
			return false;
		}
		if(p == null && q == null){
			return true;
		}
		
		Deque<TreeNode> pdq = new LinkedList<TreeNode>();
		Deque<TreeNode> qdq = new LinkedList<TreeNode>();
		pdq.push(p);
		qdq.push(q);
		while((!pdq.isEmpty()) || (!qdq.isEmpty())){
			
		}
        return true;
    }
	
	public static boolean isSameTree(TreeNode p, TreeNode q){
		if(p == null && q == null){
			return true;
		}
		
		else if((p == null && q !=null) || p != null && q == null){
			return false;
		}
		
		else if(p.val != q.val){
			return false;
		}
		boolean isSameTree = isSameTree(p.left, q.left);
		isSameTree =isSameTree && isSameTree(p.right, q.right) ;
		return isSameTree;
	}
}
