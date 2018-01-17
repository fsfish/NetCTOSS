package com.baidu.netctoss.vo;

public class Page {
	private Integer current=1;//接收请求参数中的当前页码，默认第一页
	private Integer pageSize=5;//接收请求参数中的每页显示条数，默认5条
	private Integer rows=0;
	
	public Integer getRows() {
		return rows;
	}
	public void setRows(Integer rows) {
		this.rows = rows;
	}
	
	//jsp中使用${totalPage}时会自动调用getTotalPage()
	public Integer getTotalPage(){
		Integer totalPage=0; 
		if(rows%pageSize==0){
			totalPage=rows/pageSize;
		}else{
			totalPage=rows/pageSize+1;
		}
		return totalPage;
	}
	

	//private Integer start;
	//private Integer end;
	
	


	public Integer getCurrent() {
		return current;
	}
	public void setCurrent(Integer current) {
		this.current = current;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	
	public Integer getStart() {
		return (current-1)*pageSize+1;
	}
	//	public void setStart(int start) {
//		return ;
//	}//因为sql语句中获取的Page对象的start和end参数，实际上只是去getStart和getEnd
	//故这里删了set方法和属性不会影响CostMap中获取Page对象的参数
	
	public Integer getEnd() {
		return current*pageSize+1;
	}
//	public void setEnd(int end) {
//		this.end = end;
//	}
}
