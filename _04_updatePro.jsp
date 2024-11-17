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

		String logid = (String)session.getAttribute("logid");
		String name = request.getParameter("name");
		String gen = request.getParameter("age");
		String pw = request.getParameter("pw");
		String pwck = request.getParameter("pwck");
		int age = Integer.parseInt(request.getParameter("age"));
		boolean check = false;
		
		String logname = (String)session.getAttribute("logname");
		String logpw = (String)session.getAttribute("logpw");
		String loggen = (String)session.getAttribute("loggen");
		int logage = (int)session.getAttribute("logage");
		
		if(pw!=null && !pw.isEmpty() && pw.equals(pwck)){
			try{
				String jdbcUrl = "jdbc:mysql://localhost:3306/_01_DBSAMPLE_1?serverTimezone=UTC&useSSL=false";
				String dbId = "root";
				String dbPw = "rootroot";
			
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
				String s = " select * from member where mem_id=? ";
				pstmt = conn.prepareStatement(s);
				pstmt.setString(1, logid);
				rs = pstmt.executeQuery();
				if(rs.next()){
					System.out.println("성공1");
					check = true;
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
		}
		
		if(check){
			try{
				String jdbcUrl = "jdbc:mysql://localhost:3306/_01_DBSAMPLE_1?serverTimezone=UTC&useSSL=false";
				String dbId = "root";
				String dbPw = "rootroot";
			
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
				String s = " update member set mem_pw=?, mem_name=?, mem_gender=?, mem_age=? where mem_id=? ";
				pstmt = conn.prepareStatement(s);
				pstmt.setString(5, logid);
				pstmt.setString(1, pw);
				pstmt.setString(2, name);
				pstmt.setString(3, gen);
				pstmt.setInt(4, age);
				int re = pstmt.executeUpdate();
				if(re==1){
					System.out.println("성공2");
					logname = name;
					logpw = pw;
					loggen = gen;
					logage = age;
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
		}
		
		if(check==false){
			response.sendRedirect("_04_update.jsp?error=true");
		}else{
			session.setAttribute("logname", logname);
			session.setAttribute("logpw", logpw);
			session.setAttribute("logage", logage);
			session.setAttribute("loggen", loggen);
			response.sendRedirect("_04_update.jsp");
		}
		
	%>
</body>
</html>