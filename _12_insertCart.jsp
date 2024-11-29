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

		String logid = (String)session.getAttribute("logid");
		int count = Integer.parseInt(request.getParameter("count"));
		String itemNum = request.getParameter("itemNum");
		String[] item = new String[7];
		if(logid!=null){
			try{
				String jdbcUrl = "jdbc:mysql://localhost:3306/_01_DBSAMPLE_1?serverTimezone=UTC&useSSL=false";
				String dbId = "root";
				String dbPw = "rootroot";
				
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
				String s = " select * from item where item_id=?";
				pstmt = conn.prepareStatement(s);
				pstmt.setString(1, itemNum);
				rs = pstmt.executeQuery();
				if(rs.next()){
					item[0] = rs.getInt(1) + "";
					item[1] = rs.getString(2);
					item[2] = rs.getInt(3) + "";
					item[3] = rs.getString(4);
					item[4] = rs.getString(5);
					item[5] = rs.getInt(6) + "";
					item[6] = rs.getInt(7) + "";
					System.out.println(item[0] + " " +  item[1]);
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
			try{
				String jdbcUrl = "jdbc:mysql://localhost:3306/_01_DBSAMPLE_1?serverTimezone=UTC&useSSL=false";
				String dbId = "root";
				String dbPw = "rootroot";

				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
				String s = " select cart_count from cart where cart_itemName=? and mem_cartId=?";
				pstmt = conn.prepareStatement(s);
				pstmt.setString(1, item[1]);
				pstmt.setString(2, logid);
				rs = pstmt.executeQuery();
				if(rs.next()){
					int co = rs.getInt(1);
					int noco = co + count;
					rs.close();
					pstmt.close();
					s = "update cart set cart_count=? where cart_itemName=? and mem_cartId=? ";
					pstmt = conn.prepareStatement(s);
					pstmt.setInt(1, noco);
					pstmt.setString(2, item[1]);
					pstmt.setString(3, logid);
					int re = pstmt.executeUpdate();
					if(re==1){
						System.out.println("성공");
					}else{
						System.out.println("실패");
					}
				}else{
					rs.close();
					pstmt.close();
					s = " insert into cart (cart_itemName, cart_price, cart_img, cart_count, mem_cartId) values (?, ?, ?, ?, ?)";
					pstmt = conn.prepareStatement(s);
					pstmt.setString(1, item[1]);
					if(Integer.parseInt(item[5])>0){
					int discountPrice = Integer.parseInt(item[2]) - Integer.parseInt(item[2]) * Integer.parseInt(item[5]) / 100;
			           	pstmt.setInt(2, discountPrice);
			     	} else {
			            pstmt.setInt(2, Integer.parseInt(item[2]));
			      	}
					pstmt.setString(3, item[3]);
					pstmt.setInt(4, count);
					pstmt.setString(5, logid);
					int res = pstmt.executeUpdate();
					if(res==1){
						System.out.println("성공2");
					}else{
						System.out.println("실패2");
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
			response.sendRedirect("_13_cart.jsp");
		}else{
			response.sendRedirect("_02_login.jsp");
		}
		
	%>
</body>
</html>