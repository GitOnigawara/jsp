<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<c:set var="pageSize"	value="10" />
<c:set var="grpSize"	value="5" />
<c:set var="pageNum"	value="1" />
<c:set var="pageCnt"	value="1" />
<c:set var="skipRow"	value="1" />
<c:set var="rowCnt" />

<sql:query var="rs" dataSource="jdbc/OracleDB">
	SELECT * FROM board ORDER BY ref DESC, idx
</sql:query>
<c:set var="rowCnt" value="${ rs.rowCount }" />
<c:choose>
	<c:when test="${ rowCnt % pageSize == 0 }">
		<c:set var="pageCnt" value="${ rowCnt / pageSize }" />
	</c:when>
	<c:otherwise>
		<c:set var="pageCnt" value="${ rowCnt / pageSize + 1 }" />
	</c:otherwise>
</c:choose>

<c:set var="reqNum" value="${ param.pageNum }" />
<c:choose>
	<c:when test="${ reqNum == null }">
		<c:set var="reqNum" value="1" />
	</c:when>
	<c:otherwise>
		<c:set var="skipRow" value="${ (reqNum - 1) * pageSize + 1 }" />
	</c:otherwise>
</c:choose>
<sql:query var="rs" dataSource="jdbc/OracleDB" startRow="${ skipRow - 1 }" maxRows="${ pageSize }">
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
			<c:if test="${ reqNum != null }">
				<c:set var="seqNum" value="${ rowCnt - (reqNum - 1) * pageSize }" />
			</c:if>
			<c:forEach var="row" items="${ rs.rows }" varStatus="stat">
				<tr>
					<td>${ seqNum - (stat.count) + 1 }</td>
					<td>
						<c:if test="${ row.step > 0 }">
							<c:forEach begin="0" end="${ row.step }" step="1">&nbsp;</c:forEach>┗[댓]
						</c:if>
						<a href="read.jsp?idx=${ row.idx }&hit=${ row.hit }">${ row.title }</a>
					</td>
					<td>${ row.name }</td>
					<td>${ row.hit }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br />
	<a href="write_form.jsp?mode=write">글쓰기</a>
<c:set var="grpCheck" value="${ (reqNum - 1) % grpSize }" />
<c:set var="startPage" value="${ reqNum - grpCheck }" />
<c:if test="${ (startPage - grpSize) > 0 }">
	<a href="notice.jsp?pageNum=${ startPage - 1 }">[prev]</a>
</c:if>
<c:forEach var="i" begin="${ startPage }" end="${ startPage + grpSize - 1 }" step="1">
	<c:choose>
		<c:when test="${ i == reqNum }">
			&nbsp; ${ i } &nbsp;
		</c:when>
		<c:when test="${ i > pageCnt }">
			<c:set var="i" value="${ startPage + grpSize - 1 }" />
		</c:when>
		<c:otherwise>
			<a href="notice.jsp?pageNum=${ i }">[${ i }]</a>
		</c:otherwise>
	</c:choose>
</c:forEach>
<c:if test="${ (grpSize + startPage) <= pageCnt }">
	<a href="notice.jsp?pageNum=${ startPage + grpSize }">[next]</a>
</c:if>
</body>
</html>