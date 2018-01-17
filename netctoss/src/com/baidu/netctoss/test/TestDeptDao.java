package com.baidu.netctoss.test;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.baidu.netctoss.dao.TestDeptMapperDao;
import com.baidu.netctoss.dao.TestEmpMapperDao;
import com.baidu.netctoss.entity.TestDept;
import com.baidu.netctoss.entity.TestEmp;

;

public class TestDeptDao {

	public static void main(String[] args) {
		String[] conf={"com/baidu/netctoss/config/applicationContext-mvc.xml",
					"com/baidu/netctoss/config/applicationContext-mybatis.xml"};
		ApplicationContext ac=new ClassPathXmlApplicationContext(conf);
		TestDeptMapperDao dao=(TestDeptMapperDao)ac.getBean("testDeptMapperDao");
		TestDept dept=dao.findDeptByNo1(1);
		System.out.println("dname="+dept.getDname()+
				",dept_no="+dept.getDept_no()+
				",loc="+dept.getLoc());
		for(TestEmp emp:dept.getEmps()){
			System.out.println(
				"name="+emp.getName()+",sex="+emp.getSex()+
				",dept_no="+emp.getDept_no()+",id="+emp.getId()
			);
//			System.out.println("dname="+emp.getDept().getDname()+
//							   ",loc="+emp.getDept().getLoc()+
//							   ",dept_no="+emp.getDept().getDept_no()
//			);
		}
		System.out.println();
	}
}
