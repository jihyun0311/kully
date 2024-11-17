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
		int cartSize = 0;
		String[][] cartList = new String[1000][5];
		try{
			String jdbcUrl = "jdbc:mysql://localhost:3306/_01_DBSAMPLE_1?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPw = "rootroot";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			String s = "select * from cart where mem_cartId=? ";
			pstmt = conn.prepareStatement(s);
			pstmt.setString(1, logid);
			rs = pstmt.executeQuery();
			int i = 0;
			while(rs.next()){
				cartList[i][0] = rs.getInt(1) + "";
				cartList[i][1] = rs.getString(2);
				cartList[i][2] = rs.getInt(3) + "";
				cartList[i][3] = rs.getString(4);
				cartList[i][4] = rs.getInt(5) + "";
				i++;
			}
			cartSize = i;
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
		int dily=3000;
		int free = 40000;
	%>
	<h2>장바구니</h2>
	<hr color="purple" width="300px">
	<br>
	<%int to = 0; %>
	<%for(int i = 0; i<cartSize; i++){ %>
		<%to += Integer.parseInt(cartList[i][2]);%>
		<table>
			<tr height="40px">
				<td width="50px" align="center"><%=i+1 %></td>
				<td width="100px" align="center"><img src="img/<%=cartList[i][3] %>" alt="상품" height="40px"></td>
				<td width="300px"><font size="3"><b><%=cartList[i][1] %></b></font></td>
				<td width="100px" align="center"><font size="3"><b><%=cartList[i][4] %></b></font></td>
				<td width="100px"><font size="3"><b><%=cartList[i][2] %></b></font>
				<td width="40px" align="center"><a href="_13_cartDelete.jsp?num=<%=cartList[i][0]%>"><img alt="삭제" src="img/09_delete.png"></a></td>
			</tr>
		</table>
		<hr size="1" color="gray" width="680px">
	<%} %>
	<form  action="#">
		<table>
			<tr height="70px">
				<td width="480px" align="right"><font size="3"><b>총 상품금액</b></font></td>
				<td width="200px" align="right"><font size="3"><b><%=to %></b></font></td>
			</tr>
			<%if(free-to>0){ %>
				<tr height="70px">
					<td width="480px" align=right><font size="3"><b>배송비</b></font></td>
					<td width="200px" align="right"><font size="3"><b><%=dily %></b></font><br>
					<font size="2" color="purple"><%=free-to %>원 추가 주문시 무료배송</font></td>
				</tr>
				<tr height="70px">
					<td width="480px" align="right"><font size="4"><b>총 결제금액</b></font>
					<td width="200px" align="right"><font size="4"><b><%=to + dily %></b></font></td>
				</tr>
			<%}else{ %>
				<tr height="70px">
					<td width="480px" align=right><font size="3"><b>배송비</b></font></td>
					<td width="200px" align="right"><font size="3"><b>0원</b></font><br></td>
				</tr>
				<tr height="70px">
					<td width="480px" align="right"><font size="4"><b>총 결제금액</b></font>
					<td width="200px" align="right"><font size="4"><b><%=to %></b></font></td>
				</tr>
			<%} %>
			<tr height="70px">
				<td colspan="2" align="right"><input type="image" src="img/08_order.PNG" alt="주문하기" height="50px"></td>
			</tr>
		</table>
	</form>
</body>
</html>