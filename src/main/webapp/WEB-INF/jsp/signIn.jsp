<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>  
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<style>
header {height:100px;}
main {height:400px;}
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
			<div class="form-group">
				<input type="text" id="loginId" class="form-control" placeholder="아이디">
			</div>	
			<div class="form-group">
				<input type="password" id="password" class="form-control" placeholder="비밀번호">
			</div>	
			<button type="button" id="signInBtn" class="btn btn-primary  btn-block text-white">로그인</button>
			<button type="button" onclick="location.href='#'"  class="btn btn-dark  btn-block text-white">회원가입</button>
		</section>
		 
	</main>
	<footer class="bg-secondary">
		<div>
		
		</div>
	</footer>
</div>

<script>

$(document).ready(function(){
	
	$("#signInBtn").on('click',function(){
		let loginId = $("#loginId").val().trim();
		if (loginId.length < 1)	{
			alert("아이디를 입력하세요");	
			return;
		}
		let password = $("#password").val().trim();
		if (password.length < 1)	{
			alert("패스워드를 입력하세요");	
			return;
		}
		
		
		
	}); //click
	
	
});//ready

</script>

</body>
</html>