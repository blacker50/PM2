<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

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
 		    $.get("meterReader/logout",function(data){
		        if(data=="logout"){  
		          alert("退出系统");
		          location="login.jsp";
		        }
		    });
		}
		</script> 
    </head>
    <body class="index">
        <font color="#FFFFFF">
           <span style="font-weight:bold;">${userName }</span>
        </font>
        <a href="javaScript:void(0)" onclick="doLogout()">[退出]</a>  
        <div id="index_navi">
            <ul id="menu">
                <li><a href="mr_index.jsp" class="index_off"></a></li>
                <li><a href="showTasksByMRId" class="account_off"></a></li>
                <li><a href="mr/pwd_modi" class="password_off"></a></li>
            </ul>
        </div>
    </body>
</html>