package com.baidu.netctoss.controller.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.baidu.netctoss.dao.ServiceMapperDao;

@Controller
@RequestMapping("/service")
public class ServiceStatusController {
	@Resource
	private ServiceMapperDao dao;
	//由开通变暂停
	@RequestMapping("/pause")
	public String pauseService(
			@RequestParam("id") Integer id){
		dao.pauseById(id);
		return "redirect:/service/list.from";
	}
	//由暂停变开通
	@RequestMapping("/start")
	public String startService(
			@RequestParam("id") Integer id){
		dao.startById(id);
		return "redirect:/service/list.from";
	}
}
