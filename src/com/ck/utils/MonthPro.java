package com.ck.utils;

public class MonthPro {
	public static String getLastMonth(String yearAndMonth) {
		String[] yearMonth = yearAndMonth.split("-");
		int year = Integer.parseInt(yearMonth[0]);
		int month = Integer.parseInt(yearMonth[1]);
		if(month > 1 && month <= 12) {
			month = month-1;
		}
		else if(month == 1) {
			year = year-1;
			month = 12;
		}
		String lastMonth = Integer.toString(year)+"-"+Integer.toString(month);
		return lastMonth;
	}
	
	public static int monthForm(String yearAndMonth) {
		String[] yearMonth = yearAndMonth.split("-");
		int month = Integer.parseInt(yearMonth[1]);
		if(month >=1 && month <= 12) 
			return 1;
		return 0;
	}
}
