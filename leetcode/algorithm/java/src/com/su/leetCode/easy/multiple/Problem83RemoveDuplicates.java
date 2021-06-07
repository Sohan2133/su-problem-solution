package com.su.leetCode.easy.multiple;

import java.util.ArrayList;
import java.util.List;

public class Problem83RemoveDuplicates {

	public static void main(String[] args) {
		ListNode ln = new ListNode(10);
		List<String> names = new ArrayList<String>();
		ln.next = new ListNode(20);
		ln.next.next = new ListNode(20);
		ln.next.next.next = new ListNode(40);
		ListNode solution = deleteDuplicates(ln);
		while(solution != null){
			System.out.println(solution.val);
			solution = solution.next;
		}
	}
	
	public static ListNode deleteDuplicates(ListNode head) {
		ListNode tempNode = head;
		while(tempNode != null && tempNode.next != null){
			if(tempNode.val == tempNode.next.val)
				tempNode.next = tempNode.next.next;
			else
				tempNode = tempNode.next;
		}
		return head;
    }

}
