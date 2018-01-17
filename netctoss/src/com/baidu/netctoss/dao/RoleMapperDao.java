package com.baidu.netctoss.dao;

import java.util.List;

import com.baidu.netctoss.entity.Role;
import com.baidu.netctoss.entity.Role_Privilege;
import com.baidu.netctoss.vo.Page;


public interface RoleMapperDao {
	public List<Role> findPage(Page p);
	public List<Role> findRoles();
	public Role findById(Integer id);
	/*更新role涉及三方法*/
	public void updateById(Role role);
	public void deletePriviByRoleId(Integer id);
	public void addPrivi(Role_Privilege rp);
}
