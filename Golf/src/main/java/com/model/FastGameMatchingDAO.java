package com.model;

import java.util.ArrayList;

public class FastGameMatchingDAO extends DAO{
	int game_id = 0;
	ArrayList<Integer> GameMatchinglist = new ArrayList();
	
	public ArrayList FastGameMatching5KM(String Latiude,String Longitude,int member_id) {
		getConn();
		try {
			//(6371 * acos( cos( radians( 현재위치위도 ) ) * cos( radians( 위도) ) * cos( radians( 경도) - radians(현재위치경도)) 
			//sin( radians(현재위치위도) ) * sin( radians(위도) ) ) ) AS distance


			String sql ="SELECT games.game_id \r\n"
					+ "FROM (\r\n"
					+ "SELECT ( 6371 * acos( cos( RADIANS( ? ) ) * cos( RADIANS( latiude) ) * cos( RADIANS( longitude ) - RADIANS(?) ) + sin( RADIANS(?) ) * sin( RADIANS(latiude\r\n"
					+ ") ) ) ) AS distance , screen.screen_id\r\n"
					+ "FROM screen \r\n"
					+ ") DATA join games on games.location_id = screen_id join groups g on g.game_id = games.game_id \r\n"
					+ "WHERE DATA.distance < 5 and games.game_date > sysdate and games.game_id not in (select game_id from groups where member_id=?)";
					
			
			
			psmt=conn.prepareStatement(sql);
			//현재위치위도 입력
			psmt.setString(1, Latiude);
			//현재경도위치 입력
			psmt.setString(2, Longitude);
			//현재위치위도 입력
			psmt.setString(3, Latiude);
			//지금 맴버
			psmt.setInt(4, member_id);
			
			rs= psmt.executeQuery();
			
			while(rs.next()) {
				System.out.println("빠른매칭 성공!!.");
				game_id = rs.getInt("game_id");
				GameMatchinglist.add(game_id);
			}
			
			
			
			
		}catch(java.sql.SQLSyntaxErrorException e){
			System.out.println("일치하는 방이 없음");
			e.printStackTrace();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return GameMatchinglist;
	} 


	public ArrayList FastGameMatching10KM(String Latiude,String Longitude, int member_id) {
		try {
			//(6371 * acos( cos( radians( 현재위치위도 ) ) * cos( radians( 위도) ) * cos( radians( 경도) - radians(현재위치경도)) 
			//sin( radians(현재위치위도) ) * sin( radians(위도) ) ) ) AS distance


			String sql ="SELECT games.game_id \r\n"
					+ "FROM (\r\n"
					+ "SELECT ( 6371 * acos( cos( RADIANS( ? ) ) * cos( RADIANS( latiude) ) * cos( RADIANS( longitude ) - RADIANS(?) ) + sin( RADIANS(?) ) * sin( RADIANS(latiude\r\n"
					+ ") ) ) ) AS distance , screen.screen_id\r\n"
					+ "FROM screen \r\n"
					+ ") DATA join games on games.location_id = screen_id join groups g on g.game_id = games.game_id \r\n"
					+ "WHERE DATA.distance < 10 and games.game_date > sysdate and DATA.distance>5 and games.game_id not in (select game_id from groups where member_id=?)";
					
			
			
			psmt=conn.prepareStatement(sql);
			//현재위치위도 입력
			psmt.setString(1, Latiude);
			//현재경도위치 입력
			psmt.setString(2, Longitude);
			//현재위치위도 입력
			psmt.setString(3, Latiude);
			//지금 맴버
			psmt.setInt(4, member_id);
			
			rs= psmt.executeQuery();
			if(rs.next()) {
				while(rs.next()) {
					System.out.println("빠른매칭 성공!!.");
					game_id = rs.getInt("game_id");
					GameMatchinglist.add(game_id);
					}
			}else {
				System.out.println("ㄴㄴ 실패염");
			}
			
			
			
		}catch(java.sql.SQLSyntaxErrorException e){
			System.out.println("일치하는 방이 없음");
			e.printStackTrace();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return GameMatchinglist;
		} 
}
