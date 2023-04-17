<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 등록</title>
</head>
<body>
	<form action="tradeInsert.do" method="post"  enctype="multipart/form-data">
		<%-- <input type="hidden" name="tradeId" value="${Trade.tradeId}"/> --%>
		<table>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<th>교수</th>
				<td><input type="text" name="professor"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="contents"></textarea></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="text" name="price"></td>
			</tr>
			<tr>
				<th>사진</th>
				<td><input type="file" name="uploadImage">
					<input type="hidden" value="${USER.userId }" name="writerId">
				</td>
			</tr>
			
		</table>
		<button type="submit">등록</button>
	</form>
</body>
</html>