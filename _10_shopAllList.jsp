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

		String[][] itemList = new String[1000][7];
		int itemSize = 0;
		try{
			String jdbcUrl = "jdbc:mysql://localhost:3306/_01_DBSAMPLE_1?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPw = "rootroot";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			String s = " select * from item ";
			pstmt = conn.prepareStatement(s);
			rs = pstmt.executeQuery();
			int i = 0;
			while(rs.next()){
				itemList[i][0] = rs.getInt(1) + "";
				itemList[i][1] = rs.getString(2);
				itemList[i][2] = rs.getInt(3) + "";
				itemList[i][3] = rs.getString(4);
				itemList[i][4] = rs.getString(5);
				itemList[i][5] = rs.getInt(6) + "";
				itemList[i][6] = rs.getInt(7) + "";
				i++;
			}
			itemSize = i;
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
	%>
	<h2>전체 상품</h2>
	<hr width="300px" color="purple">
	<br>
	<table>
		<%for(int i = 0; i<itemSize; i++){ %>
		<%int discountPrice = Integer.parseInt(itemList[i][2]) - Integer.parseInt(itemList[i][2])*Integer.parseInt(itemList[i][6])/100; %>
			<%if(i%3==0){ %>
				<tr height="250px">
			<%} %>
			<td width="400px" align="center">
				<a href="_11_item.jsp?ind=<%=itemList[i][0]%>">
				<%if(Integer.parseInt(itemList[i][6])>0){ %>
					<img src="img/<%=itemList[i][3] %>" alt="상품" width="250px">
				<%}else{ %>
					<img src="img/<%=itemList[i][3] %>" alt="상품" width="250px" style="opacity: 20%">
				<%} %>
				</a>
				<br>
				<p><font size="5"><b><%=itemList[i][1] %></b></font></p>
				<%if(Integer.parseInt(itemList[i][6])>0){ %>
					<%if(Integer.parseInt(itemList[i][5])>0){ %>
						<p><font size="4" style="text-decoration: line-through;"><%=itemList[i][2] %></font>→
						<font size="4"color="purple"><b><%=discountPrice %></b></font></p>
					<%}else{ %>
						<font size="4"><%=itemList[i][2] %></font>
					<%} %>
				<%}else{ %>
					<font size="4" color="red"><b>품절</b></font>
				<%} %>
				<p><font size="2"><%=itemList[i][4] %></font></p>
			</td>
			<%if(i%3==2){ %>
				</tr>
			<%} %>
		<%} %>
	</table>
</body>
</html>