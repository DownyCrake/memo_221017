package com.memo.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.memo.common.FileManagerService;

@Configuration 
public class webMvcConfig implements WebMvcConfigurer{
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry
		.addResourceHandler("/images/**")  // 웹주소   http://localhost/ ~~
		.addResourceLocations("file:///" + FileManagerService.FILE_UPLOAD_PATH);  // 맥은 file:/  슬래시 1개  실제 파일 주소
	}
}
