<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trade Board</title>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script>
	window.onload = function(){
		
		var updateBtn = document.getElementById("updateBtn");
		
		updateBtn.onclick = function(){
			var path = "${pageContext.request.contextPath}/updateTradePage.do";
			var params = {
					"tradeId" : "${trade.tradeId}"
			}
			post(path,params);
		}
		
		var deleteBtn = document.getElementById("deleteBtn");
		
		deleteBtn.onclick = function(){
			if(confirm("게시글을 삭제하시겠습니까?") == true){
				var path = "${pageContext.request.contextPath}/tradeDelete.do";
				var params = {
						"tradeId" : "${trade.tradeId}",
						"image" : "${trade.image}"
				}
				post(path,params);
			}
			else{
				return;
			}
		}
	
	
	function post(path, params){
		var form = document.createElement("form");
		form.action = path;
		form.method = "post";
		
		for(var key in params){
			if(params.hasOwnProperty(key)){
				var hiddenField = document.createElement("input");
				hiddenField.type = "hidden";
				hiddenField.name = key;
				hiddenField.value = params[key];
				form.appendChild(hiddenField);
			}
		}
		document.body.appendChild(form);
		form.submit();
	}
	
    function writeComment(parentId) {
        $.ajax({
            url: 'writeComment.do',
            type: 'POST',
            data: {
                tradeId: '${trade.tradeId}',
                parentId: parentId,
                content: $('#content-' + parentId).val(),
                writerId: $('#writerId-' + parentId).val()
            },
            success: function (response) {
                if (response === 'success') {
                    location.reload();
                }
            },
            error: function (error) {
                console.log(error);
            }
        });
    }
    
    function showReplyForm(parentId) {
        $('.reply-form').hide();
        $('#reply-form-' + parentId).show();
    }
    
</script>
</head>
<body>
	<header>
		<div style="margin: auto;">
			<button type="button" onclick="window.location.href='${pageContext.request.contextPath}/main.do'">메인화면</button>
			<button type="button" onclick="window.location.href='${pageContext.request.contextPath}/tradeListPage.do'">목록</button>
		</div>
		<div style="display: flex;align-items: center;">
			<c:if test="${USER.name != NULL }">
			<h5>[${USER.name}]님</h5>
			<button type="button" onclick="window.location.href='${pageContext.request.contextPath}/logout.do'">로그아웃</button>
			</c:if>
			
		</div>
	</header>
	<section>
	<fieldset style="width:700px;">
		<legend><h3>게시글 상세</h3></legend>
		<table style="width:600px;">
			<tr>
				<th>제목</th>
				<td><c:out value="${trade.title }"/></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><c:out value="${trade.writerId }"/></td>
			</tr>
			<tr>
				<th>교수</th>
				<td><c:out value="${trade.professor }"/></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><c:out value="${trade.contents }"/></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><c:out value="${trade.price }"/></td>
			</tr>
			<tr>
				<th>등록날짜</th>
				<td>
					<fmt:parseDate value="${trade.nowdate }" pattern="yyyy-MM-dd HH:mm" var="registrationDate"/>
					<fmt:formatDate value="${registrationDate }" pattern="yyyy년MM월dd일HH:mm"/>
				</td>
			</tr>
			<tr>
				<th>이미지</th>
				<td><img alt="image" width="300px" height="300px" src="/img/<c:out value='${trade.image }'/>"></td>
			</tr>
		</table>
		<br>
		
		</fieldset>
		<div style=" margin-top:10px;">
		<button type="button" onclick="window.history.go(-1)">이전</button>
		<c:if test="${trade.writerId == USER.userId }">
			<button type="button" id="updateBtn">수정</button>
			<button type="button" id="deleteBtn">삭제</button>
		</c:if>
		</div>
		<h2>댓글 작성</h2>
		<form>
			<input type="hidden" id="parent-id-0" value="">
			내용: <textarea id="content" rows="5" cols="30" required></textarea><br>
			<input type="hidden" id="writerId-0" value="${USER.userId }" required><br>
		    <button type="button" onclick="writeComment(0)">작성</button>
		</form>
		<div id="comments">
		    <tags:displayComments comments="${comments}" indent="0" />
		
		    <c:forEach var="comment" items="${comments}">
		    	<div id="reply-form-${comment.commentId}" class="reply-form" style="display: none; margin-left: 20px;">
		       		<form>
		            	<input type="hidden" id="parent-id-${comment.commentId}" value="${comment.commentId}">
		                내용: <textarea id="content-${comment.commentId}" rows="5" cols="30" required></textarea><br>
		                작성자: <input type="hidden" id="writer-${comment.commentId}" value="${USER.userId }" required><br>
		                <button type="button" onclick="writeComment(${comment.commentId})">작성</button>
		                <button type="button" onclick="$('.reply-form').hide();">취소</button>
		            </form>
		        </div>
		    </c:forEach>
		</div>
	</section>
</body>

</html>