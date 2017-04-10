<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>达内－NetCTOSS</title>
        <link type="text/css" rel="stylesheet" media="all" href="../styles/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="../styles/global_color.css" /> 
        <script language="javascript" type="text/javascript">
            //显示角色详细信息
            function showDetail(flag, a) {
                var detailDiv = a.parentNode.getElementsByTagName("div")[0];
                if (flag) {
                    detailDiv.style.display = "block";
                }
                else
                    detailDiv.style.display = "none";
            }
            //删除
            function deleteAccount(id) {
                var r = window.confirm("确定要删除此业务账号吗？删除后将不能恢复。");
                if(r){
                	location.href="delete.from?id="+id;
               		document.getElementById("operate_result_info").style.display = "block";
                }
            }
            //开通或暂停
            function startState(id) {
                var r = window.confirm("确定要开通此业务账号吗？");
                if(r){
					location.href='start.from?id='+id;                
                	document.getElementById("operate_result_info").style.display = "block";
            	}
            }
            function pauseState(id) {
                var r = window.confirm("确定要暂停此业务账号吗？");
                if(r){
					location.href='pause.from?id='+id;                
             	   document.getElementById("operate_result_info").style.display = "block";
            	}
            }
            
        </script>
    </head>
    <body>
        <!--Logo区域开始-->
        <div id="header">
            <img src="../images/logo.png" alt="logo" class="left"/>
            <a href="#">[退出]</a>            
        </div>
        <!--Logo区域结束-->
        <!--导航区域开始-->
        <div id="navi">                        
            <ul id="menu">
                <li><a href="../index.html" class="index_off"></a></li>
                <li><a href="../role/role_list.html" class="role_off"></a></li>
                <li><a href="../admin/admin_list.html" class="admin_off"></a></li>
                <li><a href="../fee/fee_list.html" class="fee_off"></a></li>
                <li><a href="../account/account_list.html" class="account_off"></a></li>
                <li><a href="../service/service_list.html" class="service_on"></a></li>
                <li><a href="../bill/bill_list.html" class="bill_off"></a></li>
                <li><a href="../report/report_list.html" class="report_off"></a></li>
                <li><a href="../user/user_info.html" class="information_off"></a></li>
                <li><a href="../user/user_modi_pwd.html" class="password_off"></a></li>
            </ul>            
        </div>
        <!--导航区域结束-->
        <!--主要区域开始-->
        <div id="main">
        	<form:form commandName="servicePage" action="list.from?current=1" method="post">
                <!--查询-->
                <div class="search_add">                        
                    <div>OS 账号：
                    <form:input path="os_username" cssClass="width100 text_search" /></div>                            
                    <div>服务器 IP：
                    <form:input path="unix_host" cssClass="width100 text_search" /></div>
                    <div>身份证：
                    <form:input path="idcard_no" cssClass="text_search" /></div>
                    <div>状态：
                        <form:select path="status" cssClass="select_search">
                            <form:option value="-1">全部</form:option>
                            <form:option value="0">开通</form:option>
                            <form:option value="1">暂停</form:option>
                            <form:option value="2">删除</form:option>
                        </form:select>
                    </div>
                    <div><input type="submit" value="搜索" class="btn_search" /></div>
                    <input type="button" value="增加" class="btn_add" onclick="location.href='toadd.from';" />
                </div>  
                <!--删除的操作提示-->
                <div id="operate_result_info" class="operate_success">
                    <img src="../images/close.png" onclick="this.parentNode.style.display='none';" />
                    删除成功！
                </div>   
                <!--数据区域：用表格展示数据-->     
                <div id="data">            
                    <table id="datalist">
                    <tr>
                        <th class="width50">业务ID</th>
                        <th class="width70">账务账号ID</th>
                        <th class="width150">身份证</th>
                        <th class="width70">姓名</th>
                        <th>OS 账号</th>
                        <th class="width50">状态</th>
                        <th class="width100">服务器 IP</th>
                        <th class="width100">资费</th>                                                        
                        <th class="width200"></th>
                    </tr>
                    <c:forEach items="${services}" var="ser">
                     <tr>
                        <td><a href="detail.from?id=${ser.id}" title="查看明细">${ser.id}</a></td>
                        <td>${ser.account_id}</td>
                        <td>${ser.idcard_no}</td>
                        <td>${ser.real_name}</td>
                        <td>${ser.os_username}</td>
                        <td>${ser.status=="0"?"开通":ser.status=="1"?"暂停":"删除"}</td>
                        <td>${ser.unix_host}</td>
                        <td>
                            <a class="summary"  onmouseover="showDetail(true,this);" onmouseout="showDetail(false,this);">${ser.cost_name}</a>
                            <!--浮动的详细信息-->
                            <div class="detail_info">
                                ${ser.cost_descr}
                            </div>
                        </td>                            
                        <td class="td_modi">
                        	<c:if test='${ser.status!=2}'>
                        		<c:choose>
                        			<c:when test='${ser.status=="0"}'><!-- 当前开通 -->
                        				<input type="button" value="暂停" class="btn_pause" onclick="pauseState(${ser.id});" />
                        			</c:when>
                        			<c:when test='${ser.status=="1"}'><!-- 当前暂停 -->
                        				<input type="button" value="开通" class="btn_start" onclick="startState(${ser.id});" />
                        			</c:when>
                        		</c:choose>
                          	  <input type="button" value="修改" class="btn_modify" onclick='location.href="toupdate.from?id=${ser.id}"' />
                          	  <input type="button" value="删除" class="btn_delete" onclick="deleteAccount(${ser.id});" />
                       		</c:if>
                        </td>
                   	 </tr>
                    </c:forEach>
                </table>                
                <p>业务说明：<br />
                1、创建即开通，记载创建时间；<br />
                2、暂停后，记载暂停时间；<br />
                3、重新开通后，删除暂停时间；<br />
                4、删除后，记载删除时间，标示为删除，不能再开通、修改、删除；<br />
                5、业务账号不设计修改密码功能，由用户自服务功能实现；<br />
                6、暂停和删除状态的账务账号下属的业务账号不能被开通。</p>
                </div>                    
                <!--分页-->
                <div id="pages">
                    <a href='list.from?current=1'>首页</a>
                    <c:choose>
                    	<c:when test='${servicePage.current=="1"}'>
                    		<a>上一页</a>
                   		</c:when>
        	        	<c:otherwise>
        	       	 	<a href='list.from?current=${servicePage.current-1}'>上一页</a>
        	       	 	</c:otherwise>
                    </c:choose>
        	        <c:forEach begin="1" end="${servicePage.totalPage}" var="p">
        	        	<c:choose>
        	        		<c:when test="${p==servicePage.current}">
        	        			<a href='list.from?current=${p}' 
        	        			   class="current_page">${p}</a>
        	        		</c:when>
        	        		<c:otherwise>
        	        			<a href='list.from?current=${p}'>${p}</a>
        	        		</c:otherwise>
        	        	</c:choose>
        	        </c:forEach>
        	        <c:choose>
        	        	<c:when test="${servicePage.totalPage==servicePage.current}">
        	        		<a>下一页</a>
        	       		</c:when>
        	      		<c:otherwise>
        	        		<a href='list.from?current=${servicePage.current+1}'>下一页</a>
        	       		</c:otherwise>
        	        </c:choose>
                    <a href='list.from?current=${servicePage.totalPage}'>末页</a>
                </div>                    
            </form:form>
        </div>
        <!--主要区域结束-->
        <div id="footer">
            <p>[源自北美的技术，最优秀的师资，最真实的企业环境，最适用的实战项目]</p>
            <p>版权所有(C)加拿大达内IT培训集团公司 </p>
        </div>
    </body>
</html>
