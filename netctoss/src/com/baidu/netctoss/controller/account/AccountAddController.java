package com.baidu.netctoss.controller.account;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.baidu.netctoss.dao.AccountMapperDao;
import com.baidu.netctoss.entity.Account;
@Controller
@RequestMapping("/account")
public class AccountAddController {
	@Resource
	private AccountMapperDao dao;
	
	@RequestMapping("/toadd")
	public String loadAccount(){
		return "/account/account_add";
	}
	
	@RequestMapping("/add")
	public String add(Account acc,
		@RequestParam("recommender_idcard") 
		String recommender_idcard){
		//根据推荐人身份证号获取推荐人id(若不为空)，并设置
		if(recommender_idcard!=null&&recommender_idcard!=""){
			Integer recommender_id=
				dao.findIdByIdcard(recommender_idcard);
			acc.setRecommender_id(recommender_id);
		}
		//调用dao添加
		dao.addAccount(acc);
		//返回列表页面
		return "redirect:/account/list.from";
	}
}
