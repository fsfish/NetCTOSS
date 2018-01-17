package com.baidu.netctoss.controller.role;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.baidu.netctoss.dao.RoleMapperDao;
import com.baidu.netctoss.entity.Role;
import com.baidu.netctoss.vo.Page;

@Controller
@RequestMapping("/role")
public class RoleListController {
	@Resource
	private RoleMapperDao dao;
	
	@RequestMapping("list")
	public String listByConditions(Page page,Model model){
		List<Role> roles=dao.findPage(page);
		//Integer rows=dao.countRowsByConditions(page);
		//page.setRows(rows);//查出总行数，totalPage即可得
		model.addAttribute("roles",roles);
		//model.addAttribute("servicePage",page);
		return "/role/role_list";
	}
	
}
