package com.baidu.netctoss.entity;

import java.io.Serializable;
import java.util.List;

public class Role_Privilege implements Serializable {

	private Integer role_id;
	private Integer privilege_id;
	
	public Integer getRole_id() {
		return role_id;
	}
	public void setRole_id(Integer roleId) {
		role_id = roleId;
	}
	public Integer getPrivilege_id() {
		return privilege_id;
	}
	public void setPrivilege_id(Integer privilegeId) {
		privilege_id = privilegeId;
	}
}
