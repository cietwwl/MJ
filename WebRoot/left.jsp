<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <div class="col-sm-3 col-md-2 sidebar">
  <ul class="nav nav-sidebar">
    <li class="active"><a href="IndexServlet">概述</a></li>
    <li><a href="UserServlet?method=userList">用户管理</a></li>
    <li><a href="UserServlet?method=chargeRecord">充值记录</a></li>
   <!--  <li><a href="http://v3.bootcss.com/examples/dashboard/#">服务器信息</a></li> -->
  </ul>
 <!--  <ul class="nav nav-sidebar">
    <li><a href="http://v3.bootcss.com/examples/dashboard/">Nav item</a></li>
    <li><a href="http://v3.bootcss.com/examples/dashboard/">Nav item again</a></li>
    <li><a href="http://v3.bootcss.com/examples/dashboard/">One more nav</a></li>
    <li><a href="http://v3.bootcss.com/examples/dashboard/">Another nav item</a></li>
    <li><a href="http://v3.bootcss.com/examples/dashboard/">More navigation</a></li>
  </ul>
  <ul class="nav nav-sidebar">
    <li><a href="http://v3.bootcss.com/examples/dashboard/">Nav item again</a></li>
    <li><a href="http://v3.bootcss.com/examples/dashboard/">One more nav</a></li>
    <li><a href="http://v3.bootcss.com/examples/dashboard/">Another nav item</a></li>
  </ul> -->
</div>
