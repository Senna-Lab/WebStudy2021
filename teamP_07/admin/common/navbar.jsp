<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>

<meta charset="UTF-8">
<%
String dept = request.getParameter("dept");
String name = request.getParameter("name");
String date = request.getParameter("date");


%>
    <!-- Page Wrapper -->
    <div class="container-fluid" id="wrapper">
	  <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-dark static-top">

                    <!-- Topbar Navbar -->
                    <div class="navbar-collapse collapse w-30 order-1 order-md-0 dual-collapse2">
       					 <ul class="navbar-nav me-auto">
						 <a class="navbar-brand" href="../admin_index.jsp">
							<img src="../common/img/logo.png"></a>
                        </ul>
                    </div>
          
					<div class="navbar-collapse collapse w-100 order-3 dual-collapse2">
      					<ul class="navbar-nav ms-auto" id="topbar-item">
        						<li class="nav-item" id="topbar-greeting">
         					 		<%=dept %> <%=name %>님, 환영합니다!<br>
         					 		<span>(로그인: <%=date %>)</span>
         					 	</li>
       						     <li class="nav-item">
									<a href="#" class="d-none d-sm-inline-block btn btn-sm btn-outline-light shadow-sm" id="btn_logout">
                                	<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                	Log out
                               		</a>
                               	</li>
                            </ul>
                    </div>       
                    

                </nav>
                <!-- End of Topbar -->
		
    <div class="row flex-nowrap">
    	
    
    <!--  Side bar -->
        <div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0" id="sidebar">
            <div class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white min-vh-100">
                <a href="#" class="d-flex align-items-center pb-3 mb-md-0 mx-auto text-white text-decoration-none">
                    <span class="fs-5 d-none d-sm-inline" id="sidebar-title">Menu</span>
                </a>
                <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start" id="menu">
                    <li class="nav-item">
                        <a href="#" class="nav-link align-middle px-0">
                            <i class="fs-4 bi-house"></i> <span class="ms-1 d-none d-sm-inline">Home</span>
                        </a>
                    </li>
                    <li>
                        <a href="#submenu1" data-bs-toggle="collapse" class="nav-link px-0 align-middle">
                            <i class="fs-4 bi-speedometer2"></i> <span class="ms-1 d-none d-sm-inline">회원 관리</span> </a>
                        <ul class="collapse show nav flex-column" id="submenu1" data-bs-parent="#menu">
                            <li class="w-100">
                                <a href="../member/check_grade.jsp" class="nav-link px-0"> <span class="d-none d-sm-inline">크리에이터 등업</span></a>
                            </li>
                            <li>
                                <a href="../member/entire.jsp" class="nav-link px-0"> <span class="d-none d-sm-inline">전체 조회</span></a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#" class="nav-link px-0 align-middle">
                            <i class="fs-4 bi-table"></i> <span class="ms-1 d-none d-sm-inline">가등록 상품 검토</span></a>
                    </li>
                    <li>
                        <a href="#submenu2" data-bs-toggle="collapse" class="nav-link px-0 align-middle ">
                            <i class="fs-4 bi-bootstrap"></i> <span class="ms-1 d-none d-sm-inline">신고 관리</span></a>
                        <ul class="collapse nav flex-column" id="submenu2" data-bs-parent="#menu">
                            <li class="w-100">
                                <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline">새로운 신고 확인</span></a>
                            </li>
                            <li>
                                <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline">보류 신고</span></a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#submenu3" data-bs-toggle="collapse" class="nav-link px-0 align-middle ">
                            <span class="ms-1 d-none d-sm-inline">제조사 관리</span></a>
                        <ul class="collapse nav flex-column" id="submenu3" data-bs-parent="#menu">
                            <li class="w-100">
                                <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline">제조사 관리</span></a>
                            </li>
                            <li>
                                <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline">제조사 등록</span></a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#submenu4" data-bs-toggle="collapse" class="nav-link px-0 align-middle">
                            <i class="fs-4 bi-grid"></i> <span class="ms-1 d-none d-sm-inline">로그</span></a>
                            <ul class="collapse nav flex-column" id="submenu4" data-bs-parent="#menu">
                            <li class="w-100">
                                <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline">회원 로그</span></a>
                            </li>
                            <li>
                                <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline">게시물 관리 로그</span></a>
                            </li>
                            <li>
                                <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline">신고 관리 로그</span></a>
                            </li>                       
                        </ul>
                    </li>
                    <li>
                        <a href="#" class="nav-link px-0 align-middle">
                            <i class="fs-4 bi-people"></i> <span class="ms-1 d-none d-sm-inline">직원 로그</span> </a>
                    </li>
                </ul>
            </div>
        </div>
    <!--  End of Side bar -->   