<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="name"	value="${ param.name }"/>
<c:set var="age"	value="${ param.age }"/>
<c:set var="gender"	value="${ param.gender }"/>
<c:set var="tall"	value="${ param.tall }"/>
<c:set var="weight"	value="${ param.weight }"/>
<c:set var="flag"	value="true"/>

<c:choose>
	<c:when test="${ age < 20 || age > 80 }">
		<% out.println("보험에 가입할 수 없는 나이입니다."); %>
		<c:set var="flag"	value="false"/>
	</c:when>
	<c:when test="${ gender == '남' && gender == '남자' }">
		<% out.println("보험에 가입할 수 없는 성별입니다."); %>
		<c:set var="flag"	value="false"/>
	</c:when>
	<c:when test="${ tall <= 160 }">
		<% out.println("보험에 가입할 수 없는 신장입니다."); %>
		<c:set var="flag"	value="false"/>
	</c:when>
	<c:when test="${ weight < 50 || weight > 90 }">
		<% out.println("보험에 가입할 수 없는 무게입니다."); %>
		<c:set var="flag"	value="false"/>
	</c:when>
	<c:when test="${ flag }">
		<% out.println("보험에 가입할 수 있습니다."); %>
	</c:when>
</c:choose>

<%--
<c:if test="${ age < 20 || age > 80 }">
	<% out.println("보험에 가입할 수 없는 나이입니다."); %>
	<c:set var="flag"	value="false"/>
</c:if>
<c:if test="${ gender == '남' && gender == '남자' }">
	<% out.println("보험에 가입할 수 없는 성별입니다."); %>
	<c:set var="flag"	value="false"/>
</c:if>
<c:if test="${ tall <= 160 }">
	<% out.println("보험에 가입할 수 없는 신장입니다."); %>
	<c:set var="flag"	value="false"/>
</c:if>
<c:if test="${ weight < 50 || weight > 90 }">
	<% out.println("보험에 가입할 수 없는 무게입니다."); %>
	<c:set var="flag"	value="false"/>
</c:if>
<c:if test="${ flag }">
	<% out.println("보험에 가입할 수 있습니다."); %>
</c:if>
--%>