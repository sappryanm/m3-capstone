package com.techelevator.npgeek.model.park;

import java.util.List;

public interface WeatherDAO {
	public List<Weather> getParkWeather(String parkId);
}
