<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 
prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<!-- 1 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>达内－NetCTOSS</title>
        <link type="text/css" rel="stylesheet" media="all" href="<%=basePath %>/styles/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="<%=basePath %>/styles/global_color.css" />
        <script type="text/javascript" src="<%=basePath %>/js/jquery-1.11.1.js" ></script>
        <script language="javascript" type="text/javascript">
            //排序按钮的点击事件
            function sort(btnObj) {
                if (btnObj.className == "sort_desc")
                    btnObj.className = "sort_asc";
                else
                    btnObj.className = "sort_desc";
            }

            //启用
            function startFee(id) {
                var r = window.confirm("确定要启用此资费吗？资费启用后将不能修改和删除。");
                document.getElementById("operate_result_info").style.display = "block";
            	window.location.href="start.from?id="+id;
            }
            //删除
            function deleteFee(id) {//通过js传入一个参数
                var r = window.confirm("确定要删除此资费吗？");
                if(r){//当true时
	           		//为了使用rest格式,需发出/fee/{id}
					//脚本中又不能用form:form，考虑用ajax
	           		$.ajax({
	           			url:"/netctoss_rest/fee/"+id,//发送目标
	           			type:"delete",//发送类型(就是为了这个设置)
	           			dataType:"json",//传送方式
	           			success:function(data){//回调函数
							//data就是服务器返回的数据,json形式返回
							if(data.ok){//如果data中的ok是true
								$("#operate_result_info").text("删除成功"+data.rediUrl);
								$("#operate_result_info").show();
								window.location.href="/netctoss_rest"+data.rediUrl;
							}else{
								$("#operate_result_info").text("删除失败");
								$("#operate_result_info").show();
							}
	           			}
            		});
            	}
            }
        </script>        
    </head>
    <body>
        <!--Logo区域开始-->
        <div id="header">
            <img src="<%=basePath %>/images/logo.png" alt="logo" class="left"/>
			<span>当前账号：<b>scott</b></span>
            <a href="#">[退出]</a>            
        </div>
        <!--Logo区域结束-->
        <!--导航区域开始-->
        <div id="navi">                        
            <ul id="menu">
                <li><a href="../index.html" class="index_off"></a></li>
                <li><a href="../role/role_list.html" class="role_off"></a></li>
                <li><a href="../admin/admin_list.html" class="admin_off"></a></li>
                <li><a href="../fee/fee_list.html" class="fee_on"></a></li>
                <li><a href="../account/account_list.html" class="account_off"></a></li>
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
            <form action="" method="">
                <!--排序-->
                <div class="search_add">
                    <div>
                        <input type="button" value="月租" class="sort_asc" onclick="sort(this);" />
                        <input type="button" value="基费" class="sort_asc" onclick="sort(this);" />
                        <input type="button" value="时长" class="sort_asc" onclick="sort(this);" />
                    </div>
                    <input type="button" value="增加" class="btn_add" onclick="location.href='<%=basePath %>/fee/toadd';" />
                </div> 
                <!--启用操作的操作提示-->
                <div id="operate_result_info" class="operate_success">
                    <img src="<%=basePath %>/images/close.png" onclick="this.parentNode.style.display='none';" />
                    删除成功！
                </div>    
                <!--数据区域：用表格展示数据-->     
                <div id="data">            
                    <table id="datalist">
                        <tr>
                            <th>资费ID</th>
                            <th class="width100">资费名称</th>
                            <th>基本时长</th>
                            <th>基本费用</th>
                            <th>单位费用</th>
                            <th>创建时间</th>
                            <th>开通时间</th>
                            <th class="width50">状态</th>
                            <th class="width200"></th>
                        </tr>
                        <c:forEach items="${costs}" var="cost">                      
	                        <tr>
	                            <td>${cost.id}</td>
	                            <td><a href="detail.from?id=${cost.id}">${cost.name}</a></td>
	                            <td>${cost.base_duration} 小时</td>
	                            <td>${cost.base_cost } 元</td>
	                            <td>${cost.unit_cost } 元/小时</td>
	                            <td>${cost.creatime}</td>
	                            <td>${cost.startime}</td>
	                            <td>${cost.status=="1"?"暂停":"开通"}</td>
	                            <td> 
	                            <c:if test='${cost.status=="1"}'>                               
	                                <input type="button" value="启用" class="btn_start" onclick="startFee(${cost.id});" />
	                                <input type="button" value="修改" class="btn_modify" onclick="location.href='<%=basePath %>/fee/${cost.id}/toupdate';" />
	                                <input type="button" value="删除" class="btn_delete" onclick="deleteFee(${cost.id});" /><!-- 调用了一个js脚本 -->
	                            </c:if><!-- 判断是否是暂停状态，是才展示修改等选项 -->
	                            </td>
	                        </tr>
                        </c:forEach>
                    </table>
                    <p>业务说明：<br />
                    1、创建资费时，状态为暂停，记载创建时间；<br />
                    2、暂停状态下，可修改，可删除；<br />
                    3、开通后，记载开通时间，且开通后不能修改、不能再停用、也不能删除；<br />
                    4、业务账号修改资费时，在下月底统一触发，修改其关联的资费ID（此触发动作由程序处理）
                    </p>
                </div>
                <!--分页-->
                <div id="pages">
                	 <c:choose>
                		<c:when test="${page.current>1}">
                			<a href="${page.current-1}">上一页</a>
                		</c:when>
                		<c:otherwise>
                			<a>上一页</a>
                		</c:otherwise>
                	</c:choose>
                	<c:forEach begin="1" end="${page.totalPage}" var="p">
                		<c:choose>
                			<c:when test="${p==page.current}">
                				<a class="current_page">${p}</a>
                			</c:when>
                			<c:otherwise>
                				<a href="${p}">${p}</a>
                			</c:otherwise>
                		</c:choose>
                		
                	</c:forEach>
                    <c:choose>
                    	<c:when test="${page.current<page.totalPage}">
                    		<a href="${page.current+1}">下一页</a>
                    	</c:when>
                    	<c:otherwise>
                    		<a>下一页</a>
                    	</c:otherwise>
                    </c:choose>
                </div>
            </form>
        </div>
        <!--主要区域结束-->
        <div id="footer">
            <p>[源自北美的技术，最优秀的师资，最真实的企业环境，最适用的实战项目]</p>
            <p>版权所有(C)加拿大达内IT培训集团公司 </p>
        </div>
    </body>
</html>
