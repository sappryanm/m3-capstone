package com.techelevator.npgeek.model.park;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JdbcParkDAO implements ParkDAO{

	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JdbcParkDAO(DataSource datasource) {
		this.jdbcTemplate = new JdbcTemplate(datasource);
	}
	
	@Override
	public List<Park> getAllParks() {
		List<Park> parks = new ArrayList<Park>();
		String selectAllParks = "SELECT * FROM park";
		SqlRowSet results = jdbcTemplate.queryForRowSet(selectAllParks);
		while(results.next()) {
			parks.add(mapRowToPark(results));
		}
		return parks;
	}

	@Override
	public Park getParkById(String parkId) {
		Park onePark = new Park();
		String sqlSelectParkById = "SELECT * FROM park WHERE parkCode = ?";
		SqlRowSet result = jdbcTemplate.queryForRowSet(sqlSelectParkById, parkId);
		if(result.next()) {
			onePark = mapRowToPark(result);
		}
		return onePark;
	}
	
	public Park mapRowToPark(SqlRowSet row) {
		Park park = new Park();
		park.setParkCode(row.getString("parkCode"));
		park.setParkName(row.getString("parkName"));
		park.setState(row.getString("state"));
		park.setAcreage(row.getInt("acreage"));
		park.setElevation(row.getInt("elevationInFeet"));
		park.setMilesOfTrail(row.getDouble("milesOfTrail"));
		park.setNumberOfCampsites(row.getInt("numberOfCampsites"));
		park.setClimate(row.getString("climate"));
		park.setYearFounded(row.getInt("yearFounded"));
		park.setAnnualVisitorCount(row.getInt("annualVisitorCount"));
		park.setQuote(row.getString("inspirationalQuote"));
		park.setQuoteSource(row.getString("inspirationalQuoteSource"));
		park.setDescription(row.getString("parkDescription"));
		park.setEntryFee(row.getInt("entryFee"));
		park.setNumberOfAnimalSpecies(row.getInt("numberOfAnimalSpecies"));
		return park;
	}

}
