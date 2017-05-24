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
        <link type="text/css" rel="stylesheet" media="all" href="/PM2/styles/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="/PM2/styles/global_color.css" /> 
		<script type="text/javascript" src="jquery-1.7.2.min.js"></script>
		<script type="text/javascript">
		function doLogout() {
 		    $.get("meterReader/logout",function(data){
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
            <img src="/PM2/images/logo.png" alt="logo" class="left"/>
            <font color="#FFFFFF">
            	<span style="font-weight:bold;">${userName }</span>
            </font>
            <a href="javaScript:void(0)" onclick="doLogout()">[退出]</a>            
        </div>
        <!--Logo区域结束-->
        <!--导航区域开始-->
        <div id="navi">                        
            <ul id="menu">
                <li><a href="/PM2/mr_index.jsp" class="index_off"></a></li>
                <li><a href="/PM2/showTasksByMRId" class="account_off"></a></li>
                <li><a href="/PM2/mr/pwd_modi" class="password_off"></a></li>
            </ul>           
        </div>
        <!--导航区域结束-->
        <!--主要区域开始-->
        <div id="main">
            <div class="search_add">
            		<form action="${pageContext.request.contextPath}/mr/task" method="post">
                    	<div>抄表月份：<input class="text_search width200" type="text" name="mread_month"/></div>
                    	<div><input value="搜索" class="btn_search" type="submit"/></div>
                    </form>
            </div>
            <form action="" method="post">
                <!--数据区域：用表格展示数据-->     
                <div id="data">            
                    <table id="datalist">
                        <tr>
                        	<th style="width:25%">抄表月份</th>
                            <th style="width:25%">宿舍ID</th>
                            <th style="width:25%">状态（已/未）</th>
                            <th style="width:25%">操作</th>
                        </tr> 
                        <c:choose>
							<c:when test="${fn:length(tasksByMRId)==1}">
		                        <tr><td>${tasksByMRId[0].mread_month }</td>
		                        	<td>${tasksByMRId[0].dorm_id }</td>
									<td>${tasksByMRId[0].is_read eq 1?'完成':'未读'}</td>
			                        <td>
			                           <a href="mr/task/${tasksByMRId[0].id }">
			                               ${tasksByMRId[0].is_read eq 1?'修改':'添加记录'}
			                           </a>&nbsp;&nbsp;
			                        </td>	
								</tr>
	                        </c:when>    
	                        <c:otherwise>             	
		             			<c:forEach var="task" items="${tasksByMRId }">
									<tr><td>${task.mread_month }</td>
										<td>${task.dorm_id }</td>
										<td>${task.is_read eq 1?'完成':'未读'}</td>
			                            <td>
			                                <a href="mr/task/${task.id}">${task.is_read eq 1?'修改':'添加记录'}</a>&nbsp;&nbsp;
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
