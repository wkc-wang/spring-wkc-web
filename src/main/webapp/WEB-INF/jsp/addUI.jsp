<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/bootstrap-datetimepicker.min.css" rel="stylesheet">

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.fr.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/edit" method="post">
  		<div class="form-group">
		    <label>title</label>
		    <input type="text" class="form-control" name="title">
  		</div>
  		<div class="form-group">
		    <label>price</label>
		    <input type="text" class="form-control" name="price">
  		</div>
  		<div class="form-group">
		    <label>descs</label>
		    <textarea class="form-control" rows="3" name="descs"></textarea>
  		</div>
  		<div class="form-group">
                <label for="dtp_input1" class="control-label">上架时间</label>
                <div class="input-group date form_datetime col-md-5" data-date="" data-date-format="yyyy-mm-dd HH:mm:ss" data-link-field="dtp_input1">
                    <input class="form-control" size="16" type="text" value="" name="shelftime" readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
					<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                </div>
				<input type="hidden" id="dtp_input1" value="" name="shelftime"/><br/>
            </div>
  		<div class="form-group">
      	<div class="checkbox col-sm-10">
		  	<label>
		      <input type="checkbox" name="isshelf" value="1">是否下架
		    </label>
	    </div>
	  </div>
	    <div class="form-group">
	    	<div class="checkbox col-sm-10">
		  	<label>
		      <input type="checkbox" name="iscount" value="1">是否折扣
		    </label>
	      </div>
	  </div>
  		<input type="submit" value="提交" class="btn btn-success btn-block">
	</form>
	
	<script type="text/javascript">
    $('.form_datetime').datetimepicker({
        //language:  'fr',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		forceParse: 0,
        showMeridian: 1
    });
	$('.form_date').datetimepicker({
        language:  'fr',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0
    });
	$('.form_time').datetimepicker({
        language:  'fr',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 1,
		minView: 0,
		maxView: 1,
		forceParse: 0
    });
</script>
</body>
</html>