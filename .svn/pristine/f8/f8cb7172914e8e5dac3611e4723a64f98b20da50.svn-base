package com.zxz.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import com.mysql.jdbc.StringUtils;
import com.zxz.dao.ConsumeRecordDao;
import com.zxz.dao.OperateChargeRecordDao;
import com.zxz.dao.OperateUserDao;
import com.zxz.dao.UserMapper;
import com.zxz.dao.impl.ConsumeRecordDaoImpl;
import com.zxz.dao.impl.OperateChargeRecordDaoImpl;
import com.zxz.dao.impl.OperateUserDaoImpl;
import com.zxz.dao.impl.UserMapperImpl;
import com.zxz.domain.ConsumeRecord;
import com.zxz.domain.OperateUser;
import com.zxz.domain.User;
import com.zxz.util.Constants;
import com.zxz.util.MD5Util;
import com.zxz.util.PageUtil;
import com.zxz.util.RegexUtil;
import com.zxz.util.StringUtil;

public class UserService implements Constants{

	UserMapper userDao = new UserMapperImpl();
	ConsumeRecordDao consumeRecordDao = new ConsumeRecordDaoImpl();
	OperateUserDao operateUserDao = new OperateUserDaoImpl();
	OperateChargeRecordDao operateChargeRecordDao = new OperateChargeRecordDaoImpl();
	
	
	/**分页查询
	 * @param pageUtil 
	 * @param idOrNick 用户的id或昵称
	 * @param recommendId 推荐人id
	 * @param beginDate 注册开始时间
	 * @param endDate 注册结束时间
	 * @param consumeCard 消耗房卡排序
	 * @param registDate 注册时间排序
	 */
	public void findUserByPage(PageUtil<User> pageUtil,String idOrNick, String recommendId, String beginDate, String endDate, String registDate, String consumeCard){
	
		Map<String, Object> map = new HashMap<String, Object>();
		if(!StringUtil.isNull(idOrNick)){
			boolean isId = Pattern.matches(RegexUtil.NUMBERS, idOrNick.trim());//判读是否是数字
			if(isId){
				map.put("id", idOrNick);
			}else{
				map.put("nickName", idOrNick);
			}
		}
		
		if(StringUtil.getInt(recommendId)>0){
			map.put("recommendId", recommendId);
		}
		
		if(!StringUtil.isNull(beginDate)){
			map.put("beginDate", beginDate);
		}
		
		if(!StringUtil.isNull(endDate)){
			map.put("endDate", endDate);
		}
		if(!StringUtil.isNull(registDate)){
			map.put("registDate", registDate);
		}
		if(!StringUtil.isNull(consumeCard)){
			map.put("consumeCard", consumeCard);
		}
		boolean haveOrderBy = haveOrderBy(registDate, consumeCard);
		if(haveOrderBy){
			map.put("haveOrderby", true);
		}
		int toatal = userDao.selectUserListTotal(map);
		map.put("rowStart",pageUtil.getStartRow());
		int size = pageUtil.getSize();
		map.put("pageSize",size);
		List<User> userList = userDao.selectUserList(map);
		pageUtil.setList(userList);
		pageUtil.setTotalCount(toatal);
	}
	
	/**
	 * @param pageUtil
	 * @param id 用户id
	 */
	public void operateFindUserByPage(PageUtil<User> pageUtil,String id){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		int toatal = userDao.selectUserListTotal(map);
		map.put("rowStart",pageUtil.getStartRow());
		int size = pageUtil.getSize();
		map.put("pageSize",size);
		List<User> userList = userDao.selectUserList(map);
		pageUtil.setList(userList);
		pageUtil.setTotalCount(toatal);
	}
	
	
	/**查询条件里面是否有order by
	 * @param registDate
	 * @param consumeCard
	 * @return
	 */
	public boolean haveOrderBy(String registDate, String consumeCard){
		if(!StringUtil.isNull(registDate)||!StringUtil.isNull(consumeCard)){
			return true;
		}
		return false;
	}
	
	
	/**根据用户ID查询用户的信息
	 * @param userId
	 * @return
	 */
	public User findUserById(int userId){
		User user = userDao.selectByPrimaryKey(userId);
		return user;
	}

