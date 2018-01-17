package com.baidu.netctoss.controller.role;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.baidu.netctoss.dao.CostMapperDao;
import com.baidu.netctoss.dao.RoleMapperDao;
import com.baidu.netctoss.dao.ServiceMapperDao;
import com.baidu.netctoss.entity.Cost;
import com.baidu.netctoss.entity.Privilege;
import com.baidu.netctoss.entity.Role;
import com.baidu.netctoss.entity.Role_Privilege;
import com.baidu.netctoss.service.RoleService;
import com.baidu.netctoss.service.RoleServiceImpl;
import com.baidu.netctoss.util.PrivilegeReader;
import com.baidu.netctoss.vo.RolePrivilegeBean;
import com.baidu.netctoss.vo.ServiceLine;

@Controller
@RequestMapping("/role")
public class RoleModiController {
	@Resource
	private RoleMapperDao dao;
	@Resource
	private RoleService roleServiceIpml;//也是通过接口方式接收注入的实现类
	
	@RequestMapping("/toupdate")
	public String loadRole(
			@RequestParam("rid") Integer id,Model model){
		//将业务封装到service，service处理完后返回一个RolePrivilegeBean对象
		RolePrivilegeBean rp=roleServiceIpml.loadRole(id);
		model.addAttribute("rolePrivi",rp);
		return "/role/role_modi";
	}
	
	@RequestMapping("update")
	public String updateRole(Role role){
		//业务逻辑全部封装到service包
		roleServiceIpml.updateRole(role);
		return "redirect:/role/list.from";
	}
	
}
