package com.su.hackerrank.medium.stack;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Scanner;

public class PoisonousPlants {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int n = sc.nextInt();
		List<Integer> plants = new LinkedList<Integer>();
		
		int left = Integer.MAX_VALUE;
		for(int i = 0; i<n ; i++){
			int right = sc.nextInt();
			if(left >= right) {
				plants.add(right);
				
			}
			left = right;
		}
		
		if(plants.size() == n){
			System.out.println(0);
			return;
		}
		
		for(int i = 2; i<= n; i++){
			List<Integer> temp = new ArrayList<Integer>();
			int total_del = 0;
			for(int j = 0; j <plants.size() - 1; j++){
				
				if(j == 0) {
					temp.add(j);
					continue;
				}
				
				if(plants.get(j) < plants.get(j + 1)){
					total_del ++;
					continue;
				}
				
				temp.add(plants.get(j + 1));
			}
			if(total_del == 0){
				System.out.println(i - 1);
				break;
			}
			plants = temp;
		}
	}

}
