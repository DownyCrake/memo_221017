<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="form-group">
	<input type="text" id="loginId" class="form-control" placeholder="아이디">
</div>

<div class="form-group">
	<input type="password" id="password" class="form-control"
		placeholder="비밀번호">
</div>

<button type="button" id="signInBtn"
	class="btn btn-primary  btn-block text-white">로그인</button>
<button type="button" onclick="location.href='/user/sign_up'"
	class="btn btn-dark  btn-block text-white">회원가입</button>
