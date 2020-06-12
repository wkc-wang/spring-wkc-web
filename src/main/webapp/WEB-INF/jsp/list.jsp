<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="${pageContext.request.contextPath}/edit" class="btn btn-info">增加</a>
	<table class="table table-bordered">
	<tr>
		<td>id</td>
		<td>title</td>
		<td>price</td>
		<td>descs</td>
		<td>shelftime</td>
		<td>操作</td>
	</tr>
	<c:forEach var="p" items="${productList }">
	<tr>
		<th scope="row"><input type="checkbox" name="ids" value="${p.id }"></th>
		<td>${p.title }</td>
		<td>${p.price }</td>
		<td>${p.descs }</td>
		<td>
		<fmt:formatDate value="${p.shelftime }" pattern="yyyy-MM-dd HH:mm:ss"/>
		</td>
		<td><a href="javascript:delFun('${p.id }')" class="btn btn-info">删除</a>&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/edit/${p.id }" class="btn btn-danger">修改</a></td>
	</tr>
	</c:forEach>
	</table>
	
	<form action="" method="post" id="myForm">
		<input type="hidden" name="_method" value="DELETE">
	</form>
	<script type="text/javascript">
		function delFun(id) {
			$("#myForm").attr("action","${pageContext.request.contextPath}/edit/"+id);
			$("#myForm").get(0).submit();
		}
	</script>
</body>
</html>