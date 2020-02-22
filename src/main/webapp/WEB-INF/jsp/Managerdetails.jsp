<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="club.boot.NewsManage.bean.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>新闻详情页</title>
       <style type="text/css">
    	ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #333;
}
 
li {
    float: left;
}
 
li a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}
 
/*鼠标移动到选项上修改背景颜色 */
li a:hover {
    background-color: #111;
}
.active {
    background-color: #4CAF50;
}

ul {
    position: fixed;
    top: 0;
    width: 100%;
}


.hr{
	height:5px;border:none;border-top:5px ridge green;
}

body{  padding: 0px;  
       background-color:#F0FFFF;
     }

	</style>	
  </head> 
  <body>
     <% 
  				String title=request.getParameter("title");
  				String content=request.getParameter("content");
  				String post_time=request.getParameter("post_time");
  				String type=request.getParameter("type"); 	 							  								
  	%>  	
    <ul>
     <li><a><font color="Aqua"><strong>今日新闻</strong></a></font></li>
     <li style="float:right"><a>欢迎，<font color="red">${sessionScope.username} </font>管理员</a></li>
     <li style="float:right"><a class="active" href="firstview">退出</a></li> 	 
 	 <li style="float:right"><a href="manageUser">管理客户信息</a></li>
     <li style="float:right"><a href="Managerview">新闻首页</a></li>

	</ul>
	 <br><br><br>
	 <h3>新闻详情</h3>
	 <hr>
	 <table>
        		<center><span>
  				<h4><%=title%></h4>
 				<br> 				
  				</span></center>				 				
  				<center>
  				<span style="color:gray">
							
  		 	    发布日期：<%=post_time%> &nbsp;|&nbsp; 
  				
  		  	    新闻分类：<%=type %> &nbsp;&nbsp;&nbsp;
  				</span>
  				</center>
  				<br><br><br>
  				<%=content%>
  				</table> 
  </body>
</html>
