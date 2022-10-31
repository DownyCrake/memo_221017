package com.memo.post;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.memo.post.bo.PostBO;

@RequestMapping("/post")
@RestController
public class PostRestController {
	
	@Autowired
	private PostBO postBO;
	
	/* 글 쓰기 */
	@PostMapping("/create")
	public Map<String, Object> create(
			@RequestParam("subject") String subject
			, @RequestParam(value="content", required=false) String content
			, @RequestParam(value="file", required=false) MultipartFile file
			, HttpSession session
			){
		
		String userLoginId = (String)session.getAttribute("userLoginId");
		Integer userId = (Integer)session.getAttribute("userId");
		
		// DB insert
		int row = postBO.addPost(userId, userLoginId, subject, content, file);
		
		
		Map<String, Object> result = new HashMap<>();
		if (row > 0) {
			result.put("code", 100);
			result.put("reuslt", "success");		
			}else {
				result.put("errorMessage","메모저장에 실패했습니다. 관리자에게 문의해주세요.");
			}
	
		return result;
	}
	
	/* 글 수정 */
	@PutMapping("/update")
	public Map<String, Object> update(
			@RequestParam("postId") int postId
			, @RequestParam("subject") String subject
			, @RequestParam(value="content", required=false) String content
			, @RequestParam(value="file", required=false) MultipartFile file
			, HttpSession session) {
		
		int userId = (int)session.getAttribute("userId");
		String userLoginId = (String)session.getAttribute("userLoginId");
		
		int count = postBO.updatePost(postId, userId, userLoginId, subject, content, file);
		
		Map<String, Object> result = new HashMap<>();
		
		if(count > 0) {
			result.put("code",100);//실패
		} else {
			result.put("code",400);
			result.put("errorMessage", "글 수정에 실패했습니다");
		}
		
		
		result.put("code",100);
		
		return result;
	}
	
	
	@DeleteMapping("/delete")
	public Map<String, Object> delete(
			@RequestParam("postId") int id){
		
		Map<String, Object> result = new HashMap<>();

		int row = postBO.deletePostByPostId(id);
		if (row > 0) {
			result.put("code", 100);
			result.put("result", "success");
		} else {
			result.put("code", 400);
			result.put("errorMessage","삭제에 실패했습니다");
		}
		
		return result;
	}
	
}
