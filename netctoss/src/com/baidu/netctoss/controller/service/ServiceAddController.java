package com.baidu.netctoss.controller.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baidu.netctoss.dao.AccountMapperDao;
import com.baidu.netctoss.dao.CostMapperDao;
import com.baidu.netctoss.dao.ServiceMapperDao;
import com.baidu.netctoss.entity.Cost;
import com.baidu.netctoss.entity.Service;
import com.baidu.netctoss.vo.ServiceLine;

@Controller
@RequestMapping("/service")
public class ServiceAddController {
	@Resource
	private ServiceMapperDao dao;
	@Resource
	private AccountMapperDao accDao;
	@Resource
	private CostMapperDao costDao;
	
	@RequestMapping("/toadd")
	public String loadNew(Model model){
		List<Cost> costs=costDao.findAllAvailable();
		model.addAttribute("costs",costs);
		return "/service/service_add";
	}
	
	/*根据输入的idcard，点某个按钮时,查找account_id和login_name并存储*/
	@RequestMapping("/findaccount")
	@ResponseBody//ajax处理逻辑
	public Map findAccountByIdCard(
			@RequestParam("no") String idcard_no){
		//System.out.println(idcard_no);
		Map<String,Object> account=accDao.findByIdCard(idcard_no);
		//System.out.println(account);
		return account;
	}
	
	@RequestMapping("/add")
	public String addService(Service ser){
		dao.addService(ser);
		return "redirect:/service/list.from";
	}
}
