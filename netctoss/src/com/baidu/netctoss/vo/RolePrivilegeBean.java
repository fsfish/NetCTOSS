package com.baidu.netctoss.vo;

import java.util.List;

import com.baidu.netctoss.entity.Privilege;
import com.baidu.netctoss.entity.Role;
import com.baidu.netctoss.entity.Role_Privilege;

public class RolePrivilegeBean {
	private Role role;//封装dao查出的一个Role对象
	private List<Privilege> allPrivileges;//封装从xml抓取出的所有Privilege对象
	private Integer privi_id;

	//如果role的里面的(所有)role_privileges(对象)属性的privilege_id属性
	public boolean isChecked(){//类似getXX,jsp中只要.XX就能得到；
	//布尔类型用isXX，jsp中EL表达式只要.XX就能得到;这里返回true前端就得到true
		System.out.println("====role有权限，进入isChecked,开始遍历====");
		for(Role_Privilege role_privi:role.getRole_privileges()){
			System.out.println("===检查是否为true==");
			if(role_privi.getPrivilege_id().equals(privi_id)){
				System.out.println("return true");
				return true;//如果匹配上了，返回true
			}
		}	
		System.out.println("*return false*");
		return false;//如果遍历了role对象的privilege list的privi_id
					//属性，未发现匹配项，则返回false
	}
	
	public Integer getPrivi_id() {
		return privi_id;
	}
	public void setPrivi_id(Integer priviId) {
		privi_id = priviId;
	}
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	public List<Privilege> getAllPrivileges() {
		return allPrivileges;
	}
	public void setAllPrivileges(List<Privilege> allPrivileges) {
		this.allPrivileges = allPrivileges;
	}
}
