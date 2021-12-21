<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="Creator.*"%>
<%
request.setCharacterEncoding("utf-8");
String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My One Pick</title>
<link rel="stylesheet" href="Funding_Register.css" type="text/css">
<link rel="stylesheet" href="../common/style.css" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
</head>
<body>
	<% 	

			%>
	<%@include file="../common/header.jsp"%>
	<section>
		<form id="frm01">
				<% String memNum = (String) session.getAttribute("memnum");
				session.setAttribute("creNum","'crt-0001'");
				String creNum = (String) session.getAttribute("creNum");
				DAO_MyOnePick dao = new DAO_MyOnePick ();
				dao.CreatorList(creNum);
				String creNM = dao.CreatorList(creNum).get(0).getCreNM();%>
		<div class="wrap">
			<div class="profile">
	
				<div class="profile_title" style="color:#138396"><%=creNM %><span id="welcome">님 <br> 환영합니다 !</span></div>
				<br>
		        <ui class="mainMenu">
		            <li class="subject">
		                <a href="#account" class="Menu">펀딩 준비</a>
		                	<%-- Btn ==> Menu로 변경했음 --%>
		                <div class="subMenu">
		                   	<a href="Funding_Register_Theme.jsp" target="frame01">테마선택</a>
		                   	<a href="Funding_Register_Basic.jsp" target="frame01">기본정보</a>
							<a href="Funding_Register_Story.jsp" target="frame01">스토리작성</a>
							<a href="Funding_Register_Policy.jsp" target="frame01">정책동의</a>
		                </div>
		            </li>
		     	</ui>
		</div>
			<iframe name="frame01" src="Funding_Register_Theme.jsp" >
			</iframe>
		</div>
		</form>
	</section>
	<%@include file="../common/footer.jsp" %>
</body>
</html>