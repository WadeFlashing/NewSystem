<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <link rel="stylesheet" href="kindeditor/default/default.css" /> 
    <script charset="utf-8" src="kindeditor/kindeditor-all.js"></script> 
              <script charset="utf-8" src="kindeditor/lang/zh-CN.js"></script> 
               <script> 
               KindEditor.ready(function(K) { 
                   K.create('#text', { 
                           uploadJson : 'upload_json.jsp', 
                           fileManagerJson : 'file_manager_json.jsp', 
                           allowFileManager : true
                           
                   }); 
           }); 
              </script> 
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'publish.jsp' starting page</title>
    
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


hr{
	height:5px;border:none;border-top:5px ridge green;
}


.input{
				height:40px;
				width:800px;
                border: 1px solid #ccc;
                padding: 7px 0px;
                border-radius: 3px;
                padding-left:5px;
                -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
                box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
                -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
                -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
                transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s
            }
            input:focus{
                    border-color: #66afe9;
                    outline: 0;
                    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6);
                    box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6)
            }

.select{
				height:40px;
				width:70px;
                border: 1px solid #ccc;
                padding: 7px 0px;
                border-radius: 3px;
                padding-left:5px;
                -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
                box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
                -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
                -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
                transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s
            }
            
             body{  padding: 0px;  
       background-color:#F0FFFF;
     }
            
	</style>

  </head>
  
  <body>
  <%

		Date time = new Date();

		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		String nowtime = df.format(time);

    	String username=(String)session.getAttribute("username"); 	
    	
	%>
     <ul>
     <li><a><font color="Aqua"><strong>今日新闻</strong></a></font></li>
     <li style="float:right"><a>欢迎，${sessionScope.username} </a></li>
 	 <li style="float:right"><a class="active" href="firstview">退出</a></li> 	 
 	 <li style="float:right"><a href="topublish">发布新闻</a></li>
 	 <li style="float:right"><a href="mynews?&username=<%=username %>">我的新闻</a></li>
 	 <li style="float:right"><a href="view?&username=<%=username %>">新闻首页</a></li>
	 </ul>
	 <br><br><br>
	 <h2><center>发布新闻</center></h2>
	 
   	 <center><form action="publish" method="post"> 
   	 <input type="text" name="title" class="input">
	 <br><br>
	 
	 <select name="type" class="select" style="margin-right:720px;">
	 	<option value="教育">教育</option>
	 	<option value="政治">政治</option>
	 	<option value="商业">商业</option>
	 	<option value="娱乐">娱乐</option>
	 </select>
	 
	 <br><br>
	 
		<textarea rows="15" cols="105" id="text" name="content" ></textarea><br>
		<input type="hidden" name="username" value="<%=username %>" />
		<input type="hidden" name="post_time" value="<%=nowtime %>" />
        <input type="submit" value="提交" class="input" /> 
      </form></center>
      
  </body>
</html>
