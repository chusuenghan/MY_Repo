<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<style>
		fieldset {
			width: 750px;
		}
		
		legend {
			font-weight: bold;
		}
	</style>
	<meta charset="UTF-8">
	<title>게시글 수정</title>
</head>
<body>
	<form action="tradeUpdate.do" method="post"  enctype="multipart/form-data">
		<fieldset>
			<legend>게시글 수정</legend>
			<table style="width: 80%;">
				<tr>
				<th>게시글</th>
					<td>
						<%-- <c:out value="${trade.writerName }"></c:out> --%>
						<input type="hidden" value="${trade.tradeId }" name="tradeId" style="width: 100%;"/>
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>
						<input type="text" value="${trade.title }" name="title" style="width: 100%;" required/>
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea name="contents" style="width: 100%; height: 100px;" required><c:out value="${trade.contents }"></c:out></textarea>
					</td>
				</tr>
				<tr>
					<th>교수</th>
					<td>
						<input type="text" value="${trade.professor }" name="professor" style="width: 100%;" required/>
					</td>
				</tr>
				<tr>
					<th>가격</th>
					<td>
						<input type="text" value="${trade.price }" name="price" style="width: 100%;" required/>
					</td>
				</tr>
				<tr>
					<th>이미지</th>
					<td>
						<input type="file" name="uploadImage" style="width: 100%;"/>
					</td>
				</tr>
			</table>
			<button type="button" onclick="history.back(); return false;"> 
				이전 </button>
			<button type="submit">수정</button>
		</fieldset>
	</form>
</body>
</html>