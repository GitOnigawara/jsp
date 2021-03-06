<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<sql:update var="rs" dataSource="jdbc/OracleDB">
	UPDATE board SET hit = hit+1 WHERE idx = ?
	<sql:param value="${ param.idx}" />
</sql:update>
<sql:query var="rs" dataSource="jdbc/OracleDB">
	SELECT * FROM board WHERE idx = ?
	<sql:param value="${ param.idx }" />
</sql:query>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach var="row" items="${ rs.rows }">
		<p>글번호 : ${ row.idx } / 작성자 : ${ row.name } / 이메일 : ${ row.email }</p><br /><br />
		<h3>제목 : ${ row.title }</h3><br /><br />
		<p>내용 : ${ row.content }</p>
	</c:forEach>
	<a href="notice.jsp">목록</a> / 
	<a href="write_form.jsp?mode=modify&idx=${ param.idx }">수정</a> / 
	<a href="write_form.jsp?mode=delete&idx=${ param.idx }">삭제</a> /
	<a href="reply.jsp?idx=${ param.idx }">댓글</a>
	<br /><br /><br />
</body>
</html>
