<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="UTF-8"/>

<sql:query var="rs" dataSource="jdbc/OracleDB">
	SELECT * FROM BOARD WHERE idx = ?
	<sql:param value="${ param.idx }"/>
</sql:query>
<c:forEach var="row" items="${ rs.rows }">
	<c:out value="${ row.title }" />
	<c:out value="${ row.content }" />
	<c:set var="idx" value="${ row.idx }" />
	<c:set var="ref" value="${ row.ref }" />
	<c:set var="step" value="${ row.step }" />
	<c:set var="b_order" value="${ row.b_order }" />
</c:forEach>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="reply_check.jsp" method="POST">
		<table>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="re_name"/></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="re_pw"/></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="re_email"/></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="re_title"/></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="re_content"cols="30" rows="10"></textarea></td>
			</tr>
		</table>
		<input type="hidden" name="idx" value="${ idx }"/>
		<input type="hidden" name="ref" value="${ ref }"/>
		<input type="hidden" name="step" value="${ step }"/>
		<input type="hidden" name="b_order" value="${ b_order }"/>
		<input type="submit" value="댓글달기"/>
	</form>
</body>
</html>