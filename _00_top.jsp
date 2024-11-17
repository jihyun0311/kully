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
	String logname = (String)session.getAttribute("logname");
%>

<div align="right">
	<%if(logname==null){ %>
		<font size="2"><a href="_03_join.jsp">회원가입</a></font>&nbsp;
		<img alt="메뉴선" src="img/01_top.jpg">&nbsp;
		<font size="2"><a href="_02_login.jsp">로그인</a></font>&nbsp;
		<img alt="메뉴선" src="img/01_top.jpg">&nbsp;
		<font size="2"><a href="#">고객센터</a></font>&nbsp;
	<%}else{ %>
		<font size="3"><%=logname %>님</font>&nbsp;
		<img alt="메뉴선" src="img/01_top.jpg">&nbsp;
		<a href="_04_update.jsp"><font size="2">마이페이지</font></a>&nbsp;
		<img alt="메뉴선" src="img/01_top.jpg">&nbsp;
		<font size="2"><a href="_13_cart.jsp">주문확인</a></font>&nbsp;
		<img alt="메뉴선" src="img/01_top.jpg">&nbsp;
		<font size="2"><a href="_02_logout.jsp">로그아웃</a></font>&nbsp;
		<img alt="메뉴선" src="img/01_top.jpg">&nbsp;
		<font size="2"><a href="#">고객센터</a></font>&nbsp;
	<%} %>
</div>
<a href="_01_main.jsp">
		<img alt="메인로고" src="img/02_logo.png" height="90px">
</a>
<table>
	<tr height="50px">
		<th width="180px"><a href="_10_shop.jsp">전체상품보기</a></th>
		<th width="10px"><img alt="메뉴선" src="img/01_top.jpg"></th>
		<th width="180px"><a href="#">신상품</a></th>
		<th width="10px"><img alt="메뉴선" src="img/01_top.jpg"></th>
		<th width="180px"><a href="#">베스트</a></th>
		<th width="10px"><img alt="메뉴선" src="img/01_top.jpg"></th>
		<th width="180px"><a href="_20_board.jsp">게시판</a></th>
		<th width="10px"><img alt="메뉴선" src="img/01_top.jpg"></th>
		<th width="180px"><a href="#">이벤트</a></th>
		<th width="10px"><img alt="메뉴선" src="img/01_top.jpg"></th>
		<th width="180px"><a href="_13_cart.jsp"><img alt="장바구니" width="30px" src="img/03_cart.png"></a></th>
	</tr>
</table>
</body>
</html>