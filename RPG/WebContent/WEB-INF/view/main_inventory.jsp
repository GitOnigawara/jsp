<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.bean.Character" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" />
<title>Insert title here</title>
<style>

</style>
</head>
<body>
	<div id="wrap">
		<header id="header">
			<jsp:include page="gnb.jsp" />
		</header>
		<div id="contents">
			<div class="insert on">
				<h1>착용중 아이템</h1>
				<table border="1px" class="data_tbl">
					<tr>
						<th>무기</th>
						<th>갑옷</th>
						<th>장갑</th>
						<th>신발</th>
						<th>보조1</th>
						<th>보조2</th>
						<th>보조3</th>
						<th>스킬1</th>
						<th>스킬2</th>
						<th>장비변경</th>
					</tr>
					<tr>
						<c:forEach items="${equip_list}" var="row">
						<td>
							<select name="weapon" class="li_${row.char_name}">
								<c:choose>
									<c:when test="${row.weapon_code == 0 || row.weapon_code == null}">
										<option value="0">없음</option>
									</c:when>
									<c:otherwise>
										<option value="${row.weapon_code}">${row.weapon_name}</option>
									</c:otherwise>
								</c:choose>
							</select>
						</td>
						<td>
							<select name="amor" class="li_${row.char_name}">
								<c:choose>
									<c:when test="${row.amor_code == 0 || row.amor_code == null}">
										<option value="0">없음</option>
									</c:when>
									<c:otherwise>
										<option value="${row.amor_code}">${row.amor_name}</option>
									</c:otherwise>
								</c:choose>
							</select>
						</td>
						<td>
							<select name="gloves" class="li_${row.char_name}">
								<c:choose>
									<c:when test="${row.gloves_code == 0 || row.gloves_code == null}">
										<option value="0">없음</option>
									</c:when>
									<c:otherwise>
										<option value="${row.gloves_code}">${row.gloves_name}</option>
									</c:otherwise>
								</c:choose>
							</select>
						</td>
						<td>
							<select name="boots" class="li_${row.char_name}">
								<c:choose>
									<c:when test="${row.boots_code == 0 || row.boots_code == null}">
										<option value="0">없음</option>
									</c:when>
									<c:otherwise>
										<option value="${row.boots_code}">${row.boots_name}</option>
									</c:otherwise>
								</c:choose>
							</select>
						</td>
						<td>
							<select name="sub1" class="li_${row.char_name}">
								<c:choose>
									<c:when test="${row.sub1_code == 0 || row.sub1_code == null}">
										<option value="0">없음</option>
									</c:when>
									<c:otherwise>
										<option value="${row.sub1_code}">${row.sub1_name}</option>
									</c:otherwise>
								</c:choose>								
							</select>
						</td>
						<td>
							<select name="sub2" class="li_${row.char_name}">
								<c:choose>
									<c:when test="${row.sub2_code == 0 || row.sub2_code == null}">
										<option value="0">없음</option>
									</c:when>
									<c:otherwise>
										<option value="${row.sub2_code}">${row.sub2_name}</option>
									</c:otherwise>
								</c:choose>								
							</select>
						</td>
						<td>
							<select name="sub3" class="li_${row.char_name}">
								<c:choose>
									<c:when test="${row.sub3_code == 0 || row.sub3_code == null}">
										<option value="0">없음</option>
									</c:when>
									<c:otherwise>
										<option value="${row.sub3_code}">${row.sub3_name}</option>
									</c:otherwise>
								</c:choose>								
							</select>
						</td>
						<td>
							<select name="sk1" class="li_${row.char_name}">
								<c:choose>
									<c:when test="${row.sk1_code == 0 || row.sk1_code == null}">
										<option value="0">없음</option>
									</c:when>
									<c:otherwise>
										<option value="${row.sk1_code}">${row.sk1_name}</option>
									</c:otherwise>
								</c:choose>								
							</select>
						</td>
						<td>
							<select name="sk2" class="li_${row.char_name}">
								<c:choose>
									<c:when test="${row.sk2_code == 0 || row.sk2_code == null}">
										<option value="0">없음</option>
									</c:when>
									<c:otherwise>
										<option value="${row.sk2_code}">${row.sk2_name}</option>
									</c:otherwise>
								</c:choose>								
							</select>
						</td>
						<td>
							<input type="button" value="장비변경" onclick="show_modify(event, '${row.char_name}');"/>
						</td>
						</c:forEach>
					</tr>
				</table>
			</div>
			<div class="modify">
				<h1>착용가능 아이템</h1>
				<form action="equip_modify.do" method="POST" id="modFrm">
				<table border="1px" class="data_tbl">
					<tr>
						<th>무기</th>
						<th>갑옷</th>
						<th>장갑</th>
						<th>신발</th>	
						<th>보조1</th>
						<th>보조2</th>
						<th>보조3</th>
						<th>스킬1</th>
						<th>스킬2</th>
						<th>장비적용</th>
					</tr>
					<tr>
						<td>
							<select name="weapon_code" class="mod_">
								<option value="0">없음</option>
								<c:forEach items="${weapon_list}" var="row">
								<option value="${row.item_code}">${row.item_name}</option>
								</c:forEach>
							</select>
						</td>
						<td>
							<select name="amor_code" class="mod_">
								<option value="0">없음</option>
								<c:forEach items="${amor_list}" var="row">
									<option value="${row.item_code}">${row.item_name}</option>
								</c:forEach>
							</select>
						</td>
						<td>
							<select name="gloves_code" class="mod_">
								<option value="0">없음</option>
								<c:forEach items="${gloves_list}" var="row">
								<option value="${row.item_code}">${row.item_name}</option>
								</c:forEach>
							</select>
						</td>
						<td>
							<select name="boots_code" class="mod_">
								<option value="0">없음</option>
								<c:forEach items="${boots_list}" var="row">
								<option value="${row.item_code}">${row.item_name}</option>
								</c:forEach>
							</select>
						</td>
						<td>
							<select name="sub1_code" class="mod_">
								<option value="0">없음</option>
								<c:forEach items="${sub_list}" var="row">
								<option value="${row.item_code}">${row.item_name}</option>
								</c:forEach>
							</select>
						</td>
						<td>
							<select name="sub2_code" class="mod_">
								<option value="0">없음</option>
								<c:forEach items="${sub_list}" var="row">
								<option value="${row.item_code}">${row.item_name}</option>
								</c:forEach>
							</select>
						</td>
						<td>
							<select name="sub3_code" class="mod_">
								<option value="0">없음</option>
								<c:forEach items="${sub_list}" var="row">
								<option value="${row.item_code}">${row.item_name}</option>
								</c:forEach>
							</select>
						</td>
						<td>
							<select name="sk1_code" class="mod_">
								<option value="0">없음</option>
							</select>
						</td>
						<td>
							<select name="sk2_code" class="mod_">
								<option value="0">없음</option>
							</select>
						</td>
						<td>
							<input type="button" value="장비적용" onclick="equip_dup_ck(event);"/>
						</td>
					</tr>
				</table>
				</form>
			</div>
			<div class="char_status">
				<h1>케릭터</h1>
				<table border="1px">
					<tr>
						<th>이름</th>
						<th>체력</th>
						<th>공격력</th>
						<th>방어력</th>
						<th>완력</th>
						<th>민첩</th>
						<th>회피율</th>
						<th>치명타율</th>
						<th>경험치</th>
					</tr>
					<tr>
						<c:forEach items="${char_info}" var="row">
						<td>Lv.${row.char_lv} ${row.char_name}(${row.user_id})</td>
						<td>${row.char_hp}</td>
						<td>${row.char_atk}</td>
						<td>${row.char_def}</td>
						<td>${row.char_str}</td>
						<td>${row.char_dex}</td>
						<td>${row.char_agi}</td>
						<td>${row.char_crt}</td>
						<td>${row.char_exp}</td>
						</c:forEach>
					</tr>
				</table>
			</div>
			<div class="ueser_inven">
				<h1>소지아이템</h1>
				<table border="1px">
					<tr>
						<c:forEach items="${inven_list}" var="row">
						<td>
							<div class="hoverable">
								<a href="return false;" class="hoverTarget icon_${row.item_prop}"></a>
								<div class="hoverBox">
									<p>
										<c:if test="${row.item_prop == 0}">기타</c:if>
										<c:if test="${row.item_prop == 1}">무기</c:if>
										<c:if test="${row.item_prop == 2}">갑옷</c:if>
										<c:if test="${row.item_prop == 3}">장갑</c:if>
										<c:if test="${row.item_prop == 4}">신발</c:if>
										<c:if test="${row.item_prop == 5}">보조장비</c:if>
									</p>
									<p>${row.item_name} (${row.item_price} 골드)</p>
									<c:if test="${row.item_atk != 0}"><p>공격력 : ${row.item_atk}</p></c:if>
									<c:if test="${row.item_def != 0}"><p>방어력 : ${row.item_def}</p></c:if>
									<p>설명 : ${row.item_sub}</p>
								</div>
							</div>
						</td>
						</c:forEach>
					</tr>
				</table>
			</div>
		</div>
		<div id="footer">
			<jsp:include page="script.jsp" />
		</div>
	</div>
</body>
</html>