package com.model;

import java.util.ArrayList;

public class MemberDAO extends DAO{
	int result =0;
	MemberVO vo = new MemberVO();
	
	// 회원 가입
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
	
	// 로그인
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
	
	// 회원 정보 보여주기
	public MemberVO getInfo(String nickName) {
				
		getConn();
		
		try {
			
			String sql = "select * from members where nickname = ?";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, nickName);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				String nick_name = rs.getString("nickname");
				String gender = rs.getString("gender");
				String age = rs.getString("age");
				String gameType = rs.getString("game_type");
				String scoreScreen = rs.getString("score_field");
				String scoreField = rs.getString("score_screen");
				String profilePic = rs.getString("profile_pic");
				String ratings_cnt = rs.getString("ratings_cnt");
				String ratings_total = rs.getString("ratings_total");
				
				vo = new MemberVO(nick_name, gender, age, gameType, scoreScreen, scoreField, profilePic, ratings_cnt, ratings_total);
				
			}else {
				System.out.println("검색 실패");
			}
					
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return vo;
	}
	
	// 마이페이지 나의 그룹 목록가져오기
	
	// 현재 진행중 그룹
	public ArrayList<GameVO> getMyGroupList(String member_id) {
		ArrayList<GameVO> GroupList = new ArrayList<GameVO>();
		getConn();
		try {
			String sql = "select * from groups, members, games where groups.member_id = members.member_id and groups.game_id = games.game_id and members.member_id = ? and games.game_date > sysdate";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, member_id);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int game_id = rs.getInt("game_id");
				String game_name = rs.getString("game_name");
				String game_type = rs.getString(20);
				int location = rs.getInt("location_id");
				int game_fee = rs.getInt("game_fee");
				String game_date = rs.getString("game_date");
				String game_length = rs.getString("game_length");
				int total_member = rs.getInt("total_member");
				
				GameVO vo = new GameVO(game_id, game_name, game_type, location, game_fee, game_date, game_length, total_member);
				GroupList.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return GroupList;
	}
	
	// 게임이 끝난 그룹
	public ArrayList<GameVO> getMyGroupHistory(String member_id) {
		ArrayList<GameVO> GroupHistory = new ArrayList<GameVO>();
		getConn();
		try {
			String sql = "select * from groups, members, games where groups.member_id = members.member_id and groups.game_id = games.game_id and members.member_id = ? and games.game_date < sysdate";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, member_id);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int game_id = rs.getInt("game_id");
				String game_name = rs.getString("game_name");
				String game_type = rs.getString(20);
				int location = rs.getInt("location_id");
				int game_fee = rs.getInt("game_fee");
				String game_date = rs.getString("game_date");
				String game_length = rs.getString("game_length");
				int total_member = rs.getInt("total_member");
				
				GameVO vo = new GameVO(game_id, game_name, game_type, location, game_fee, game_date, game_length, total_member);
				GroupHistory.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return GroupHistory;
	}
	
	public GameVO getGroupDetail(String type, int game_id) {
		GameVO vo = new GameVO();
		getConn();
		try {
			String sql = "select * from games,"+type+" where games.location_id = "+type+"."+type+"_id and game_type = ? and game_id = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, type);
			psmt.setInt(2, game_id);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int game_idVO = rs.getInt(1);
				String game_name = rs.getString(2);
				String game_type = rs.getString(3);
				int location = rs.getInt(4);
				int game_fee = rs.getInt(5);
				String game_date = rs.getString(6);
				String game_length = rs.getString(7);
				int total_member = rs.getInt(8);
				String location_name = rs.getString("name");
				String location_address = rs.getString("address");
				
				
			vo = new GameVO(game_idVO, game_name, game_type, location, game_fee, game_date, game_length, total_member, location_name, location_address);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return vo;
	}
}
