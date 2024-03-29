<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="Creator.*"
    import="java.util.ArrayList"
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

<link rel="stylesheet" href="Funding_Register_Basic.css" type="text/css">
<link rel="stylesheet" href="../common/style.css" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript">
$(document).ready(function () {
	$("#datepicker").datepicker({ 
		dateFormat: 'yy-mm-dd'
	}); 
	
	$('[name=fdTargetPrice]').on("keyup",function(key) {
		if(key.keyCode==13) {
			if ($(this).val()<=500000||$(this).val()>=100000000) 
				alert("목표금액 설정 가능 범위는 50만원에서 1억 사이입니다. ");
				$(this).val(0);
		}
	});
	$('#contentText').keyup(function(e) {
		var content = $(this).val();
		$('#count').text(50 - content.length);
		if (content.length > 50) {
			$(this).val($(this).val().substring(0, 50));
			alert("입력 가능한 글자수를 초과하였습니다.");
		}
	});
	var tagArr = [10];
	var tags = "";
	var idx=0;
	$('[name=fdTags]').on("keyup",function(key) {
		if(key.keyCode==13) {
			if (idx>9) {
				alert("10단어 이상 입력이 불가합니다.");
			}else{
				tagArr[idx] = $(this).val();
				tags+=" #"+tagArr[idx];
				idx++;
				$('#tags').val("");
			}
			console.log(tagArr);
			$("[name=tagArr]").text(tags);
		}
	});
	
	$("[name=save]").click(function() {
		if ($("[name=fdProjectNM]").val()=="") {
			alert("제목을 입력하세요.");
			$(this).focus();
		}else if ($("[name=fdTargetPrice]").val()=="0") {
			alert("목표금액을 설정하세요.");
			$(this).focus();
		}else if ($("[name=fdCategoryNum]").val()=="0") {
			alert("카테고리를 선택하세요.");
			$(this).focus()
		}else if ($("[name=fdExpDT]").val()=="") {
			alert("프로젝트 종료일을 선택하세요.");
			$(this).focus();
		}else{
			$("#frm01").submit();
		}
	});
});
</script>

</head>
<%-- 
# 

--%>
<%
	String memNum = (String) session.getAttribute("memnum");
	String creNum = (String) session.getAttribute("creNuum");
	
	
	String fdProjectNM = request.getParameter("fdProjectNM");
	String fdTargetPriceS = request.getParameter("fdTargetPrice");
	String fdImg = request.getParameter("fdImg");
	String fdCategoryNumS = request.getParameter("fdCategoryNum");
	String fdExpDT =request.getParameter("fdExpDT");
	String fdTags [] = request.getParameterValues("fdTags");
	
	if (fdProjectNM!=null) {
		int fdTargetPrice = Integer.parseInt(fdTargetPriceS);
		int fdCategoryNum = Integer.parseInt(fdCategoryNumS);
			
		DAO_MyOnePick dao = new DAO_MyOnePick ();
		dao.update_basic(new Funding(fdProjectNM,fdTargetPrice,fdImg,fdCategoryNum,fdExpDT,fdTags.toString()));
	}


	%>
<body>
	<h1 id="Register_title">기본 정보</h1>
	<form id="frm01">
	<table class="basic">
	<tr>
		<td colspan="2" class="fd_dt_title">프로젝트 제목<span style="color:red">*</span></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="text" name="fdProjectNM" id="contentText" class="fd_dt_contents"/>
      		<h3 class="warning">남은글자수 <span id="count">50</span></h3></td>
	</tr>
	<tr>
		<td colspan="2" class="fd_dt_title">목표금액<span style="color:red">*</span></td>
	</tr>
	<tr>
		<td><input type="text" name="fdTargetPrice" value="0" class="fd_dt_contents"/>
			<h3 class="warning">목표금액은 50만원에서 1억사이 금액으로 설정 가능</h3></td><td>원</td>
	</tr>
	<tr>
		<td colspan="2" class="fd_dt_title">대표이미지<span style="color:red">*</span></td>
	</tr>
	<tr>
		<td colspan="2">
            <input type="file" value="파일 선택" name="fd_img"/>
			<h3 class="warning">3MB 이하의 JPEG, PNG 파일</h3></td>
	</tr>
	<tr>
		<td colspan="2" class="fd_dt_title">카테고리<span style="color:red">*</span></td>
	</tr>
	<tr>
		<td colspan="2">
			<select name="fdCategoryNum" class="fd_dt_contents" >
				<option value="0">선택</option>
				<option value="100">의류</option>
				<option value="200">스티커/지류</option>
				<option value="300">문구/오피스</option>
				<option value="400">기타</option>
			</select>
	</tr>
	<tr>
		<td colspan="2" class="fd_dt_title">프로젝트 종료일<span style="color:red">*</span></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="text" name="fdExpDT" id="datepicker" class="fd_dt_contents" value="">
		</td>
	</tr>
	<tr>
		<td colspan="2" class="fd_dt_title">검색태그<span style="color:red">*</span></td>
	</tr>
	<tr>
		<td><input type="text" name="fdTags" id="tags"value="" class="fd_dt_contents"/>
			<h3 name="tagArr"></h3>
			<h3 class="warning">최대 등록 가능 단어수: 10단어</h3></td><td></td>
	</tr>
	</table>
	</form>
	<input type="submit" value="저장하기" name="save" class="save_choice"/>	

<script type="text/javascript">

	$('#contentText').keyup(function(e) {
		var content = $(this).val();
		$('#count').text(50 - content.length);
		if (content.length > 50) {
			$(this).val($(this).val().substring(0, 50));
			alert("입력 가능한 글자수를 초과하였습니다.");
		}
	});
</script>
</body>
</html>