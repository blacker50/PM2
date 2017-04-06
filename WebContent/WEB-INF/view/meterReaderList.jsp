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
                <li><a href="" class="account_off"></a></li>
                <li><a href="" class="fee_off"></a></li>
                <li><a href="./showAllDorms" class="service_off"></a></li>
                <li><a href="" class="bill_off"></a></li>
                <li><a href="" class="report_off"></a></li>
                <li><a href="./modifyPassword" class="password_off"></a></li>
            </ul>           
        </div>
        <!--导航区域结束-->
        <!--主要区域开始-->
        <div id="main">
            <div class="search_add">
            		<form action="${pageContext.request.contextPath}/meterReader" method="post">
                    	<div>抄表员id：<input class="text_search width200" type="text" name="id"/></div>
                    	<div><input value="搜索" class="btn_search" type="submit"/></div>
                    </form>
                    <input value="增加" class="btn_add" onclick="location.href='./meterReader';" type="button"/>
            </div>
            <form action="" method="post">
                <!--数据区域：用表格展示数据-->     
                <div id="data">            
                    <table id="datalist">
                        <tr>
                            <th style="width:20%">抄表员ID</th>
                            <th style="width:20%">姓名</th>
                            <th style="width:20%">电话</th>
                            <th style="width:40%">操作</th>
                        </tr> 
                        <!-- 判断是否admins元素是否是搜索id得到的一个 --> 
                        <c:if test="${fn:length(meterReadersSelected)==0}">
                           <c:choose>
	                           <c:when test="${!empty meterReaderSelected}">
	                        		<tr><td>${meterReaderSelected.id }</td>
										<td>${meterReaderSelected.name }</td>
										<td>${meterReaderSelected.phone }</td>
		                            	<td>
		                               		<a href="meterReader/${meterReaderSelected.id}">编辑</a>&nbsp;&nbsp;
		                                	<a href="meterReader/${meterReaderSelected.id}" class="delete">删除</a>
		                            	</td>	
									</tr>
								</c:when>
								<c:otherwise>
								</c:otherwise>
							</c:choose>
                        </c:if>                    	
             			<c:forEach var="meterReader" items="${meterReaders }">
							<tr><td>${meterReader.id }</td>
								<td>${meterReader.name }</td>
								<td>${meterReader.phone }</td>
	                            <td>
	                                <a href="meterReader/${meterReader.id}">编辑</a>&nbsp;&nbsp;
	                                <a href="meterReader/${meterReader.id}" class="delete">删除</a>
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
