package com.su.leetCode.easy.multiple;

import java.util.Deque;
import java.util.LinkedList;

public class Problem206ReverseLinkedList {

	public static void main(String[] args) {
		ListNode ln = new ListNode(1);
		ln.next = new ListNode(2);
		ln.next.next = new ListNode(3);
		ln.next.next.next = new ListNode(4);
		
		ListNode rln = reverseList(ln);
		System.out.println(rln.val);
		System.out.println(rln.next.val);
		System.out.print(rln.next.next.val);
		System.out.print(rln.next.next.next.val);
	}
	
	public static ListNode reverseList(ListNode head) {
		ListNode temp = head;
		Deque<ListNode> dq = new LinkedList<ListNode>();
		
		while(head != null){
			dq.addFirst(head);
			head = head.next;
		}

		temp = dq.pop();
		int size = dq.size();
		while(size > 0){
			temp.next = new ListNode(dq.pop().val);
			size--;
		}
		
		return temp;
    }

}
