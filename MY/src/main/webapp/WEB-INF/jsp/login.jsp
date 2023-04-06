<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<style>
		fieldset {
			width: 300px;
		}
		legend {
			font-weight: bold;
		}
	</style>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<form action="login.do" method="post">
		<fieldset>
			<legend>Login</legend>
			<table>
				<tr>
					<th>ID</th>
					<td><input type="text" id="userId" name="userId" placeholder="ID를 입력해주세요"/></td>
				</tr>
				<tr>
					<th>PWD</th>
					<td><input type="password" id="pwd" name="pwd" placeholder="비밀번호를 입력해주세요"/></td>
				</tr>
			</table>
			<br>
			<button type="button" onclick="window.location.href='signUpPage.do'">회원가입</button>
			<button type="submit">로그인</button>
			<button type="reset">reset</button>
		</fieldset>
	</form>
</body>
</html>