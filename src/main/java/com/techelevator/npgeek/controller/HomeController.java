package com.techelevator.npgeek.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.techelevator.npgeek.model.park.JdbcSurveyDAO;
import com.techelevator.npgeek.model.park.Park;
import com.techelevator.npgeek.model.park.ParkDAO;
import com.techelevator.npgeek.model.park.Survey;
import com.techelevator.npgeek.model.park.SurveyDAO;
import com.techelevator.npgeek.model.park.Weather;
import com.techelevator.npgeek.model.park.WeatherDAO;

@Controller
@SessionAttributes({"tempPref"})
public class HomeController {

		@Autowired
		ParkDAO parkDao;
		@Autowired
		SurveyDAO surveyDao;
		@Autowired
		WeatherDAO weatherDao;
		
		List<Park> parks;
		List<Weather> weather;
		List<Weather> celcius;
		
		@RequestMapping(path={"/", "/homePage"}, method=RequestMethod.GET)
		public String displayHomePage(HttpServletRequest request, ModelMap map) {
			parks = parkDao.getAllParks();
	
			request.setAttribute("size", parks.size());
			request.setAttribute("parks", parks);
			
			return "homepage";
		}
		
		@RequestMapping(path={"/parkDetail"}, method=RequestMethod.GET)
		public String displayParkDetails(HttpServletRequest request, ModelMap map) {
			String codeString = request.getParameter("code");
			request.setAttribute("parkdetail", parkDao.getParkById(codeString));
			
			return "parkdetail";
		}
		
		@RequestMapping(path={"/weather"}, method=RequestMethod.GET)
		public String displayParkWeather(HttpServletRequest request, ModelMap map) {
			String codeString = request.getParameter("code");
			weather = weatherDao.getParkWeather(codeString);
			boolean tempPreference = false;
			if(map.containsAttribute("tempPref")) {
				tempPreference = (boolean) map.get("tempPref");
			}
			else {
				tempPreference = false;
			}			
					
			map.addAttribute("tempPref", tempPreference);
			request.setAttribute("weather", weather);

			return "weather";
		}
		
		@RequestMapping(path={"/weather"}, method=RequestMethod.POST)
		public String displayParkWeatherCelcius(@RequestParam String code, @RequestParam boolean tempPref, HttpServletRequest request, ModelMap map) {
			weather = weatherDao.getParkWeather(code);
			boolean tempPreference = tempPref;
			String parkName = parkDao.getParkById(code).getParkName();
			
			map.replace("tempPref", tempPreference);
			request.setAttribute("weather", weather);

			return "redirect:/weather?code=" + code + "&name=" + parkName;
		}
	
		@RequestMapping(path={"/survey"}, method=RequestMethod.GET)
		public String displaySurveyForm(HttpServletRequest request) {
			return "survey";
		}
		
		@RequestMapping(path={"/survey"}, method=RequestMethod.POST)
		public String saveSurveyForm(@RequestParam String parkCode,
									@RequestParam String email,
									@RequestParam String state,
									@RequestParam String activityLevel) {
								
			Survey survey = new Survey();
			survey.setParkCode(parkCode);
			survey.setEmailAddress(email);
			survey.setState(state);
			survey.setActivityLevel(activityLevel);
			
			surveyDao.save(survey);
			
			return "redirect:/surveyResults";
		}
		
		@RequestMapping("/surveyResults")
		public String showSurveyResults(HttpServletRequest request) {
			int totalVotes = 0;
			parks = parkDao.getAllParks();
			List<Park> surveys = surveyDao.getAllSurveys();

			
			for (Park item : surveys) {
				totalVotes += item.getParkRating();
			}
			
			
			request.setAttribute("totalVotes", totalVotes);
			request.setAttribute("surveys", surveys);
			
			return "surveyresults";
		}
}
