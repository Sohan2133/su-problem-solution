package com.su.hackerrank.easy.stack;

import java.util.Scanner;

public class EqualStacks {

	public static void main(String[] args) {
		Scanner in = new Scanner(System.in);
        int n1 = in.nextInt();
        int n2 = in.nextInt();
        int n3 = in.nextInt();
        int h1[] = new int[n1];
        int sum1 = 0, sum2 = 0, sum3 = 0;
        for(int h1_i=0; h1_i < n1; h1_i++){
            h1[h1_i] = in.nextInt();
            sum1 += h1[h1_i];
        }
        int h2[] = new int[n2];
        for(int h2_i=0; h2_i < n2; h2_i++){
            h2[h2_i] = in.nextInt();
            sum2 += h2[h2_i];
        }
        int h3[] = new int[n3];
        for(int h3_i=0; h3_i < n3; h3_i++){
            h3[h3_i] = in.nextInt();
            sum3 += h3[h3_i];
        }
        
        int d = 0;
        for(int s1 = 0, s2 = 0, s3 = 0; s1 < n1 && s2 < n2 && s3 < n3;){
        	d = getDistortion(sum1, sum2, sum3);
        	if(d == 0){
        		System.out.println(sum1);
        		break;
        	}
        	int d1 = getDistortion(sum1 - h1[s1], sum2, sum3);
        	int d2 = getDistortion(sum1, sum2 - h2[s2], sum3);
        	int d3 = getDistortion(sum1, sum2, sum3 - h3[s3]);
        	
        	if(d1 <= d2 && d1 <= d3){ 
        		sum1 -= h1[s1];
        		s1++;
        	}
        	if(d2 <= d1 && d2 <= d3) {
        		sum2 -= h2[s2];
        		s2++;
        	}
        	if(d3 <= d1 && d3 <= d2) {
        		sum3 -= h3[s3];
        		s3++;
        	}
        }
        
        if(d != 0){
        	System.out.println(0);
        }
	}
	
	public static int getDistortion(int num1, int num2, int num3){
		int min = Math.min(Math.min(num1, num2), num3);
		return (num1 - min) + (num2 - min) + (num3 - min); 
	}

}
