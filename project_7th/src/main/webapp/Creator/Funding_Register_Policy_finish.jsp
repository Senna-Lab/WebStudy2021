<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="Creator.*"
    %>
 <%
	request.setCharacterEncoding("utf-8");
	String path = request.getContextPath();
%>     
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<link rel="stylesheet" href="Funding_Register_Story.css" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<script src="jquery-3.6.0.js" 
	type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function () {
	if (confirm("펀딩 등록이 완료되었습니다. \n 해당 펀딩은 관리자 승인이후 게시됩니다.\n(소요시간 2~3일)")) {
		window.open("../mainPage/mainPage.jsp");
	}

});
</script>
	
</head>
<body>
</body>
</html>