package com.baidu.netctoss.test;

import java.util.List;

import com.baidu.netctoss.entity.Privilege;
import com.baidu.netctoss.util.PrivilegeReader;

public class TestPrivilegeReader {

	public static void main(String[] args) {
//		String moduleName=PrivilegeReader.getModuleNameById("3");
//		System.out.println(moduleName);
//		
		List<Privilege> privileges=PrivilegeReader.getModules();
		for(Privilege p:privileges){
			System.out.println("id="+p.getId()+",name="+p.getName());
		}
	}
}
