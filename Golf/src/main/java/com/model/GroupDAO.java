package com.model;

import java.util.ArrayList;

public class GroupDAO extends DAO{
	int result = 0;
	
	public int joinGroup(int game_id, int member_id) {
		getConn();
		try {
		
			String sql = "insert into groups values(groups_seq.nextval,?,?)";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, game_id);
			psmt.setInt(2, member_id);
			
			result = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return result;
	}
	
	public int getGroupMemberCnt(int game_id) {
		int cnt = 0;
		getConn();
		try {
			String sql = "select * from groups where game_id = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, game_id);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				cnt ++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
		}
		return cnt;
	}
	
	public String getGroupPic(int game_id) {
		String pic = "assets/profile_pic/default.jpg";
		
		getConn();
		try {
			String sql = "select * from groups,members where groups.member_id = members.member_id and game_id = ? order by group_id";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, game_id);
			rs =psmt.executeQuery();
			
			if(rs.next()) {
				pic = "assets/profile_pic/"+rs.getString("profile_pic");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return pic;
	}
	
	public ArrayList<MemberVO> getGroupMemberVO(int game_id) {
		ArrayList<MemberVO> members = new ArrayList<MemberVO>();
		getConn();
		try {
			String sql = "select * from groups,members where groups.member_id = members.member_id and game_id = ? order by group_id";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, game_id);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				String memberid = rs.getString("member_id");
				String email = rs.getString("email");
				String nickname=rs.getString("nickname");
				String profile_pic=rs.getString("profile_pic");
				String gender=rs.getString("gender");
				String age=rs.getString("age");
				String contact=rs.getString("contact");
				String address=rs.getString("address");
				String gametype=rs.getString("game_type");
				String score_field=rs.getString("SCORE_FIELD");
				String score_screen=rs.getString("SCORE_SCREEN");
				String ratings_cnt=rs.getString("ratings_cnt");
				String ratings_total=rs.getString("ratings_total");
				
				MemberVO vo = new MemberVO(memberid, email, nickname, gender, contact, age, gametype, score_screen, score_field, address, profile_pic, ratings_total, ratings_cnt);
				members.add(vo);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return members;
	}
	public int GameGroupsAvg(int game_id) {
		getConn();
		int GameAvg =0;
		try {
			String sql ="select avg(score_screen) from members m, groups g where m.member_id=g.member_id and g.game_id = ?";
			psmt= conn.prepareStatement(sql);
			psmt.setInt(1, game_id);
			rs=psmt.executeQuery();
			if(rs.next()) {
				System.out.println("에버리지구하기성공");
				GameAvg = rs.getInt("avg(screen_score");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return GameAvg;
	}
}


