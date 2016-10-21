<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- BEGIN META -->
     <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Olive Enterprise">
    <!-- END META -->
    
     <!-- BEGIN SHORTCUT ICON -->
     <link rel="shortcut icon" href="img/favicon.ico">
     <!-- END SHORTCUT ICON -->
     <title>
       	创建代理
     </title>
     <!-- BEGIN STYLESHEET-->
		<link href="<%=basePath%>/css/bootstrap.min.css" rel="stylesheet"><!-- BOOTSTRAP CSS -->
		<link href="<%=basePath%>/css/bootstrap-reset.css" rel="stylesheet"><!-- BOOTSTRAP CSS -->
		<link href="<%=basePath%>/assets/font-awesome/css/font-awesome.css" rel="stylesheet"><!-- FONT AWESOME ICON CSS -->
		<link href="<%=basePath%>/assets/advanced-datatable/media/css/demo_page.css" rel="stylesheet"><!-- ADVANCED DATATABLE CSS -->
      	<link href="<%=basePath%>/assets/advanced-datatable/media/css/demo_table.css" rel="stylesheet"><!-- ADVANCED DATATABLE CSS -->
		<link href="<%=basePath%>/assets/data-tables/DT_bootstrap.css"><!-- DATATABLE CSS -->
		<link href="<%=basePath%>/css/style.css" rel="stylesheet"><!-- THEME BASIC CSS -->
		<link href="<%=basePath%>/css/style-responsive.css" rel="stylesheet"><!-- THEME RESPONSIVE CSS -->
		<link href="<%=basePath%>/assets/morris.js-0.4.3/morris.css" rel="stylesheet"><!-- MORRIS CHART CSS -->
     <!--dashboard calendar-->
        <link href="<%=basePath%>/css/clndr.css" rel="stylesheet"><!-- CALENDER CSS -->
        <!-- 日期相关 -->
        <link href="<%=basePath%>assets/bootstrap-wysihtml5/bootstrap-wysihtml5.css" rel="stylesheet">
        <link href="<%=basePath%>assets/bootstrap-datepicker/css/datepicker.css" rel="stylesheet">
        <link href="<%=basePath%>assets/bootstrap-timepicker/compiled/timepicker.css" rel="stylesheet">
        <link href="<%=basePath%>assets/bootstrap-colorpicker/css/colorpicker.css" rel="stylesheet">
        <link href="<%=basePath%>assets/bootstrap-daterangepicker/daterangepicker-bs3.css" rel="stylesheet">
        <link href="<%=basePath%>assets/bootstrap-datetimepicker/css/datetimepicker.css" rel="stylesheet">
        <link href="<%=basePath%>assets/jquery-multi-select/css/multi-select.css" rel="stylesheet">
     <!--[if lt IE 9]>
