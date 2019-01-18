<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="UTF-8"/>

<%
	String[] stu_name	= request.getParameterValues("stu_name");
	String[] stu_avg	= request.getParameterValues("stu_avg");
	
	Map<String, Integer> stu = new HashMap<String, Integer>();
	for(int i = 0; i < stu_name.length; i++) {
		stu.put(stu_name[i], Integer.parseInt(stu_avg[i]));
	}
	request.setAttribute("stu", stu);
%>

${ stu.entrySet().stream().filter(e -> e.value >= 90).toList() }