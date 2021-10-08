package com.model;

public class MemberVO {
	private String Email;
	private String Password;
	private String Nickname;
	private String Gender;
	private String contact;
	private String Age;
	private String Gametype;
	private String score_screen;
	private String score_field;
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
	public String getcontact() {
		return contact;
	}
	public String getAge() {
		return Age;
	}
	public String getGametype() {
		return Gametype;
	}
	public String getscore_screen() {
		return score_screen;
	}
	public String getscore_field() {
		return score_field;
	}
	public String getAddress() {
		return Address;
	}
	public String getProfilePic() {
		return profilePic;
	}
	public MemberVO(String email, String password, String nickname, String gender, String contact, String age,
			String gametype, String score_screen, String score_field, String address, String profilePic) {
		super();
		Email = email;
		Password = password;
		Nickname = nickname;
		Gender = gender;
		this.contact = contact;
		Age = age;
		Gametype = gametype;
		this.score_screen = score_screen;
		this.score_field = score_field;
		Address = address;
		this.profilePic = profilePic;
	}
	public MemberVO(String email, String nickname, String gender, String contact, String age, String gametype,
			String score_screen, String score_field, String address, String profilePic) {
		super();
		Email = email;
		Nickname = nickname;
		Gender = gender;
		this.contact = contact;
		Age = age;
		Gametype = gametype;
		this.score_screen = score_screen;
		this.score_field = score_field;
		Address = address;
		this.profilePic = profilePic;
	}
	
	
		


}

