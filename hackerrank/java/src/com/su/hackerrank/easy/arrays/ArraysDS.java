package com.su.hackerrank.easy.arrays;

import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

public class ArraysDS {

	public static void main(String[] args) {
		Scanner in = new Scanner(System.in);
        int n = in.nextInt();
        int arr[] = new int[n];
        for(int arr_i=0; arr_i < n; arr_i++){
            arr[arr_i] = in.nextInt();
        }
        
        for(int start = 0, end = n-1; start < end; start++, end--){
        	arr[start] = arr[start] ^ arr[end];
        	arr[end] = arr[start] ^ arr[end];
        	arr[start] = arr[end] ^ arr[start];
        }
        
        for(int element : arr){
        	System.out.print(element + " ");
        }
        
	}

}
