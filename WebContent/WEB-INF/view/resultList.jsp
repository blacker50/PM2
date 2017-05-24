<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>用电收费系统</title>
        <link type="text/css" rel="stylesheet" media="all" href="styles/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="styles/global_color.css" /> 
		<script type="text/javascript" src="jquery-1.7.2.min.js"></script>
		<script type="text/javascript">
		function doLogout() {
 		    $.get("admin/logout",function(data){
		        if(data=="logout"){  
		          alert("退出系统");
		          location="./login.jsp";
		        }
		    });
		}
		</script>   
    </head>
    <body>
        <!--Logo区域开始-->
        <div id="header">
            <img src="./images/logo.png" alt="logo" class="left"/>
            <font color="#FFFFFF">
            	<span style="font-weight:bold;">${userName }</span>
            </font>
            <a href="javaScript:void(0)" onclick="doLogout()">[退出]</a>            
        </div>
        <!--Logo区域结束-->
        <!--导航区域开始-->
        <div id="navi">                        
            <ul id="menu">
                <li><a href="./index.jsp" class="index_off"></a></li>
                <li><a href="./showAllMeterReaders" class="role_off"></a></li>
                <li><a href="./showAllTasks" class="account_off"></a></li>
                <li><a href="./showAllResults" class="fee_off"></a></li>
                <li><a href="./showAllDorms" class="service_off"></a></li>
                <li><a href="" class="bill_off"></a></li>
                <li><a href="" class="report_off"></a></li>
                <li><a href="./admin/pwd_modi" class="password_off"></a></li>
            </ul>           
        </div>
        <!--导航区域结束-->
        <!--主要区域开始-->
        <div id="main">
            <div class="search_add">
            		<form action="${pageContext.request.contextPath}/task" method="post">
                    	<div>抄表月份：<input class="text_search width200" type="text" name="mread_month"/></div>
                    	<div><input value="搜索" class="btn_search" type="submit"/></div>
                    </form>
                    <input value="添加" class="btn_add" onclick="location.href='./task';" type="button"/>
            </div>
            <form action="${pageContext.request.contextPath}/task" method="post">
                <!--数据区域：用表格展示数据-->     
                <div id="data">            
                    <table id="datalist">
                        <tr>
                        	<th style="width:15%">抄表月份</th>
                            <th style="width:15%">宿舍ID</th>
                            <th style="width:15%">抄表员ID</th>
                            <th style="width:15%">状态（已/未）</th>
                            <th style="width:40%">操作</th>
                        </tr> 
                        <c:choose>
							<c:when test="${fn:length(tasks)==1}">
		                        <tr><td>${tasks[0].mread_month }</td>
		                        	<td>${tasks[0].dorm_id }</td>
									<td>${tasks[0].mreader_id }</td>
									<td>${tasks[0].is_read eq 1?'完成':'未读'}</td>
			                        <td>
			                           <a href="task/${tasks[0].id }">
			                               ${tasks[0].is_read eq 1?'查看':''}
			                           </a>&nbsp;&nbsp;
			                        </td>	
								</tr>
	                        </c:when>    
	                        <c:otherwise>             	
		             			<c:forEach var="task" items="${tasks }">
									<tr><td>${task.mread_month }</td>
										<td>${task.dorm_id }</td>
										<td>${task.mreader_id }</td>
										<td>${task.is_read eq 1?'完成':'未读'}</td>
			                            <td>
			                                <a href="task/${task.id}">${task.is_read eq 1?'查看':''}</a>&nbsp;&nbsp;
			                            </td>	
									</tr>
								</c:forEach>
							</c:otherwise>  
						</c:choose> 
                    </table>
                </div>
            </form>
        </div>
        <!--主要区域结束-->
    </body>
</html>
