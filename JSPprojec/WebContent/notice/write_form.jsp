<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="UTF-8"/>
<c:choose>
<%-- modify --%>
	<c:when test="${ param.mode == 'modify' }">
		<sql:query var="rs" dataSource="jdbc/OracleDB">
			SELECT * FROM board WHERE idx = ?
			<sql:param value="${ param.idx }" />
		</sql:query>
		<!DOCTYPE html>
		<html>
		<head>
		<meta charset="UTF-8">
		<title>modify</title>
		</head>
		<body>
			<form action="modify_check.jsp" method="POST">
			<input type="hidden" value="${ param.idx }">
				<c:forEach var="row" items="${ rs.rows }">
					작성자 : <input type="text" name="name" value="${ row.name }"/><br />
					이메일 : <input type="text" name="email" value="${ row.email }"/><br />
					제목 : <input type="text" name="title" value="${ row.title }"/><br />
					내용 : <textarea name="content" id="" cols="60" rows="20">${ row.content }</textarea><br />
					패스워드 : <input type="password" name="pw"/><br />
					<input type="hidden" name="idx" value="${ row.idx }"/>
				</c:forEach>
				<input type="submit" value="수정"/>
			</form>
		</body>
		</html>
	</c:when>
<%-- writr --%>
	<c:when test="${ param.mode == 'write' }">
		<!DOCTYPE html>
		<html>
		<head>
		<meta charset="UTF-8">
		<title>write_form</title>
		</head>
		<body>
			<form action="write_check.jsp" method="POST">
				작성자 : <input type="text" name="name"/><br />
				이메일 : <input type="text" name="email"/><br />
				제목 : <input type="text" name="title"/><br />
				내용 : <textarea name="content" cols="60" rows="20"></textarea><br />
				패스워드 : <input type="password" name="pw"/><br />
				<input type="submit" value="작성"/>
			</form>
		</body>
		</html>
	</c:when>
<%-- delete --%>
	<c:when test="${ param.mode == 'delete' }">
		<!DOCTYPE html>
		<html>
		<head>
		<meta charset="UTF-8">
		<title>delete</title>
		</head>
		<body>
			<form action="delete_check.jsp" method="POST">
				<input type="password" name="pw"/>
				<input type="hidden" name="idx" value="${ param.idx }"/>
				<input type="submit" value="삭제"/>
			</form>
		</body>
		</html>
	</c:when>
	
</c:choose>