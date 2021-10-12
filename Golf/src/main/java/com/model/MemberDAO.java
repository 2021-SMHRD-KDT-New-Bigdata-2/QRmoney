package com.model;

public class MemberDAO extends DAO{
	int result =0;
	MemberVO vo = new MemberVO();
	public int SignUp(MemberVO vo) {
		getConn();
		try {
			String sql ="insert into members values(MEMBERS_SEQ.nextval,?,?,?,?,?,?,?,?,?,?,?,0,0) ";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1,vo.getEmail());
			psmt.setString(2, vo.getPassword());
			psmt.setString(3, vo.getNickname());
			psmt.setString(4, vo.getProfilePic());
			psmt.setString(5, vo.getGender());
			psmt.setString(7, vo.getcontact());
			psmt.setString(8, vo.getAddress());
			psmt.setString(9, vo.getGametype());
			try {
				if(vo.getAge().equals("")) {
					psmt.setNull(6, 4);
				}else {
					psmt.setInt(6, Integer.parseInt(vo.getAge()));
				}
				if(vo.getscore_field().equals("")) {
					psmt.setNull(10,4);;
				}else {
					
					psmt.setDouble(10, Integer.parseInt(vo.getscore_field()));
				}
				if(vo.getscore_screen().equals("")) {	
					psmt.setNull(11,4);
				}else {
					psmt.setDouble(11, Integer.parseInt(vo.getscore_screen()));
				}
			}catch(NumberFormatException e) {
				
			}
			result =psmt.executeUpdate();		
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return result;
	}
	
	public MemberVO Login(String email, String pw) {
		getConn();
		try {
			String sql="select * from members where email=? and password=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, email);
			psmt.setString(2, pw);
			
			rs=psmt.executeQuery();
			if(rs.next()) {
				String get_email = rs.getString("email");
				String get_nickname=rs.getString("nickname");
				String get_profile_pic=rs.getString("profile_pic");
				String get_gender=rs.getString("gender");
				String get_age=rs.getString("age");
				String get_contact=rs.getString("contact");
				String get_address=rs.getString("address");
				String get_gametype=rs.getString("game_type");
				String get_score_field=rs.getString("SCORE_FIELD");
				String get_score_screen=rs.getString("SCORE_SCREEN");
				String get_ratings_cnt=rs.getString("ratings_cnt");
				String get_ratings_total=rs.getString("ratings_total");
				
				vo = new MemberVO(get_email, get_nickname, get_gender, get_contact, get_age, get_gametype, get_score_screen, get_score_field, get_address, get_profile_pic,get_ratings_total,get_ratings_cnt);
				System.out.println("로긴성공");
						
			}else {
				System.out.println("로긴실패");
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return vo;
	}
}
