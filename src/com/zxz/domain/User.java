package com.zxz.domain;

import java.util.Date;

public class User {
    private Integer id;

    private String openid;

    private String nickname;

    private String sex;

    private String province;

    private String city;

    private String country;

    private String unionid;

    private String username;

    private String password;

    private String roomid;

    private Integer roomcard;

    private String refreshtoken;

    private Date createdate;

    private String headimgurl;
    
    private int recommendId;//推荐人id
    
    private int consumeCard;//消耗的房卡数
    
    
    public int getConsumeCard() {
		return consumeCard;
	}

	public void setConsumeCard(int consumeCard) {
		this.consumeCard = consumeCard;
	}

	public int getRecommendId() {
		return recommendId;
	}

	public void setRecommendId(int recommendId) {
		this.recommendId = recommendId;
	}

	public String getHeadimgurl() {
		return headimgurl;
	}

	public void setHeadimgurl(String headimgurl) {
		this.headimgurl = headimgurl;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOpenid() {
        return openid;
    }

    public void setOpenid(String openid) {
        this.openid = openid == null ? null : openid.trim();
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname == null ? null : nickname.trim();
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province == null ? null : province.trim();
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city == null ? null : city.trim();
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country == null ? null : country.trim();
    }

    public String getUnionid() {
        return unionid;
    }

    public void setUnionid(String unionid) {
        this.unionid = unionid == null ? null : unionid.trim();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getRoomid() {
        return roomid;
    }

    public void setRoomid(String roomid) {
        this.roomid = roomid == null ? null : roomid.trim();
    }

    public Integer getRoomcard() {
        return roomcard;
    }

    public void setRoomcard(Integer roomcard) {
        this.roomcard = roomcard;
    }

    public String getRefreshtoken() {
        return refreshtoken;
    }

    public void setRefreshtoken(String refreshtoken) {
        this.refreshtoken = refreshtoken == null ? null : refreshtoken.trim();
    }

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

	@Override
	public String toString() {
		return "User [id=" + id + ", openid=" + openid + ", nickname="
				+ nickname + ", sex=" + sex + ", province=" + province
				+ ", city=" + city + ", country=" + country + ", unionid="
				+ unionid + ", username=" + username + ", password=" + password
				+ ", roomid=" + roomid + ", roomcard=" + roomcard
				+ ", refreshtoken=" + refreshtoken + ", createdate="
				+ createdate + "]";
	}
    
    
}