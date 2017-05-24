<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>用电收费系统</title>
        <link type="text/css" rel="stylesheet" media="all" href="../styles/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="../styles/global_color.css" /> 
        <script type="text/javascript" src="jquery-1.7.2.min.js"></script>
		<script type="text/javascript">
		function doLogout() {
 		    $.get("meterReader/logout",function(data){
		        if(data=="logout"){  
		          alert("退出系统");
		          location="../login.jsp";
		        }
		    });
		}
		</script>  
    </head>
	<body>
        <!--Logo区域开始-->
        <div id="header">
            <img src="../images/logo.png" alt="logo" class="left"/>
            <font color="#FFFFFF">
            	<span style="font-weight:bold;">${userName }</span>
            </font>
            <a href="javaScript:void(0)" onclick="doLogout()">[退出]</a>            
        </div>
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
            <div id="save_result_info" class="save_success">保存成功！</div>
            <form:form action="${pageContext.request.contextPath}/mr/meterReader" method="post"  
            modelAttribute="meterReader" class="main_form">
					<c:if test="${meterReader.id>0 }">
						<form:hidden path="id"/>
						<input type="hidden" name="_method" value="put"/>	
					</c:if>           
                    <div class="text_info clearfix"><span>密码：</span></div>
                    <div class="input_info">
                    	<form:input path="password" />
                    </div>
                    <div class="button_info clearfix">
                        <input value="保存" class="btn_save" type="submit"/>
                        <input value="取消" class="btn_save" type="button" onclick="location.href='../showAllMeterReaders';"/>
                    </div>
            </form:form>  
        </div>
</body>
</html>