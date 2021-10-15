package com.model;

public class MemberVO {
	private String member_id;
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
	private String Ratings_total;
	private String Ratings_cnt;
	private int Rating;
	
	public String getMember_id() {
		return member_id;
	}
	
	public int getRating() {
		return Rating;
	}
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
	public String getRatings_total() {
		return Ratings_total;
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
	public String getRatings_cnt() {
		return Ratings_cnt;
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
	
	// 로그인 - member_id 추가
	public MemberVO(String member_id, String email, String nickname, String gender, String contact, String age, String gametype,
			String score_screen, String score_field, String address, String profilePic, String ratings_total,
			String ratings_cnt) {
		super();
		this.member_id = member_id;
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
		Ratings_total = ratings_total;
		Ratings_cnt = ratings_cnt;
	}
	
	// UpdateService
	public MemberVO(String email, String password, String gender, String contact, String gametype, String score_screen,
			String score_field, String profilePic) {
		this.Email = email;
		this.Password = password;
		this.Gender = gender;
		this.contact = contact;
		this.Gametype = gametype;
		this.score_screen = score_screen;
		this.score_field = score_field;
		this.profilePic = profilePic;
	}
	// Rating Service
	public MemberVO(String email, int rating) {
		super();
		Email = email;		
		Rating = rating;
	}
	
	public MemberVO() {
		super();
	}

	// 친구 정보 불러오기
	public MemberVO(String nickname, String gender, String age, String gametype, String score_screen,
			String score_field, String profilePic) {
		System.out.println("vo호출 성공");
		this.Nickname = nickname;
		this.Gender = gender;
		this.Age = age;
		this.Gametype = gametype;
		this.score_screen = score_screen;
		this.score_field = score_field;
		this.profilePic = profilePic;
		
	}

}

