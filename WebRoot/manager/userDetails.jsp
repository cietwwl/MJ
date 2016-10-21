<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<!-- saved from url=(0042)http://v3.bootcss.com/examples/dashboard/# -->
<html lang="en">
	<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<base href="<%=basePath%>">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="http://v3.bootcss.com/favicon.ico">

    <title>用户详情</title>

    <!-- Bootstrap core CSS -->
    <link href="<%=basePath%>/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="<%=basePath%>/css/dashboard.css" rel="stylesheet">

	<link href="<%=basePath%>/css/userDetails.css" rel="stylesheet">
    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="/<%=basePath%>js/ie-emulation-modes-warning.js"></script>
	
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

    <jsp:include page="../nav.jsp"/>

    <div class="container-fluid">
      <div class="row">
       <jsp:include page="../left.jsp"/>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	      <h1 class="page-header">用户详情</h1>
          <div class="userDetail">
				<img data-src="holder.js/160x120" alt="160x120" src="${user.headimgurl }" style="width: 100%;height: 50%;">
			    <h6>${user.nickname}</h6>
			    <h6>Id:${user.id}</h6>
			    <h6>房卡:${user.roomcard}</h6>
          </div>
          <div class="buy">
          	  <a href="UserServlet?method=toAddCard&userId=${user.id}">
		          <button type="button" class="btn btn-large btn-primary " >房卡充值</button>
          	  </a>
	          <button type="button" class="btn btn-large btn-primary disabled" disabled="disabled">开通会员</button>
	          <button type="button" class="btn btn-large btn-primary disabled" disabled="disabled">房卡转让</button>
          </div>
          <div class="record">
             <h3 class="dropdowns-example">充值记录</h3><hr/>
		          <div class="bs-example">
					    <table class="table table-bordered">
					      <thead>
					        <tr>
					          <th>用户ID:</th>
					          <th>昵称:</th>
					          <th>充值房卡数:</th>
					          <th>充值时间:</th>
					        </tr>
					      </thead>
					      <tbody>
					      	<c:forEach items="${pageUtil.list}" var="record">
					      		<tr>
						          <td>${record.id }</td>
						          <td>${record.nickName }</td>
						          <td>${record.total }</td>
						          <td><fmt:formatDate value="${record.createDate }"  pattern="yyyy-MM-dd HH:mm:ss" /></td>
					       	    </tr>
					      	</c:forEach>
					      </tbody>
					    </table>
					    
					    <div class="bs-example">
							    <nav>
							      <ul class="pagination">
							        <li class="disabled"><a href="#">«</a></li>
							        <c:forEach items="${pageUtil.numbers }" var="number">
							        	<c:if test="${number==pageUtil.index}">
										        <li class="active"><a href="UserServlet?method=userDetail&index=${number }&userId=${userId}">${number } <span class="sr-only">(current)</span></a></li>
						    			</c:if>
						    			<c:if test="${number!=pageUtil.index}">
										       <li><a href="UserServlet?method=userDetail&index=${number }&userId=${userId}">${number }</a></li>
						    			</c:if>    	
							        </c:forEach>
							     </ul>
							   </nav>
  						</div>
					    
					    
					    
		  		  </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="<%=basePath%>/js/jquery.min.js"></script>
    <script src="<%=basePath%>/js/bootstrap.min.js"></script>
    <script src="./Dashboard Template for Bootstrap_files/docs.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="./Dashboard Template for Bootstrap_files/ie10-viewport-bug-workaround.js"></script>
  

<div id="global-zeroclipboard-html-bridge" class="global-zeroclipboard-container" title="" style="position: absolute; left: 0px; top: -9999px; width: 15px; height: 15px; z-index: 999999999;" data-original-title="Copy to clipboard">      <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" id="global-zeroclipboard-flash-bridge" width="100%" height="100%">         <param name="movie" value="/assets/flash/ZeroClipboard.swf?noCache=1473127424041">         <param name="allowScriptAccess" value="sameDomain">         <param name="scale" value="exactfit">         <param name="loop" value="false">         <param name="menu" value="false">         <param name="quality" value="best">         <param name="bgcolor" value="#ffffff">         <param name="wmode" value="transparent">         <param name="flashvars" value="trustedOrigins=v3.bootcss.com%2C%2F%2Fv3.bootcss.com%2Chttp%3A%2F%2Fv3.bootcss.com">         <embed src="/assets/flash/ZeroClipboard.swf?noCache=1473127424041" loop="false" menu="false" quality="best" bgcolor="#ffffff" width="100%" height="100%" name="global-zeroclipboard-flash-bridge" allowscriptaccess="sameDomain" allowfullscreen="false" type="application/x-shockwave-flash" wmode="transparent" pluginspage="http://www.macromedia.com/go/getflashplayer" flashvars="trustedOrigins=v3.bootcss.com%2C%2F%2Fv3.bootcss.com%2Chttp%3A%2F%2Fv3.bootcss.com" scale="exactfit">                </object></div><svg xmlns="http://www.w3.org/2000/svg" width="200" height="200" viewBox="0 0 200 200" preserveAspectRatio="none" style="visibility: hidden; position: absolute; top: -100%; left: -100%;"><defs></defs><text x="0" y="10" style="font-weight:bold;font-size:10pt;font-family:Arial, Helvetica, Open Sans, sans-serif;dominant-baseline:middle">200x200</text></svg></body></html>