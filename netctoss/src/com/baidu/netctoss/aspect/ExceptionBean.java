package com.baidu.netctoss.aspect;

import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Component//等价于在xml配置中用<bean>把本类加入容器
@Aspect//等价于<aop:aspect id="" ref="">
public class ExceptionBean {
	
//	@Before("within(com.baidu.netctoss.controller..*)")
//		//等价于<aop:before>标签
	@AfterThrowing(throwing="ex",
		pointcut="within(com.baidu.netctoss.controller..*)")
		//异常对象要和下面方法的一致,即当出现异常对象后调AfterThrowing的方面方法
	public void myexecute(Exception ex){
		//将异常对象记录到文件
		System.out.println("记录异常信息(模拟):"+ex);
	}
}