<script src="js/html5shiv.js">
</script>
<script src="js/respond.min.js">
</script>
<![endif]-->
     <!-- END STYLESHEET-->
  </head>
  <body>
    <!-- BEGIN SECTION -->
    <section id="container">
	
	   <!-- BEGIN HEADER -->
	  <jsp:include page="/user/head.jsp"></jsp:include>
	   <!-- END HEADER -->
      <!-- BEGIN SIDEBAR -->
	  <jsp:include page="/user/aside.jsp"></jsp:include>
      <!-- END SIDEBAR -->
      <!-- BEGIN MAIN CONTENT -->
      <section id="main-content">
	  	<!-- 这里开始写内容 -->
	  	<section class="wrapper">
			   <!-- BEGIN ROW  -->
               <div class="row">
                  <div class="col-lg-6">
                     <section class="panel">
                        <header class="panel-heading">
                           <span class="label label-primary">创建代理</span>
                           <span class="tools pull-right">
                           <a href="javascript:;" class="fa fa-chevron-down"></a>
                           <a href="javascript:;" class="fa fa-times"></a>
                           </span>
                        </header>
                        <div class="panel-body">
                           <form class="form-horizontal" role="form" method="post" action="UserServlet?method=addOperate" id="createOperateForm">
                              <div class="form-group">
                                 <label for="userName" class="col-lg-2 col-sm-2 control-label">代理名称:</label>
                                 <div class="col-lg-8">
                                    <input type="text" class="form-control" id="userName" name="userName" autocomplete="off" placeholder="请输入用户名" required="required" value="${requestScope.operateUser.username }"> 
                                    <p class="help-block">代理登录时的用户名也是该名称</p>
                                 </div>
                              </div>
                              
                              <div class="form-group">
                                 <label for="password" class="col-lg-2 col-sm-2 control-label">密码:</label>
                                 <div class="col-lg-8">
                                    <input type="password" class="form-control" id="password" name="password" pattern="\S{6,}" autocomplete="off" placeholder="请输入密码" required="required" value="${requestScope.operateUser.password }"> 
                                 </div>
                              </div>
                              
                              <div class="form-group">
                                 <label for="confirmPassword" class="col-lg-2 col-sm-2 control-label">确认密码:</label>
                                 <div class="col-lg-8">
                                    <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" pattern="\S{6,}" autocomplete="off" placeholder="确认密码" required="required" value="${requestScope.operateUser.password }" > 
                                 </div>
                              </div>
                              
                              <div class="form-group">
                                 <label for="mobile" class="col-lg-2 col-sm-2 control-label">手机号:</label>
                                 <div class="col-lg-8">
                                    <input type="text" class="form-control" id="mobile" name="mobile" autocomplete="off" placeholder="手机号"  pattern="^1[3-9]\d{9}$" required="required" value="${requestScope.operateUser.mobile}">
                                 </div>
                              </div>
                              
                              <div class="form-group">
                                 <label for="mobile" class="col-lg-2 col-sm-2 control-label">推荐号:</label>
                                 <div class="col-lg-8">
                                    <input type="text" class="form-control" id="recommendId" name="recommendId" autocomplete="off" placeholder="推荐人推荐号"  pattern="\d{4,}"  value="${requestScope.operateUser.recommendId}">
                                 </div>
                              </div>
                              
                              <div class="form-group">
                                 <label for="address" class="col-lg-2 col-sm-2 control-label">地址:</label>
                                 <div class="col-lg-8">
                                    <textarea rows="5" cols="30" class="form-control" name="address" autocomplete="off" required="required">${requestScope.operateUser.address }</textarea>
                                 </div>
                              </div>
							
							  <div class="form-group">
								<p class="help-block" align="center" >
								  <font  color="red" >${error }</font>
								</p>
                              </div>

                              <div class="form-group">
                                 <div class="col-lg-offset-2 col-lg-10">
                                    <button type="submit" class="btn btn-danger" >保存</button>
                                 </div>
                              </div>
                           </form>
                        </div>
                     </section>
                     
                  </div>
               </div>
			   <!-- END ROW  -->
			   
            </section>
	  
	  
      </section>
      <!-- END MAIN CONTENT -->
      <!-- BEGIN FOOTER -->
      <jsp:include page="/user/footer.jsp"></jsp:include>
      <!-- END  FOOTER -->
    </section>
    <!-- END SECTION -->
    <!-- BEGIN JS -->
    <script src="<%=basePath%>/js/jquery-1.8.3.min.js" ></script><!-- BASIC JQUERY 1.8.3 LIB. JS -->
    <script src="<%=basePath%>/js/bootstrap.min.js" ></script><!-- BOOTSTRAP JS -->
    <script src="<%=basePath%>/js/jquery.dcjqaccordion.2.7.js"></script><!-- ACCORDIN JS -->
    <script src="<%=basePath%>/js/jquery.scrollTo.min.js" ></script><!-- SCROLLTO JS -->
    <script src="<%=basePath%>/js/jquery.nicescroll.js" ></script><!-- NICESCROLL JS -->
    <script src="<%=basePath%>/js/respond.min.js" ></script><!-- RESPOND JS -->
    <script src="<%=basePath%>/js/jquery.sparkline.js"></script><!-- SPARKLINE JS -->
    <script src="<%=basePath%>/js/sparkline-chart.js"></script><!-- SPARKLINE CHART JS -->
    <script src="<%=basePath%>/js/common-scripts.js"></script><!-- BASIC COMMON JS -->
    <script src="<%=basePath%>/js/count.js"></script><!-- COUNT JS -->
    <!--Morris-->
    <script src="<%=basePath%>/assets/morris.js-0.4.3/morris.min.js" ></script><!-- MORRIS JS -->
    <script src="<%=basePath%>/assets/morris.js-0.4.3/raphael-min.js" ></script><!-- MORRIS  JS -->
    <script src="<%=basePath%>/js/chart.js" ></script><!-- CHART JS -->
    <!--Calendar-->
    <script src="<%=basePath%>/js/calendar/clndr.js"></script><!-- CALENDER JS -->
    <script src="<%=basePath%>/js/calendar/evnt.calendar.init.js"></script><!-- CALENDER EVENT JS -->
    <script src="<%=basePath%>/js/calendar/moment-2.2.1.js"></script><!-- CALENDER MOMENT JS -->
    <script src="<%=basePath%>/js/underscore-min.js"></script><!-- UNDERSCORE JS -->
    <script src="<%=basePath%>/assets/jquery-knob/js/jquery.knob.js" ></script><!-- JQUERY KNOB JS -->
    
    <script src="<%=basePath%>/assets/advanced-datatable/media/js/jquery.dataTables.js"></script><!-- BASIC COMMON JS  -->
    <script src="<%=basePath%>/assets/data-tables/DT_bootstrap.js"></script><!-- DATATABLE BOOTSTRAP JS  -->
    
    
    <!-- 日期相关 -->
    <script src="<%=basePath%>/assets/fuelux/js/spinner.min.js"></script>
    <script src="<%=basePath%>/assets/bootstrap-wysihtml5/wysihtml5-0.3.0.js"></script>
    <script src="<%=basePath%>/assets/bootstrap-wysihtml5/bootstrap-wysihtml5.js"></script>
    <script src="<%=basePath%>/assets/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    
    <script src="<%=basePath%>/assets/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
    
    <script src="<%=basePath%>/assets/bootstrap-daterangepicker/moment.min.js"></script>
    <script src="<%=basePath%>/assets/bootstrap-daterangepicker/daterangepicker.js"></script>
    <script src="<%=basePath%>/assets/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
    <script src="<%=basePath%>/assets/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
    <script src="<%=basePath%>/assets/jquery-multi-select/js/jquery.multi-select.js"></script>
    <script src="<%=basePath%>/assets/jquery-multi-select/js/jquery.quicksearch.js"></script>
    <script src="<%=basePath%>/js/advanced-form-components.js"></script>
    <script src="<%=basePath%>/assets/ckeditor/ckeditor.js"></script>
    <script src="<%=basePath%>/js/jquery.validate.min.js"></script>
    <script >
      //knob
      $(".knob").knob();
	  
	  $.validator.setDefaults({
		    submitHandler: function() {
		      document.forms[0].submit();
		    }
	  });
	  
	  window.onload = function(){
	  
	  		jQuery.validator.addMethod("isMobile", function (value, element) {  
			    var length = value.length;  
			    var mobile = /^1[3-9]\d{9}$/;  
			    return this.optional(element) || (length == 11 && mobile.test(value));  
			}, "手机号格式不正确");  
	  
	  
	  		$("#createOperateForm").validate({
			    rules: {
			      userName: {
			        required: true,
			        minlength: 2
			      },
			      password: {
			        required: true,
			        minlength: 6
			      },
			      confirmPassword: {
			        required: true,
			        minlength: 6,
			        equalTo: "#password"
			      },
			      address:"required",
			      mobile:{
			      	required: true,  
                	isMobile: "#mobile"  
			      },
			      recommendId:{
			      	digits:true
			      }
			    },
			    messages: {
			      userName: {
			        required: "请输入代理名",
			        minlength: "长度至少2位"
			      },
			      password: {
			        required: "请输入密码",
			        minlength: "密码长度6-15"
			      },
			      confirmPassword: {
			        required: "请输入密码",
			        minlength: "密码长度6-15",
			        equalTo: "两次密码输入不一致"
			      },
			      address: "请输入地址",
			      mobile:{
			      	required: "请输入手机号",
			      },
			      recommendId:{
			      	digits:"请输入数字"
			      } 
			    }
			});
	  }
	  
	  
    </script>
    <!-- END JS -->
  </body>
</html>


