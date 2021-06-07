package com.su.leetCode.easy;

public class Problem463IslandPerimeter {

	public static void main(String[] args) {
		int [][]n = {{1,0}};
		System.out.println(islandPerimeter(n));
	}
	
	public static int islandPerimeter(int[][] grid) {
        int res = 0;
        int rows = grid.length;
        int columns = grid[0].length;
    
        for(int i = 0; i<rows; i++){
        	for(int j = 0; j<columns; j++){
        		if(grid[i][j] == 1){
        			if(j + 1 < columns){
        				if(grid[i][j+1] == 0)
            				res++;
        			}
        			
        			else{
        				res ++;
        			}
        			
        			if(j - 1 >=0){
        				if(grid[i][j - 1] == 0)
            				res++;
        			}
        			else{
        				res ++;
        			}
        			if(i - 1 >=0){
        				if(grid[i-1][j] == 0)
            				res++;
        			}
        			
        			else {
        				res ++;
        			}
        			if(i + 1 < rows){
        				if(grid[i + 1][j] == 0)
            				res ++;
        			}
        			else{
        				res ++;
        			}
        			
        		}
        	}
        }
		return res;
    }
}
