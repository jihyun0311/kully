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

		String[] itemList = new String[7];
		int ind = Integer.parseInt(request.getParameter("ind"));
		try{
			String jdbcUrl = "jdbc:mysql://localhost:3306/_01_DBSAMPLE_1?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPw = "rootroot";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			String s = " select * from item where item_id=? ";
			pstmt = conn.prepareStatement(s);
			pstmt.setInt(1, ind);
			rs = pstmt.executeQuery();
			if(rs.next()){
				itemList[0] = rs.getInt(1) + "";
				itemList[1] = rs.getString(2);
				itemList[2] = rs.getInt(3) + "";
				itemList[3] = rs.getString(4);
				itemList[4] = rs.getString(5);
				itemList[5] = rs.getInt(6) + "";
				itemList[6] = rs.getInt(7) + "";
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
		int discountPrice = Integer.parseInt(itemList[2]) - Integer.parseInt(itemList[2])*Integer.parseInt(itemList[5])/100;
	%>
	<form action="_12_insertCart.jsp" method="post">
		<table>
			<tr height="80px">
				<td rowspan="6" width="350px" align="center">
					<img alt="상품" src="img/<%=itemList[3] %>" height="350px">
				</td>
				<td colspan="2" width="400px"><font size="5"><b><%=itemList[1] %></b></font>
				<br><font size="2"><%=itemList[4] %></font></td>
			</tr>
			<%if(Integer.parseInt(itemList[6])>0) {%>
				<%if(Integer.parseInt(itemList[5])>0){ %>
				<tr height="80px">
					<td colspan="2" width="400px">
						<font size="3" style="text-decoration: line-through;"><b><%=itemList[2] %></b></font>
						→<font size="4" color="purple"><b><%=discountPrice %></b></font>
						<br><font size="2" color="purple">로그인 후 적립혜택이 적용됩니다.</font>
					</td>
				</tr>
				<%}else{ %>
					<tr height="80px">
						<td colspan="2" width="400px"><font size="4"><b><%=itemList[2] %></b></font></td>
					</tr>
				<%} %>
			<%}else{ %>
					<tr height="80px">
						<td colspan="2" width="400px"><font size="4"  style="text-decoration:line-through;"><b><%=itemList[2] %></b></font>
						<br><font size="4" color="red">품절</font></td>
					</tr>
			<%} %>
			<tr height="50px">
				<td width="100px"><font size="2"><b>판매단위</b></font></td>
				<td width="300px"><font size="2">1개</font></td>
			</tr>
			<tr height="50px">
				<td width="100px"><font size="2"><b>배송방법</b></font></td>
				<td width="300px"><font size="2">샛별배송/새벽배송</font></td>
			</tr>
			<tr height="50px">
				<td width="100px"><font size="2"><b>포장타입</b></font></td>
				<td width="300px"><font size="2">상온/종이포장</font><br><font size="1">택배배송은 에코포장이 스티로폼으로 대체됩니다</font></td>
			</tr>
			<%if(Integer.parseInt(itemList[6])>0) {%>
			<tr height="50px">
				<td width="100px"><font size="2"><b>구매수량</b></font></td>
				<td width="300px"><input type="number" min="1" max="99" value="1" name="count"></td>
			</tr>
			<tr height="50px">
				<td colspan="3" align="right"><input type="hidden" name="itemNum" value="<%=itemList[0]%>">
				<input type="image" src="img/07_sendcart.PNG" height="50px"></td>
			</tr>
			<%}else{ %>
			<tr height="50px">
				<td width="100px"><font size="2"><b>구매수량</b></font></td>
				<td width="300px"><input type="number" min="1" max="1" value="1" name="count"></td>
			</tr>
			<tr height="50px">
				<td colspan="3" align="right"><input type="hidden" name="itemNum" value="<%=itemList[0]%>">
				<input type="image" src="img/07_sendcart.PNG" height="50px" disabled style="opacity:0.3;"></td>
			</tr>			
			<%} %>
		</table>
	</form>
</body>
</html>