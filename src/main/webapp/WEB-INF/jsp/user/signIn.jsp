<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="signInDiv" class="d-flex justify-content-center align-items-center ">
<form id="signInForm" method="post"  action="/user/sign_in" >
	<div class="form-group">
		<input type="text" id="loginId" name="loginId" class="form-control" placeholder="아이디">
	</div>
	
	<div class="form-group">
		<input type="password" id="password" name="password" class="form-control"
			placeholder="비밀번호">
	</div>
	
	<input type="submit" id="signInBtn"
		class="btn btn-primary  btn-block text-white" value="로그인">
		
		<a href="/user/sign_up_view" >
	<button type="button"
		class="btn btn-dark  btn-block text-white mt-3">회원가입</button>
		</a>
</form>

</div>
<script>

$(document).ready(function() {

	$("#signInForm").on('submit', function(e) {

		e.preventDefault();
		
		// alert("test");
		
		let loginId = $('input[name=loginId]').val().trim();
		let password = $('input[name=password]').val().trim();
		if (loginId == ""){
			alert("아이디를 입력해주세요.");
			return false;
		} 
		if (password == ""){
			alert("패스워드를 입력해주세요.");
			return false;
		} 
		
		// ajax
		let url = $(this).attr('action');
		let params = $(this).serialize();
		
		$.post(url,params)
		.done(function(data){
			if (data.code == 100) { //성공
				location.href = "/post/post_list_view" //글 목록 화면으로 이동
			} else {
				alert(data.errorMessage);
			}
			
		}); //done
		
	});// 로그인 버튼 클릭
	
}); //ready


</script>