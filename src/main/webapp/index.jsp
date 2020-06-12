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
	   	  	<button class="btn btn-info" data-toggle="modal" data-toggle="modal" id="btnSaveUI">新增</button>
	   	  	<button class="btn btn-danger" id="btnBatchDelete">批量删除</button>
	   	  </div>
	   </div>
	   	<!-- 新增 -->
	   	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="myModal"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">新增员工信息</h4>
		      </div>
		      <div class="modal-body">
		        <form class="form-horizontal" id="empSaveForm">
				  <div class="form-group">
				    <label for="input_empName" class="col-sm-2 control-label">员工姓名</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="inputempName" name="empName" placeholder="empName">
				      <span id="helpBlock2" class="help-block"></span>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="inputPassword3" class="col-sm-2 control-label">员工部门</label>
				    <div class="col-sm-3">
				      <select class="form-control" name="deptId" id="selectDept">
				      
				      
				      </select>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="input_empEmail" class="col-sm-2 control-label">员工邮箱</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="inputempEmail" name="empEmail">
				      <span id="helpBlock3" class="help-block"></span>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="inputPassword3" class="col-sm-2 control-label">员工性别</label>
				    <div class="col-sm-10">
				      <label class="radio-inline">
					  <input type="radio" name="empSex" id="inlineRadio1" value="男">男
					</label>
					<label class="radio-inline">
					  <input type="radio" name="empSex" id="inlineRadio2" value="女">女
					</label>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="input_empBirthday" class="col-sm-2 control-label">员工生日</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="inputPassword3" name="empBirthday">
				    </div>
				  </div>
				</form>
		        
		        
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
		        <button type="button" class="btn btn-primary" id="btnEmpAdd">新增</button>
		      </div>
		    </div>
		  </div>
		</div>
	   	
	   	
	   	
	   	<!-- 修改 -->
	   	<div class="modal fade" id="myEditModal" tabindex="-1" role="dialog" aria-labelledby="myModalEditLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close" ><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalEditLabel">修改员工信息</h4>
		      </div>
		      <div class="modal-body">
		        <form class="form-horizontal" id="empEditForm">
				  <div class="form-group">
				    <label for="input_edit_empName" class="col-sm-2 control-label">员工姓名</label>
				    <div class="col-sm-10">
				     <p class="form-control-static" id="input_edit_empName"></p>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="selectEditDept" class="col-sm-2 control-label">员工部门</label>
				    <div class="col-sm-3">
				      <select class="form-control" name="deptId" id="selectEditDept">
				      
				      
				      </select>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="input_edit_empEmail" class="col-sm-2 control-label">员工邮箱</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="input_edit_empEmail" name="empEmail">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="inputPassword3" class="col-sm-2 control-label">员工性别</label>
				    <div class="col-sm-10">
				      <label class="radio-inline">
					  <input type="radio" name="empSex" id="inlineRadio3" value="男">男
					</label>
					<label class="radio-inline">
					  <input type="radio" name="empSex" id="inlineRadio4" value="女">女
					</label>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="input_edit_empBirthday" class="col-sm-2 control-label">员工生日</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="input_edit_empBirthday" name="empBirthday">
				    </div>
				  </div>
				</form>
		        
		        
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
		        <button type="button" class="btn btn-primary" id="btnEmpEdit">修改</button>
		      </div>
		    </div>
		  </div>
		</div>
	   	
	   	
	   <div class="row">
	   	  <div class="col-md-12">
	   	  	<table class="table table-striped">
		      <thead>
		        <tr>
		          <th><input type="checkbox" id="ckAll" onclick="$('input[name=ids]').prop('checked',this.checked)"></th>
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
	   	  <div class="col-md-6"  id="myPageInfo">
	   	  	
	   	  </div>
	   	  <div class="col-md-6" id="myPageDetail">
	   	     
	   	  </div>
	   </div>
	</div>
	<script type="text/javascript">
	var rowPage;
	var currentPage;
	$(function(){
		// 这就是异步请求
		gotoPage(1);
	});
	// 跳转页码
	function gotoPage(pg) {
		if($("#ckAll").prop("checked")) {
			$("#ckAll").prop("checked",false);
		}
		$.ajax({
		   type: "GET",
		   url: "${pageContext.request.contextPath}/emp/list",
		   data: "pg="+pg,
		   dataType: "json",
		   success: function(data){
		      // 1.获取表格数据
		      addEmpData(data);
		      // 2.获取页面详情
		      addPageInfo(data);
		      // 3.获取页码信息
		      addPageDetail(data);
		   }
		});
	}
	//点击新增按钮
	$("#btnSaveUI").click(function() {
		addDeptsDate("#selectDept");
		$('#myModal').modal({
			"backdrop" : "static"
		});
	})
	
	
	function addDeptsDate(ele) {
		var _selectDept=$(ele);
		_selectDept.empty();
		$.ajax({
			type: "GET",
			   url: "${pageContext.request.contextPath}/dept/list",
			   dataType: "json",
			   async:false,
			   success: function(data){
			      var _deptData=data.info.deptartList;
			      $.each(_deptData,function(index,item) {
			    	  $("<option></option>").attr("id","deptId").attr("name","deptId").attr("value",item.deptId).append(item.deptName).appendTo(_selectDept);
			      })
			   }
		})
	}
	// 获取页码信息
	function addPageDetail(data) {
		var _pageDetail = $("#myPageDetail");
		// 调用之前清空
		_pageDetail.empty();
		// <nav aria-label="Page navigation">
		var _nav = $("<nav></nav>").attr("aria-label","Page navigation");
		// <ul class="pagination">
		var _ul = $("<ul></ul>").addClass("pagination");
		var _isFirstPage=$("<li></li>");
		if(data.info.pageInfo.isFirstPage) {
			_isFirstPage.addClass("disabled").append($("<a></a>").attr("href","javascript:void(0);").append("首页"));
		} else {
			_isFirstPage.append($("<a></a>").attr("href","javascript:gotoPage(1);").append("首页"));
		}
		var _hasPreviousPage=$("<li></li>");
		if(data.info.pageInfo.hasPreviousPage) {
			var pPage = data.info.pageInfo.pageNum-1;
			_hasPreviousPage.append($("<a></a>").attr("href","javascript:gotoPage("+pPage+");").attr("aria-label","Previous")
					.append($("<span></span>").attr("aria-hidden","true").append("&laquo;")));
		} else {
			_hasPreviousPage.addClass("disabled").append($("<a></a>").attr("href","javascript:void(0);").attr("aria-label","Previous")
					.append($("<span></span>").attr("aria-hidden","true").append("&laquo;")));
		}
		_ul.append(_isFirstPage).append(_hasPreviousPage) ;
		//添加页码
		$.each(data.info.pageInfo.navigatepageNums,function(index,item) {
			var _li = $("<li></li>");
			if(item == data.info.pageInfo.pageNum) {
				_li.addClass("active").append($("<a></a>").attr("href","javascript:void(0);")
						.append(item).append($("<span></span>").addClass("sr-only").append("(current)")));
			} else {
				//<li><a href="${pageContext.request.contextPath}/emp/list?pg=${p}">${p }</a></li>
				_li.append($("<a></a>").attr("href","javascript:gotoPage("+item+");").append(item));
			}
			_ul.append(_li);
		});
		// 添加结束页
		var _hasNextPage= $("<li></li>");
		if(data.info.pageInfo.hasNextPage) {
			var pPage = data.info.pageInfo.pageNum+1;
			_hasNextPage.append($("<a></a>").attr("href","javascript:gotoPage("+pPage+");").attr("aria-label","Next")
					.append($("<span></span>").attr("aria-hidden","true").append("&raquo;")));
		} else {
			_hasNextPage.addClass("disabled").append($("<a></a>").attr("href","javascript:void(0);").attr("aria-label","Next")
					.append($("<span></span>").attr("aria-hidden","true").append("&raquo;")));
		}
		// 最后一页
		var _isLastPage= $("<li></li>");
		if(data.info.pageInfo.isLastPage) {
			_isLastPage.addClass("disabled").append($("<a></a>").attr("href","javascript:void(0);").append("末页"));
		} else {
			_isLastPage.append($("<a></a>").attr("href","javascript:gotoPage("+data.info.pageInfo.pages+")").append("末页"));
		}
		_ul.append(_hasNextPage).append(_isLastPage);
	
		_nav.append(_ul);
	
		_pageDetail.append(_nav);
		
	} 
	// 获取页面详情
	function addPageInfo(data) {
		//
		var _pageInfo = $("#myPageInfo");
		// 调用之前清空
		_pageInfo.empty();
		_pageInfo.append("当前"+data.info.pageInfo.pageNum+"页/总"
				+data.info.pageInfo.pages+"页，每页显示"
				+data.info.pageInfo.pageSize+"条数,总共"
				+data.info.pageInfo.total+"行数据");
		rowPage=data.info.pageInfo.total;
		currentPage = data.info.pageInfo.pageNum;
	}
	// 这是获取表格数据
	function addEmpData(data) {
		var _list = data.info.pageInfo.list ;
		var _tbody = $("#myData");
		//添加之前清空
		_tbody.empty();
		$.each(_list,function(index,item) {
			// 动态的创建一个tr
			var _tr =$("<tr></tr>");
			// 动态的创建一个th
			var _empId=$("<th></th>").attr("scope","row").append("<input type='checkbox' name='ids' value='"+item.empId+"'>");
			// 动态的创建一个td
			var _deptName= $("<td></td>").append(item.deptartment.deptName);
			// 动态的创建一个td
			var _empName= $("<td></td>").append(item.empName);
			// 动态的创建一个td
			var _empEmail= $("<td></td>").append(item.empEmail);
			// 动态的创建一个td
			var _empSex= $("<td></td>").append(item.empSex);
			// 动态的创建一个td
			var _empBirthday= $("<td></td>").append(item.empBirthday);
			// var _btnTd=""
			var _btnTd = $("<td></td>");
			var _btnEdit = $("<button></button>").addClass("btn btn-sm btn-primary btn-edit").attr("aria-label","Left Align").attr("emp_id",item.empId)
				.append($("<span></span>").addClass("glyphicon glyphicon-pencil").attr("aria-hidden","true")).append("修改");
			var _btnDelete = $("<button></button>").addClass("btn btn-sm btn-danger btn-del").attr("aria-label","Left Align").attr("emp_id",item.empId)
				.append($("<span></span>").addClass("glyphicon glyphicon-trash").attr("aria-hidden","true")).append("删除");
			_btnTd.append(_btnEdit).append(" ").append(_btnDelete);
			_tr.append(_empId).append(_empName).append(_deptName).append(_empEmail)
			.append(_empSex).append(_empBirthday).append(_btnTd);
			_tbody.append(_tr);
			
		});
	}
	//每个修改按钮绑定一个事件
	$(document).on("click",".btn-edit",function(index,item) {
		var empId=$(this).attr("emp_id");
		//准备部门数据
		addDeptsDate("#selectEditDept");
		addEmpByEmpId(empId);
		$("#btnEmpEdit").attr("edit-id",empId);
		$("#myEditModal").modal({
			"backdrop":"static"
		})
	});
	//每个删除按钮绑定一个事件
	$(document).on("click",".btn-del",function(index,item) {
		var empId=$(this).attr("emp_id");
		var _emname=$(this).parents("tr").find("td:eq(0)").text();
		var flag=window.confirm("你确定要删除【"+_emname+"】?");
		if(flag) {
			$.ajax({
				type: "DELETE",
				   url: "${pageContext.request.contextPath}/emp/del/"+empId,
				   dataType: "json",
				   success: function(data){
				     if(data.code==200) {
				    	 gotoPage(currentPage); 
				     }
				   }
			})
		}
		
	});
	function addEmpByEmpId(empId) {
		$.ajax({
		   type: "GET",
		   url: "${pageContext.request.contextPath}/emp/edit/"+empId,
		   dataType: "json",
		   async: false,
		   success: function(data){
		      // 数据回显
		      var _emp = data.info.employee;
		      // 添加员工的姓名
		      console.log(_emp);
		      $("#input_edit_empName").text(_emp.empName);
		      $("#input_edit_empEmail").val(_emp.empEmail);
		      $("#input_edit_empBirthday").val(_emp.empBirthday);
		      $("#empEditForm input[name='empSex']").val([_emp.empSex]);
		      $("#selectEditDept").val([_emp.deptId]);
		   }
		});
	}
	
	$("#btnEmpAdd").click(function() {
		var flag=validateFormFunction();
		if(!flag) {
			return;
		}
		var _validate=$(this).attr("is-validate");
		if("error"==_validate) {
			return;
		}
		//提取提示信息代码
		function common_validate(el,state,msg){
			if(state == "success"){
				$(el).parent().removeClass("has-error").addClass("has-success");
				$(el).next().text(msg);
			}else {
				$(el).parent().removeClass("has-success").addClass("has-error");
				$(el).next().text(msg);
			}
		};
		$("#inputempName").change(function() {
			var _empName=$(this).val();
			$.ajax({
				type: "GET",
				   url: "${pageContext.request.contextPath}/emp/checkUserName",
				   data:"_empName="+_empName,
				   dataType: "json",
				   async:false,
				   success: function(data){
					  	if(data.code==500) {
					  		$("#btnEmpAdd").attr("is-validate","error")
					  		common_validate("#inputempName","error",data.info.msg);
					  		return;
					  	}
				     if(data.info.flag) {
				    	 $("#btnEmpAdd").attr("is-validate","error")
				    	 common_validate("#inputempName","error","用户已经存在");
				     }else {
				    	 $("#btnEmpAdd").attr("is-validate","success")
				    	 common_validate("#inputempName","success","用户可以使用");
				     }
				   }
			})
		})
		//表单校验
		function validateFormFunction() {
			var _empName=$("#inputempName").val();
			var _empNameReg=/(^[a-zA-z0-9_-]{3,16}$)|(^[\u2E80-\u9FFF]{2,6}$)/;
			if(_empNameReg.test(_empName)) {
				common_validate("#inputempName","success","");
			}else {
				common_validate("#inputempName","error","你必须发输入字母数字或者下划线3到16位,或者2到6位的中文");
				return false;
			}
			var _empEmail=$("#inputempEmail").val();
			var _empEmailReg=/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if(_empEmailReg.test(_empEmail)) {
				common_validate("#inputempEmail","success","");
			}else {
				common_validate("#inputempEmail","error","你必须输入合法的邮箱");
				return false;
			}
			return true;
		}
		$.ajax({
			type: "POST",
			   url: "${pageContext.request.contextPath}/emp/edit",
			   data:$("#empSaveForm").serialize(),
			   dataType: "json",
			   success: function(data){
			     if(data.code==200) {
			    	 $("#myModal").modal("hide");
			    	 gotoPage(rowPage);
			     }
			   }
		})
	})
	// 给修改按钮绑定一个点击事件
	$("#btnEmpEdit").click(function() {
		 var edit_id= $(this).attr("edit-id");
			// 发送ajax请求，进行页面修改的操作
			$.ajax({
			   type: "PUT",
			   url: "${pageContext.request.contextPath}/emp/edit/"+edit_id,
			   data: $("#empEditForm").serialize(),
			   dataType: "json",
			   success: function(data){
			     if(data.code == 200) {
			    	 // 关闭修改窗口
			    	$("#myEditModal").modal("hide");
			    	 // 跳转到当前的页面
			    	gotoPage(currentPage); 
			     }
			   }
			});
	});
	//按钮全选
	$(document).on("click","input[name='ids']",function() {
		var _len=$("input[name='ids']").length;
		var _cks=$("input[name='ids']:checked").length;
		if(_len==_cks) {
			$("#ckAll").prop("checked",true);
		}else {
			$("#ckAll").prop("checked",false);
		}
	})
	//批量删除
	$("#btnBatchDelete").click(function() {
		var _cks=$("input[name='ids']:checked");
		var _len=_cks.length;
		if(_len>0) {
			var _emps=[];
			var _empIds=[];
			$.each(_cks,function(index,item) {
				_emps.push($(this).parent("th").next("td").text());
				_empIds.push($(this).val());
			})
			if(window.confirm("你确定要删除【"+_emps.join(",")+"】吗?")) {
				var _emp=_empIds.join(",");
				$.ajax({
					type: "DELETE",
					   url: "${pageContext.request.contextPath}/emp/del/"+_emp,
					   dataType: "json",
					   success: function(data){
					     if(data.code==200) {
					    	 gotoPage(currentPage); 
					     }
					   }
				})
			}
		}else {
			alert("你至少要选择一项")
		}
	})
	</script>
</body>
</html>