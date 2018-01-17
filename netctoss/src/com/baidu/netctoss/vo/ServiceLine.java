package com.baidu.netctoss.vo;

import java.sql.Date;

public class ServiceLine {
	private Integer id;
	private Integer account_id;
	private String idcard_no;
	private String real_name;
	private String os_username;
	private String status;
	private String unix_host;
	private Date create_date;
	private Integer cost_id;
	private String cost_name;
	private String cost_descr;
//	private String login_passwd;
//	public String getLogin_passwd() {
//		return login_passwd;
//	}
//	public void setLogin_passwd(String loginPasswd) {
//		login_passwd = loginPasswd;
//	}
	public Date getCreate_date() {
		return create_date;
	}
	public void setCreate_date(Date createDate) {
		create_date = createDate;
	}
	public Integer getCost_id() {
		return cost_id;
	}
	public void setCost_id(Integer costId) {
		cost_id = costId;
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getAccount_id() {
		return account_id;
	}
	public void setAccount_id(Integer accountId) {
		account_id = accountId;
	}
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
	public String getOs_username() {
		return os_username;
	}
	public void setOs_username(String osUsername) {
		os_username = osUsername;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getUnix_host() {
		return unix_host;
	}
	public void setUnix_host(String unixHost) {
		unix_host = unixHost;
	}
	public String getCost_name() {
		return cost_name;
	}
	public void setCost_name(String costName) {
		cost_name = costName;
	}
	public String getCost_descr() {
		return cost_descr;
	}
	public void setCost_descr(String costDescr) {
		cost_descr = costDescr;
	}
	
}
