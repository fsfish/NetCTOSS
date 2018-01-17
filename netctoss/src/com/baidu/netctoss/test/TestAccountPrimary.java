package com.baidu.netctoss.test;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.baidu.netctoss.dao.AccountMapperDao;
import com.baidu.netctoss.entity.Account;
import com.baidu.netctoss.vo.AccountPage;
/*测试通过修改insert语句，加入<selectKey>,取出启动生成的主键值*/
public class TestAccountPrimary {

	public static void main(String[] args) {
		String[] conf={
	"com/baidu/netctoss/config/applicationContext-mvc.xml",
	"com/baidu/netctoss/config/applicationContext-mybatis.xml"};
		ApplicationContext ac=new ClassPathXmlApplicationContext(conf);
		AccountMapperDao dao=(AccountMapperDao)ac.getBean("accountMapperDao");
		Account acc=new Account();
		acc.setLogin_name("lxxl13");
		acc.setLogin_passwd("123");
		acc.setStatus("0");
		acc.setReal_name("liu");
		acc.setIdcard_no("110110100010001003");
		acc.setGender("0");
		acc.setTelephone("12313");
		dao.addAccount(acc);
		System.out.println(acc.getId());
	}
}
