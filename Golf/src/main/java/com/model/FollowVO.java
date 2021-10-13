package com.model;

public class FollowVO {
	private String FOLLOWER_ID;
	private String FOLLOWING_ID;
	private String nickname;
	private String gender;
	
	public String getFOLLOWER_ID() {
		return FOLLOWER_ID;
	}
	public String getFOLLOWING_ID() {
		return FOLLOWING_ID;
	}
	public String getNickname() {
		return nickname;
	}
	public String getGender() {
		return gender;
	}
	public FollowVO(String fOLLOWER_ID, String fOLLOWING_ID) {
		super();
		FOLLOWER_ID = fOLLOWER_ID;
		FOLLOWING_ID = fOLLOWING_ID;
	}
	
	
	
	
}
