<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
 <%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
 <!-- Css Styles -->
    <link rel="stylesheet" href="${path}/resources/template/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${path}/resources/template/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${path}/resources/template/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${path}/resources/template/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${path}/resources/template/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${path}/resources/template/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${path}/resources/template/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${path}/resources/template/css/style.css" type="text/css">
<head>
<meta charset="UTF-8">
<title>boardTiles</title>
</head>
<body>

    <tiles:insertAttribute name="boardheader" />
    <div class="container">
	    <div class="row">
	     <tiles:insertAttribute name="boardnav" />
	<!-- partial -->
	     <!-- partial:partials/_settings-panel.html -->
	     <tiles:insertAttribute name="boardcontent" />
	     </div>
     </div>
     <tiles:insertAttribute name="boardfooter" />
</body>
</html>