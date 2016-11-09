<%@include file="header.jsp"%>

<h1 id="welcome">Please select a Park</h1>
<ul>
	<li class="park">
        <c:url var="parkImgSrc" value="/img/parks/${parkdetail.parkCode.toLowerCase()}.jpg" /> 
        <img src="${parkImgSrc}" />
    </li>
    <li>
	    <h2><c:out value="${parkdetail.parkName} National Park" /></h2>
    </li>
    <li>
    	<p><strong>State: </strong><c:out value="${parkdetail.state}"/></p>
  	</li>
  	<li>
    	<p><strong>Size: </strong><c:out value="${parkdetail.acreage}"/></p>
  	</li>
  	<li>
    	<p><strong>Elevation: </strong><c:out value="${parkdetail.elevation}"/></p>
  	</li>
  	<li>
    	<p><strong>Miles of Trail: </strong><c:out value="${parkdetail.milesOfTrail}"/></p>
  	</li>
  	<li>
    	<p><strong>Number of Campsites: </strong><c:out value="${parkdetail.numberOfCampsites}"/></p>
  	</li>
  	<li>
    	<p><strong>Climate: </strong><c:out value="${parkdetail.climate}"/></p>
  	</li>
  	<li>
    	<p><strong>Year Founded: </strong><c:out value="${parkdetail.yearFounded}"/></p>
  	</li>
  	<li>
    	<p><strong>Annual Visitors: </strong><c:out value="${parkdetail.annualVisitorCount}"/></p>
  	</li>
  	<li>
    	<p><strong>Quote: </strong><em><c:out value="${parkdetail.quote}"/></em> ~ ${parkdetail.quoteSource }</p>
  	</li>
  	<li>
    	<p><strong>Entry Fee: </strong><c:out value="$${parkdetail.entryFee}"/></p>
  	</li>
  	<li>
    	<p><strong>Number of Animal Species: </strong><c:out value="${parkdetail.numberOfAnimalSpecies}"/></p>
  	</li>
  	<li>
    	<p><strong>Description: </strong><c:out value="${parkdetail.description}"/></p>  
  	</li>
  	<li>
  	   	<c:url var="parkWeather" value="/weather?code=${parkdetail.parkCode }" /> 
    	<p><strong>Weather: </strong><a href="${parkWeather}"><c:out value="See weather forecast"/></a></p>  
  	</li>
  	
</ul>

<%@include file="footer.jsp"%>