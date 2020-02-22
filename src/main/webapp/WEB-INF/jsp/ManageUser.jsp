<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() 
	                   + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
<title>管理客户信息页面</title>

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
     
.divcss5 {background:#F0FFFF; 
 } 
</style>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-theme.min.css"/> 
<link href="${pageContext.request.contextPath}/css/metisMenu.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/dataTables.bootstrap.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/sb-admin-2.css" rel="stylesheet" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>
<div class="divcss5">
<!-- <div class="panel panel-primary">
	.panel-heading 面板头信息。
	<div class="panel-heading" style="word-spacing:1100px">
		.panel-title 面板标题。
		<h3 class="panel-title">客户信息管理 <a href="Managerview">[<font color="red">退出</font>]</a></h3>
	</div>
</div> -->
<ul>
     <li><a><font color="Aqua" size="3px"><strong>今日新闻</strong></a></font></li>
     <li style="float:right"><font size="3px"><a>欢迎，<font color="red">${sessionScope.username} </font>管理员</a></font></li>
 	 <li style="float:right"><font size="3px"><a class="active" href="firstview">退出</a></font></li> 	 
 	 <li style="float:right"><font size="3px"><a href="manageUser">管理客户信息</a></font></li>
 	 <li style="float:right"><font size="3px"><a href="Managerview">新闻首页</a></font></li>
</ul>
<hr><hr>
<div class="container">
	<br>
	<div class="col-md-12">
			<div class="panel panel-primary">
				<div class="panel-heading">
			  	  <h3 class="panel-title">客户信息列表</h3>
			  </div>
			  <div class="panel-body">
				
				<div class="table table-responsive">
					<table class="table table-bordered table-hover">
						<thead>
							<tr>
								<th class="text-center">客户名</th ><th class="text-center">性别</th>
								<th class="text-center">电话</th ><th class="text-center">地址</th>
								<th class="text-center">操作</th >
							</tr>
						</thead>
						<tbody class="text-center">
							<c:forEach items="${requestScope.user}" var="user">
								<tr>
									<td>${user.username}</td>
									<td>${user.sex}</td>
									<td>${user.phone}</td>
									<td>${user.address}</td>
									<td><a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#UserEditDialog" onclick= "editUser(${user.uid})">修改</a> | 
									 <a href="#" class="btn btn-danger btn-xs" onclick="deleteUser(${user.uid})">删除</a>
		 							 </td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				</div>
			</div>
		</div>
</div>



<!-- 修改客户模态框 -->
<div class="modal fade" id="UserEditDialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">修改客户信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="edit_user_form">
					<input type="hidden" id="edit_uid" name="uid"/>
					
					<div class="form-group">
						<label for="edit_username" class="col-sm-2 control-label">用户名称</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_username" placeholder="用户名称" name="username" />
						</div>
					</div>
					
					<div class="form-group">
						<label for="edit_password" class="col-sm-2 control-label">密码</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_password" placeholder="密码" name="password" />
						</div>
					</div>
					
					<div class="form-group">
						<label for="edit_sex" class="col-sm-2 control-label">性别</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_sex" placeholder="性别" name="sex" />
						</div>
					</div>
					
					<div class="form-group">
						<label for="edit_phone" class="col-sm-2 control-label">电话</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_phone" placeholder="电话" name="phone" />
						</div>
					</div>
					
					<div class="form-group">
						<label for="edit_address" class="col-sm-2 control-label">地址</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_address" placeholder="地址" name="address" />
						</div>
					</div>
					
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="updateUser()">保存修改</button>
			</div>
		</div>
	</div>
</div>

<script src="${pageContext.request.contextPath}/js/jquery-1.11.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/metisMenu.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/js/dataTables.bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/sb-admin-2.js"></script>

<script type="text/javascript">
//通过id获取修改的客户信息
function editUser(uid) {
    $.ajax({
        type:"get",
        url:"${pageContext.request.contextPath}/getById",
        data:{"uid":uid},
        success:function(data) {
            $("#edit_uid").val(data.uid);
            $("#edit_username").val(data.username);
            $("#edit_password").val(data.password);
            $("#edit_sex").val(data.sex);
            $("#edit_phone").val(data.phone);
            $("#edit_address").val(data.address);         
        }
    });
}

// 执行修改客户操作
function updateUser() {
	$.post("${pageContext.request.contextPath}/updateUser",$("#edit_user_form").serialize(),function(data){
		if(data =="OK"){
			alert("用户信息更新成功！");
			window.location.reload();
		}else{
			alert("用户信息更新失败！");
			window.location.reload();
		}
	});
}

//删除客户
function deleteUser(uid) {
    if(confirm('确实要删除该用户吗(同时删除用户的新闻)?')) {
$.post("${pageContext.request.contextPath}/delete",{"uid":uid},
function(data){
            if(data =="OK"){
                alert("客户删除成功！");
                window.location.reload();
            }else{
                alert("删除客户失败！");
                window.location.reload();
            }
        });
    }
}
</script>
<br><br><br><br><br><br><br><br><br><br>
</div>
</body>
</html>