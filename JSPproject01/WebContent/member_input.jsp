<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="UTF-8"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
</script>
</head>
<body>
	<form action="mem_control" method="GET">
		첫번째 숫자 : <input type="text" name="num1"/><br />
		계산식 : <input type="text" name="op"/><br />
		두번째 숫자 : <input type="text" name="num2"/><br />
		<input type="submit" value="제출"/>
	</form>
</body>
</html>