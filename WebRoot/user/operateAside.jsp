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
                <i class="fa fa-th">
                </i>
                <span>
                  	代理中心
                </span>
                <span class="label label-inverse span-sidebar">
                  3
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

          </ul>
        </div>
      </aside>