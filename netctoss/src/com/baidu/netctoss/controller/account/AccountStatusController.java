package com.baidu.netctoss.controller.account;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.baidu.netctoss.dao.AccountMapperDao;

@Controller
@RequestMapping("/account")
public class AccountStatusController {
	@Resource
	private AccountMapperDao dao;
	
	@RequestMapping("/pause")
	public String pauseAccount(@RequestParam("id") Integer id){
		dao.pauseById(id);
		return "redirect:/account/list.from";
	}
	@RequestMapping("/start")
	public String startAccount(@RequestParam("id") Integer id){
		dao.startById(id);
		return "redirect:/account/list.from";
	}
}
