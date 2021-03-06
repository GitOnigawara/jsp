<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	String[] subNams = {"컴퓨터이론", "C++", "정보통신"};
	String[] subNums = {"c001", "c002", "c003"};
%>
<c:set var="sub_names" value="<%=subNams %>" />
<c:set var="sub_nums" value="<%=subNums %>" />
<c:forEach items="${ paramValues.dep_ck }" var="ck" varStatus="stat">
	<sql:update var="rs" dataSource="jdbc/OracleDB">
		INSERT INTO SCHOOL_STUDENT(STU_NAME, DEP_NAME, STU_NUM, SUB_NAME, SUB_NUM) VALUES(?, ?, ?, ?, ?)
		<sql:param value="${ param.stu_name }" />
		<sql:param value="${ param.dep_name }" />
		<sql:param value="${ param.stu_num }" />
		<sql:param value="${ sub_names[ck - 1] }" />
		<sql:param value="${ sub_nums[ck - 1] }" />
	</sql:update>
	<sql:update var="rs" dataSource="jdbc/OracleDB">
		INSERT INTO SCHOOL_SCORE(STU_NUM, SUB_NUM, SUB_SCORE, SUB_NAME) VALUES(?, ?, ?, ?)
		<sql:param value="${ param.stu_num }" />
		<sql:param value="${ sub_nums[ck - 1] }" />
		<sql:param value="${ 0 }" />
		<sql:param value="${ sub_names[ck -1] }" />
	</sql:update>
</c:forEach>
<c:redirect url="index.jsp" />