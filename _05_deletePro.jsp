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
		String pw = request.getParameter("pw");
		String pwck = request.getParameter("pwck");
		boolean check = false;
		boolean check2 = false;
		boolean check3 = false;
		if(pw.equals(pwck)){
			check = true;
		}
		try{
			String jdbcUrl = "jdbc:mysql://localhost:3306/_01_DBSAMPLE_1?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPw = "rootroot";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			String s = " select mem_pw from member where mem_id=? ";
			pstmt = conn.prepareStatement(s);
			pstmt.setString(1, logid);
			rs = pstmt.executeQuery(s);
			if(rs.next()){
				String mempw = rs.getString(1);
				if(pw.equals(mempw)){
					check2 = true;
				}
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
				String s = " delete from member where mem_id=? ";
				pstmt = conn.prepareStatement(s);
				pstmt.setString(1, logid);
				int re = pstmt.executeUpdate();
				if(re==1){
					System.out.println("성공");
					check3 = true;
				}else{
					System.out.println("실패");
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
			System.out.println("1");
		}else if(check2==false){
			System.out.println("2");
		}else if(check3==false){
			System.out.println("3");
		}
		
		if(check==false){
			response.sendRedirect("_05_delete.jsp?error=true");
		}else{
			session.removeAttribute("logname");
			session.removeAttribute("logpw");
			session.removeAttribute("logage");
			session.removeAttribute("loggen");
			response.sendRedirect("_01_main.jsp");
		}
		
	%>
</body>
</html>