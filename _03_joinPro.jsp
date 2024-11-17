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

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String gen = request.getParameter("gen");
		String age = (request.getParameter("age"));
		boolean check = false;
		boolean check2 = false;
		try{
			String jdbcUrl = "jdbc:mysql://localhost:3306/_01_DBSAMPLE_1?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPw = "rootroot";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			String s = "select mem_id from member where mem_id=?";
			pstmt = conn.prepareStatement(s);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(!rs.next()){
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
		
		if(check){
			try{
				String jdbcUrl = "jdbc:mysql://localhost:3306/_01_DBSAMPLE_1?serverTimezone=UTC&useSSL=false";
				String dbId = "root";
				String dbPw = "rootroot";
				
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
				String s = "insert into member values(?, ?, ?, ?, ?)";
				pstmt = conn.prepareStatement(s);
				pstmt.setString(1, id);
				pstmt.setString(2, pw);
				pstmt.setString(3, name);
				pstmt.setString(4, gen);
				pstmt.setString(5, age);
				int re = pstmt.executeUpdate();
				if(re==1){
					check2 = true;
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
		
		if(check==true && check2==true){
			System.out.println("회원가입 성공");
			response.sendRedirect("_02_login.jsp");
		}else{
			System.out.println("회원가입 실패");
			response.sendRedirect("_03_join.jsp");
		}
	%>
</body>
</html>