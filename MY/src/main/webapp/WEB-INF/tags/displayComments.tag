<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="comments" type="java.util.List" required="true" %>
<%@ attribute name="indent" type="java.lang.Integer" required="true" %>

<c:forEach var="comment" items="${comments}">
    <div style="margin-left: ${20 * indent}px;">
        <p>${comment.writerId}: ${comment.content} <button onclick="showReplyForm(${comment.commentId})">답글 작성</button></p>
		<c:if test="${not empty comment.children}">
			<jsp:include page="/WEB-INF/tags/displayComments.tag">
			<jsp:param name="comments" value="${comment.children}" />
			<jsp:param name="indent" value="${indent + 1}" />
			</jsp:include>
		</c:if>
		</div>
</c:forEach>