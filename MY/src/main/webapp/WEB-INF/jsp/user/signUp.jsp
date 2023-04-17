<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<form action="signUp.do" method="post" id="signUpForm">
		<table>
			<thead>
				<tr>
					<th colspan="2">회원가입</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>아이디*</th>
					<td><input type="text" name="userId" required="required"/></td>
				</tr>
				<tr>
					<th>비밀번호*</th>
					<td><input type="password" id="pwdInput1" name="pwd" required="required"/></td>
				</tr>
				<tr>
					<th>비밀번호 확인*</th>
					<td><input type="password" id="pwdInput2" required="required"/></td>
				</tr>
				<tr>
					<th>이름*</th>
					<td><input type="text" name="name" required="required"/></td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input type="text" name="phone" required="required"/></td>
				</tr>
			</tbody>
		</table>
		
		<button type="button" onclick="window.history.back()">이전</button>
		<button type="button" id="okBtn">확인</button>
	</form>
</body>

<script>
	
	window.onload = function() {
		
		var okBtn = document.getElementById("okBtn");
		
		okBtn.onclick = function() {
			var pwd1 = document.getElementById("pwdInput1").value;
			var pwd2 = document.getElementById("pwdInput2").value;
			
			console.log(pwd1, pwd2);
			
			if(pwd1 == pwd2) {
				document.getElementById("signUpForm").submit();
			} else {
				alert("비밀번호가 일치하지 않습니다.");
			}
		}
	}
	
</script>

</html>