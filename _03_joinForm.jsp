<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.btn{
		background-Color:rgb(95, 0, 128);
		width:100%; 
		height:48px;
		border:none; 
		color:rgb(255, 255, 255); 
		border-radius:5px;
		font-size:14px;
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
        width: 98%;
        height:30px;
        padding: 1px 2px;
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
</style>
</head>
<body>
<div class="form-container">
<h2 style="font-size:24px;">회원가입</h2>
<hr color="purple" width="300px">
<br>
<form  action="_03_joinPro.jsp">
<table>
	<tr height="70px" align="center">
		<td width="100px">아이디</td>
		<td width="300px"><input type="text" name="id" placeholder="아이디" style="width: 300px; height: 30px"></td>
	</tr>
	<tr height="70px" align="center">
		<td width="100px">비번</td>
		<td width="300px"><input type="text" name="pw" placeholder="비밀번호" style="width: 300px; height: 30px"></td>
	</tr>
	<tr height="70px" align="center">
		<td width="100px">이름</td>
		<td width="300px"><input type="text" name="name" placeholder="이름" style="width: 300px; height: 30px"></td>
	</tr>
	<tr height="70px">
		<td width="100px" align="center">성별</td>
		<td width="300px"><label><input type="radio" name="gen" value="남">남</label> &nbsp;
			<label><input type="radio" name="gen" value="여">여</label> &nbsp;
			<label><input type="radio" name="gen" value="선택안함">선택안함</label></td>
	</tr>
	<tr height="70px">
		<td width="100px" align="center">나이</td>
		<td width="300px"><input type="number" name="age" min="1" max="100" class="age-input"></td>
	</tr>
	<tr height="70px" align="center">
		<td width="300px" colspan="2"><input type="submit" width="300px" height="50px" value="회원가입" class="btn"></td>
	</tr>
</table>
</form>
</div>
</body>
</html>