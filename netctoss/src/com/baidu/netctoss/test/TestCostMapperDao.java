package com.baidu.netctoss.test;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.baidu.netctoss.dao.CostMapperDao;
import com.baidu.netctoss.entity.Cost;
import com.baidu.netctoss.vo.Page;

public class TestCostMapperDao {

	public static void main(String[] args) {
		String[] conf={"com/baidu/netctoss/config/applicationContext-mvc.xml",
					"com/baidu/netctoss/config/applicationContext-mybatis.xml"};
		ApplicationContext ac=new ClassPathXmlApplicationContext(conf);
		CostMapperDao dao=(CostMapperDao)ac.getBean("costMapperDao");
		Page p=new Page();
		//p.setCurrent(2);
		//p.setPageSize(5);
		List<Cost> costs=dao.findPage(p);
		for(Cost c:costs){
			System.out.println(c.getId()+","+c.getName());
		}
	}
}
