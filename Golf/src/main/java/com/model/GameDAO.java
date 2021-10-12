package com.model;

public class GameDAO  extends DAO{
	int result = 0;
	
	public int makeGame(String game_name, String game_type, int location, String game_date, int game_fee, String game_length, int total_member) {
		getConn();
		try {
			String sql = "insert into games "
						+"values(games_seq.nextval,?,?,?,?,to_date(?,'YYYY-MM-DD HH24:MI'),?,?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, game_name);
			psmt.setString(2, game_type);
			psmt.setInt(3, location);
			psmt.setInt(4, game_fee);
			psmt.setString(5, game_date);
			psmt.setString(6, game_length);
			psmt.setInt(7, total_member);
			
			result = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return result;
	}
	
	public int getGameIDbyName(String game_name) {
		int game_id = 0;
		
		getConn();
		try {
			String sql = "select * from games where game_name = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, game_name);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				game_id = rs.getInt("game_id");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return game_id;
	}
}
