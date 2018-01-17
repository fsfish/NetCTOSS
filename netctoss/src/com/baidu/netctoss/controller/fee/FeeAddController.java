package com.baidu.netctoss.controller.fee;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.baidu.netctoss.dao.CostMapperDao;
import com.baidu.netctoss.entity.Cost;
@Controller
@RequestMapping("/fee")
public class FeeAddController {
	@Resource
	private CostMapperDao dao;
	
	@RequestMapping("/toadd")
	public String toAdd(){
		return "/fee/fee_add";
	}
	@RequestMapping("add")
	public String add(Cost c){
		dao.insertFee(c);
		return "redirect:/fee/list.from";
	}
}
