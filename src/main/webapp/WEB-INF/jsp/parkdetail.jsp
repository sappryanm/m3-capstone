<%@include file="header.jsp"%>



<div class="container-fluid">
	<h1 id="welcome">${parkdetail.parkName}</h1>
	<div class="row">
  		<div class="col-xs-6 col-md-6">
    		<a href="#">
      			<c:url var="parkImgSrc" value="/img/parks/${parkdetail.parkCode.toLowerCase()}.jpg" /> 
    			<img src="${parkImgSrc}" class="thumbnail img-rounded"/>
    		</a>
  		</div>
	</div>
	
	<blockquote>
      <p><c:out value="${parkdetail.quote}"/></p>
      <footer><cite title="${parkdetail.quoteSource }">${parkdetail.quoteSource }</cite></footer>
    </blockquote>
        
    <dl class="dl-horizontal">
    
    <dt>State:</dt>
    <dd><c:out value="${parkdetail.state}"/></dd>
    
    <dt>Size:</dt>
    <dd><c:out value="${parkdetail.acreage}"/></dd>
    
    <dt>Elevation:</dt><dd><c:out value="${parkdetail.elevation}"/></dd>

    <dt>Miles of Trail:</dt><dd><c:out value="${parkdetail.milesOfTrail}"/></dd>

    <dt>Number of Campsites:</dt><dd><c:out value="${parkdetail.numberOfCampsites}"/></dd>

    <dt>Climate:</dt><dd><c:out value="${parkdetail.climate}"/></dd>
    
    <dt>Year Founded:</dt><dd><c:out value="${parkdetail.yearFounded}"/></dd>
    
    <dt>Annual Visitors:</dt><dd><c:out value="${parkdetail.annualVisitorCount}"/></dd>

    <dt>Entry Fee:</dt><dd><c:out value="$${parkdetail.entryFee}"/></dd>
    
    <dt>Animal Species:</dt><dd><c:out value="${parkdetail.numberOfAnimalSpecies}"/></dd>
    
    <dt>Description:</dt><dd><c:out value="${parkdetail.description}"/></dd>  
    
    <c:url var="parkWeather" value="/weather?code=${parkdetail.parkCode}&name=${parkdetail.parkName}" />
    <dt>Weather: </dt><dd><a href="${parkWeather}"><c:out value="See weather forecast"/></a></dd>  
    
</dl>
</div>

<%@include file="footer.jsp"%>