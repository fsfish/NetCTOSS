package com.baidu.netctoss.aspect;

import java.util.Date;
/*测试方面组件，切入点为所有controller，前置通知*/
public class loggerBean {
	public void mylog(){
		System.out.println(new Date()+"执行了***操作");
	}
}
