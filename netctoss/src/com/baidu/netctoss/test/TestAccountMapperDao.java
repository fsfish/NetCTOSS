package com.baidu.netctoss.test;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.baidu.netctoss.dao.AccountMapperDao;
import com.baidu.netctoss.entity.Account;
import com.baidu.netctoss.vo.AccountPage;

public class TestAccountMapperDao {

	public static void main(String[] args) {
		String[] conf={
			"com/baidu/netctoss/config/applicationContext-mvc.xml",
			"com/baidu/netctoss/config/applicationContext-mybatis.xml"};
		ApplicationContext ac=new ClassPathXmlApplicationContext(conf);
		AccountMapperDao dao=(AccountMapperDao)ac.getBean("accountMapperDao");
		AccountPage ap=new AccountPage();
		//ap.setStatus("1");
		//ap.setLogin_name("taiji001");
		List<Account> accounts=dao.findPageByConditions(ap);
		Integer rows=dao.countRowsByConditions(ap);
		System.out.println("满足条件的共："+rows+"条记录");
		for(Account acc:accounts){
			System.out.println(
				acc.getIdcard_no()+","+acc.getReal_name()+","+
				acc.getLogin_name()+","+acc.getStatus());
		}
	}

}
