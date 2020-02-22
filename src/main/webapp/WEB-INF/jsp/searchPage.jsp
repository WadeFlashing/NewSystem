<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="club.boot.NewsManage.bean.*"%>
<%@page import="java.sql.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>搜索结果页</title>
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

.button {
    background-color: #4CAF50;
    border: none;
    color: white;
    padding: 6px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
}
 .container {
    height: 70px;
    width: 800px;
    margin: 100px auto 0 auto;
}
.parent {
    position: relative;
}
.search {
    width: 300px;
    height: 40px;
    border-radius: 18px;
    outline: none;
    border: 1px solid #ccc;
    padding-left: 20px;
    position: absolute;
}
.hr{
	height:5px;border:none;border-top:5px ridge green;
}

select{
                //清除select的边框样式
                border: none;
                //清除select聚焦时候的边框颜色
                outline: none;
                //将select的宽高等于div的宽高
                width: 100%;
                height: 40px;
                line-height: 40px;
                //隐藏select的下拉图标
                
                -webkit-appearance: none;
                -moz-appearance: none;
                //通过padding-left的值让文字居中
                padding-left: 60px;
            }
            //使用伪类给select添加自己想用的图标
            div:after{
                content: "";
                width: 14px;
                height: 8px;
                
                //通过定位将图标放在合适的位置
                position: absolute;
                right: 20px;
                top: 45%;
                //给自定义的图标实现点击下来功能
                pointer-events: none;
            }       

 body{  padding: 0px;  
       background-color:#F0FFFF;
     }

    </style>
  </head>
  <body>
     <% 
     		String username=(String)session.getAttribute("username");		            	             
      %> 
      
      <ul>
     <li><a><font color="Aqua"><strong>今日新闻</strong></a></font></li>
     <li style="float:right"><a>欢迎，${sessionScope.username}</a></li>
 	 <li style="float:right"><a class="active" href="firstview">退出</a></li> 	 
 	 <li style="float:right"><a href="topublish">发布新闻</a></li>
 	 <li style="float:right"><a href="mynews?&username=<%=username %>">我的新闻</a></li>
 	 <li style="float:right"><a href="view?&username=<%=username %>">新闻首页</a></li>
	 </ul>	 
	 <br><br><br>
	 <h2>新闻</h2>
	 <div class="container">
    <form action="search" class="parent" method="post">
    <select name="choose">  
    <option value="1">根据发布人ID</option> 
    <option value="2">根据新闻类别</option> 
    <option value="3">根据新闻标题</option> 
    </select> 
        <input type="text" class="search"  name="values" placeholder="搜索" />
        &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
        &emsp;&emsp;&emsp;&emsp;&emsp;
        <input type="submit" class="button" value="搜索" >
    </form>
	</div>
	 <br>
	 <hr class="hr">
     <table>
     
     <%
  		   List<News> list = new ArrayList<News>();    		
		   list = (List)request.getAttribute("list");
  			for(int i = 0;i<list.size();i++){
  			News news =(News) list.get(i);
  			String title=news.getTitle();
  			String content=news.getContent();
  			String post_time=news.getPost_time();
  			String type=news.getType();  
  			int uid=news.getUid();			
  	    %>
  	    
  	    <span>
  				<h3><a href="details?title=<%=title%>&content=<%=content%>&post_time=<%=post_time%>&type=<%=type%>"><%=title%></a></h3><br>
  				</span>
  				  				
  		        <span style="color:gray">
  		   		发布人ID：<%=uid %> &nbsp;|&nbsp; 
							
  		 	    发布日期：<%=post_time%> &nbsp;|&nbsp; 
  				
  		  	    新闻分类：<%=type%>&nbsp;&nbsp;&nbsp;
  				</span>
  				<br><br><br>
  				<hr>
     </table>
        <%
	 	}
	 	 %>    
  </body>
</html>
