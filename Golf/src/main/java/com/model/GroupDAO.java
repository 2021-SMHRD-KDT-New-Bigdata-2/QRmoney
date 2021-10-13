package com.model;

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
			String sql = "select * from groups,members where groups.member_id = members.member_id and game_id = ?";
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
}
