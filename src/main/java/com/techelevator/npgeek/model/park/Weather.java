package com.techelevator.npgeek.model.park;

import java.util.ArrayList;
import java.util.List;

public class Weather {
	private String parkCode;
	private int fiveDayForecastValue;
	private int low;
	private int high;
	private String forecast;
	private List<String> recommendation = new ArrayList<String>();
	
	public List<String> getRecommendation() {
		if(forecast.equals("snow")) {
			recommendation.add("Pack snow shoes");
		}
		else if (forecast.equals("rain")) {
			recommendation.add("Pack rain gear and wear water-proof shoes");
		}
		else if (forecast.equals("thunderstorms")) {
			recommendation.add("Seek shelter and avoid hiking on exposed ridges");
		}
		else if (forecast.equals("sun")) {
			recommendation.add("Pack sun-block");
		}
		else {
			recommendation.add("Have a nice day");
		}
		
		if(high > 75) {
			recommendation.add("Bring an extra gallon of water");
		}
		
		if (high - low > 20) {
			recommendation.add("Wear breathable layers");
		}
		
		if (low < 20) {
			recommendation.add("Be warned that exposure to frigid temperatures can kill you");
		}
		
		return recommendation;
		
	}
	
//	public double getTemperatureInCelcius() {
//		if(high)
//	}
	
	public String getParkCode() {
		return parkCode;
	}
	public void setParkCode(String parkCode) {
		this.parkCode = parkCode;
	}
	public int getFiveDayForecastValue() {
		return fiveDayForecastValue;
	}
	public void setFiveDayForecastValue(int fiveDayForecastValue) {
		this.fiveDayForecastValue = fiveDayForecastValue;
	}
	public int getLow() {
		return low;
	}
	public void setLow(int low) {
		this.low = low;
	}
	public int getHigh() {
		return high;
	}
	public void setHigh(int high) {
		this.high = high;
	}
	public String getForecast() {
		return forecast;
	}
	public void setForecast(String forecast) {
		this.forecast = forecast;
	}
	
	
}
