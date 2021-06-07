package com.su.leetCode.easy;

public class Problem121BestTimeBuySellStock {

	public static void main(String[] args) {
		int []n = {7, 6, 4, 3, 1};
		System.out.println(maxProfit1(n));
	}
	
	public static int maxProfit(int[] prices) {
        int maxProfit = 0;
        if(prices.length <= 0)
        	return maxProfit;
        int minBuying = prices[0];
        
        for(int i = 1; i< prices.length; i++){
        	int sellingPrice = prices[i];
        	int profit = sellingPrice - minBuying;
        	
        	if(profit > maxProfit){
        		maxProfit = profit;
        	}
        	
        	minBuying = (sellingPrice < minBuying) ? sellingPrice : minBuying;
        }
        return maxProfit;
    }
	
	public static int maxProfit1(int[] prices) {
		int min = Integer.MAX_VALUE;
		int max = 0;
		for(int price : prices){
			min = Math.min(min, price);
			max = Math.max(max, price - min);
		}
		
		return max;
	}
	

}
