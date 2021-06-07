package com.su.leetCode.easy;

public class Problem461HammingDistance {

	public static void main(String[] args) {
		System.out.println(hammingDistance(1, 4));
	}
	
	public static int hammingDistance(int x, int y) {
        int dis = 0;
        while((x ^ y ) != 0){
        	dis = ((x & 1)^ ( y & 1)) == 0 ? dis : (dis + 1);
        	x >>=1;
        	y>>=1;
        }
        
        return dis;
    }
	
	public static int hammingDistance1(int x, int y) {
        int xor = x ^ y;
        int count = 0;
        for(int i = 0; i<32; i++) count += (xor>>i) & 1;
        return count;
    }
	
	public static int hammingDistance2(int x, int y) {
        int xor = x ^ y;
        int count = 0;
        while(xor != 0){
        	count += (xor & 1);
        	xor >>= 1;
        }
        return count;
    }

}
