package com.baidu.netctoss.entity;

import java.io.Serializable;
import java.util.List;

import com.baidu.netctoss.util.PrivilegeReader;

public class Role implements Serializable{
	private Integer id;
	private String name;
	private List<Role_Privilege> role_privileges;
	//为了接收jsp中表单提交的多个checkbox选中项的value(即privilege_id)
	private Integer[] rolePrivis;

	//追加getPriviNames方法，用于在jsp使用${r.priviNames}时能调用本get
	public String getPriviNames(){
		//根据role_privileges属性的privilege_id属性，
		//找权限名字(用工具里PrivilegeReader)
		//拼在一起返回
		String priviNames="";
		for(int i=0;i<role_privileges.size();i++){
			Role_Privilege rp=role_privileges.get(i);
			String name=PrivilegeReader.
			getModuleNameById(rp.getPrivilege_id().toString());
			priviNames+=name;
			if(i<role_privileges.size()-1){
				priviNames+="、";
			}
		}
		return priviNames;
	}
	
	public Integer[] getRolePrivis() {
		return rolePrivis;
	}
	public void setRolePrivis(Integer[] rolePrivis) {
		this.rolePrivis = rolePrivis;
	}
	public List<Role_Privilege> getRole_privileges() {
		return role_privileges;
	}
	public void setRole_privileges(List<Role_Privilege> rolePrivileges) {
		role_privileges = rolePrivileges;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
