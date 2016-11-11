<%@include file="header.jsp"%>

<c:set var="counter" value="0"/>
<div class="container-fluid">
<div class="row">
	<c:forEach var="park" items="${parks}">
	  <div class="col-md-6">
	    <div class="thumbnail">
	    	<c:url var="parkCampsitesHref" value="/parkDetail">
	            <c:param name="code" value="${park.parkCode}" />
	        </c:url>
	        <a href="${parkCampsitesHref}"> 
	        	<c:url var="parkImgSrc" value="/img/parks/${park.parkCode.toLowerCase()}.jpg" /> 
	      		<img src="${parkImgSrc}" alt="parkPicture">
	      	</a>
	      <div class="caption myText">
	        <h3><a href="${parkCampsitesHref}"><c:out value="${park.parkName} National Park" /></a></h3>
	        <p><strong>State: </strong><c:out value="${park.state}"/></p>
	        <p><c:out value="${park.description}"/></p>
	      </div>
	    </div>
	  </div>
	  <c:set var="counter" value="${counter + 1}"/>
	</c:forEach>
</div>
</div>

<%@include file="footer.jsp"%>