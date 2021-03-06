<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="UTF-8"/>
<c:set var="pageView" value="10" />
<c:set var="pageSkip" value="5" />
<sql:query var="rs" dataSource="jdbc/OracleDB">
	SELECT * FROM board ORDER BY ref DESC, idx
</sql:query>
<c:set var="rowCnt" value="${ rs.rowCount }" />
<c:choose>
	<c:when test="${ (rowCnt % pageView) == 0 }">
		<c:set var="pages" value="${ rowCnt / pageView }" />
	</c:when>
	<c:otherwise>
		<c:set var="pages" value="${ (rowCnt / pageView) + 1 }" />
	</c:otherwise>
</c:choose>

<c:choose>
	<c:when test="${ param.pageNum != null }">
		<c:set var="pageNum" value="${ param.pageNum }"/>
	</c:when>
	<c:otherwise>
		<c:set var="pageNum" value="1"/>
	</c:otherwise>
</c:choose>
<fmt:parseNumber var="pageCnt" integerOnly="true" value="${ pages }"/>

<sql:query var="rs" dataSource="jdbc/OracleDB" startRow="${ ((pageNum - 1) * pageView) }" maxRows="${ pageView }">
	SELECT * FROM board ORDER BY ref DESC, idx
</sql:query>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice</title>
</head>
<body>
	<table>
		<tbody>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
			</tr>
			<c:forEach var="row" items="${ rs.rows }" varStatus="stat">
				<tr>
					<td>${ row.idx }</td>
					<td>${ row.title }</td>
					<td>${ row.name }</td>
					<td>${ row.hit }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br />
	<p>글쓰기</p>
	<c:choose>
		<c:when test="${ param.pageNum <= 1 }">
			<a href="notice_1.jsp?pageNum=${ 1 }">[ prev ]</a>
		</c:when>
		<c:when test="${ param.pageNum - pageSkip <= 1 }">
			<a href="notice_1.jsp?pageNum=${ 1 }">[ prev ]</a>
		</c:when>
		<c:otherwise>
			<a href="notice_1.jsp?pageNum=${ param.pageNum - pageSkip }">[ prev ]</a>
		</c:otherwise>
	</c:choose>
	<c:forEach var="i" begin="1" end="${ pageCnt }" step="1" varStatus="stat">
		<c:choose>
			<c:when test="${ i == pageNum }">
				<a href="notice_1.jsp?pageNum=${ i }"> [${ i }] </a>
			</c:when>
			<c:otherwise>
				<a href="notice_1.jsp?pageNum=${ i }">${ i }</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:choose>
		<c:when test="${ param.pageNum >= pageCnt }">
			<a href="notice_1.jsp?pageNum=${ pageCnt }">[ next ]</a>
		</c:when>
		<c:when test="${ param.pageNum + pageSkip >= pageCnt }">
			<a href="notice_1.jsp?pageNum=${ pageCnt }">[ next ]</a>
		</c:when>
		<c:otherwise>
			<a href="notice_1.jsp?pageNum=${ param.pageNum + pageSkip }">[ next ]</a>
		</c:otherwise>
	</c:choose>
</body>
</html>