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
       	代理列表
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
	  <jsp:include page="/user/head.jsp"></jsp:include>
	   <!-- END HEADER -->
      <!-- BEGIN SIDEBAR -->
	  <jsp:include page="/user/aside.jsp"></jsp:include>
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
                           <span class="label label-primary">代理查询</span>
                           <span class="tools pull-right">
                           <a href="javascript:;" class="fa fa-chevron-down"></a>
                           <a href="javascript:;" class="fa fa-times"></a>
                           </span>
                        </header>
                        
                        <div class="panel-body">
                           <form class="form-inline" role="form" action="UserServlet?method=operateList" method="post" >
                           	  <input type="hidden" name="index" value="1"/>
                              <div class="form-group">
                                 <label  for="exampleInputEmail2">用户名/手机号</label>
                                 <input type="text" class="form-control" id="exampleInputEmail2" placeholder="用户名/手机号" name="userNameOrMobile" value="${userNameOrMobile}">
                              </div>
                              
                              <div class="form-group">
                              	<label for="registDate">注册开始</label>
                                <input type="radio" name="registDate" value="asc"  <c:if test="${registDate eq 'asc'}">checked="checked"</c:if>>升序
								<input type="radio" name="registDate" value="desc" <c:if test="${registDate eq 'desc'}"> checked="checked"</c:if>>降序
								<input type="radio" name="registDate" value="" <c:if test="${registDate eq ''}"> checked="checked"</c:if>>默认
                              </div>
                              
                              <div class="form-group">
                              	<label for="registDate">消耗房卡</label>
                                <input type="radio" name="consumeCard" value="asc"  <c:if test="${consumeCard eq 'asc'}">checked="checked"</c:if>>升序
								<input type="radio" name="consumeCard" value="desc" <c:if test="${consumeCard eq 'desc'}">checked="checked"</c:if>>降序
								<input type="radio" name="consumeCard" value="" <c:if test="${consumeCard eq ''}">checked="checked"</c:if>>默认
                              </div>
                              <button type="submit" class="btn btn-success">查询</button>
                           </form>
                        </div>
                     </section>
                     
                     <!--1  -->
                       <section class="panel">
                         <div class="panel-body">
                           <div class="adv-table">
                              
                              <table class="table table-striped table-hover table-bordered dataTable" id="editable-sample" aria-describedby="editable-sample_info" style="width: 1610px;">
                                 <thead>
                                    <tr>
                                       <th>代理Id</th>
                                       <th>名字</th>
                                       <th class="hidden-phone">地址</th>
                                       <th class="hidden-phone">手机号</th>
                                       <th class="hidden-phone">注册时间</th>
                                       <th class="hidden-phone">房卡数量</th>
                                       <th class="hidden-phone">消耗数</th>
                                       <th class="hidden-phone">推荐号</th>
                                       <th class="hidden-phone">操作</th>
                                    </tr>
                                 </thead>
                                 <tbody>
                                 	<c:forEach items="${pageUtil.list}" var="operateUser" varStatus="vs">
							    		<tr class="gradeX">
							    			<td>${operateUser.id }</td>
							    			<td>${operateUser.userName }</td>
							    			<td class="hidden-phone">${operateUser.address }</td>
							    			<td class="hidden-phone">${operateUser.mobile }</td>
							    			<td class="hidden-phone"><fmt:formatDate value="${operateUser.createDate}"  pattern="yyyy-MM-dd HH:mm:ss" /></td>
							    			<td class="hidden-phone">${operateUser.roomCard }</td>
							    			<td class="hidden-phone">${operateUser.consumeCard }</td>
							    			<td class="hidden-phone">
							    			<c:if test="${operateUser.recommendId!=0 }">${operateUser.recommendId }</c:if>
							    			</td>
							    			<td class="hidden-phone">
							    				<a class="edit" href="UserServlet?method=operateDetail&oId=${operateUser.id }"><span class="label label-success">编辑</span></a>
							    				<a class="" href="javascript:deleteThis(${operateUser.id })"><span class="label label-danger">删除</span></a>
							    				<a class="edit" href="UserServlet?method=chargeDetail&oId=${operateUser.id }"><span class="label label-success">充值</span></a>
							    			</td>
							    		</tr>
					    			</c:forEach>
                                 </tbody>
                              </table>
                              
                              
                              <div class="row-fluid">
								  <div class="span6">
								    <div class="dataTables_info" id="example_info">共${pageUtil.totalPageCount }页/${pageUtil.totalCount }条数据</div></div>
								  <div class="span6">
								    <div class="dataTables_paginate paging_bootstrap pagination">
								      <ul>
								      	<c:if test="${pageUtil.index-1>0}">
									        <li class="prev disabled">
									          <a href="javascript:change(${pageUtil.index-1 })">← 上一页</a>
									        </li>
								      	</c:if>
								         <c:forEach items="${pageUtil.numbers }" var="number">
								        	<c:if test="${number==pageUtil.index}">
											        <li class="active"><a href="javascript:change(${number })">${number }</a></li>
							    			</c:if>
							    			<c:if test="${number!=pageUtil.index}">
											       <li><a href="javascript:change(${number })">${number }</a></li>
							    			</c:if>    	
								        </c:forEach> 
								        <c:if test="${pageUtil.index<pageUtil.totalPageCount}" >
									        <li class="next">
									          <a href="javascript:change(${pageUtil.index+1 })">下一页 →</a>
									        </li>
								        </c:if>
								      </ul>
								    </div>
								  </div>
								</div>
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
    <script src="<%=basePath%>/js/editable-table.js"></script><!-- DATATABLE BOOTSTRAP JS  -->
    
     
     
    <script >
      //knob
      $(".knob").knob();
		
		function change(index){			
			//给form的index表单项赋值
			document.forms[0].index.value=index;
			//提交form
			document.forms[0].submit();
		}
		
		function deleteThis(id){			
			if (window.confirm("真的要删除吗?")) { 
  				//window.open("UserServlet?method", "Thanks for Visiting!");
  				$.ajax(
  					{
  						url:"UserServlet?method=deleteOperate&oId="+id,
  						success:function(result){
  							//alert(result);
							window.location.reload();
						},
						error:function(result){
							alert(result);
						}
					}
				);
			}
		}
    </script>
    <!-- END JS -->
  </body>
</html>


