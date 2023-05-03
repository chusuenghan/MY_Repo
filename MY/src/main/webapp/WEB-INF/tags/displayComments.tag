<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ tag body-content="scriptless" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="comments" type="java.util.List" required="true" %>
<%@ attribute name="indent" type="java.lang.Integer" required="true" %>


<c:forEach var="comment" items="${comments}">
    <div style="margin-left: ${20 * indent}px;">
        <p><c:out value="${comment.writerId}"/>: <c:out value="${comment.content}"/> <button onclick="showReplyForm(${comment.commentId})">답글 작성</button></p>
		<c:if test="${not empty comment.children}">
			<c:set var="nestedComments" value="${comment.children}" />
            <c:set var="nestedIndent" value="${indent + 1}" />
            <c:import url="/WEB-INF/tags/displayComments.tag" var="importedContent">
                <c:param name="comments" value="${nestedComments}" />
                <c:param name="indent" value="${nestedIndent}" />
            </c:import>
            ${importedContent}
		</c:if>
		</div>
</c:forEach>