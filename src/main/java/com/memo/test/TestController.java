package com.memo.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TestController {

	    @RequestMapping("/test1")
	    public String helloWorld() {
	        return "/test1";
	    }

	    @RequestMapping("/test2")
	    public String logIn() {
	    	return "/signIn";
	    }

	    @RequestMapping("/test3")
	    public String signUp() {
	    	return "/signUp";
	    }
}
