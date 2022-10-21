<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<div class="d-flex justify-content-between align-items-center header-box">
	<%-- logo --%>
	<div>
		<h1 class="font-weight-bold ml-5 text-white">MEMO 게시판</h1>
	</div>
	
	<%-- 로그인 정보 --%>
	<div class="mr-5">
	
		<%-- 로그인이 되었을떄만 정보 노출 --%>
		<c:if test="${not empty userName}">
		<span class="text-white">${userName}님 안녕하세요</span>
		<a href="/user/sign_out" class="ml-3 font-wieght-bold text-warning">로그아웃</a>
		</c:if>
	</div>
</div>   
    