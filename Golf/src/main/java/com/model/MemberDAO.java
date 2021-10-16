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
				String get_memberid = rs.getString("member_id");
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
				
				vo = new MemberVO(get_memberid, get_email, get_nickname, get_gender, get_contact, get_age, get_gametype, get_score_screen, get_score_field, get_address, get_profile_pic,get_ratings_total,get_ratings_cnt);
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
	

	// 회원 정보 수정
	public int update(MemberVO vo1) {
		
		getConn();
		
		int cnt = 0;
		try {
			String sql = "update members set password=?, gender=?, contact=?, game_type=?,"
					+ " score_screen=?, score_field=?, profile_pic=? where email=?";
			
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, vo1.getPassword());
			psmt.setString(2, vo1.getGender());
			psmt.setString(3, vo1.getcontact());
			psmt.setString(4, vo1.getGametype());
			psmt.setString(7, vo1.getProfilePic());
			psmt.setString(8, vo1.getEmail()); // 세션정보
			
			try {
				if(vo1.getscore_field().equals("")) {
					psmt.setNull(6,4);
				}else {
					psmt.setDouble(6, Integer.parseInt(vo1.getscore_field()));
				}
				if(vo1.getscore_screen().equals("")) {	
					psmt.setNull(5,4);
				}else {
					psmt.setDouble(5, Integer.parseInt(vo1.getscore_screen()));
				}
			}catch(NumberFormatException e) {
				e.printStackTrace();
			}
			
			cnt = psmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return cnt;
	}
	
	public int getMemberIdbyEmail(String email) {
		int member_id = 0;
		
		getConn();
		try {
			String sql = "select * from members where email = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, email);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				member_id = rs.getInt("member_id");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return member_id;
	}
	
	public int RatingEstimation(MemberVO vo) {
		getConn();
		try {
			String sql="select email, ratings_total from members where email=?";
			psmt =conn.prepareStatement(sql);
			psmt.setString(1, vo.getEmail());
			
			rs=psmt.executeQuery();
			String get_email=null;
			int get_rating_total=0;
			if(rs.next()){
				get_email = rs.getString("email");
				get_rating_total = rs.getInt("ratings_total");
				System.out.println("레이팅시스템 검색성공");
			}else {
				System.out.println("레이팅시스템 검색실패");
			}
			
			
			
			sql= "update members set ratings_total =?, ratings_cnt= RATING_SEQ.nextval where email =?" ;
			
			
			
			int Rating_total =get_rating_total +vo.getRating(); 
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, Rating_total);			
			psmt.setString(2, vo.getEmail());
			
			
			result=psmt.executeUpdate();
			
		} catch(Exception e){
			e.printStackTrace();
		}finally {
			close();
		}
		return result;
	}
	
	public MemberVO getInfo(String nickName) {
		
		String nick_name = "";
		String gender= "";
		String age = "";
		String gameType = "";
		String scoreScreen = "";
		String scoreField = "";
		String profilePic = "";
		
		getConn();
		
		try {
			// ? 준현이가 가꼬온 거 
			
			System.out.println("dao 호출 성공");
			System.out.println(nickName);
			
			String sql = "select * from members where nickname = ?";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, nickName);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				nick_name = rs.getString("nickname");
				gender = rs.getString("gender");
				age = rs.getString("age");
				gameType = rs.getString("game_type");
				scoreScreen = rs.getString("score_field");
				scoreField = rs.getString("score_screen");
				profilePic = rs.getString("profile_pic");
			}else {
				System.out.println("검색 실패");
			}
			
			System.out.println(gender+" "+age);
			System.out.println("sql검색 성공");
			vo = new MemberVO(nick_name, gender, age, gameType, scoreScreen, scoreField, profilePic);
		
			System.out.println(vo.getAge());
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return vo;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
