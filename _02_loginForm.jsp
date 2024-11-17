<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>로그인</h2>
<hr color="purple" width="300px">
<br>
<form action="_02_loginPro.jsp" method="post">
	<table>
		<tr height="50px">
			<td width="300px" align="center">
				<input type="text" placeholder="아이디" style="width:300px; height:30px;" name="id">
			</td>
		</tr>
		<tr>
			<td width="300px" align="center">
				<input type="password" placeholder="비번" style="width:300px; height:30px;" name="pw">
			</td>
		</tr>
		<tr height="50px">
			<td width="300px" align="center">
				<font size="2"><a href="#">아이디찾기</a></font>&nbsp;
				<img src="img/01_top.jpg" alt="메뉴선">&nbsp;
				<font size="2"><a href="#">비번찾기</a></font>
			</td>
		</tr>
		<tr height="50px">
			<td width="300px" align="center">
				<input type="image" src="img/06_login.PNG" width="300px">
			</td>
		</tr>
	</table>
</form>
</body>
</html>