package com.baidu.netctoss.vo;
/*单独用一个vo，接收查询账户信息时传过来的值，最多4项；比Account对象省空间*/
public class AccountPage extends Page {
	private String idcard_no;
	private String real_name;
	private String login_name;
	private String status="-1";//默认是-1,即全部,即若不指定范围则按全部查
	public String getIdcard_no() {
		return idcard_no;
	}
	public void setIdcard_no(String idcardNo) {
		idcard_no = idcardNo;
	}
	public String getReal_name() {
		return real_name;
	}
	public void setReal_name(String realName) {
		real_name = realName;
	}
	public String getLogin_name() {
		return login_name;
	}
	public void setLogin_name(String loginName) {
		login_name = loginName;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}
