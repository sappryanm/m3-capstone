package com.techelevator.npgeek.model.park;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JdbcSurveyDAO implements SurveyDAO {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JdbcSurveyDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

//	@Override
//	public List<Survey> getAllSurvey() {
//		List<Survey> allSurveys = new ArrayList<Survey>();
//		String sqlCountSurvey = "SELECT * FROM survey_result";
//		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlCountSurvey);
//		while(results.next()) {
//			allSurveys.add(mapRowToSurvey(results));
//		}
//		return allSurveys;
//	}
	
	@Override
	public Map<String, Integer> getAllSurveys() {
		Map<String, Integer> allSurveys = new HashMap<String, Integer>();
		String sqlCountSurvey = "SELECT * FROM survey_result";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlCountSurvey);
		while(results.next()) {
			Survey survey = mapRowToSurvey(results);
			int oldValue = 1;
			if(allSurveys.containsKey(survey.getParkCode())) {
				oldValue += allSurveys.get(survey.getParkCode());
			}
			allSurveys.put(survey.getParkCode(), oldValue);
		}
		return allSurveys;
	}

	@Override
	public void save(Survey survey) {
		String sqlSaveSurvey = "INSERT INTO survey_result (surveyId, parkCode, emailAddress, state, activityLevel) VALUES(?, ?, ?, ?, ?)";
		Long id = getNextId();
		System.out.println("It got here in the save method");
		jdbcTemplate.update(sqlSaveSurvey, id, survey.getParkCode(), survey.getEmailAddress(), survey.getState(), survey.getActivityLevel());
	}
	
	private Long getNextId() {
		System.out.println("It got here in the id method");

		String sqlSelectNextId = "SELECT NEXTVAL('seq_surveyId')";
		SqlRowSet result = jdbcTemplate.queryForRowSet(sqlSelectNextId);
		if(result.next()) {
			return result.getLong(1);
		} else {
			throw new RuntimeException("Something went wrong while getting the next product id");
		}
	}

	private Survey mapRowToSurvey(SqlRowSet row) {
		Survey survey = new Survey();
		survey.setSurveyId(row.getInt("surveyId"));
		survey.setParkCode(row.getString("parkCode"));
		survey.setEmailAddress(row.getString("emailAddress"));
		survey.setState(row.getString("state"));
		survey.setActivityLevel(row.getString("activityLevel"));
		return survey;
	}

}
