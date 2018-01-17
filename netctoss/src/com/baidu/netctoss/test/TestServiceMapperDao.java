package com.baidu.netctoss.test;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.baidu.netctoss.dao.AccountMapperDao;
import com.baidu.netctoss.dao.ServiceMapperDao;
import com.baidu.netctoss.entity.Account;
import com.baidu.netctoss.entity.Service;
import com.baidu.netctoss.vo.AccountPage;
import com.baidu.netctoss.vo.ServiceLine;
import com.baidu.netctoss.vo.ServicePage;

public class TestServiceMapperDao {

	public static void main(String[] args) {
		String[] conf={
			"com/baidu/netctoss/config/applicationContext-mvc.xml",
			"com/baidu/netctoss/config/applicationContext-mybatis.xml"};
		ApplicationContext ac=new ClassPathXmlApplicationContext(conf);
		ServiceMapperDao dao=(ServiceMapperDao)ac.getBean("serviceMapperDao");
		ServicePage sp=new ServicePage();
		//---测试动态sql各if
		sp.setStatus("-1");
		//sp.setOs_username("luwsh");
		//sp.setUnix_host("192.168.0.20");
		//sp.setIdcard_no("330682196903190613");
		//----测试完毕-----
		
		List<ServiceLine> services=dao.findByConditions(sp);
		//Integer rows=dao.countRowsByConditions(ap);
		//System.out.println("满足条件的共："+rows+"条记录");
		for(ServiceLine ser:services){
			System.out.println(
			"OS账号:"+ser.getOs_username()+",UNiX IP地址:"+ser.getUnix_host()
			+",账务账号ID:"+ser.getAccount_id()+",状态:"+ser.getStatus()
			);
		}
	}

}
