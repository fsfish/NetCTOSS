package com.baidu.netctoss.controller.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.baidu.netctoss.dao.ServiceMapperDao;
import com.baidu.netctoss.vo.ServiceLine;
import com.baidu.netctoss.vo.ServicePage;

@Controller
@RequestMapping("/service")
@SessionAttributes("servicePage")
public class ServiceListController {
	@Resource
	private ServiceMapperDao dao;
	
	@RequestMapping("list")
	public String listByConditions(ServicePage page,Model model){
		List<ServiceLine> services=dao.findByConditions(page);
		Integer rows=dao.countRowsByConditions(page);
		page.setRows(rows);//查出总行数，totalPage即可得
		model.addAttribute("services",services);
		model.addAttribute("servicePage",page);
		return "/service/service_list";
	}
	
}
