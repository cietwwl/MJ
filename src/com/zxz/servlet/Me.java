package com.zxz.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.zxz.domain.OperateUser;
import com.zxz.domain.User;
import com.zxz.service.OperaterUserService;
import com.zxz.service.UserService;
import com.zxz.util.PageUtil;

/**
 * @author Administrator
 *
 */
public class Me  extends BaseServlet{
	
	UserService userService = new UserService();
	/**
	 * 代理中心 
	 */
	OperaterUserService operaterUserService = new OperaterUserService();
	
	
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		super.doPost(request, response);
	}

	@Override
	public void receiveMessage(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		//String method = request.getParameter("method");
		if(method.equals("chargeRecord")){
			chargeRecord(request,response);//充值记录
		}else if(method.equals("myInfo")){
			myInfo(request,response);//充值记录
		}else if(method.equals("chargeCard")){
			chargeCard(request,response);//房卡充值
		}else if(method.equals("addUserCard")){
			addUserCard(request,response);//房卡充值
		}else if(method.equals("")){
			
		}
	}

	/**房卡充值
	 * @param request
	 * @param response
	 */
	private void chargeCard(HttpServletRequest request,
			HttpServletResponse response) {
		String id= getParameter("id");//用户名/昵称
		OperateUser sessionUser = (OperateUser) session.getAttribute("user");
		OperateUser user =  operaterUserService.findOperateUserById(sessionUser.getId());
		PageUtil<User> pageUtil = new PageUtil<User>();
		userService.operateFindUserByPage(pageUtil,id);
		setAttribute("pageUtil", pageUtil);
		setAttribute("id", id);
		setAttribute("user", user);
		forward("/center/operateCharge.jsp");//跳转到充值的页面
	}


	/**添加用户的房卡
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void addUserCard(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String userId = getParameter("userId");
		String total = getParameter("total");
		OperateUser user  = (OperateUser) session.getAttribute("user");
		Integer operateId = user.getId();
		Integer roomCard = user.getRoomCard();
		System.out.println("代理房卡数:"+roomCard);
		
		if(roomCard<Integer.parseInt(total)){
			JSONObject outJsonObject = new JSONObject();
			outJsonObject.put("code", "error");
			outJsonObject.put("disciption", "充值失败,房卡数量不足");
			write(outJsonObject.toString());
			return;
		}
		int result = userService.addUserCardByUserId(userId,total,operateId,0);
		if(result>0){
			JSONObject outJsonObject = new JSONObject();
			outJsonObject.put("code", "success");
			outJsonObject.put("disciption", "充值成功!本次充值房卡数量为:"+total);
			outJsonObject.put("userCard", result);//用户当前的房卡数 
			write(outJsonObject.toString());
		}

	}

	
	
	/**个人信息
	 * @param request
	 * @param response
	 */
	private void myInfo(HttpServletRequest request, HttpServletResponse response) {
		OperateUser sessionUser= (OperateUser) session.getAttribute("user");
		Integer id = sessionUser.getId();
		OperateUser user =  operaterUserService.findOperateUserById(id);
		setAttribute("user", user);
		System.out.println(user);
		forward("/center/myInfo.jsp");
	}


	/**充值记录
	 * @param request
	 * @param response
	 */
	private void chargeRecord(HttpServletRequest request,
			HttpServletResponse response) {
		OperateUser operateUser = (OperateUser) session.getAttribute("user");
		int index = getIndex();
		int pageSize = getPageSize();
		
		String beginDate = getParameter("beginDate");
		String endDate = getParameter("endDate");
		String idOrNick = getParameter("idOrNick");
		String chargeCount = getParameter("chargeCount");//充值数量排序
		
		PageUtil<Map<String,Object>> pageUtil = new PageUtil<>();
		pageUtil.setIndex(index);
		pageUtil.setSize(pageSize);
		userService.findChargeRecordByOperate(pageUtil,operateUser.getId(),beginDate,endDate,idOrNick,chargeCount);
		setAttribute("pageUtil", pageUtil);
		setAttribute("idOrNick", idOrNick);
		setAttribute("beginDate", beginDate);
		setAttribute("endDate", endDate);
		setAttribute("chargeCount", chargeCount);
		forward("/center/chargeList.jsp");
	}


	/**老的充值记录
	 * @param request
	 */
	private void oldChargeRecord(HttpServletRequest request) {
		OperateUser operateUser = (OperateUser) session.getAttribute("user");
		int index = getIndex();
		int pageSize = getPageSize();
		String beginDate = request.getParameter("beginDate");
		String endDate = request.getParameter("endDate");
		PageUtil<Map<String,Object>> pageUtil = new PageUtil<>();
		pageUtil.setIndex(index);
		pageUtil.setSize(pageSize);
		userService.findChargeRecord(pageUtil,operateUser.getId(),beginDate,endDate);
		request.setAttribute("pageUtil", pageUtil);
		forward("/manager/chargeRecord.jsp");
	}

	
}
