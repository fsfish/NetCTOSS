package com.baidu.netctoss.controller.fee;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.baidu.netctoss.dao.CostMapperDao;

@Controller
@RequestMapping("/fee")
public class FeeStartController {
	@Resource
	private CostMapperDao dao;
	
	@RequestMapping("/start")
	public String start(@RequestParam("id") Integer id){
		dao.start(id);
		return "redirect:/fee/list.from";
	}
}
