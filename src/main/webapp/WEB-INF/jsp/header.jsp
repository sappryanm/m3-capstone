<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>

<html lang="en">
<head>
  <meta charset="utf-8">

  <title>National Parks</title>
  <c:url value="css/style.css" var="cssHref" />
  <meta name="National Parks" content="Welcome to the wonderful world of National Parks">
  <meta name="author" content="Gabriel Sheeley / Ryan Sapp">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${cssHref}">

    <script src="https://use.fontawesome.com/4863af0b32.js"></script>
    
    <script>
    $(document).ready(function() {
    	// get current URL path and assign 'active' class
    	var pathname = window.location.pathname;
    	$('.nav > li > a[href="'+pathname+'"]').parent().addClass('active');
    })
    </script>
    
  <!--[if lt IE 9]>
    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
</head>

  <c:url value="/" var="homePageHref" />
  <c:url value="/surveyResults" var="surveyResults" />
  <c:url value="/survey" var="surveyHref" />
  <c:url value="/img/logo.png" var="logoSrc" />

<body>
      <header>
        <nav class="navbar navbar-default navbar-fixed-top">
          <div class="container-fluid">
            <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		      </button>
              <a class="navbar-brand" href="${homePageHref}">
                <img src="${logoSrc}" alt="National Parks Logo" id="logo">
              </a>
              <ul class="nav navbar-nav">
                <li><a href="${homePageHref}">Home<span class="sr-only">(current)</span></a></li>
                <li><a href="${surveyHref}">Take Our Survey</a></li>
                <li><a href="${surveyResults}">Survey Results</a></li>
              </ul>
            </div>
          </div>
        </nav>
        <div class="page-header">
          <h1>National Parks <small>Like city parks, but national</small></h1>
        </div>
      </header>

