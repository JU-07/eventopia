<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<tbody>
	<c:forEach var="post" items="${posts}">
		<tr>
			<td>${post.name}</td>
			<td><c:choose>
					<c:when test="${post.img != '画像なし'}">
						<img src="${pageContext.request.contextPath}${post.img}" alt="画像"
							width="50" height="50">
					</c:when>
					<c:otherwise>画像なし</c:otherwise>
				</c:choose></td>
			<td>${post.content}</td>
			<td><fmt:formatDate value="${post.date}"
					pattern="MM/dd HH:mm:ss" /></td>
		</tr>
	</c:forEach>
</tbody>
