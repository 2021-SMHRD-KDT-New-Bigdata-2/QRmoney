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
}
