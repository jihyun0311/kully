<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*{
		font-size:12px;
		box-sizing: border-box;
	}
	.btn{
		background-Color:rgb(95, 0, 128);
		width:100%; 
		height:48px;
		border:none; 
		color:rgb(255, 255, 255); 
		border-radius:5px;
		font-size:14px;
		cursor: pointer;
		margin:10px 0;
	}
	.btn:hover{
        background-Color: rgba(84, 0, 112)
       
    }
	input[type=radio]{
		transform: scale(1.3);
		margin-right:8px;
	}
	label{
	font-size:14px; 
	margin-right:20px;
	}
	.age-input {
        width: 100%;
        height: 30px;
        padding: 5px 12px;
        font-size: 14px;
        border-radius: 2px;
        outline: none;
        border: 1px solid rgb(118, 118, 118);
    }
    .form-container{
        width: 400px;
        margin: 0 auto;
        padding: 20px;
        border-radius: 7px;
        box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1);
        background-color: #fff;
        margin:20px 0;
    }
     .error-message {
        color: red; 
        background-color: rgb(254, 245, 245);
        padding: 11px 12px 13px;
        border-radius: 4px;
        margin: 13px 0;
        font-size: 11px;
    }
</style>
</head>
<body>
<%
	String logid = (String)session.getAttribute("logid");

	String logname = (String)session.getAttribute("logname");
	String loggen = (String)session.getAttribute("loggen");
	int logage = (int)session.getAttribute("logage");
%>

<div class="form-container">
<h2 style="font-size:24px;">회원정보수정</h2>
<hr color="purple" width="300px">
<br>

<form action="_04_updatePro.jsp">
	<table>
		<tr height="70px" align="center">
			<td width="100px" align="right">아이디 &nbsp;</td>
			<td width="300px"><input type="text" value="<%=logid %>" readonly style="width: 300px; height: 30px"></td>
		</tr>
		<tr height="70px" align="center">
			<td width="100px" align="right">비밀번호 &nbsp;</td>
			<td width="300px"><input type="password" name="pw" style="width: 300px; height: 30px"></td>
		</tr>
		<tr height="70px" align="center">
			<td width="100px" align="right">비밀번호 확인 &nbsp;</td>
			<td width="300px"><input type="password" name="pwck" style="width: 300px; height: 30px"></td>
		</tr>
		<%if(request.getParameter("error")!=null) {%>
			<tr height="40px">
				<td colspan="2" width="300px" class="error-message">비밀번호를 적어주시거나 다시 확인해주세요</td>
			</tr>
		<%} %>
		<tr height="70px" align="center">
			<td width="100px" align="right">이름 &nbsp;</td>
			<td width="300px"><input type="text" name="name" value="<%=logname %>" style="width: 300px; height: 30px"></td>
		</tr>
		<tr height="70px">
		<td width="100px" align="right">성별 &nbsp;</td>
		<%if(loggen.equals("남")) {%>
			<td width="300px"><label><input type="radio" name="gen" value="남" checked>남</label> &nbsp;
			<label><input type="radio" name="gen" value="여">여</label> &nbsp;
			<label><input type="radio" name="gen" value="선택안함">선택안함</label></td>
		<%}else if(loggen.equals("여")){ %>
			<td width="300px"><label><input type="radio" name="gen" value="남">남</label> &nbsp;
			<label><input type="radio" name="gen" value="여" checked>여</label> &nbsp;
			<label><input type="radio" name="gen" value="선택안함">선택안함</label></td>
		<%} else{%>
			<td width="300px"><label><input type="radio" name="gen" value="남" checked>남</label> &nbsp;
			<label><input type="radio" name="gen" value="여">여</label> &nbsp;
			<label><input type="radio" name="gen" value="선택안함">선택안함</label></td>
		<%} %>
	</tr>
	<tr height="70px">
		<td width="100px" align="right">나이 &nbsp;</td>
		<td width="300px"><input type="number" name="age" value="<%=logage %>" min="1" max="100" class="age-input"></td>
	</tr>
	<tr height="70px" align="center">
		<td width="100px" colspan="2" align="right"><input type="submit" value="정보수정" class="btn"></td>
	</tr>
	</table>
</form>
<br>
<div align="right">
	<a href="_05_delete.jsp" style="color:gray;">탈퇴하기</a>
</div>
</div>
</body>
</html>