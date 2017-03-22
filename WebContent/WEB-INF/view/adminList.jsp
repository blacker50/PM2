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
        <link type="text/css" rel="stylesheet" media="all" href="./styles/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="./styles/global_color.css" />    
		<script type="text/javascript" src="jquery-1.7.2.min.js"></script>
		<script type="text/javascript">
		$(function(){
			$(".delete").click(function(){
				var href=$(this).attr("href");
				var form=$("#form1").attr("action",href);
				form.submit();
				return false;
			});
		});
	</script>   
    </head>
    <body>
        <form action="" method="post" id="form1">
			<input type="hidden" name="_method" value="delete"/>
	    </form>
        <!--Logo区域开始-->
        <div id="header">
            <img src="./images/logo.png" alt="logo" class="left"/>
            <a href="login.jsp">[退出]</a>            
        </div>
        <!--Logo区域结束-->
        <!--导航区域开始-->
        <div id="navi">                        
            <ul id="menu">
                <li><a href="./index.jsp" class="index_off"></a></li>
                <li><a href="./showAllMeterReaders" class="role_off"></a></li>
                <li><a href="./showAllAdmins" class="admin_off"></a></li>
                <li><a href="./toll.jsp" class="fee_off"></a></li>
                <li><a href="./meterReader.jsp" class="account_off"></a></li>
                <li><a href="./showAllDorms" class="service_off"></a></li>
                <li><a href="./account.jsp" class="bill_off"></a></li>
                <li><a href="./report.jsp" class="report_off"></a></li>
                <li><a href="./showUserInfo" class="information_off"></a></li>
                <li><a href="./modifyPassword" class="password_off"></a></li>
            </ul>            
        </div>
        <!--导航区域结束-->
        <!--主要区域开始-->
        <div id="main">
            <div class="search_add">
            		<form:form action="${pageContext.request.contextPath}/admin" modelAttribute="admin">
                    	<div>管理员id：<form:input class="text_search width200" type="text" path="id"/></div>
                    	<div><input value="搜索" class="btn_search" type="submit"/></div>
                    </form:form>
                    <input value="增加" class="btn_add" onclick="location.href='./admin';" type="button"/>
            </div>
            <form action="" method="post">
                <!--数据区域：用表格展示数据-->     
                <div id="data">            
                    <table id="datalist">
                        <tr>
                            <th>管理员ID</th>
                            <th>姓名</th>
                            <th></th>
                        </tr> 
                        <!-- 判断是否admins元素是否是搜索id得到的一个 --> 
                        <c:if test="${fn:length(admins)==0}">
                           <c:choose>
	                           <c:when test="${!empty adminSelected}">
	                        		<tr><td>${adminSelected.id }</td>
										<td>${adminSelected.name }</td>
		                            	<td>
		                               		<a href="admin/${adminSelected.id}">编辑</a>&nbsp;&nbsp;
		                                	<a href="admin/${adminSelected.id}" class="delete">删除</a>
		                            	</td>	
									</tr>
								</c:when>
								<c:otherwise>
								    <tr>
								    	<td></td>
										<td></td>
		                            	<td></td>	
									</tr>
								</c:otherwise>
							</c:choose>
                        </c:if>                    	
             			<c:forEach var="admin" items="${admins }">
							<tr><td>${admin.id }</td>
								<td>${admin.name }</td>
	                            <td>
	                                <a href="admin/${admin.id}">编辑</a>&nbsp;&nbsp;
	                                <a href="admin/${admin.id}" class="delete">删除</a>
	                            </td>	
							</tr>
						</c:forEach>
                    </table>
                </div>
            </form>
        </div>
        <!--主要区域结束-->
    </body>
</html>
