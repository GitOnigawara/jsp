<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="UTF-8"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="el_2.jsp" method="GET">
		<hr />
		학생_1<br />
		이름 : <input type="text" name="stu_name"/><br />
		평균 : <input type="text" name="stu_avg"/><br />
		<hr />
		<hr />
		학생_2<br />
		이름 : <input type="text" name="stu_name"/><br />
		평균 : <input type="text" name="stu_avg"/><br />
		<hr />
		<hr />
		학생_3<br />
		이름 : <input type="text" name="stu_name"/><br />
		평균 : <input type="text" name="stu_avg"/><br />
		<hr />
		<hr />
		학생_4<br />
		이름 : <input type="text" name="stu_name"/><br />
		평균 : <input type="text" name="stu_avg"/><br />
		<hr />
		<hr />
		학생_5<br />
		이름 : <input type="text" name="stu_name"/><br />
		평균 : <input type="text" name="stu_avg"/><br />
		<hr />
		<input type="submit" />
	</form>
</body>
</html>