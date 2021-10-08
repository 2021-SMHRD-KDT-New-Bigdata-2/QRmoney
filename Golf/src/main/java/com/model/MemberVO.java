package com.model;

public class MemberVO {
	private String Email;
	private String Password;
	private String Nickname;
	private String Gender;
	private String Tel;
	private String Age;
	private String Gametype;
	private String Screen_Score;
	private String Field_Score;
	private String Address;
	private String profilePic;
	public String getEmail() {
		return Email;
	}
	public String getPassword() {
		return Password;
	}
	public String getNickname() {
		return Nickname;
	}
	public String getGender() {
		return Gender;
	}
	public String getTel() {
		return Tel;
	}
	public String getAge() {
		return Age;
	}
	public String getGametype() {
		return Gametype;
	}
	public String getScreen_Score() {
		return Screen_Score;
	}
	public String getField_Score() {
		return Field_Score;
	}
	public String getAddress() {
		return Address;
	}
	public String getProfilePic() {
		return profilePic;
	}
	public MemberVO(String email, String password, String nickname, String gender, String tel, String age,
			String gametype, String screen_Score, String field_Score, String address, String profilePic) {
		super();
		Email = email;
		Password = password;
		Nickname = nickname;
		Gender = gender;
		Tel = tel;
		Age = age;
		Gametype = gametype;
		Screen_Score = screen_Score;
		Field_Score = field_Score;
		Address = address;
		this.profilePic = profilePic;
	}
	
		


}

