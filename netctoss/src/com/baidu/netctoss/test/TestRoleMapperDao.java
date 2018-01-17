package com.baidu.netctoss.test;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.baidu.netctoss.dao.RoleMapperDao;
import com.baidu.netctoss.dao.TestDeptMapperDao;
import com.baidu.netctoss.dao.TestEmpMapperDao;
import com.baidu.netctoss.entity.Privilege;
import com.baidu.netctoss.entity.Role;
import com.baidu.netctoss.entity.Role_Privilege;
import com.baidu.netctoss.entity.TestDept;
import com.baidu.netctoss.entity.TestEmp;
import com.baidu.netctoss.vo.Page;

;

public class TestRoleMapperDao {

	public static void main(String[] args) {
		String[] conf={"com/baidu/netctoss/config/applicationContext-mvc.xml",
					"com/baidu/netctoss/config/applicationContext-mybatis.xml"};
		ApplicationContext ac=new ClassPathXmlApplicationContext(conf);
		RoleMapperDao dao=(RoleMapperDao)ac.getBean("roleMapperDao");
		Page page=new Page();
		page.setCurrent(1);
		page.setPageSize(2);
		/*查出全部，分页*/
		List<Role> roles=dao.findPage(page);
		
		/*查出全部，不分页*/
		//List<Role> roles=dao.findRoles();
		for(Role r:roles){
			System.out.println("id="+r.getId()+",name="+r.getName());
			//System.out.println("1:"+r.getRole_privileges());
			System.out.println("拥有的权限id为：");
			for(Role_Privilege p:r.getRole_privileges()){
				System.out.println("privilegeId="+p.getPrivilege_id()
						+",role_id="+p.getRole_id());
			}
		}
	}	
}
