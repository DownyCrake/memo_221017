package com.memo.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.memo.common.EncryptUtils;
import com.memo.user.bo.UserBO;

@RequestMapping("/user")
@RestController
public class UserRestController {

	@Autowired
	private UserBO userBO;
	
	
	@RequestMapping("/is_duplicated_id")
	public Map<String, Object> idDuplicatedId(
			@RequestParam("loginId") String loginId
			) {
		Map <String, Object> result = new HashMap<>();
		boolean isDuplicated = userBO.existLoginId(loginId); 
		if (isDuplicated) {
			result.put("result", true); //중복
			result.put("code", 100); //성공
		} else {
			result.put("result", false); //중복아님
			result.put("code", 100); //성공
		}
				
		return result;
	}
	
	@PostMapping("/sign_up")
	public Map<String, Object> signUp(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, @RequestParam("name") String name
			, @RequestParam("email") String email){
		
		// 암호화 => 해싱  - 복호화 불가. 같은 값인지 확인 가능
		// md5 
		String encryptPassword = EncryptUtils.md5(password);   //static은 메모리에 상주하므로 new 필요 없음
		
		
		//db insert
		userBO.addUser(loginId, encryptPassword, name, email);
		
		Map<String, Object> result = new HashMap<>();
		result.put("code", 100);
		result.put("result", "success");
		return result;
	}
	
	
}
