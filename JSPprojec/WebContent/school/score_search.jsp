<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<sql:query var="rs1" dataSource="jdbc/OracleDB">
	SELECT * FROM SCHOOL_SCORE WHERE STU_NUM = ?
	<sql:param value="${ param.stu_num }" />
</sql:query>
<sql:query var="rs2" dataSource="jdbc/OracleDB">
	SELECT * FROM SCHOOL_STUDENT WHERE STU_NUM = ?
	<sql:param value="${ param.stu_num }" />
</sql:query>
이름 :
<c:forEach var="row" items="${ rs2.rows }" varStatus="stat">
	${ row.STU_NAME }
</c:forEach>
<c:forEach var="row" items="${ rs1.rows }" varStatus="stat">
	과목 : ${ row.SUB_NUM } / 득점 : ${ row.SUB_SCORE }	<br />
</c:forEach>

SELECT B.*, A.* FROM school_score A, school_student B WHERE a.stu_num = b.stu_num AND a.sub_num = b.sub_num