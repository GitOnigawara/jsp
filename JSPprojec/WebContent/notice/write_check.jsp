<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="UTF-8"/>
<sql:query var="rs" dataSource="jdbc/OracleDB">
	SELECT MAX(idx) AS mIdx, max(ref) as mRef FROM board
</sql:query>
<c:forEach var="row" items="${ rs.rows }">
	<c:set var="idx" value="${ row.mIdx + 1 }"/>
	<c:set var="ref" value="${ row.mRef + 1 }"/>
</c:forEach>
<c:if test="${ empty idx}">
	<c:set var="idx" value="${ 1 }" />
</c:if>
<sql:update var="rs" dataSource="jdbc/OracleDB">
	INSERT INTO board(idx, name, pw, email, title, content, ref, step, b_order, hit)
	 VALUES(?, ?, ?, ?, ?, ?, ?, 0, 0, 0)
	<sql:param value="${ idx }" />
	<sql:param value="${ param.name }" />
	<sql:param value="${ param.pw }" />
	<sql:param value="${ param.email }" />
	<sql:param value="${ param.title }" />
	<sql:param value="${ param.content }" />
	<sql:param value="${ ref }" />
</sql:update>
<c:redirect url="notice.jsp" />