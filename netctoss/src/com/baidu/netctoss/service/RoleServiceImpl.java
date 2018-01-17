package com.baidu.netctoss.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.baidu.netctoss.dao.RoleMapperDao;
import com.baidu.netctoss.entity.Privilege;
import com.baidu.netctoss.entity.Role;
import com.baidu.netctoss.entity.Role_Privilege;
import com.baidu.netctoss.util.PrivilegeReader;
import com.baidu.netctoss.vo.RolePrivilegeBean;

@Service
@Transactional//相当于给各个方法都加了读/写类型的事务控制
public class RoleServiceImpl implements RoleService {
	@Resource
	private RoleMapperDao dao;
	
	public void updateRole(Role role) {
		//根据id修改名字
		dao.updateById(role);
		//清空之前该id下所有privilege
		dao.deletePriviByRoleId(role.getId());
		//为该id下添加所选的所有privilege
		//dao=null;//模拟异常，测试事务是否启用
		if(role.getRolePrivis()!=null){
			for(Integer pid:role.getRolePrivis()){
				Role_Privilege rp=new Role_Privilege();
				rp.setRole_id(role.getId());
				rp.setPrivilege_id(pid);
				dao.addPrivi(rp);
			}
		}
	}
	
	@Transactional(readOnly=true)//只支持读的事务,方法中不能有增删改
	public RolePrivilegeBean loadRole(Integer id){
		//调用dao查询角色信息
		Role r=dao.findById(id);
		//调用PrivilegeReader取出privilege信息
		List<Privilege> allPrivileges=
			PrivilegeReader.getModules();
		//*将查到的role的信息，和所有privi信息封装成一个对象，
		//因为要根据这两个对象其中的属性做判断，匹配上的即为该role有这个privi id
		//和privi name，在jsp中才check；这一段判断逻辑要在一个对象中用方法完成
		
//		/*测试role_privileges属性*/
//		for(Role_Privilege rp:r.getRole_privileges()){
//			System.out.println(rp.getPrivilege_id());
//		}
		
		RolePrivilegeBean rp=new RolePrivilegeBean();
		rp.setRole(r);
		rp.setAllPrivileges(allPrivileges);
		return rp;
	}
}
