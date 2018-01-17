package com.baidu.netctoss.controller.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.baidu.netctoss.dao.ServiceMapperDao;

@Controller
@RequestMapping("/service")
public class ServiceDeleteController {
	@Resource
	private ServiceMapperDao dao;
	
	@RequestMapping("/delete")
	public String deleteService(
			@RequestParam("id") Integer id){
		dao.deleteById(id);
		return "redirect:/service/list.from";
	}
	
}
