<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

      <aside>
        <div id="sidebar" class="nav-collapse">
          <ul class="sidebar-menu" id="nav-accordion">
            <li >
              <a href="IndexServlet" class="active">
                <i class="fa fa-dashboard">
                </i>
                <span>
                  	首页
                </span>
              </a>
            </li>
            <li class="sub-menu">
              <a href="javascript:;">
                <i class="fa fa-laptop">
                </i>
                <span>
                  	用户管理
                </span>
                <span class="label label-success span-sidebar">
                  4
                </span>
              </a>
              <ul class="sub">
                <li>
                  <a href="UserServlet?method=userList">
                    	用户查询
                  </a>
                </li>
               
              </ul>
            </li>
            <li class="sub-menu">
              <a href="javascript:;">
                <i class="fa fa-book">
                </i>
                <span>
                  	房间管理
                </span>
                <span class="label label-info span-sidebar">
                  7
                </span>
              </a>
              <ul class="sub">
                <li>
                  <a href="RoomServlet?method=roomList">
                                                   房间查询
                  </a>
                </li>
                
              </ul>
            </li>
            <li class="sub-menu">
              <a href="javascript:;">
                <i class="fa fa-cogs">
                </i>
                <span>
                  	代理管理
                </span>
                <span class="label label-primary span-sidebar">
                  5
                </span>
              </a>
              <ul class="sub">
                <li>
                  <a href="UserServlet?method=createOpeate">
                                                 创建代理
                  </a>
                </li>
                <li>
                  <a href="UserServlet?method=operateList">
                   	查询充值
                  </a>
                </li>
                <li>
                  <a href="UserServlet?method=chargeRecordByAdmin">
                   	充值记录
                  </a>
                </li>
              </ul>
            </li>
            <li class="sub-menu">
              <a href="javascript:;">
                <i class="fa fa-th">
                </i>
                <span>
                  	统计与消息
                </span>
                <span class="label label-inverse span-sidebar">
                  5
                </span>
              </a>
              <ul class="sub">
                <li>
                  <a href="RoomServlet?method=createBuyMessage">
                    	购买房卡通知
                  </a>
                  <a href="RoomServlet?method=buyMessageList">
                    	消息列表
                  </a>
                  <a href="RoomServlet?method=statics">
                    	房卡统计分析
                  </a>
                </li>
              </ul>
            </li>
            <%-- 
	            <li class="sub-menu">
	              <a href="javascript:;">
	                <i class="fa fa-th">
	                </i>
	                <span>
	                  	代理中心
	                </span>
	                <span class="label label-inverse span-sidebar">
	                  5
	                </span>
	              </a>
	              <ul class="sub">
	                <li>
	                  <a href="Me?method=myInfo">
	                    	个人信息
	                  </a>
	                  <a href="Me?method=chargeCard">
	                    	房卡充值
	                  </a>
	                  <a href="Me?method=chargeRecord">
	                    	充值记录
	                  </a>
	                </li>
	              </ul>
	            </li>
			--%>
          </ul>
        </div>
      </aside>