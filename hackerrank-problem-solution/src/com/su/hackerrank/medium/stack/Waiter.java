package com.su.hackerrank.medium.stack;

import java.util.LinkedList;
import java.util.Queue;
import java.util.Scanner;
import java.util.Stack;

public class Waiter {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int n = sc.nextInt();
		int q = sc.nextInt();
		Queue<Integer> p0 = new LinkedList<Integer>();
		for(int i = 0; i<n; i++){
			int x = sc.nextInt();
			p0.add(x);
		}
		Stack<Queue<Integer>> a = new Stack<Queue<Integer>>();
		
		int prime = 2;
		for(int i = 1; i<=q; i++){
			Queue<Integer> temp = new LinkedList<Integer>();
			Queue<Integer> b = new LinkedList<Integer>();
			for(int x : p0){
				if(x % prime == 0){
					temp.add(x);
				}
				else{
					b.add(x);
				}
			}
			a.add(temp);
			p0 = b;
			prime = getNextPrime(prime);
		}
		for(Queue<Integer> resq : a){
			for(int x : resq) System.out.println(x);
		}
		for(int x : p0) System.out.println(x);
	}

	private static int getNextPrime(int prime) {
		for(int nextPrime = prime + 1; ;nextPrime++){
			if(isPrime(nextPrime))
				return nextPrime;
		}
	
	}
	
	private static boolean isPrime(int n){
		int limit = (int) Math.sqrt(n + 1);
		for(int i = 2; i <= limit; i++){
			if(n % i == 0) return false;
		}
		return true;
	}
	
}
