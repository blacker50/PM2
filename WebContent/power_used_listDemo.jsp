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
            		<form action="" method="post">
                    	<div>抄表月份：<input class="text_search width200" type="text" name="id"/></div>
                    	<div><input value="搜索" class="btn_search" type="submit"/></div>
                    </form>
            </div>
            <form action="" method="post">
                <!--数据区域：用表格展示数据-->     
                <div id="data">            
                    <table id="datalist">
                        <tr>
                            <th style="width:10%">宿舍号</th>
                            <th style="width:10%">抄表员</th>
                            <th style="width:15%">上月读数</th>
                            <th style="width:15%">本月读数</th>
                            <th style="width:15%">用电量</th>
                            <th style="width:15%">剩余电量</th>
                            <th style="width:10%">用电状态（正常/欠费）</th>
                            <th style="width:10%">操作</th>
                        </tr> 
						<tr><td>A231</td>
								<td>Cxx</td>
								<td>47.77</td>
								<td>106.51</td>
								<td>58.74</td>
								<td>-3.5</td>
								<td>欠费</td>
	                            <td>
	                                <a href="">缴费</a>&nbsp;&nbsp;
	                            </td>	
						</tr>
						<tr><td>A511</td>
								<td>xiaoming</td>
								<td>47.77</td>
								<td>96.20</td>
								<td>48.43</td>
								<td>6.7</td>
								<td>正常</td>
	                            <td>
	                                <a href="">缴费</a>&nbsp;&nbsp;
	                            </td>	
						</tr>
                    </table>
                </div>
            </form>
        </div>
        <!--主要区域结束-->
    </body>
</html>
