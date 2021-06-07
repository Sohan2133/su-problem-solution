package com.su.leetCode.easy;

import java.util.ArrayList;
import java.util.List;

public class Problem412FizzBuzz {

	public static void main(String[] args) {
		for(String s : fizzBuzz(15)){
			System.out.println(s);
		}
	}
	
	public static List<String> fizzBuzz(int n) {
		List<String> res = new ArrayList<String>();
		for(int i = 1 ; i <=n ; i++){
			if( i %3 == 0 && i %5 == 0){
				res.add("FizzBuzz");
				continue;
			}
			else if(i%5 == 0){
				res.add("Buzz");
				continue;
			}
			else if(i%3 == 0){
				res.add("Fizz");
				continue;
			}
			res.add(String.valueOf(i));
		}
		
        return res;
    }
}
