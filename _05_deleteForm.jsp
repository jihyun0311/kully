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
<div class="form-container">
<h2 style="font-size:24px;">회원탈퇴</h2>
<hr color="purple" width="300px">
<br>

<form  action="_05_deletePro.jsp">
	<table>
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
		<tr align="right" height="70px">
			<td width="370px" colspan="2" align="right"><a href="_05_deletePro.jsp"><input type="submit" value="회원탈퇴" class="btn deleteBtn"></a></td>
		</tr>
	</table>
</form>
</div>
</body>
</html>