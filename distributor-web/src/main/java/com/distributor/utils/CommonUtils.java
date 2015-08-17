package com.distributor.utils;

public class CommonUtils {
   
	public static String priceInt2Float(int price){
		StringBuilder stringBuilder = new StringBuilder(String.valueOf(price));
		stringBuilder.insert(stringBuilder.length()-2, '.');
		return stringBuilder.toString();
	}
	
	public static int priceFloat2Int(String price){
		return Integer.parseInt(price.replace(".", ""));
	}
	
	public static float intPrice2Float(int price){
		StringBuilder stringBuilder = new StringBuilder(String.valueOf(price));
		if(stringBuilder.length()>2){
			stringBuilder.insert(stringBuilder.length()-2, '.');
			return Float.parseFloat(stringBuilder.toString());
		}
		else{
			return price;
		}
	}
	
	
    public static void main(String[] args) {

    	System.out.println(priceFloat2Int("12.32"));
    }
}
