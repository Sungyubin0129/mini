<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page session="false" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Main Page</title>
	<jsp:include page="header.jsp"></jsp:include>
</head>
<body>

<P>  The time on the server is ${serverTime}. </P>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>
