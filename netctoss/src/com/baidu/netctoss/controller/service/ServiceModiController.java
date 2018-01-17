package com.baidu.netctoss.controller.service;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.baidu.netctoss.dao.CostMapperDao;
import com.baidu.netctoss.dao.ServiceMapperDao;
import com.baidu.netctoss.entity.Cost;
import com.baidu.netctoss.vo.ServiceLine;

@Controller
@RequestMapping("/service")
public class ServiceModiController {
	@Resource
	private ServiceMapperDao dao;
	@Resource
	private CostMapperDao costDao;
	
	@RequestMapping("/toupdate")
	public String loadService(
			@RequestParam("id") Integer id,Model model){
		ServiceLine s=dao.findById(id);
		List<Cost> costs=costDao.findAllAvailable();
		//System.out.println("id:"+s.getId());
		model.addAttribute("serviceLine",s);
		model.addAttribute("costs",costs);
		return "/service/service_modi";
	}
	@RequestMapping("/update")
	public String updateService(ServiceLine ser){
		dao.updateService(ser);
		//System.out.println(ser.getId()+","+ser.getCost_id());
		return "redirect:/service/list.from";
	}
}
