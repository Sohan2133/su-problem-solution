package com.su.hackerrank.easy.arrays;

public class NodeInsert {

	public static void main(String[] args) {
		Node node = new Node(1);
		node.next = new Node(2);
		node.next.next = new Node(3);
		Node temp = Insert(node, 4);
		Print(temp);
	}
	
	public static Node Insert (Node head,int data) {
		Node temp = new Node();
		temp.data = data;
		if(head == null){
			head = temp;
			return head;
		}
		Node current = head;
		while(current.next != null){
			current = current.next;
		}
		current.next = temp;
		
		return head;
	}
	
	public static void Print(Node head) {
		  while(head != null){
			  System.out.println(head.data);
			  head = head.next;
		  }
	}
}
