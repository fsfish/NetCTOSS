package com.baidu.netctoss.controller.account;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.baidu.netctoss.dao.AccountMapperDao;
import com.baidu.netctoss.entity.Account;
import com.baidu.netctoss.vo.AccountPage;

@Controller
@RequestMapping("/account")
@SessionAttributes("accountPage")
public class AccountListController {
	@Resource
	private AccountMapperDao dao;
	
	@RequestMapping("list")
	public String listAccount(AccountPage page,Model model){
		List<Account> accounts=dao.findPageByConditions(page);
		Integer rows=dao.countRowsByConditions(page);
		page.setRows(rows);
		//这里需要一个AccountPage类型参数，需要在调本方法时传入得到、接收，
		//因此必须规定发/list.from请求的页面传入与AccountPage对象属性
		//一一对应的几个参数；
//		System.out.println("status:"+page.getStatus());
//		System.out.println("realName:"+page.getReal_name());
//		System.out.println("idcardNo:"+page.getIdcard_no());
//		System.out.println("loginName:"+page.getLogin_name());
		model.addAttribute("accounts",accounts);
		model.addAttribute("accountPage",page);
		return "/account/account_list";
	}
}
