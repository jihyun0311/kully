<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%	
	session.removeAttribute("logid");
	session.removeAttribute("logname");
	session.removeAttribute("logen");
	session.removeAttribute("logage");
	response.sendRedirect("_01_main.jsp");
%>
</body>
</html>