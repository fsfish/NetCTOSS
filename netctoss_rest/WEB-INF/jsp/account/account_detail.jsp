<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>达内－NetCTOSS</title>
        <link type="text/css" rel="stylesheet" media="all" href="../styles/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="../styles/global_color.css" />
    </head>
    <body>
        <!--Logo区域开始-->
        <div id="header">
            <img src="../images/logo.png" alt="logo" class="left" />
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
            <form:form commandName="account" action="" 
            		   method="post" cssClass="main_form">
                <!--必填项-->
                <div class="text_info clearfix"><span>账务账号ID：</span></div>
                <div class="input_info">
                <form:input path="id" readonly="true" cssClass="readonly" /></div>
                <div class="text_info clearfix"><span>姓名：</span></div>
                <div class="input_info">
                <form:input path="real_name" readonly="true" cssClass="readonly" /></div>
                <div class="text_info clearfix"><span>身份证：</span></div>
                <div class="input_info">
                    <form:input path="idcard_no" readonly="true" cssClass="readonly" />
                </div>
                <div class="text_info clearfix"><span>登录账号：</span></div>
                <div class="input_info">
                    <form:input path="login_name" readonly="true" cssClass="readonly" />
                </div>                   
                <div class="text_info clearfix"><span>电话：</span></div>
                <div class="input_info">
                    <form:input path="telephone" cssClass="width200 readonly" 
                    			readonly="true"/>
                </div>
                <div class="text_info clearfix"><span>推荐人账务账号ID：</span></div>
                <div class="input_info">
                	<form:input path="recommender_id" readonly="true" cssClass="readonly"/></div>
                <div class="text_info clearfix"><span>推荐人身份证号码：</span></div>
                <div class="input_info">
                	<input readonly class="readonly" value="${recommender_idcard}"/></div>
                <div class="text_info clearfix"><span>状态：</span></div>
                <div class="input_info">
                    <form:select path="status" disabled="true">
                        <form:option value="0">开通</form:option>
                        <form:option value="1">暂停</form:option>
                        <form:option value="2">删除</form:option>
                    </form:select>                        
                </div>                    
                <div class="text_info clearfix"><span>开通/暂停/删除时间：</span></div>
                <div class="input_info">
                	<c:choose>
                		<c:when test='${account.status=="0"}'><!--当前开通-->
                			<form:input path="create_date" 
                				readonly="true" cssClass="readonly" />
                		</c:when>
                		<c:when test='${account.status=="1"}'><!--当前暂停-->
                			<form:input path="pause_date" 
                				readonly="true" cssClass="readonly" />
                		</c:when>
                		<c:when test='${account.status=="2"}'><!--当前删除-->
                			<form:input path="close_date" 
                				readonly="true" cssClass="readonly" />
                		</c:when>
                	</c:choose>
                </div>
                <div class="text_info clearfix"><span>上次登录时间：</span></div>
                <div class="input_info">
                	<form:input path="last_login_time" readonly="true" cssClass="readonly"/></div>
                <div class="text_info clearfix"><span>上次登录IP：</span></div>
                <div class="input_info">
                	<form:input path="last_login_ip" readonly="true" cssClass="readonly"/></div>
                <!--可选项数据-->
                <div class="text_info clearfix"><span>生日：</span></div>
                <div class="input_info">
                    <form:input path="birthdate" readonly="true" cssClass="readonly" />
                </div>
                <div class="text_info clearfix"><span>Email：</span></div>
                <div class="input_info">
                    <form:input path="email" cssClass="width350 readonly" readonly="true" />
                </div> 
                <div class="text_info clearfix"><span>职业：</span></div>
                <div class="input_info">
                    <form:select path="occupation" disabled="true">
                        <option value="0">干部</option>
                        <option value="1">学生</option>
                        <option value="2">技术人员</option>
                        <option value="3">其他</option>
                    </form:select>                        
                </div>
                <div class="text_info clearfix"><span>性别：</span></div>
                <div class="input_info fee_type">
                    <form:radiobutton path="gender" id="female" value="0" disabled="true" />
                    <label for="female">女</label>
                    <form:radiobutton path="gender" id="male" value="1" disabled="true" />
                    <label for="male">男</label>
                </div> 
                <div class="text_info clearfix"><span>通信地址：</span></div>
                <div class="input_info">
                	<form:input path="mailaddress" cssClass="width350 readonly" readonly="true" /></div> 
                <div class="text_info clearfix"><span>邮编：</span></div>
                <div class="input_info">
                	<form:input path="zipcode" cssClass="readonly" readonly="true" /></div> 
                <div class="text_info clearfix"><span>QQ：</span></div>
                <div class="input_info">
                	<form:input path="qq" cssClass="readonly" readonly="true" /></div>                
                <!--操作按钮-->
                <div class="button_info clearfix">
                    <input type="button" value="返回" class="btn_save" onclick="location.href='list.from';" />
                </div>
            </form:form>  
        </div>
        <!--主要区域结束-->
        <div id="footer">
            <span>[源自北美的技术，最优秀的师资，最真实的企业环境，最适用的实战项目]</span>
            <br />
            <span>版权所有(C)加拿大达内IT培训集团公司 </span>
        </div>
    </body>
</html>
