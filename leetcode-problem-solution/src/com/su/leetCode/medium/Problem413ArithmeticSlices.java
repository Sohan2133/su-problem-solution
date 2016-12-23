package com.su.leetCode.medium;

public class Problem413ArithmeticSlices {

	public static void main(String[] args) {
		int []n = {1, 2, 3, 8,9,10,11};
		System.out.println(numberOfArithmeticSlices(n));
	}
	
	//the solution fail for some test cases;
	public static int numberOfArithmeticSlices1(int[] A) {
        int na = 0;
        int n = A.length;
        int p = 0, q = 2;
        while(n - p >=3){
        	if(Math.abs(A[p] - A[p+1]) == Math.abs(A[p+1] - A[p+2])){
        		na ++;
        		int dif = Math.abs(A[p] - A[p+1]);
        		int q1 = q;
        		while( q1 < n - 1){
        			q1++;
        			if(Math.abs(A[q1 - 1] - A[q1]) == dif ) {
        				na++;
        			}
        			else break;
        		}
        	}
        	p++;
    		q++;
        }
        return na;
    }
	
	public static int numberOfArithmeticSlices(int[] A) {
	    int curr = 0,  total_AS = 0;
	    for(int i = 2; i < A.length; i++){
	    	if(A[i] - A[i - 1] == A[i - 1] - A[i - 2]){
	    		curr +=1;
	    		total_AS += curr;
	    	}
	    	else{
	    		curr = 0;
	    	}
	    }
	    return total_AS;
	}

}
