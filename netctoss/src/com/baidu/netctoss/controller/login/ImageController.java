package com.baidu.netctoss.controller.login;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//用于生成一个验证码图片
@Controller
@RequestMapping("/login")
public class ImageController {
	@RequestMapping("/image")
	public void createImage(HttpServletResponse res){
		//生成一个bufferedImage验证码图片
		//利用response将图片输入
	}
}
