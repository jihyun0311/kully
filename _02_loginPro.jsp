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
		request.setCharacterEncoding("utf-8");
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String logid = null;
		String logpw = null;
		String logname = null;
		String loggen = null;
		int logage = 0;
		boolean check = false;
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		System.out.println(id + " " + pw);
		try{
			String jdbcUrl = "jdbc:mysql://localhost:3306/_01_DBSAMPLE_1?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPw = "rootroot";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			String s = " select * from member where mem_id=? and mem_pw=? ";
			pstmt = conn.prepareStatement(s);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				check = true;
				logid = rs.getString(1);
				logpw = rs.getString(2);
				logname = rs.getString(3);
				loggen = rs.getString(4);
				logage = rs.getInt(5);
				System.out.println("loggen: " + loggen);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(conn != null){
				conn.close();			
			}
			if(pstmt != null){
				pstmt.close();	
			}
			if(rs != null){
				rs.close();
			}
		}
		System.out.println(check);
	%>
	<%if(check){
		session.setAttribute("logid", logid);
		session.setAttribute("logpw", logpw);
		session.setAttribute("logname", logname);
		session.setAttribute("loggen", loggen);
		session.setAttribute("logage", logage);
		response.sendRedirect("_01_main.jsp");
	} else{
		response.sendRedirect("_02_login.jsp");
	} %>
</body>
</html>