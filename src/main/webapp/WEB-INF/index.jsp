<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet">
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script
	src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script
	src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
	   <div class="row">
	   	  <div class="col-md-12">
	   	  	<h1>员工的CRUD操作</h1>
	   	  </div>
	   </div>
	   <div class="row">
	   	  <div class="col-md-4 col-md-offset-8">
	   	  	<button class="btn btn-info">新增</button>
	   	  	<button class="btn btn-danger">批量删除</button>
	   	  </div>
	   </div>
	   <div class="row">
	   	  <div class="col-md-12">
	   	  	<table class="table table-striped">
		      <thead>
		        <tr>
		          <th>#</th>
		          <th>员工的姓名</th>
		          <th>员工的部门</th>
		          <th>员工的邮箱</th>
		          <th>员工的性别</th>
		          <th>员工的生日</th>
		          <th>操作</th>
		        </tr>
		      </thead>
		      <tbody id="myData">
		      
		      </tbody>
		    </table>
	   	  </div>
	   </div>
	   <div class="row">
	   	  <div class="col-md-6">
	   	  	
	   	  </div>
	   	  <div class="col-md-6">
	   	     
	   	  </div>
	   </div>
	</div>
	<script type="text/javascript">
		$(function(){
			// 这就是异步请求
			$.ajax({
			   type: "GET",
			   url: "${pageContext.request.contextPath}/emp/list",
			   data: "pg=1",
			   dataType: "json",
			   success: function(data){
			      // 1.获取表格数据
			      addEmpData(data);
			      // 2.获取页面详情
			      
			      // 3.获取页码信息
			   }
			});
		});
		
		function addEmpData(data) {
			var _list = data.info.pageInfo.list ;
			var _tbody = $("#myData");
			$.each(_list,function(index,item) {
				// 动态的创建一个tr
				var _tr =$("<tr></tr>");
				// 动态的创建一个th
				var _empId=$("<th></th>").attr("scope","row").append(item.empId);
				// 动态的创建一个td
				var _deptName= $("<td></td>").append(item.department.deptName);
				// 动态的创建一个td
				var _empName= $("<td></td>").append(item.empName);
				// 动态的创建一个td
				var _empEmail= $("<td></td>").append(item.empEmail);
				// 动态的创建一个td
				var _empSex= $("<td></td>").append(item.empSex=="M"?"男":"女");
				// 动态的创建一个td
				var _empBirthday= $("<td></td>").append(item.empBirthday);
				// var _btnTd=""
				var _btnTd = $("<td></td>");
				var _btnEdit = $("<button></button>").addClass("btn btn-sm btn-primary").attr("aria-label","Left Align")
					.append($("<span></span>").addClass("glyphicon glyphicon-pencil").attr("aria-hidden","true")).append("修改");
				var _btnDelete = $("<button></button>").addClass("btn btn-sm btn-danger").attr("aria-label","Left Align")
					.append($("<span></span>").addClass("glyphicon glyphicon-trash").attr("aria-hidden","true")).append("删除");
				_btnTd.append(_btnEdit).append(" ").append(_btnDelete);
				_tr.append(_empId).append(_empName).append(_deptName).append(_empEmail)
				.append(_empSex).append(_empBirthday).append(_btnTd);
				_tbody.append(_tr);
				
			});
		}
	</script>
</body>
</html>