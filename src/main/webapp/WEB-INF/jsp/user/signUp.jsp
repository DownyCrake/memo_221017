<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="signUpDiv" class="d-flex justify-content-center align-items-center ">

	<form id="signUpForm" method="post" class="sign-up-box" action="/user/sign_up">
			<div class="form-group d-flex m-0">
				<input type="text" id="loginId" name="loginId" class="form-control" placeholder="아이디 입력">
				<button type="button" id="loginCheckBtn" class="btn btn-success btn-sm ml-1">중복확인</button>
			</div>	
				<small id="idCheckLength" class="text-danger d-none isDuplicationText">아이디가 4글자 이하입니다.</small>
				<small id="idCheckDuplicated" class="text-danger d-none isDuplicationText">중복된 아이디입니다.</small>
				<small id="idCheckOk"class="text-secondary d-none isDuplicationText">사용가능한 아이디입니다.</small>
				<small class="text-danger">&nbsp</small>
			<div class="form-group m-0">
				<input type="password" id="password" name="password" class="form-control" placeholder="비밀번호 입력">
			</div>	
			<small class="text-danger">&nbsp</small>
			
			<div class="form-group m-0">
				<input type="password" id="passwordCheck" name="passwordCheck" class="form-control" placeholder="비밀번호 확인">
			</div>	
			<small class="text-danger">&nbsp</small>
			<div class="form-group m-0">
				<input type="text" id="name" name="name" class="form-control" placeholder="이름 입력">
			</div>	
			<small class="text-danger">&nbsp</small>
			<div class="form-group m-0">
				<input type="text" id="email" name="email" class="form-control" placeholder="이메일 주소">
			</div>	
			<small class="text-danger">&nbsp</small>
			<button type="submit" id="signUpBtn" class="btn btn-primary  btn-block text-white">회원가입</button>
	</form>
</div>

<script>
$(document).ready(function() {
	//중복확인
	$('#loginCheckBtn').on('click',function() {
		let loginId = $('#loginId').val().trim();	
		// alert(loginId);	
		if (loginId.length < 4) {
			$('#idCheckLength').removeClass('d-none');
			$('#idCheckDuplicated').addClass('d-none');
			$('#idCheckOk').addClass('d-none');
			return;
		}	
	
	$.ajax({
		url:"/user/is_duplicated_id"
		, data:{"loginId":loginId}
		
		, success:function(data){
			if (data.result) { //중복
				$('#idCheckDuplicated').removeClass('d-none');
				$('#idCheckLength').addClass('d-none');
				$('#idCheckOk').addClass('d-none');	
			} else { //중복X
				$('#idCheckDuplicated').addClass('d-none');
				$('#idCheckLength').addClass('d-none');
				$('#idCheckOk').removeClass('d-none');	
			}
		} 
		, error:function(e){
			alert("아이디 중복확인에 실패했습니다. 관리자에게 문의해주세요");
		}
	});//ajax
	}); //duple check click
	
	//회원가입버튼
	$('#signUpForm').on('submit',function(e){
		e.preventDefault(); // 서브밋 기능 중단
		//alert("회원가입");
		let loginId = $("#loginId").val().trim();
		let password = $("#password").val().trim();
		let passwordCheck = $("#passwordCheck").val().trim();
		let name = $("#name").val().trim();
		let email = $("#email").val().trim();
		
		if (loginId.length < 1)	{
			alert("아이디를 입력하세요");	
			return false;
		}
		if (password.length < 1)	{
			alert("비밀번호를 입력하세요");	
			return false;
		}
		if (passwordCheck.length < 1)	{
			alert("비밀번호를 확인하세요");	
			return false;
		}
		if (passwordCheck != password )	{
			alert("비밀번호가 일치하지 않습니다");	
			return false;
		}
		if (name.length < 1)	{
			alert("이름을 입력하세요");
			return false;
		}
		if (email.length < 1)	{
			alert("이메일을 입력하세요");
			return false;
		}
		// 아이디 중복확인이 완료 되었는지 확인 > idCheckOk d-none이 없음
		if ($('#idCheckOk').hasClass('d-none')) {
			alert("아이디 중복확인을 다시 해주세요");
			return false;
		}
		
		// 1) submit
		// $(this)[0].submit();  // 0 번째 form   서브밋 이후에 다른 화면으로 넘길떄 사용 (action 주소> 뷰 화면)
		
		// 2) ajax
		let url = $(this).attr('action');
		let params = $(this).serialize();
		// console.log(params);
		
		$.post(url, params)
		.done(function(data) {
			if (data.code ==100) {
				alert("가입을 환영합니다!!! 로그인 해주세요.");
				location.href="/user/sign_in_view";
			}else {
				alert("가입에 실패했습니다.");
			}
		});
		
	});// submit click
	
});//ready
</script>