<%@include file="header.jsp"%>

<h1 id="welcome">Please select a Park</h1>
<ul class="park">
	<c:forEach var="day" items="${weather}">
		<li class="park">
       		<c:url var="weatherImg" value="/img/weather/${day.forecast.replaceAll(' ', '').toLowerCase()}.png" /> 
        	<img src="${weatherImg}" />
    	</li>
    	<li>
    		<p>Forecast: ${day.forecast}</p>
    	</li>
    	<li>
    		<p>High Temperature: ${day.high}</p>
    	</li>
    	<li>
    		<p>Low Temperature: ${day.low}</p>
    	</li>
    	<li>
    		<p>Recommendation: <ul><c:forEach var="rec" items="${day.getRecommendation()}"><li>${rec}</li>
    		</c:forEach></ul>
    		</p>
    	</li>
  	</c:forEach>
</ul>

<%@include file="footer.jsp"%>