<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>	
	<form action="score_check.jsp" method="GET">
		학번 : <input type="number" name="stu_num" id="stu_num"/><br />
		이름 : <input type="text" name="stu_name" id="stu_name"/><br />
		과목코드 : <input type="text" name="dep_code" id="dep_code"/><br />
		점수 : <input type="number" name="dep_score" id="dep_score"/><br />
		<input type="submit" value="입력"/>
	</form>
</body>
</html>