<%@include file="header.jsp"%>

<h1 id="welcome">Please select a Park</h1>
<ul>
    <c:forEach var="park" items="${parks}">
        <li class="park">
        <c:url var="parkCampsitesHref" value="/parkDetail">
            <c:param name="code" value="${park.parkCode}" />
        </c:url>
        <a href="${parkCampsitesHref}"> 
        <c:url var="parkImgSrc" value="/img/parks/${park.parkCode.toLowerCase()}.jpg" /> 
        <img src="${parkImgSrc}" />
        </a>
    <h2>
        <a href="${parkCampsitesHref}"><c:out value="${park.parkName} National Park" /></a>
    </h2>
    <p><strong>State: </strong><c:out value="${park.state}"/></p>
    <p><c:out value="${park.description}"/></p>     
    </c:forEach>
</ul>

<%@include file="footer.jsp"%>