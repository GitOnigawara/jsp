<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<c:choose>
	<c:when test="${ param.stu_num == null || param.str_name == null || param.dep_code == null || param.dep_score == null }">
		<script type="text/javascript">alert("값을 모두 입력해 주세요");</script>
		<c:redirect url=score_input.jsp">
			<c:param name="stu_num" value="${ param.stu_num }" />
			<c:param name="str_name" value="${ param.str_name }" />
			<c:param name="dep_code" value="${ param.dep_code }" />
			<c:param name="dep_score" value="${ param.dep_score }" />
		</c:redirect>
	</c:when>
	<c:otherwise>
		<sql:query var="rs" dataSource="jdbc/OracleDB">
			INSERT INTO SCHOOL_SCORE(STU_NUM, DEP_CODE, DEP_SCORE) VALUES(?, ?, ?)
		</sql:query>
	</c:otherwise>
</c:choose>


