package com.memo.post;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.memo.post.bo.PostBO;
import com.memo.post.model.Post;

@RequestMapping("/post")
@Controller
public class PostController {

	@Autowired
	private PostBO postBO;
	
	/* 글 목록 화면 */
	@RequestMapping("/post_list_view")
	public String postListView(
			@RequestParam(value="prevId", required=false) Integer prevIdParam
			, @RequestParam(value="nextId", required=false) Integer nextIdParam
			, HttpSession session, Model model) {
		Integer userId = (Integer)session.getAttribute("userId");  //로그인이 풀려있으면 Null 이므로 int 불가
		if (userId == null) { //로그인이 풀려있으면 로그인 페이지로 리다이렉트
			return "redirect:/user/sign_in_view";
		}
		List<Post> postList = postBO.getPostListById(userId, prevIdParam, nextIdParam);
		int prevId = 0;
		int nextId = 0;
		if (postList.isEmpty() == false) {  //postList가 비어있을떄 에러 방지
			prevId = postList.get(0).getId();
			nextId = postList.get(postList.size() - 1).getId();
			
			//next 페이지의 끝인가
			// 가장 작은 숫자를 가져와서 nextId와 같으면 마지막 페이지
			if (postBO.isLastPage(userId, nextId)) {
				nextId = 0;
			}
			
			//prev 페이지의 끝인가
			// 가장 큰 숫자(postId)와 prevId가 같으면 첫페이지
			if (postBO.isFirstPage(userId, prevId)) {
				prevId = 0;
			}
		}
		model.addAttribute("prevId", prevId); //가져온 post중 가장 앞쪽 (큰 숫자) 아이디
		model.addAttribute("nextId", nextId); // 가져온 post 중 가장 뒤쪽 (작은 숫자) 아이디
		model.addAttribute("postList", postList);
		model.addAttribute("viewName", "post/postList");
		return "template/layout";
	}
	
	@RequestMapping("/post_create_view")
	public String postCreateView(HttpSession session, Model model) {
		Integer userId = (Integer)session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/user/sign_in_view";
		}
		model.addAttribute("viewName", "post/postCreate");
		return "template/layout";
	}
	
	@RequestMapping("/post_detail_view")
	public String postDetailView(
			@RequestParam("postId") int PostId
			,HttpSession session
			, Model model) {
		
		//로그인 확인 > 안되있으면 로그인 페이지로
		Integer userId = (Integer)session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/user/sign_in_view";
		}
		// postId에 해당하는 데이터를 가져와서 model에 담는다
		Post post = postBO.getPostByPostIdAndUserId(PostId, userId);
		model.addAttribute("post",post);
		
		// layout 화면 이동
		model.addAttribute("viewName", "post/postDetail");
		return "template/layout";

	}
	
}
