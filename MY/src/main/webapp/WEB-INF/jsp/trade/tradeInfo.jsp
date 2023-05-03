<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%-- <%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trade Board</title>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script>
	window.onload=function(){
		
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
				
		
		
	};
	
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
	
	
</script>
<script type="text/javascript">
$(document).ready(function() {	
	$.ajax({
        url: '${pageContext.request.contextPath}/showComment.do',
        type: 'GET',
        data: {tradeId : '${trade.tradeId}'},
        dataType:'json',
        success: function (response) {
            if (response) {
            	var out;
            	var comments = response.comments;
            	
            	out = recursiveComments(comments, 0);
            	
            	$('#comments').append(out);
            }
            else{
            	
            }
        },
        error: function (request,status,error) {
        	console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
    });
	
	$("body").on("click", ".writecom", function () {
	    const commentId = $(this).val();
	    $.ajax({
	        url: '${pageContext.request.contextPath}/writeComment.do',
	        type: 'POST',
	        data: $('#commentForm-' + commentId).serialize(),
	        dataType:'json',
	        success: function (response) {
	            if (response) {
	            	var out;
	            	var comments = response.comments;
	            	$('.textcontent').val('');
	            	out = recursiveComments(comments, 0);
	            	
	            	$('#comments').empty();
	            	$('#comments').append(out);
	            }
	            else{
	            	
	            }
	        },
	        error: function (request,status,error) {
	        	console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	        }
	    });
	});
});
function showReplyForm(parentId) {
    $('.reply-form').hide();
    $('#reply-form-' + parentId).show();
}

function replyhide(){
	$('.reply-form').val('');
	$('.reply-form').hide();
}

function recursiveComments(comments, indent) {
	  let output = "";
	  let indentlength = indent;

		
	  comments.forEach(function(comment) {
		output += '<div style="margin-left: ' + indentlength + 'px;">';
		if (comment.parentId != 0) {
		   output += '<p style="font-size: 20px; display:inline;">ㄴ</p>';
		}  		    
		output += '<p style="display:inline;">' + comment.writerId + ':' + comment.content + '';
		output += ' <c:if test="${USER.name != NULL }"><button onclick="showReplyForm(' + comment.commentId + ')">작성</button></c:if></p>';
		output += '<c:if test="${USER.userId != NULL }">';
		output += '<div id="reply-form-' + comment.commentId + '" class="reply-form" style="display: none; margin-left: 20px;">';
    	output += '<form id="commentForm-' + comment.commentId + '">';
    	output += '<input type="hidden" id="trade-id" name="tradeId" value="${trade.tradeId }">';
    	output += '<input type="hidden" id="parent-id-' + comment.commentId + '" name="parentId" value="' + comment.commentId + '">';
    	output += '내용: <textarea id="content-' + comment.commentId + '" name="content" class="textcontent" rows="5" cols="30" required></textarea><br>';
    	output += '<input type="hidden" id="writer-' + comment.commentId + '" name="writerId" value="${USER.userId }" required><br>';
    	output += '<button type="button" class="writecom" value="' + comment.commentId + '">작성</button>';
    	output += '<button type="button" onclick="replyhide()">취소</button>';
    	output += '</form></div></c:if>';

	    if (comment.children && comment.children.length > 0) {
	      output += recursiveComments(comment.children, 20);
	    }

	    output += "</div>";
	  });

	  return output;
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
		<c:if test="${USER.userId != NULL }">
		<h2>댓글 작성</h2>
		<form id="commentForm-0">
			<input type="hidden" id="trade-id" name="tradeId" value="${trade.tradeId }">
			<input type="hidden" id="parent-id-0" name="parentId" value="0">
			내용: <textarea id="content-0" name="content" class="textcontent" rows="5" cols="30" required></textarea><br>
			<input type="hidden" id="writerId-0" name="writerId" value="${USER.userId }" required><br>
		    <button type="button" class="writecom" value="0">작성</button>
		</form>
		</c:if>
		<div id="comments">
			
		
		</div>
		
	</section>
</body>

</html>