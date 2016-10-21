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
       	消费记录
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
                           <span class="label label-primary">充值查询</span>
                           <span class="tools pull-right">
                           <a href="javascript:;" class="fa fa-chevron-down"></a>
                           <a href="javascript:;" class="fa fa-times"></a>
                           </span>
                        </header>
                        
                        <div class="panel-body">
                           <form class="form-inline" role="form" action="Me?method=chargeRecord" method="post">
                           	  <input type="hidden" name="index" value="1"/>
                              <div class="form-group">
                                 <label  for="exampleInputEmail2">用户Id/用户名</label>
                                 <input type="text" class="form-control" id="exampleInputEmail2" placeholder="用户Id/用户名" name="idOrNick" value="${idOrNick}">
                              </div>
	                          <div class="form-group">
			                      <label for="beginDate">充值开始</label>
		                          <input type="date" class="form-control" name="beginDate" value="${beginDate }">
			                      <label for="endDate">充值结束</label>
		                          <input type="date" class="form-control" name="endDate" value="${endDate }">
	                    	  </div>
                              
                              <div class="form-group">
                              	<label for="registDate">充值数量</label>
                                <input type="radio" name="chargeCount" value="asc"  <c:if test="${chargeCount eq 'asc'}">checked="checked"</c:if>>升序
								<input type="radio" name="chargeCount" value="desc" <c:if test="${chargeCount eq 'desc'}">checked="checked"</c:if>>降序
								<input type="radio" name="chargeCount" value="" <c:if test="${chargeCount eq ''}">checked="checked"</c:if>>默认
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
                                       <th >类型</th>
                                       <th >房卡数</th>
                                       <th >赠送数量</th>
                                       <th >用户ID</th>
                                       <th >用户昵称</th>
                                       <th class="hidden-phone">创建时间</th>
                                    </tr>
                                 </thead>
                                 <tbody>
                                 	<c:forEach items="${pageUtil.list}" var="list" varStatus="vs">
							    		<tr class="gradeX">
							    			<td>${list.type==0?"用户充值":"房卡购买"}</td>
							    			<td>${list.roomCard }</td>
							    			<td>${list.sendCard }</td>
							    			<td>${list.chargeOperateId }</td>
							    			<td>${list.nickName }</td>
							    			<td class="hidden-phone"><fmt:formatDate value="${list.createDate}"  pattern="yyyy-MM-dd HH:mm:ss" /></td>
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
      	
      	
    </script>
    <!-- END JS -->
  </body>
</html>


