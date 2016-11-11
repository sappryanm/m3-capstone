<%@include file="header.jsp"%>

<%@ page import="java.awt.*" %>
<%@ page import="javax.swing.*" %>
<%@ page import="java.applet.*" %>



<div class="container text-center">
<h1 id="welcome">Most Popular Parks</h1>
</div>
<div class="container text-center">
<c:forEach var="park" items="${surveys}">
<%

int R = (int) (Math.random( )*150);
int G = (int)(Math.random( )*150);
int B= (int)(Math.random( )*150);
String randColor = "rgb(" + R + ", " + G + ", " + B + ")";

%>
<c:set var="voteCount" value="${park.getParkRating() / totalVotes}"></c:set>
<h3>${park.parkName} National Park - ${park.getParkRating()}</h3>
<div class="progress">
  <div class="progress-bar" role="progressbar" style="width: ${voteCount * 100}%; background-color: <%=randColor%>;">
  </div>
</div>
</c:forEach>
</div>
<%@include file="footer.jsp"%>