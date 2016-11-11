<%@include file="header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>




<div class="container">
<div class="row row-centered">
<div class="page-header col-md-12 col-centered">
	<h1>${param.name}</h1>
	<ul class="nav nav-pills">
	<li role="presentation">
   <c:url var="weatherSwitch" value="/weather" />
    <form class="form-inline" action="${weatherSwitch}" method="POST">
        <input type="hidden" name="tempPref" value="true"/>
        <input type="hidden" name="code" value="${param.code}"/>
        <c:if test="${tempPref}">
        <c:set value="active" var="celcius"></c:set></c:if>
        <button class="btn btn-default ${celcius}" type="submit">Celcius</button>
    </form>
    </li>
    <li role="presentation">
    <form class="form-inline" action="${weatherSwitch}" method="POST">
        <input type="hidden" name="tempPref" value="false"/>
        <input type="hidden" name="code" value="${param.code}"/>
        <c:if test="${!tempPref}">
        <c:set value="active" var="fehrenheit"></c:set></c:if>
        <button class="btn btn-default ${fehrenheit}" type="submit">Fehrenheit</button>
    </form>
    </li>
</ul>
</div>
</div>
</div>
<div class="container">
<div class="row row-centered">
<%Calendar calendar = Calendar.getInstance(); %>
<c:forEach var="day" items="${weather}">
  <div class="col-sm-4 col-md-2 col-centered">
	  <%
		   Date dNow = calendar.getTime();
		   SimpleDateFormat ft = 
		   new SimpleDateFormat ("E");
		   out.print( "<h2 align=\"center\">" + ft.format(dNow) + "</h2>");
		   calendar.add(Calendar.DAY_OF_YEAR, 1);
		%>
    <div class="thumbnail">
      <c:url var="weatherImg" value="/img/weather/${day.forecast.replaceAll(' ', '').toLowerCase()}.png" /> 
      <img src="${weatherImg}" />
      <div class="caption">
        <dl>
          <dt>Forecast:</dt>
          <dd>${day.forecast}</dd><br/>

          <dt>High Temperature:</dt>
          <dd>
            <c:choose>
                <c:when test="${tempPref}">
                    <fmt:formatNumber type="number" maxFractionDigits="2" value="${(day.high - 32) / 1.8}" />
                </c:when>
                <c:otherwise>
                    ${day.high}
                </c:otherwise>
            </c:choose>
          </dd><br/>

          <dt>Low Temperature:</dt>
          <dd>
            <c:choose>
                <c:when test="${tempPref}">
                    <fmt:formatNumber type="number" maxFractionDigits="2" value="${(day.low - 32) / 1.8}" />
                </c:when>
                <c:otherwise>
                    ${day.low}
                </c:otherwise>
            </c:choose>
          </dd><br/>
        
          <dt>Recommendation:</dt>
            <c:forEach var="rec" items="${day.getRecommendation()}">
              <dd>${rec}</dd>
            </c:forEach>
        </dl>
      </div>
    </div>
  </div>
  </c:forEach>
</div>
</div>

<%@include file="footer.jsp"%>