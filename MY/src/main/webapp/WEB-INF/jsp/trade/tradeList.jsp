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
	h5{
		display:inline;
	}
	table{
		width:500px;
		display:flex;
	}
	tbody{
		border:1px solid black;
		margin-bottom:10px;
	}
	td{
		width:166px;
		text-align: center; 
 		vertical-align: middle;
	}
	tbody:hover{
		background-color : lightyellow;
	}

</style>
<script>
	function trClickEvent(tradeId){
		location.href="tradeInfoPage/"+ tradeId + ".do";
	}
</script>
</head>
<body>
	<header>
		<div>
			<c:if test="${USER.name == NULL }">
				<div style="margin: auto;">
					<button type="button" onclick="window.location.href='main.do'">메인화면</button>
					<button type="button" onclick="window.location.href='loginPage.do'">로그인</button>
				</div>
			</c:if>
			<c:if test="${USER.name != NULL }">
				<div style="margin: auto; margin-top:10px;">
					<button type="button" onclick="window.location.href='main.do'">메인화면</button>
				</div>
				<div style="margin: auto; margin-top:10px;">
					<h5>[${USER.name}]님</h5>
					<button type="button" onclick="window.location.href='logout.do'">로그아웃</button>
				</div>
			</c:if>
		</div>
	</header>
	
	<section>
		<h3>게시판</h3>
			<c:forEach items="${tradeList }" var="item">
				<table>
					<tbody onclick="trClickEvent('${item.tradeId}')">
					<tr>
						
						<td><c:out value="${item.title }"/></td>
						<td><c:out value="${item.professor }"/></td>
						
						<td><c:out value="${item.price }"/>원</td>
						<td rowspan="2">
							<img alt="image" width="100px" height="100px" src="/img/<c:out value='${item.image }'/>">
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<fmt:parseDate value="${item.nowdate }" pattern="yyyy-MM-dd HH:mm" var="registrationDate"/>
							<fmt:formatDate value="${registrationDate }" pattern="yyyy년MM월dd일HH:mm"/>
						</td>
					</tr>
					</tbody>
				</table>
			</c:forEach>
		
		<c:if test="${USER.name != NULL }">
		<button type="button" onclick="window.location.href='tradeInsertPage.do'">게시글 등록</button>
		</c:if>
	</section>
</body>

</html>