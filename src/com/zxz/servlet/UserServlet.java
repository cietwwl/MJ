package com.zxz.servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.StringUtils;
import com.zxz.domain.OperateUser;
import com.zxz.domain.User;
import com.zxz.service.UserService;
import com.zxz.util.MD5Util;
import com.zxz.util.PageUtil;
import com.zxz.util.StringUtil;

public class UserServlet extends BaseServlet {

	private static final long serialVersionUID = 1L;
	UserService userService = new UserService();

	public UserServlet() {}

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
			HttpServletResponse response) throws Exception  {
		String method = request.getParameter("method");
		if (method.equals("userList")) {
			userList(request, response);//显示用户列表
		}else if(method.equals("userDetail")){
			userDetail(request, response);//用户的详细信息
		}else if(method.equals("toAddCard")){
			toAddCard(request,response);//跳转到添加房卡页面
		}else if(method.equals("addUserCard")){
			addUserCard(request,response);//添加用户的房卡
		}else if(method.equals("login")){
			login(request,response);//登录
		}else if(method.equals("logout")){
			logout(request,response);//退出
		}else if(method.equals("chargeRecord")){
			chargeRecord(request,response);//充值记录
		}else if(method.equals("createOpeate")){
			createOpeate(request,response);//跳转到添加代理
		}else if(method.equals("addOperate")){
			addOperate(request,response);//添加代理
		}else if(method.equals("operateList")){
			operateList(request,response);//代理查询
		}else if(method.equals("deleteOperate")){
			deleteOperate(request,response);//删除代理
		}else if(method.equals("operateDetail")){
			operateDetail(request,response);//代理详情
		}else if(method.equals("modifyOperate")){
			modifyOperate(request,response);//修改代理
		}else if(method.equals("chargeDetail")){
			chargeDetail(request,response);//充值详情
		}else if(method.equals("chargeCard")){
			chargeCard(request,response);//给代理充值房卡
		}else if(method.equals("chargeRecordByAdmin")){
			chargeRecordByAdmin();//管理员查看充值记录 
		}
	}
	
	/**
	 * 管理员查看充值记录 
	 */
	private void chargeRecordByAdmin() {
		PageUtil<Map<String,Object>> pageUtil = getObjectPageUtil();
		String idOrNick = getParameter("idOrNick");
		String beginDate = getParameter("beginDate");
		String endDate = getParameter("endDate");
		String chargeDate = getParameter("chargeDate");//升序或降序
		userService.chargeRecordByAdmin(pageUtil,idOrNick,beginDate,endDate,chargeDate);
		setAttribute("pageUtil", pageUtil);
		setAttribute("idOrNick", idOrNick);
		setAttribute("beginDate", beginDate);
		setAttribute("endDate", endDate);
		setAttribute("chargeDate", chargeDate);
		forward("/manager/chargeRecordByAdmin.jsp");
	}

	/**给代理充值房卡
	 * @param request
	 * @param response
	 */
	private void chargeCard(HttpServletRequest request,
			HttpServletResponse response) {
		String id = getParameter("id");
		String roomCard = getParameter("roomCard");
		String sendCard = getParameter("sendCard");
		userService.chargeCard(id,roomCard,sendCard);
		sendRedirect("UserServlet?method=operateList");
	}

	/**充值详情
	 * @param request
	 * @param response
	 */
	private void chargeDetail(HttpServletRequest request,
			HttpServletResponse response) {
		String operateId = getParameter("oId");
		OperateUser operateUser = userService.operateDetail(operateId);
		setAttribute("operateUser", operateUser);
		forward("/opreate/chargeDetail.jsp");
	}

	/**修改代理
	 * @param request
	 * @param response
	 */
	private void modifyOperate(HttpServletRequest request,
			HttpServletResponse response) {
		String id = getParameter("id");
		String userName = getParameter("userName");
		String mobile = getParameter("mobile");
		String address = getParameter("address");
		String password = getParameter("password");
		userService.modifyOperate(id,userName,mobile,address,password);
		sendRedirect("UserServlet?method=operateList");
	}

	/**代理详情
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws UnsupportedEncodingException 
	 */
	private void operateDetail(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException, IOException{
		String operateId = getParameter("oId");
		OperateUser operateUser = userService.operateDetail(operateId);
		setAttribute("operateUser", operateUser);
		forward("/opreate/operateDetail.jsp");
	}

	/**删除代理
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws UnsupportedEncodingException 
	 */
	private void deleteOperate(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException, IOException {
		String operateId = getParameter("oId");
		int result = userService.deleteOperate(operateId);
		if(result>=1){
			write("删除成功");
		}else{
			write("删除失败");
		}
	}

	/**代理查询
	 * @param request
	 * @param response
	 */
	private void operateList(HttpServletRequest request,
			HttpServletResponse response) {
		String userNameOrMobile = getParameter("userNameOrMobile");//用户名/昵称
		String registDate = getParameter("registDate");//注册时间排序
		String consumeCard = getParameter("consumeCard");//房卡消耗排序
		String sindex = getParameter("index");
		int index = 1;
		if (sindex != null && !"".equals(sindex)) {
			index = Integer.parseInt(sindex);
		}
		PageUtil<Map<String, Object>> pageUtil = new PageUtil<Map<String, Object>>();
		pageUtil.setIndex(index);
		userService.findOperateUserByPage(pageUtil,userNameOrMobile,registDate,consumeCard);
		setAttribute("pageUtil", pageUtil);
		setAttribute("userNameOrMobile", userNameOrMobile);
		setAttribute("registDate", registDate);
		setAttribute("consumeCard", consumeCard);
		forward("/opreate/operateList.jsp");
	}

	/**添加代理
	 * @param request
	 * @param response
	 */
	private void addOperate(HttpServletRequest request,
			HttpServletResponse response) {
		String userName = getParameter("userName");
		String mobile = getParameter("mobile");
		String address = getParameter("address");
		String password = getParameter("password");
		String recommendId = getParameter("recommendId"); //推荐人的推荐号
		System.out.println();
		OperateUser operateUser = new OperateUser();
		operateUser.setAddress(address);
		operateUser.setMobile(mobile);
		operateUser.setUsername(userName);
		operateUser.setPassword(MD5Util.string2MD5(password));
		if(!StringUtil.isNull(recommendId)){
			operateUser.setBeRecommendId(StringUtil.getInt(recommendId));
		}
		int result = userService.saveOneOperateUser(operateUser);
		if(result<0){
			if(result==-1){
				setAttribute("error", "手机号已存在");
			}else if(result==-2){
				setAttribute("error", "用户名已存在");
			}else if(result==-3){
				setAttribute("error", "推荐号不存在");
			}
			operateUser.setPassword(password);
			setAttribute("operateUser", operateUser);
			forward("/opreate/create.jsp");
			return;
		}
		sendRedirect("UserServlet?method=operateList");
	}

	/**创建代理
	 * @param request
	 * @param response
	 */
	private void createOpeate(HttpServletRequest request,
			HttpServletResponse response) {
		forward("/opreate/create.jsp");
	}

	/**充值记录
	 * @param request
	 * @param response
	 */
	private void chargeRecord(HttpServletRequest request,
			HttpServletResponse response) {
		int index = getIndex();
		int pageSize = getPageSize();
		String operateIdOrName = getParameter("operateIdOrName");//代理姓名或id
		String roomCard = getParameter("roomCard");//房卡数量
		String consumeCard = getParameter("consumeCard");//消耗数量
		String chargeTotal = getParameter("chargeTotal");//充值数量
		PageUtil<Map<String,Object>> pageUtil = new PageUtil<>();
		pageUtil.setIndex(index);
		pageUtil.setSize(pageSize);
		userService.managerFindChargeRecord(pageUtil,operateIdOrName,roomCard,consumeCard,chargeTotal);
		request.setAttribute("pageUtil", pageUtil);
		request.setAttribute("operateIdOrName", operateIdOrName);
		request.setAttribute("roomCard", roomCard);
		request.setAttribute("consumeCard", consumeCard);
		request.setAttribute("chargeTotal", chargeTotal);
		forward("/opreate/chargeRecord.jsp");
	}

	/**退出登录
	 * @param request
	 * @param response
	 */
	private void logout(HttpServletRequest request, HttpServletResponse response) {
		session.removeAttribute("user");
		sendRedirect(getContextPath());
	}

	
	/**登录
	 * @param request
	 * @param response
	 */
	private void login(HttpServletRequest request, HttpServletResponse response) {
		String code = getParameter("code");//验证码
		String sessionCode = (String) session.getAttribute("code");
		boolean checkWithCode = checkWithCode(code,sessionCode);
		if(!checkWithCode){//验证码不正确
			setAttribute("error", "验证码不正确");
			forward("/user/login.jsp");
			return;
		}
		String userName = request.getParameter("userName");
		String passWord = request.getParameter("passWord");
		String contextPath = getContextPath();
		if(StringUtil.isNull(userName)||StringUtil.isNull(passWord)){
			setAttribute("error", "用户名或密码不能为空");
			sendRedirect(contextPath+"/user/login.jsp");
			return;
		}
		OperateUser operateUser = userService.login(userName,passWord);
		if(operateUser!=null&&operateUser.getIsDel()==0){//登录成功
			session.setAttribute("user", operateUser);
			sendRedirect("IndexServlet");
		}else{//登录失败
			setAttribute("error", "用户名或密码不正确");
			forward("/user/login.jsp");
		}
	}
	
	
	/**
	 * @param code
	 */
	public boolean checkWithCode(String code,String sessionCode){
		if(StringUtil.isNull(code)||StringUtil.isNull(sessionCode)){
			return false;
		}
		
		if(code.equals(sessionCode)){
			return true;
		}
		
		return false;
	}

	/**添加用户的房卡
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void addUserCard(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String total = request.getParameter("total");
		String money = request.getParameter("money");
		OperateUser user  = (OperateUser) session.getAttribute("user");
		Integer operateId = user.getId();
		float floatMoney = Float.parseFloat(money);
		int result = userService.addUserCardByUserId(userId,total,operateId,floatMoney);
		sendRedirect("UserServlet?method=userDetail&userId="+userId);
	}

	/**跳转到添加房卡页面
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void toAddCard(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		request.setAttribute("userId", userId);
		forward("/manager/addUserCard.jsp");
	}

	/**显示用户的详情
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void userDetail(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String suserId = request.getParameter("userId");
		int uid = Integer.parseInt(suserId);
		User user = userService.findUserById(uid);
		//查询用户的充值记录
		PageUtil<Map<String, Object>> pageUtil = new PageUtil<>();
		String pageIndex = request.getParameter("index");
		int index = 1;
		if(!StringUtil.isNull(pageIndex)){
			index = Integer.parseInt(pageIndex);
		}
		pageUtil.setIndex(index);
		pageUtil.setSize(10);
		userService.queryUserChargeRecord(pageUtil , uid);
		request.setAttribute("user", user);
		request.setAttribute("pageUtil", pageUtil);
		request.setAttribute("userId", suserId);
		forward("/manager/userDetails.jsp");
	}

	/**显示用户列表
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void userList(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String idOrNick = getParameter("idOrNick");//用户名/昵称
		String recommendId = getParameter("recommendId");//推荐人id
		String beginDate = getParameter("beginDate");//注册开始时间
		String endDate = getParameter("endDate");//注册结束时间
		String registDate = getParameter("registDate");//注册时间排序
		String consumeCard = getParameter("consumeCard");//房卡消耗排序
		String sindex = getParameter("index");
		
		int index = 1;
		if (sindex != null && !"".equals(sindex)) {
			index = Integer.parseInt(sindex);
		}
		PageUtil<User> pageUtil = new PageUtil<User>();
		pageUtil.setIndex(index);
		userService.findUserByPage(pageUtil,idOrNick,recommendId,beginDate,endDate,registDate,consumeCard);
		setAttribute("recommendId", recommendId);
		setAttribute("beginDate", beginDate);
		setAttribute("endDate", endDate);
		setAttribute("pageUtil", pageUtil);
		setAttribute("idOrNick", idOrNick);
		setAttribute("registDate", registDate);
		setAttribute("consumeCard", consumeCard);
		forward("/user/userList.jsp");
	}

}
