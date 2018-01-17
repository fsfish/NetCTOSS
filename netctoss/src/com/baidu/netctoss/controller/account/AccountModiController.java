package com.baidu.netctoss.controller.account;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.baidu.netctoss.dao.AccountMapperDao;
import com.baidu.netctoss.entity.Account;
@Controller
@RequestMapping("/account")
public class AccountModiController {
	@Resource
	private AccountMapperDao dao;
	
	@RequestMapping("/toupdate")
	public String loadAccount(
			@RequestParam("id") Integer id,Model model ){
		Account a=dao.findById(id);
		model.addAttribute("account",a);
		return "/account/account_modi";
	}
	
	@RequestMapping("/update")
	public String update(Account acc){
		dao.updateAccount(acc);
		return "redirect:/account/list.from";
	}
}
