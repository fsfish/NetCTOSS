package com.baidu.netctoss.controller.account;


import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.baidu.netctoss.dao.AccountMapperDao;

@Controller
@RequestMapping("/account")
public class AccountDeleteController {
	@Resource
	private AccountMapperDao dao;
	
	@RequestMapping("/delete")
	public String deleteAccount(@RequestParam("id") Integer id){
		dao.deleteById(id);
		return "redirect:/account/list.from";
	}
}
