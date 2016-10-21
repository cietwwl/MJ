<%@page import="com.zxz.util.DateUtils"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
       	代理充值
     </title>
     <!-- BEGIN STYLESHEET-->
		<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet"><!-- BOOTSTRAP CSS -->
		<link href="<%=basePath%>css/bootstrap-reset.css" rel="stylesheet"><!-- BOOTSTRAP CSS -->
		<link href="<%=basePath%>assets/font-awesome/css/font-awesome.css" rel="stylesheet"><!-- FONT AWESOME ICON CSS -->
		<link href="<%=basePath%>assets/advanced-datatable/media/css/demo_page.css" rel="stylesheet"><!-- ADVANCED DATATABLE CSS -->
      	<link href="<%=basePath%>assets/advanced-datatable/media/css/demo_table.css" rel="stylesheet"><!-- ADVANCED DATATABLE CSS -->
		<link href="<%=basePath%>assets/data-tables/DT_bootstrap.css"><!-- DATATABLE CSS -->
		<link href="<%=basePath%>css/style.css" rel="stylesheet"><!-- THEME BASIC CSS -->
		<link href="<%=basePath%>css/style-responsive.css" rel="stylesheet"><!-- THEME RESPONSIVE CSS -->
		<link href="<%=basePath%>assets/morris.js-0.4.3/morris.css" rel="stylesheet"><!-- MORRIS CHART CSS -->
     <!--dashboard calendar-->
     	<link href="<%=basePath%>css/clndr.css" rel="stylesheet"><!-- CALENDER CSS -->
     	
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
	  <jsp:include page="/user/operateHead.jsp"></jsp:include>
	   <!-- END HEADER -->
      <!-- BEGIN SIDEBAR -->
	  <jsp:include page="/user/operateAside.jsp"></jsp:include>
      <!-- END SIDEBAR -->
      <!-- BEGIN MAIN CONTENT -->
               <!-- BEGIN MAIN CONTENT --> 		
         <section id="main-content">
            <section class="wrapper site-min-height">
			    <!-- BEGIN ROW  -->
               <div class="row">
                  <div class="col-lg-12">
                     <section class="panel">
                        <header class="panel-heading">
                           <span class="label label-primary">用户查询</span>
                           <span class="tools pull-right">
                           <a href="javascript:;" class="fa fa-chevron-down"></a>
                           <a href="javascript:;" class="fa fa-times"></a>
                           </span>
                        </header>
                        
                        <div class="panel-body">
                           <form class="form-inline" role="form" action="Me?method=chargeCard" method="post">
                           	  <input type="hidden" name="index" value="1"/>
                              <div class="form-group">
                                 <label  for="exampleInputEmail2">用户Id</label>
                                 <input type="text" class="form-control" id="exampleInputEmail2" placeholder="用户ID" name="id" value="${id}">
                              </div>
                              <button type="submit" class="btn btn-success">查询</button>
                           </form>
                        </div>
                     </section>
                     
                     <!--1  -->
                       <section class="panel">
                         <div class="panel-body">
                           <div class="adv-table">
                              <table class="display table table-bordered table-striped" id="example">
                                 <thead>
                                    <tr>
                                       <th>用户ID</th>
                                       <th>昵称</th>
                                       <th class="hidden-phone">头像</th>
                                       <th >房卡</th>
                                       <th >操作</th>
                                    </tr>
                                 </thead>
                                 <tbody>
                                 	<c:forEach items="${pageUtil.list}" var="user" varStatus="vs">
							    		<tr class="gradeX">
							    			<td>${user.id }</td>
							    			<td>${user.nickname }</td>
							    			<td class="hidden-phone"><img alt="" src="${user.headimgurl }" width="50px"></td>
							    			<td ><input type="text" id="nowUserCard" value="${user.roomcard }" readonly="readonly"></td>
							    			<td >
					                            <form class="form-inline" role="form" action="Me?method=addUserCard" method="post" id="chargeForm">
					                           	  <input type="hidden" name="userId" value="${user.id }"/>
					                              <div class="form-group">
					                                 <label  for="exampleInputEmail2">充值数量</label>
					                                 <input type="number" class="form-control" id="total" placeholder="房卡数" name="total" min="1" max="${requestScope.user.roomCard }" required="required">
					                              </div>
					                              <input type="button" class="btn btn-success" value="充值" onclick="test(${requestScope.user.roomCard });">
                          					   </form>
							    			</td>
							    		</tr>
					    			</c:forEach>
                                 </tbody>
                              </table>
                           </div>
                        </div>
                     </section>
                     <!--1  -->
                     
                     
                     
                  </div>
                  
               </div>
			   <!-- END ROW  -->
            </section>
         </section>
		 <!-- END SECTION --> 
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
    <script >
      //knob
      $(".knob").knob();
		
		function change(index){			
			//给form的index表单项赋值
			document.forms[0].index.value=index;
			//提交form
			document.forms[0].submit();
		}
      
      
		  function test(max) {
		    var userId = $("#chargeForm")[0].userId.value;
		    var total = $("#chargeForm")[0].total.value;
		
		    if (total == "") {
		        alert("请输入充值数量");
		        return;
		    }
		
		    if (isNaN(total)) {
		        alert("请输入数字");
		        return;
		    }
		
		    if (total <= 0 || total > 200) {
		        alert("充值数量在1-200之间");
		        return;
		    }
		
		    if (total > max) {
		        alert("房卡数量不足，请联系管理员充值");
		        return;
		    }
		
		    $.ajax({
		        url: "Me?method=addUserCard&userId=" + userId + "&total=" + total,
		        success: function(result) {
		        	alert(JSON.parse(result).disciption);
		            var nowUserCard = JSON.parse(result).userCard;
		            $("#nowUserCard").val = nowUserCard;
		            //window.location.reload();
		            $("#nowUserCard")[0].value = nowUserCard;
		            $("#chargeForm")[0].total.value = 0;
		        },
		    });
		}
      
    </script>
    <!-- END JS -->
  </body>
</html>


