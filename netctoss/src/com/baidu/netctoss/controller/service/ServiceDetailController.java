package com.baidu.netctoss.controller.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.baidu.netctoss.dao.ServiceMapperDao;
import com.baidu.netctoss.vo.ServiceLine;

@Controller
@RequestMapping("/service")
public class ServiceDetailController {
	@Resource
	private ServiceMapperDao dao;
	
	@RequestMapping("/detail")
	public String deleteService(
			@RequestParam("id") Integer id,Model model){
		ServiceLine s=dao.findById(id);
		//System.out.println("id:"+s.getId());
		model.addAttribute("serviceLine",s);
		
		return "/service/service_detail";
	}
	
}
