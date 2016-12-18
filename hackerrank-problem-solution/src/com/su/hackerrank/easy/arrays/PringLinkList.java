package com.su.hackerrank.easy.arrays;

public class PringLinkList {

	public static void main(String[] args) {
		Node node = new Node(1);
		node.next = new Node(2);
		node.next.next = new Node(3);
		Print(node);
	}
	
	public static void Print(Node head) {
		  while(head != null){
			  System.out.println(head.data);
			  head = head.next;
		  }
	}

}
