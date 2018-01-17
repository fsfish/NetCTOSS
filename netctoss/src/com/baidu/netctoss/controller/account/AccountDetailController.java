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
public class AccountDetailController {
	@Resource
	private AccountMapperDao dao;
	
	@RequestMapping("/detail")
	public String loadAccount(
			@RequestParam("id") Integer id,Model model ){
		Account a=dao.findById(id);
		String recommender_idcard=dao.findIdcardById(a.getRecommender_id());
		model.addAttribute("account",a);
		model.addAttribute("recommender_idcard",recommender_idcard);
		return "/account/account_detail";
	}
}
