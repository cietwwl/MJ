<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
  <head>
  	 <base href="<%=basePath%>">
    <!-- BEGIN META -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Custom Theme">
    <!-- END META -->
    
    <!-- BEGIN SHORTCUT ICON -->
    <link rel="shortcut icon" href="img/favicon.ico">
    <!-- END SHORTCUT ICON -->
    <title>
      	注册
    </title>
    <!-- BEGIN STYLESHEET-->
		<link href="<%=basePath%>/css/bootstrap.min.css" rel="stylesheet"><!-- BOOTSTRAP CSS -->
		<link href="<%=basePath%>/css/bootstrap-reset.css" rel="stylesheet"><!-- BOOTSTRAP CSS -->
		<link href="<%=basePath%>/assets/font-awesome/css/font-awesome.css" rel="stylesheet"><!-- FONT AWESOME ICON CSS -->
		<link href="<%=basePath%>/css/style.css" rel="stylesheet"><!-- THEME BASIC CSS -->
		<link href="<%=basePath%>/css/style-responsive.css" rel="stylesheet"><!-- THEME RESPONSIVE CSS -->
    <!--[if lt IE 9]>
<script src="js/html5shiv.js">
</script>
<script src="js/respond.min.js">
</script>
<![endif]-->
     <!-- END STYLESHEET-->
  </head>
  <body class="login-screen">
    <!-- BEGIN SECTION -->
    <div class="container">
      <form class="form-signin" action="UserServlet?method=login" method="post">
        <h2 class="form-signin-heading">
          	注册
        </h2>
		<!-- LOGIN WRAPPER  -->
        <div class="login-wrap">
          <input type="text" class="form-control" placeholder="代理名称" name="userName" autofocus>
          <input type="password" class="form-control" name="passWord" placeholder="密码">
          <input type="text" class="form-control" placeholder="用户名" name="userName" autofocus>
          <input type="password" class="form-control" name="passWord" placeholder="密码">
          <label class="checkbox">
            <input type="checkbox" value="remember-me">
                               记住我
            <span class="pull-right">
              <a data-toggle="modal" href="#myModal">
                                          忘记密码?
              </a>
            </span>
          </label>
          <button class="btn btn-lg btn-login btn-block" type="submit">
                                 注册
          </button>
          
          <div class="registration">
			 登录          
            <a class="" href="login.jsp">
              	创建一个
            </a>
          </div>
          
        </div>

      </form>
    </div>
    <!-- END SECTION -->
    <!-- BEGIN JS -->
    <script src="<%=basePath%>/js/jquery.js" ></script><!-- BASIC JQUERY LIB. JS -->
	<script src="<%=basePath%>/js/bootstrap.min.js" ></script><!-- BOOTSTRAP JS -->
    <!-- END JS -->
  </body>
</html>


