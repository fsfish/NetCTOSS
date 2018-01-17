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
        <script type="text/javascript" src="../js/jquery-1.11.1.js"></script>
        <script language="javascript" type="text/javascript">
            //保存成功的提示信息
            function showResult() {
                showResultDiv(true);
                window.setTimeout("showResultDiv(false);", 3000);
            }
            function showResultDiv(flag) {
                var divResult = document.getElementById("save_result_info");
                if (flag)
                    divResult.style.display = "block";
                else
                    divResult.style.display = "none";
            }

            //自动查询账务账号（不用，自己写）
            function searchAccounts(txtObj) {
                //document.getElementById("a1").innerHTML = txtObj.value;
            }
            
            //根据写入的idcard_no检测账务账号
            $(function(){
            	//点击按钮时发送ajax请求(先检查是否为空)
            	$("#searchAccountBtn").click(function(){
					//通过设置空，清除选中元素中的内容,不提示错误信息,详单于初始化
					$("#idcard_no_error").text("");
					
					//通过id选择器得到输入框，再得到其值
            		var no=$("#idcard_no").val();
					
					//检查是否为空
					if(no!=null&&""!=no){
						//发post请求(发到哪，发什么，返回怎么接收)          		
            			$.post(
            				"findaccount.from",
            				{"no":no},
            				//controller返回一个Map叫account
            				function(account){
            					if(account==""){
            						//如果返回结果为空，即未找到，提示错误信息
            						$("#idcard_no_error").text("未找到该身份证信息，请检查后输入");
            					}else{
            						//取出页面中的account_name、id框，设置值
	            					$("#account_name").val(account.LOGIN_NAME);
	            					$("#account_id").val(account.ID);
            					}
            				});
            		}else{
            			//如果输入为空，则通过设置元素中内容，显示错误信息
            			$("#idcard_no_error").text("身份证不能为空"); 
            		}
            	});
            });
            
            
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
                <li><a href="../role/list.from" class="role_off"></a></li>
                <li><a href="../admin/list.from" class="admin_off"></a></li>
                <li><a href="../fee/list.from" class="fee_off"></a></li>
                <li><a href="../account/list.from" class="account_on"></a></li>
                <li><a href="../service/list.from" class="service_off"></a></li>
                <li><a href="../bill/list.from" class="bill_off"></a></li>
                <li><a href="../report/list.from" class="report_off"></a></li>
                <li><a href="../user/list.from" class="information_off"></a></li>
                <li><a href="../user/list.from" class="password_off"></a></li>
            </ul>
        </div>
        <!--导航区域结束-->
        <!--主要区域开始-->
        <div id="main">
            <!--保存操作的提示信息-->
            <div id="save_result_info" class="save_fail">保存失败！192.168.0.23服务器上已经开通过 OS 账号 “mary”。</div>
            <form id="addForm" 
            		   action="add.from" method="post" 
            		   class="main_form">
                <!--内容项-->
                <div class="text_info clearfix"><span>身份证：</span></div>
                <div class="input_info">
                    <input type="text" id="idcard_no" value="" class="width180" />
                    <input type="button" id="searchAccountBtn" value="查询账务账号" class="btn_search_large" />
                    <span class="required">*</span>
                    <div id="idcard_no_error" class="validate_msg_short"></div>
                </div>
                <div class="text_info clearfix"><span>账务账号：</span></div>
                <div class="input_info">
                    <input type="text" id="account_name" readonly="readonly" class="readonly"/>
                    <input type="hidden" name="account_id" id="account_id" />
                    <span class="required">*</span>
                    <div class="validate_msg_long">没有此账务账号，请重新录入。</div>
                </div>
                <div class="text_info clearfix"><span>资费类型：</span></div>
                <div class="input_info">
                    <select name="cost_id">
                    	<c:forEach items="${costs}" var="c">
                    		<option value="${c.id}">${c.name}</option>
                    	</c:forEach>
                    </select>                       
                </div> 
                <div class="text_info clearfix"><span>服务器 IP：</span></div>
                <div class="input_info">
                    <input name="unix_host"  />
                    <span class="required">*</span>
                    <div class="validate_msg_long">15 长度，符合IP的地址规范</div>
                </div>                   
                <div class="text_info clearfix"><span>登录 OS 账号：</span></div>
                <div class="input_info">
                    <input name="os_username"  />
                    <span class="required">*</span>
                    <div class="validate_msg_long">8长度以内的字母、数字和下划线的组合</div>
                </div>
                <div class="text_info clearfix"><span>密码：</span></div>
                <div class="input_info">
                    <input type="password" name="login_passwd"/>
                    <span class="required">*</span>
                    <div class="validate_msg_long">30长度以内的字母、数字和下划线的组合</div>
                </div>
                <div class="text_info clearfix"><span>重复密码：</span></div>
                <div class="input_info">
                    <input type="password"  />
                    <span class="required">*</span>
                    <div class="validate_msg_long">两次密码必须相同</div>
                </div>     
                <!--操作按钮-->
                <div class="button_info clearfix">
                    <input type="submit" value="保存" class="btn_save" />
                    <input type="button" value="取消" class="btn_save" onclick='location.href="list.from"'/>
                </div>
            </form>
        </div>
        <!--主要区域结束-->
        <div id="footer">
            <span>[源自北美的技术，最优秀的师资，最真实的企业环境，最适用的实战项目]</span>
            <br />
            <span>版权所有(C)加拿大达内IT培训集团公司 </span>
        </div>
    </body>
</html>
