package com.su.hackerrank.easy.arrays;

import java.util.Scanner;

public class LeftRotation {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int n = sc.nextInt();
		int numOfLR = sc.nextInt() % n;
		int []elements = new int[n];
		for(int i = 0; i<n ;i++){
			int index = (i + n - numOfLR) % n;
			elements[index] = sc.nextInt();
		}
		
		for(int i = 0; i < n; i++){
			System.out.print(elements[i]);
			System.out.print(" ");
		}
		
	}

}
