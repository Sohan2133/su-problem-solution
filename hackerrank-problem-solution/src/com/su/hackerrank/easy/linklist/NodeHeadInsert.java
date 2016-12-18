package com.su.hackerrank.easy.linklist;


public class NodeHeadInsert {

	public static void main(String[] args) {
		Node node = new Node(1);
		node.next = new Node(2);
		node.next.next = new Node(3);
		Node temp = Insert(node, 4);
		Print(temp);
	}
	
	public static Node Insert(Node head,int x) {
		Node current = new Node();
		current.data = x;
		current.next = head;
	    return current;
	}
	
	public static void Print(Node head) {
		  while(head != null){
			  System.out.println(head.data);
			  head = head.next;
		  }
	}

}