	/**添加用户的房卡
	 * @param userId
	 * @param total
	 * @param operateId 代理id
	 * @return
	 */
	public int addUserCardByUserId(String userId, String total, Integer operateId,float money) {
		Map<String, Object> map = new HashMap<String, Object>();
		ConsumeRecord record = new ConsumeRecord();
		record.setUserid(Integer.parseInt(userId));
		record.setTotal(Integer.parseInt(total));
		record.setOperateId(operateId);//操作人员id
		record.setMoney(money);
		int result = consumeRecordDao.addUserCardByUserId(record);
		return result;
	}
	
	/**查询用户的充值记录 
	 * @param pageUtil
	 * @param userid
	 */
	public void queryUserChargeRecord(PageUtil<Map<String, Object>> pageUtil,int userid){
		int size = pageUtil.getSize();
		Map<String, Object> parameterMap = new HashMap<>();
		parameterMap.put("rowStart", pageUtil.getRowStart());
		parameterMap.put("pageSize", size);
		parameterMap.put("userId", userid);
		parameterMap.put("type", 0);
		int count = consumeRecordDao.selectUserRechargeRecordCount(parameterMap);
		pageUtil.setTotalCount(count);
		List<Map<String,Object>> list = consumeRecordDao.selectUserRechargeRecord(parameterMap);
		pageUtil.setList(list);
	}

