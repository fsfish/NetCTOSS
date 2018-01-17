package com.baidu.netctoss.test;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.baidu.netctoss.dao.CostMapperDao;
import com.baidu.netctoss.entity.Cost;

public class TestDynamicSql {

	public static void main(String[] args) {
		String[] conf={"com/baidu/netctoss/config/applicationContext-mvc.xml",
					   "com/baidu/netctoss/config/applicationContext-mybatis.xml"};
		ApplicationContext ac=new ClassPathXmlApplicationContext(conf);
		CostMapperDao dao=(CostMapperDao)ac.getBean("costMapperDao");
		Cost cc=new Cost();
		//------测试sql中if,choose元素-----
//		cc.setCost_type("2");
//		List<Cost> costs=dao.findByConditions(cc);
		//-------测试sql中foreach元素------
		cc.getIds().add(3);
		cc.getIds().add(4);
			//如果ids属性在声明时没有new初始化，可以通过如下方法在这初始化(略麻烦)
		//cc.setIds(new ArrayList<Integer>(){{add(3);add(4);}});
		List<Cost> costs=dao.findByIds(cc);
		//结果输出
		for(Cost c:costs){
			System.out.println(c.getName()+","+c.getId()+","+
					c.getCost_type()+","+c.getUnit_cost());		
		}
		
	}
}
