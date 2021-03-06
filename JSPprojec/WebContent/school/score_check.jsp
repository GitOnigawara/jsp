<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<% request.setCharacterEncoding("UTF-8"); %>
<c:forEach var="data" items="${ paramValues.sub_score }" varStatus="stat">
	<sql:update var="rs" dataSource="jdbc/OracleDB">
		UPDATE SCHOOL_SCORE SET SUB_SCORE = ? WHERE STU_NUM = ? AND SUB_NUM = ?
		<sql:param value="${ data }" />
		<sql:param value="${ param.stu_num }" />
		<sql:param value="${ paramValues.sub_num[stat.index] }" />
	</sql:update>
</c:forEach>
<c:redirect url="index.jsp" />