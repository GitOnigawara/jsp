<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.test.Animal" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	List<Animal> aniList = new ArrayList<Animal>();
	aniList.add( new Animal("개", 4) );
	aniList.add( new Animal("문어", 8) );
	aniList.add( new Animal("오징어", 10) );
	aniList.add( new Animal("고양이", 4) );
	aniList.add( new Animal("참새", 2) );
	
	request.setAttribute("aniList", aniList);
%>

${ list = aniList.stream().filter(a -> a.leg >= 4).map(a -> a.kind).toList();'' }
${ list }<br />
${ list = aniList.stream().sorted( (a,b) -> a.leg.compareTo(b.leg) ).map(a -> a.kind).toList();'' }
${ list }<br />
${ list = aniList.stream().sorted( (a,b) -> b.leg.compareTo(a.leg) ).map(a -> a.kind).toList();'' }
${ list }<br />
${ list = aniList.stream().sorted( (a,b) -> b.leg.compareTo(a.leg) ).map(a -> a.kind).limit(2).toList();'' }
${ list }<br />
${ list = aniList.stream().count();'' }
${ list }<br />
${ list = aniList.stream().filter(a -> a.leg <= 4).map(a -> a.kind).toList();'' }
${ list }<br /><br /><br />
${ arr = [1,3,4,6,7,9,8,2,5];'' }
${ arr.stream().max().get() }<br />
${ arr2 = [];'' }
${ arr2.stream().max().orElse(() -> '값이 없습니다.') }<br />
${ res = arr.stream().anyMatch(a -> a > 10);'' }
${ res.get() }
