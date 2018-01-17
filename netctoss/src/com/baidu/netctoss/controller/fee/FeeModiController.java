package com.baidu.netctoss.controller.fee;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.baidu.netctoss.dao.CostMapperDao;
import com.baidu.netctoss.entity.Cost;
import com.baidu.netctoss.vo.Page;
@Controller
@RequestMapping("/fee")
public class FeeModiController {
	@Resource
	private CostMapperDao dao;
	@RequestMapping("/toupdate")
	public String toUpdate(
		@RequestParam("id") Integer id,Model model){
		Cost cost=dao.findById(id);
		model.addAttribute("cost",cost);
		return "fee/fee_modi";
	}
	
	@RequestMapping("/update")
	public String update(Cost c){
		dao.updateById(c);
		return "redirect:/fee/list.from";
	}
}