	/**登录
	 * @param userName
	 * @param passWord
	 * @return
	 */
	public OperateUser login(String userName, String passWord) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userName", userName);
		map.put("passWord", MD5Util.string2MD5(passWord));
		map.put("rowStart", 0);
		map.put("pageSize", 10);
		List<OperateUser> list = operateUserDao.selectListByMap(map);
		if(list.size()>0){
			OperateUser operateUser = list.get(0);
			return operateUser;
		}
		return null;
	}
	
	
	/**代理人员查看充值
	 * @param pageUtil
	 * @param operateIdOrName 充值人员的id或姓名
	 * @param chargeTotal 充值数量
	 * @param consumeCard 消耗数量
	 * @param roomCard 房卡数量
	 */
	public void managerFindChargeRecord(PageUtil<Map<String, Object>> pageUtil,
			String operateIdOrName, String roomCard, String consumeCard, String chargeTotal) {
		Map<String, Object> map = new HashMap<>();
		if(!StringUtil.isNull(operateIdOrName)){
			boolean isId = Pattern.matches(RegexUtil.NUMBERS, operateIdOrName);//判读是否是数字
			if(isId){
				map.put("operateId", operateIdOrName);
			}else{
				map.put("userName", operateIdOrName);
			}
		}
		boolean isHaveOrderBy = StringUtil.isNotAllEmpty(roomCard,consumeCard,chargeTotal);
		if(isHaveOrderBy){
			map.put("haveOrderby", true);
			if(!StringUtil.isNull(roomCard)){
				map.put("roomCard", roomCard);
			}
			if(!StringUtil.isNull(consumeCard)){
				map.put("consumeCard", consumeCard);
			}
			if(!StringUtil.isNull(chargeTotal)){
				map.put("chargeTotal", chargeTotal);
			}
		}
		map.put("rowStart", pageUtil.getRowStart());
		map.put("pageSize", pageUtil.getSize());
		List<Map<String,Object>> list = operateChargeRecordDao.selectUserRechargeRecordByManager(map);
		System.out.println(list);
		pageUtil.setList(list);
		int total = operateChargeRecordDao.selectUserRechargeRecordCountByManager(map);
		pageUtil.setTotalCount(total);
	}
	
	
	

	/**代理人员查看充值
	 * @param pageUtil
	 * @param operateId 充值人员的id
	 * @param beginDate 开始时间
	 * @param endDate 结束时间
	 */
	public void findChargeRecord(PageUtil<Map<String, Object>> pageUtil,
			Integer operateId, String beginDate, String endDate) {
		Map<String, Object> map = new HashMap<>();
		if(!StringUtil.integerIsEmpty(operateId)){
			map.put("operateId", operateId);
		}
		map.put("rowStart", pageUtil.getRowStart());
		map.put("pageSize", pageUtil.getSize());
		if(!StringUtil.isNull(beginDate)){
			map.put("beginDate", beginDate);//开始时间
		}
		if(!StringUtil.isNull(endDate)){
			map.put("endDate", endDate);//结束时间
		}
		List<Map<String,Object>> list = consumeRecordDao.selectUserRechargeRecord(map);
		//System.out.println(list);
		pageUtil.setList(list);
		int total = consumeRecordDao.selectUserRechargeRecordCount(map);
		pageUtil.setTotalCount(total);
	}


	/**保存一个代理
	 * @param userService
	 * @return
	 */
	public int saveOneOperateUser(OperateUser operateUser) {
		int isRegist = operateUserIsRegist(operateUser);
		if(isRegist<0){
			return isRegist;
		}
		//查询推荐号是否存在
		
		if(operateUser.getBeRecommendId()!=null){
			OperateUser recommondOperateUser = new OperateUser();
			Integer recommendId = operateUser.getBeRecommendId();
			recommondOperateUser.setRecommendId(recommendId);
			List<OperateUser> recommondOperateUserList = operateUserDao.selectOperateUserSelective(recommondOperateUser);
			if(recommondOperateUserList.size()<=0){
				return -3;
			}
		}
		
		int recommendId = operateUserDao.selectOneRecommonId();
		operateUserDao.updateOneRecommonIdUsed(recommendId);
		operateUser.setRecommendId(recommendId);
		int insert = operateUserDao.insert(operateUser);
		return insert;
	}


	/**
	 * @param operateUser
	 * @return
	 */
	private int operateUserIsRegist(OperateUser operateUser) {
		
		OperateUser mobileUser = new OperateUser();
		
		mobileUser.setMobile(operateUser.getMobile());
		
		List <OperateUser>  list = operateUserDao.selectOperateUserSelective(mobileUser);
		
		if(list.size()>0){
			return -1 ;//手机号已注册
		}
		
		OperateUser userNameUser = new OperateUser();
		
		userNameUser.setUsername(operateUser.getUsername());
		
		List <OperateUser>  userNamelist = operateUserDao.selectOperateUserSelective(userNameUser);
		
		if(userNamelist.size()>0){
			return -2 ;//手机号已注册
		}
		
		return 1;
	}


	/**查询代理列表
	 * @param pageUtil
	 * @param userNameOrMobile
	 * @param registDate
	 * @param consumeCard
	 */
	public void findOperateUserByPage(PageUtil<Map<String, Object>> pageUtil,
			String userNameOrMobile, String registDate, String consumeCard) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(!StringUtil.isNull(userNameOrMobile)){
			String REGEX_ID = "^[\\d]*";
			boolean isMobile = Pattern.matches(REGEX_ID, userNameOrMobile.trim());//判读是否是数字
			if(isMobile){
				map.put("mobile", userNameOrMobile);
			}else{
				map.put("userName", userNameOrMobile);
			}
		}
		if(!StringUtil.isNull(registDate)){
			map.put("registDate", registDate);
		}
		if(!StringUtil.isNull(consumeCard)){
			map.put("consumeCard", consumeCard);
		}
		boolean haveOrderBy = haveOrderBy(registDate, consumeCard);
		if(haveOrderBy){
			map.put("haveOrderby", true);
		}
		int toatal = operateUserDao.selectUserListTotal(map);
		map.put("rowStart",pageUtil.getStartRow());
		int size = pageUtil.getSize();
		map.put("pageSize",size);
		List<Map<String,Object>> operateUserList = operateUserDao.selectOperateUserList(map);
		System.out.println(operateUserList);
		pageUtil.setList(operateUserList);
		pageUtil.setTotalCount(toatal);
	}

	
	/**代理查询用户充值总数
	 * @param pageUtil
	 * @param id
	 * @param chargeCount 排序 
	 * @param idOrNick 
	 * @param endDate 
	 * @param beginDate 
	 */
	public void findChargeRecordByOperate(
			PageUtil<Map<String, Object>> pageUtil, Integer id, String beginDate, String endDate, String idOrNick, String chargeCount) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rowStart", pageUtil.getStartRow());
		map.put("pageSize", pageUtil.getSize());
		map.put("operateId", id);
		
		if(!StringUtil.isNull(idOrNick)){
			boolean isNumber = StringUtil.isNumber(idOrNick);
			if(isNumber){
				map.put("userId", idOrNick);
			}else{
				map.put("nickName", idOrNick);
			}
		}
		
		StringUtil.isNull(idOrNick);
		
		if(!StringUtil.isNull(beginDate)){
			map.put(Constants.beginDate, beginDate);
		}
		
		if(!StringUtil.isNull(endDate)){
			map.put(Constants.endDate, endDate);
		}
		
		if(StringUtil.isNotAllEmpty(chargeCount)){
			map.put(haveOrderby, true);
			map.put("chargeCount", chargeCount);
		}
		
		
		List<Map<String, Object>> list = operateChargeRecordDao.findChargeRecordByOperate(map);
		int total = operateChargeRecordDao.findChargeRecordByOperateTotal(map);
		pageUtil.setList(list);
		pageUtil.setTotalCount(total);
	}

	/**删除代理
	 * @param operateId 代理人的ID
	 * @return
	 */
	public int deleteOperate(String operateId) {
		OperateUser record = new OperateUser();
		record.setId(StringUtil.getInt(operateId));
		record.setIsDel(1);
		return operateUserDao.updateByPrimaryKeySelective(record);
	}

	/**查询代理详情
	 * @param operateId
	 * @return
	 */
	public OperateUser operateDetail(String operateId) {
		return operateUserDao.selectByPrimaryKey(StringUtil.getInt(operateId));
	}

	/**修改代理
	 * @param id
	 * @param userName
	 * @param mobile
	 * @param address 
	 * @param password 密码
	 */
	public void modifyOperate(String id, String userName, String mobile, String address, String password) {
		OperateUser record = new OperateUser();
		record.setId(StringUtil.getInt(id));
		record.setUsername(userName);
		record.setMobile(mobile);
		if(!StringUtil.isNull(password)){
			String md5Password = MD5Util.string2MD5(password);
			record.setPassword(md5Password);
		}
		record.setAddress(address);
		operateUserDao.updateByPrimaryKeySelective(record );
	}
	
	/**代理充值
	 * @param id
	 * @param roomCard 房卡数量 
	 * @param sendCard 赠送数量
	 */
	public void chargeCard(String id, String roomCard, String sendCard) {
		ConsumeRecord consumeRecord = new ConsumeRecord();
		consumeRecord.setOperateId(StringUtil.getInt(id));
		consumeRecord.setTotal(StringUtil.getInt(roomCard));
		consumeRecord.setSendCard(StringUtil.getInt(sendCard));
		operateUserDao.chargeCard(consumeRecord);
	}

	/**管理员查看充值记录 
	 * @param pageUtil
	 * @param endDate 
	 * @param beginDate 
	 * @param idOrNick 
	 * @param createDate 充值时间排序
	 */
	public void chargeRecordByAdmin(PageUtil<Map<String, Object>> pageUtil, String idOrNick, String beginDate, String endDate, String createDate) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put(rowStart, pageUtil.getRowStart());
		map.put(pageSize, pageUtil.getSize());
		
		if(!StringUtil.isNull(idOrNick)){
			boolean isNumber = StringUtil.isNumber(idOrNick);
			if(isNumber){
				map.put("userId", idOrNick);
			}else{
				map.put("nickName", idOrNick);
			}
		}
		
		StringUtil.isNull(idOrNick);
		
		if(!StringUtil.isNull(beginDate)){
			map.put(Constants.beginDate, beginDate);
		}
		
		if(!StringUtil.isNull(endDate)){
			map.put(Constants.endDate, endDate);
		}
		
		if(StringUtil.isNotAllEmpty(createDate)){
			map.put(haveOrderby, true);
			map.put("createDate", createDate);
		}
		
		List<Map<String, Object>> list = operateChargeRecordDao.selectChargeRecordByAdmin(map);
		int total = operateChargeRecordDao.selectChargeRecordByAdminCount(map);
		pageUtil.setList(list);
		pageUtil.setTotalCount(total);
	}
	
}
