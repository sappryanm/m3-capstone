<%@include file="header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<h1 id="welcome">Please select a Park</h1>
	<c:url var="weatherSwitch" value="/weather" />
	<form action="${weatherSwitch}" method="POST">
		<input type="hidden" name="tempPref" value="true"/>
		<input type="hidden" name="code" value="${param.code}"/>
		<input type="submit" value="Celcius" />
	</form>
	<form action="${weatherSwitch}" method="POST">
		<input type="hidden" name="tempPref" value="false"/>
		<input type="hidden" name="code" value="${param.code}"/>
		<input type="submit" value="Fehrenheit" />
	</form>
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
    		<p>High Temperature: 
	    		<c:choose>
	    			<c:when test="${tempPref}">
	    				<fmt:formatNumber type="number" maxFractionDigits="2" value="${(day.high - 32) / 1.8}" />
	    			</c:when>
	    			<c:otherwise>
	    				${day.high}
	    			</c:otherwise>
	    		</c:choose>
    		</p>
    	</li>
    	<li>
    		<p>Low Temperature:
    			<c:choose>
	    			<c:when test="${tempPref}">
	    				<fmt:formatNumber type="number" maxFractionDigits="2" value="${(day.low - 32) / 1.8}" />
	    			</c:when>
	    			<c:otherwise>
	    				${day.low}
	    			</c:otherwise>
	    		</c:choose>
    		</p>
    	</li>
    	<li>
    		<p>Recommendation: <ul><c:forEach var="rec" items="${day.getRecommendation()}"><li>${rec}</li>
    		</c:forEach></ul>
    		</p>
    	</li>
  	</c:forEach>
</ul>

<%@include file="footer.jsp"%>