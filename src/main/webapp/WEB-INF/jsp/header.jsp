<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>National Parks</title>
    <c:url value="/css/style.css" var="cssHref" />
    <link rel="stylesheet" href="${cssHref}">
</head>

<body>
    <header>
    		<c:url value="/" var="homePageHref" />
    		<c:url value="/surveyResults" var="surveyResults" />
    		<c:url value="/survey" var="surveyHref" />
    		<c:url value="/img/logo.png" var="logoSrc" />
        <a href="${homePageHref}">
        		<img class="parkImage" id="logo" src="${logoSrc}" alt="National Parks Logo" />
        </a>
            <nav>
        <ul>
            <li><a href="${homePageHref}">Home</a></li>
            <li><a href="${surveyHref}">Survey</a></li>
            <li><a href="${surveyResults}">Survey Results</a></li>            
        </ul>
    </nav>
        <h1>National Parks</h1>
        <p>Like a city park, but national.</p>
    </header>
