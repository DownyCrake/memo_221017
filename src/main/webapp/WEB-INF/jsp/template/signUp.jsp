<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>  
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<style>
header {height:100px;}
main {height:500px;}
footer {height:100px;}

</style>

</head>
<body>
<div class="container">
	<header class="bg-secondary">
		<div>
		
		</div>
	</header>
	<main class="d-flex">
		<section class="m-auto w-25">
			<div class="form-group d-flex m-0">
				<input type="text" id="loginId" class="form-control" placeholder="아이디 입력">
				<button type="button" class="btn btn-success btn-sm ml-1">중복확인</button>
			</div>	
				<small class="text-danger d-none isDuplicationText">사용할 수 없는 아이디입니다.</small>
				<small class="text-secondary d-none isDuplicationText">사용가능한 아이디입니다.</small>
				<small class="text-danger">&nbsp</small>
			<div class="form-group m-0">
				<input type="password" id="password" class="form-control" placeholder="비밀번호 입력">
			</div>	
			<small class="text-danger">&nbsp</small>
			
			<div class="form-group m-0">
				<input type="password" id="passwordCheck" class="form-control" placeholder="비밀번호 확인">
			</div>	
			<small class="text-danger">&nbsp</small>
			<div class="form-group m-0">
				<input type="text" id="name" class="form-control" placeholder="이름 입력">
			</div>	
			<small class="text-danger">&nbsp</small>
			<div class="form-group m-0">
				<input type="text" id="email" class="form-control" placeholder="이메일 주소">
			</div>	
			<small class="text-danger">&nbsp</small>
			<button type="button" id="signUpBtn" class="btn btn-primary  btn-block text-white">회원가입</button>
		</section>
		 
	</main>
	<footer class="bg-secondary">
		<div>
		
		</div>
	</footer>
</div>

<script>
$(document).ready(function(){
	
	$("#signUpBtn").on('click',function(){
		
		let loginId = $("#loginId").val().trim();
		if (loginId.length < 1)	{
			alert("아이디를 입력하세요");	
			return;
		}
		let password = $("#password").val().trim();
		if (password.length < 1)	{
			alert("비밀번호를 입력하세요");	
			return;
		}
		let passwordCheck = $("#passwordCheck").val().trim();
		if (passwordCheck.length < 1)	{
			alert("비밀번호를 확인하세요");	
			return;
		}
		let name = $("#name").val().trim();
		if (name.length < 1)	{
			alert("이름을 입력하세요");
			return;
		}
		let email = $("#email").val().trim();
		if (email.length < 1)	{
			alert("이메일을 입력하세요");
			return;
		}
		
		
		
	}); //click
	
});//ready

</script>

</body>
</html>