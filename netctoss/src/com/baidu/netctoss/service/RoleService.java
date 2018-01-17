package com.baidu.netctoss.service;

import com.baidu.netctoss.entity.Role;
import com.baidu.netctoss.vo.RolePrivilegeBean;

public interface RoleService {
	public void updateRole(Role role);
	public RolePrivilegeBean loadRole(Integer id);
}
