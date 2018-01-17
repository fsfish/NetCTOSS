package com.baidu.netctoss.vo;
/*单独用一个vo，接收查询账户信息时传过来的值，最多4项；比Service对象省空间*/
public class ServicePage extends Page {
	private String os_username;
	private String unix_host;
	private String status="-1";//默认是-1,即全部,即若不指定范围则按全部查
	private String idcard_no;
	
	public String getIdcard_no() {
		return idcard_no;
	}
	public void setIdcard_no(String idcardNo) {
		idcard_no = idcardNo;
	}
	public String getOs_username() {
		return os_username;
	}
	public void setOs_username(String osUsername) {
		os_username = osUsername;
	}
	public String getUnix_host() {
		return unix_host;
	}
	public void setUnix_host(String unixHost) {
		unix_host = unixHost;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}
