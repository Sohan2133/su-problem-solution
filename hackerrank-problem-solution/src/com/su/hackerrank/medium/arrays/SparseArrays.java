package com.su.hackerrank.medium.arrays;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

public class SparseArrays {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int n = sc.nextInt();
		List<String> nString = new LinkedList<String>();
		for(int i = 0; i<n; i++){
			nString.add(sc.next());
		}
		
		int q = sc.nextInt();
		List<String> qString = new ArrayList<String>();
		for(int i = 0; i<q; i++){
			qString.add(sc.next());
		}
		
		Map<String, Integer> cache = new HashMap<String, Integer>();
		for(String qs : qString){
			Integer resCounter = cache.get(qs);
			if(resCounter == null){
				int counter = 0;
				Iterator<String> it = nString.iterator();
				while(it.hasNext()){
					if(it.next().equals(qs)){
						++counter;
						it.remove();
					}
				}
				cache.put(qs, counter);
				System.out.println(counter);
			}
			else{
				System.out.println(resCounter);
			}
		}
	}

}
