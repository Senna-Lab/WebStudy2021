<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "z02_vo.*"
    import = "java.util.*"    
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<c:set var = "path" value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value="utf-8"/>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>This is title</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.js"> </script>
<script type="text/javascript"></script>
<%--

# MVC 패턴 핵심 로직
1. 모델1(jsp)에서 처리하는 핵심 데이터, 화면 처리 등을 분리시켜,
	보다 기능별로 처리할 수 있게 한다.
2. 주요 기능 처리 내용
	1) Controller: 중재자 역할을 한다. 요청값을 처리하고, 모델 데이터에 맞게 이 요청값을 변경하고,
					화면에 전달할 핵심 데이터를 모델 데이터로 만든다.
					최종적으로 화면(view, jsp)를 호출하여 효과적으로 웹프로그래밍을 할 수 있게 한다.
	2) model: 컨트롤러에서 보내온 요청값을 가지고, 화면에 전달할 핵심 데이터를 만든다. 일반적으로 database를 연동한 dao에서 온 데이터나,
				조건/반복문 등을 통해서 이 모델 데이터를 만든다. jsp에서는 request.setAttribute("모델명", 핵심데이터)형식으로 처리한다.
				framework에서는 이러한 처리를 해주는 기능 객체를 사용하며 service단이라고도 한다.
	3) view: 모델 데이터를 controller를 통해 전달받아, 화면을 구성하는 것을 말한다. 보통 jsp로 웹 화면을 구성하지만, 파일을 다운로드하거나 엑셀을 다운로드 하는 등
			여러가지 화면 구성을 할 수 있다. 넘겨온 model을 el/jstl을 통해 사용자의 ui(user interface)에 맞게 처리 해준다.

# MVC 패턴 코딩 순서
1. 초기 화면 호출을 위한 controller 구성
	요청 page url 형식을 정하여, 호출할 초기 화면 page를 선언한다.
	1) http://localhost:7080/jspexp/start.do
		urlPatterns={"/start.do"}
	2) 만일 초기화면에서도 데이터나 로직을 처리하여, model 데이터가 출력이 필요하면 
		model단을 선언하여 dao/로직을 호출하여 model 데이터를 처리한다.
		request.setAttribute("모델명", 처리할 데이터 객체);
	3) RequestDispatcher rd = request.getRequestDispatcher("jsp폴더 및 파일 명");
		rd.forard(request, response);
	4) jsp 폴더 및 파일명: view단(jsp) 파일 지정
2. 초기화면 (view단 처리)
	1) jsp로 화면 구성을 한다.
	2) model 데이터가 있으면 el/jstl을 이용하여 화면구성 처리를 한다.
	3) 다음 처리 프로세스를 위해서 form을 선언하고, form 하위에 여러가지 요소객체
		<input, <select, <textarea, 를 동해 name 속성으로 데이터를 전송할 준비를 한다.
	4) submit 버튼이나, button을 통해서 js의 함수를 호출하여,
		전송할 데이터에 대한 유효성(공백/숫자처리/형식)을 체크하고 전송할 수 있게 한다.
	5) submit 처리를 통해서, form의 method 방식 get/post, 호출할 controller를 action 속성으로 지정하여 처리한다.
		<form method="post" action="${path}/gogo.do">
3. 요청값을 받는 controller
	1) 요청값에 대한 처리. 
		String 변수명 = request.getParameter("요청key");
	2) model 데이터 처리를 위한 작업
		(화면단에 보여줄 데이터가 있을 떄)
		요청값에 대한 model 데이터를 만들기 위해 데이터 변형이나, 조건/반복문을 처리한다.
		ex) porc(upt,del,del(??))따라서 dao단 호출 변경 등..
		cf) service: 요청값에 따라 데이터처리/모델 데이처 변형 처리 프로세스
			dao(Data Access Object): 데이터 접근하여 처리하는 객체
		# 모델 데이터가 필요할 떄 (화면에 보여줄 데이터가 있는 경우)
			- list, 상세페이지, 수정 후 수정된 내용을 보는 경우
		# 모델 데이터가 필요 없는 경우 (처리 프로세스만 있고, 화면에는 데이터 없음)
			- 등록, 삭제
	3) model 데이터 처리
		위에 service로 처리된 데이터를 아래 형식으로 모델 데이터로 만든다.
		request.setAttribute("모델명", 할당할 데이터 객체);
	4) 프로세스가 조건에 따라서 사용하게 될 view단을 호출
		ex) 위 처리 프로세스(service)에서 id/pass가 있을 떄는 메인페이지로 이동, 없을 때는 다시 로그인 페이지로 이동.
		


# MVC 패턴으로 계산기 만들기
1. 소스
	1) Controller: a02_mvc\A20_MVC_Calcu.java
	2) View: a14_mvc\a01_basic.jsp
2. 구현순서
	1) 초기화면 로딩
		controller단 구현
		==> servlet으로 A20_MVC_CAlcu.java 객체 생성, calcu.do로 호출 가능 처리
		==> RequestDispatcher rd = request.getRequestDispatcher("\a14_mvc\a01_basic.jsp");
		view단 구현
		==> 기본 form 화면 구현. num01, num02, cal(연산자) 선택시 다시 controller를 호출하게 구현
	2) 요청값 처리, 결과 출력
		controller 구현
		
		==> 요청값 처리
		request.getParameter("num01"),
		request.getParameter("num02"),
		request.getParameter("cal")
		==> 모델 데이터 만들기
		request.setAttribute("sum", num01+num02);
		
		view단 구현
		==> 이전 요청값을 el태그로 ${param.num01}로 처리하고 model 데이터로 온 값을 ${sum}으로 처리하여 @@@ + @@@ = @@@ 형식으로 출력하게 처리한다.
		
		
	

--%>
<body>
<script type="text/javascript">
	$(document).ready(function(){
		$("[name=cal]").change(function(){
			if($(this).val()!=""){
				alert("계산결과 처리");
				$("form").submit();
			}
		});
	});

</script>
	<h2>MVC 계산기</h2>
	<form method="post">
	<p>num01: <input type="number" name="num01"/></p>
	<p>num02: <input type="number" name="num02"/></p>
	<p>연산자: <select name="cal">
				<option value="">연산자 선택</option>
				<option value="0">+</option>
				<option value="1">-</option>
				<option value="2">*</option>
				<option value="3">/</option>
			</select>
	</p>
	<!-- <p><input type="submit" value="확인" /></p> -->
	</form>
	
	<c:if test="${not empty param.num01 }">
	<p>${param.num01 } ${calSign } ${param.num02 } = ${result }</p>
	</c:if>
</body>
</html>