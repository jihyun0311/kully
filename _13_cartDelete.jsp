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
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int num = Integer.parseInt(request.getParameter("num"));
		boolean check = false;
		try{
			String jdbcUrl = "jdbc:mysql://localhost:3306/_01_DBSAMPLE_1?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPw = "rootroot";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			String s = " delete from cart where cart_id=? ";
			pstmt = conn.prepareStatement(s);
			pstmt.setInt(1, num);
			int re = pstmt.executeUpdate();
			if(re==1){
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
			response.sendRedirect("_13_cart.jsp");
			System.out.println("성공");
		}else{
			response.sendRedirect("_13_cart.jsp");
			System.out.println("실패");
		}
	%>
</body>
</html>