package com.baidu.netctoss.controller.fee;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.baidu.netctoss.dao.CostMapperDao;
import com.baidu.netctoss.entity.Cost;

@Controller
@RequestMapping("/fee")
public class FeeDetailController {
	@Resource
	private CostMapperDao dao;
	
	@RequestMapping("/detail")
	public String toDetail(
		@RequestParam("id") Integer id,Model model){
		Cost cost=dao.findById(id);
		model.addAttribute("cost",cost);
		return "fee/fee_detail";
	}
}
