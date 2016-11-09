package com.techelevator.npgeek.model.park;

import java.util.List;
import java.util.Map;

public interface SurveyDAO {

//	public List<Survey> getAllSurveys();
	public Map<String, Integer> getAllSurveys();
	public void save(Survey survey);
}
