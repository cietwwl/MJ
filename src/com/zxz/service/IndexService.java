package com.zxz.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;

import com.zxz.dao.OneRoomDao;
import com.zxz.dao.UserMapper;
import com.zxz.dao.impl.OneRoomDaoImpl;
import com.zxz.dao.impl.UserMapperImpl;
import com.zxz.domain.Room;
import com.zxz.domain.User;
import com.zxz.rpcclient.RpcClient;
import com.zxz.util.DateUtils;

public class IndexService {

	DateService dateService = RpcClient.getService(DateService.class,"com.zxz.service.DateServiceImpl");
	UserMapper userMapper = new UserMapperImpl();
	OneRoomDao oneRoomDao = new OneRoomDaoImpl();
	
	/**得到房间的集合
	 * @return
	 */
	public List<Room> getRoomList(){
		String roomJSONObject = dateService.getRoomJSONObject();
		System.out.println(roomJSONObject);
		JSONArray jsonArray = new JSONArray(roomJSONObject);
		List<Room> list = new ArrayList<>();
		for(int i=0;i<jsonArray.length();i++){
			JSONObject jsonObject = jsonArray.getJSONObject(i);
			Room room = new Room();
			room.setZhama(jsonObject.getInt("zhama"));
			User createUser = new User();
			createUser.setId(jsonObject.getInt("createUserId"));
			createUser.setUsername(jsonObject.getString("userName"));
			room.setCreateUser(createUser);
			room.setCreateDate(DateUtils.stringToDate(jsonObject.getString("createDate"), "yyyy/MM/dd HH:mm:ss"));
			room.setTotal(jsonObject.getInt("total"));
			room.setRoomNumber(jsonObject.getInt("roomNumber"));
			list.add(room);
		}
		return list;
	}
	
	/**总的在线用户,和服务器建立连接的用户数 
	 * @return
	 */
	public int getTotalOneLineUser(){
		return dateService.getTotalOneLineUser();
	}
	
	
	/**总的登录用户
	 * @return
	 */
	public int getTotalLoginLineUser(){
		return dateService.getTotalLoginLineUser();
	}

	public static void main(String[] args) {
		IndexService indexService = new IndexService();
		int totalLoginLineUser = indexService.getTotalLoginLineUser();
		System.out.println(totalLoginLineUser);
	}
	
	
	/**今日注册数
	 * @return
	 */
	public int getTodayTotalRegist() {
		Map<String, Object> map = new HashMap<String, Object>();
		String beginDate = DateUtils.getFormatDate(new Date(), "yyyy-MM-dd");
		Date tommorrow = DateUtils.getTommorrow();
		String endDate = DateUtils.getFormatDate(tommorrow, "yyyy-MM-dd");
		map.put("beginDate", beginDate);
		map.put("endDate", endDate);
		return userMapper.selectUserListTotal(map );
	}

	/**得到今日房卡消耗数
	 * @return
	 */
	public int getTodayConsumeTotal() {
		Map<String, Object> map = new HashMap<String, Object>();
		String beginDate = DateUtils.getFormatDate(new Date(), "yyyy-MM-dd");
		Date tommorrow = DateUtils.getTommorrow();
		String endDate = DateUtils.getFormatDate(tommorrow, "yyyy-MM-dd");
		map.put("beginDate", beginDate);
		map.put("endDate", endDate);
		return oneRoomDao.selectOneRoomListTotal(map);
	}
}
