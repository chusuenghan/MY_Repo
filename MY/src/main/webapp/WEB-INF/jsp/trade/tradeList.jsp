<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래게시판</title>
<style type="text/css">
	
	body{
		width:80%;
		margin:0 auto;
	}
	table{
		margin:3px;
	}
	tbody tr:hover{
		background-color : lightyellow;
	}
	
	img{
		width:200px;
		height:200px;
	}
</style>
</head>
<body>
	<header>
		<div>
			<div style="margin: auto;">
				<button type="button" onclick="window.location.href='main.do'">메인화면</button>
			</div>
		</div>
	</header>
	
	<section>
		<h3>게시판</h3>
			<c:forEach items="${tradeList }" var="item">
				<table border="1">
					<tbody>
					<tr ondblclick="trDblClickEvent('${item.tradeId}')">
						<td><c:out value="${item.tradeId }"/></td>
						<td><c:out value="${item.title }"/></td>
						<td><c:out value="${item.professor }"/></td>
						<td><c:out value="${item.contents }"/></td>
						<td><c:out value="${item.phone }"/></td>
						<td><c:out value="${item.price }"/></td>
						<td rowspan="2">
							<img alt="image" src="/img/<c:out value='${item.image }'/>">
						</td>
					</tr>
					<tr>
						<td colspan="6">
							<fmt:parseDate value="${item.nowdate }" pattern="yyyy-MM-dd HH:mm" var="registrationDate"/>
							<fmt:formatDate value="${registrationDate }" pattern="yyyy년MM월dd일HH:mm"/>
						</td>
					</tr>
					</tbody>
				</table>
			</c:forEach>
		
		
		<button type="button" onclick="window.location.href='tradeInsertPage.do'">게시글 등록</button>
		
	</section>
</body>
<script>
	function trDblClickEvent(boardId){
		location.href="tradeInfoPage/"+ tradeId + ".do";
	}
</script>
</html>