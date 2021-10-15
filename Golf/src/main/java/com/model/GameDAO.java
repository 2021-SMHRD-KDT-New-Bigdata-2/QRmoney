package com.model;

import java.util.ArrayList;

public class GameDAO  extends DAO{
	int result = 0;
	ArrayList<GameVO> gameList = new ArrayList<GameVO>();
	GameVO vo = new GameVO();
	
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
	
	public ArrayList<GameVO> searchGameList(String type, String address) {
		getConn();
		try {
			String sql = "select * from games,"+type+" where games.location_id = "+type+"."+type+"_id and game_type = ? and address like ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, type);
			psmt.setString(2, address+"%");
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int game_id = rs.getInt(1);
				String game_name = rs.getString(2);
				String game_type = rs.getString(3);
				int location = rs.getInt(4);
				int game_fee = rs.getInt(5);
				String game_date = rs.getString(6);
				String game_length = rs.getString(7);
				int total_member = rs.getInt(8);
				String location_name = rs.getString(10);
				String location_address = rs.getString("address");
				
				GameVO vo = new GameVO(game_id, game_name, game_type, location, game_fee, game_date, game_length, total_member, location_name, location_address);
				gameList.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return gameList;
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
