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
            //删除
            function deleteAccount(id) {
                var r = window.confirm("确定要删除此账务账号吗？\r\n删除后将不能恢复，且会删除其下属的所有业务账号。");
                if(r){
                	location.href='delete.from?id='+id;
                	showResultInfo(true);
                	window.setTimeout("showResultInfo(false);", 3000);
                }
            }
            
            function showResultInfo(flag) {
           		var divResult = document.getElementById("operate_result_info");
                if (flag)
                    divResult.style.display = "block";
                else
                    divResult.style.display = "none";
            }
            
            //开通
            function startState(id) {
            	//当前为暂停，改为开通
            	var r=window.confirm("确定要开通此账务账号吗？");
            	if(r){
            		location.href="start.from?id="+id;	
            	}
            }
            //暂停
            function pauseState(id)	{
            	//当前为开通，改为暂停
                var r = window.confirm("确定要暂停此账务账号吗？");
                if(r){
               		location.href="pause.from?id="+id;
                }
            }
            
            function goPage(current){
            /*用session方式整体替换

            	//获取搜索筛选项表单element
            	var conditionForm=document.getElementById("conditions");
            	conditionForm.action="list.from?current="+current;
            	//表单的sumbit实际上是发出action请求,这里覆盖原有action,
            	//以post方式,加上current页码参数;
            	conditionForm.submit();//模拟表单的submit,连筛选内容一同form提交
        	*/
        		 window.location.href="list.from?current="+current;
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
                <li><a href="../account/account_list.html" class="account_on"></a></li>
                <li><a href="../service/service_list.html" class="service_off"></a></li>
                <li><a href="../bill/bill_list.html" class="bill_off"></a></li>
                <li><a href="../report/report_list.html" class="report_off"></a></li>
                <li><a href="../user/user_info.html" class="information_off"></a></li>
                <li><a href="../user/user_modi_pwd.html" class="password_off"></a></li>
            </ul>            
        </div>
        <!--导航区域结束-->
        <!--主要区域开始-->
        <div id="main">
        	<form:form id="conditions" action="list.from?current=1" method="post" 
        			   commandName="accountPage">
        <!-- 加入current=1每次提交查询时都回到第一页，免得从session总自动取出页码 -->
                <!--查询-->
                <div class="search_add">                        
                    <div>身份证：
                    <form:input path="idcard_no"  cssClass="text_search"/>
                    <!-- 定义了path(用于展示传入对象属性值)后，不用再定义
                    	 name=(用于传出该name的value,Controller对应类接收),
                    	 自动生成name="idcard_no" -->
                    </div>                            
                    <div>姓名：
                    <form:input path="real_name" cssClass="width70 text_search" />
                    </div>
                    <div>登录名：
                    <form:input path="login_name" cssClass="text_search" />
                    </div>
                    <div>
                        状态：
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
                <!--删除等的操作提示-->
                <div id="operate_result_info" class="operate_success">
                    <img src="../images/close.png" onclick="this.parentNode.style.display='none';" />
                    删除成功，且已删除其下属的业务账号！
                </div>   
                <!--数据区域：用表格展示数据-->     
                <div id="data">            
                    <table id="datalist">
                    <tr>
                        <th>账号ID</th>
                        <th>姓名</th>
                        <th class="width150">身份证</th>
                        <th>登录名</th>
                        <th>状态</th>
                        <th class="width100">创建日期</th>
                        <th class="width150">上次登录时间</th>                                                        
                        <th class="width200"></th>
                    </tr>
                    <c:forEach items="${accounts}" var="a">
                    <!-- items对应model中传入的id为accounts的对象 -->
                    <!-- items从模型model中取，必须用$符+大{} -->
                    <tr>
                        <td>${a.id}</td>
                        <td><a href="detail.from?id=${a.id}">${a.real_name}</a></td>
                        <td>${a.idcard_no}</td>
                        <td>${a.login_name}</td>
                        <td>${a.status=="0"?"开通":a.status=="1"?"暂停":"删除"}</td><!--嵌套三元-->
                        <td>${a.create_date}</td>
                        <td>${a.last_login_time}</td>                            
                        <td class="td_modi">
                        	<c:if test='${a.status!="2"}'><!--status为2时即删除,不显示按钮-->
                            	<c:if test='${a.status=="1"}'><!-- 当前状态暂停 -->
                           		 <input type="button" value="开通" class="btn_start" onclick="startState(${a.id});" />
                            	</c:if>
                            	<c:if test='${a.status=="0"}'><!--当前状态开通 -->
                            	 <input type="button" value="暂停" class="btn_pause" onclick="pauseState(${a.id});" />
                            	</c:if>
                            <input type="button" value="修改" class="btn_modify" onclick="location.href='toupdate.from?id=${a.id}';" />
                            <input type="button" value="删除" class="btn_delete" onclick="deleteAccount(${a.id});" />
                        	</c:if>
                        </td>
                    </tr>
                    </c:forEach>
                </table>
                <p>业务说明：<br />
                1、创建则开通，记载创建时间；<br />
                2、暂停后，记载暂停时间；<br />
                3、重新开通后，删除暂停时间；<br />
                4、删除后，记载删除时间，标示为删除，不能再开通、修改、删除；<br />
                5、暂停账务账号，同时暂停下属的所有业务账号；<br />                
                6、暂停后重新开通账务账号，并不同时开启下属的所有业务账号，需要在业务账号管理中单独开启；<br />
                7、删除账务账号，同时删除下属的所有业务账号。</p>
                </div>                   
                <!--分页-->
                <div id="pages">
                    <a href="javascript:goPage(1);">首页</a>
                    <c:choose>
                    	<c:when test="${accountPage.current>=2}">
                    		<a href="javascript:goPage(${accountPage.current-1});">上一页</a>
                    	</c:when>
                    	<c:otherwise>
                    		<a>上一页</a>
                    	</c:otherwise>
                    </c:choose>
        	        <c:forEach begin="1" end="${accountPage.totalPage}" var="p">
        	        	<c:choose>
        	        		<c:when test="${accountPage.current==p}">
        	        			<a href="javascript:goPage(${p});" class="current_page">${p}</a>
        	        		</c:when>
        	        		<c:otherwise>
        	        			<a href="javascript:goPage(${p});">${p}</a>
        	        		</c:otherwise>
        	        	</c:choose>
        	        </c:forEach>
        	        <c:choose>
        	        	<c:when test="${accountPage.current<accountPage.totalPage}">
        	        		<a href="javascript:goPage(${accountPage.current+1});">下一页</a> 
        	        		<!-- 将页码作为参数传入goPage脚本，脚本中实现页码和form内容同时提交-->
        	        	</c:when>
        	        	<c:otherwise>
        	        		<a>下一页</a>
        	        	</c:otherwise>
        	        </c:choose>
                    <a href="javascript:goPage(${accountPage.totalPage});">末页</a>
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
