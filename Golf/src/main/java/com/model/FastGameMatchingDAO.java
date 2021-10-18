package com.model;

import java.util.ArrayList;

public class FastGameMatchingDAO extends DAO{
	int game_id = 0;
	ArrayList<Integer> GameMatchinglist = new ArrayList();
	
	public ArrayList FastGameMatching5KM(String Latiude,String Longitude,int member_id) {
		getConn();
		try {
			//(6371 * acos( cos( radians( ������ġ���� ) ) * cos( radians( ����) ) * cos( radians( �浵) - radians(������ġ�浵)) 
			//sin( radians(������ġ����) ) * sin( radians(����) ) ) ) AS distance


			String sql ="SELECT games.game_id \r\n"
					+ "FROM (\r\n"
					+ "SELECT ( 6371 * acos( cos( RADIANS( ? ) ) * cos( RADIANS( latiude) ) * cos( RADIANS( longitude ) - RADIANS(?) ) + sin( RADIANS(?) ) * sin( RADIANS(latiude\r\n"
					+ ") ) ) ) AS distance , screen.screen_id\r\n"
					+ "FROM screen \r\n"
					+ ") DATA join games on games.location_id = screen_id join groups g on g.game_id = games.game_id \r\n"
					+ "WHERE DATA.distance < 5 and games.game_date > sysdate and games.game_id not in (select game_id from groups where member_id=?)";
					
			
			
			psmt=conn.prepareStatement(sql);
			//������ġ���� �Է�
			psmt.setString(1, Latiude);
			//����浵��ġ �Է�
			psmt.setString(2, Longitude);
			//������ġ���� �Է�
			psmt.setString(3, Latiude);
			//���� �ɹ�
			psmt.setInt(4, member_id);
			
			rs= psmt.executeQuery();
			
			while(rs.next()) {
				System.out.println("������Ī ����!!.");
				game_id = rs.getInt("game_id");
				GameMatchinglist.add(game_id);
			}
			
			
			
			
		}catch(java.sql.SQLSyntaxErrorException e){
			System.out.println("��ġ�ϴ� ���� ����");
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
			//(6371 * acos( cos( radians( ������ġ���� ) ) * cos( radians( ����) ) * cos( radians( �浵) - radians(������ġ�浵)) 
			//sin( radians(������ġ����) ) * sin( radians(����) ) ) ) AS distance


			String sql ="SELECT games.game_id \r\n"
					+ "FROM (\r\n"
					+ "SELECT ( 6371 * acos( cos( RADIANS( ? ) ) * cos( RADIANS( latiude) ) * cos( RADIANS( longitude ) - RADIANS(?) ) + sin( RADIANS(?) ) * sin( RADIANS(latiude\r\n"
					+ ") ) ) ) AS distance , screen.screen_id\r\n"
					+ "FROM screen \r\n"
					+ ") DATA join games on games.location_id = screen_id join groups g on g.game_id = games.game_id \r\n"
					+ "WHERE DATA.distance < 10 and games.game_date > sysdate and DATA.distance>5 and games.game_id not in (select game_id from groups where member_id=?)";
					
			
			
			psmt=conn.prepareStatement(sql);
			//������ġ���� �Է�
			psmt.setString(1, Latiude);
			//����浵��ġ �Է�
			psmt.setString(2, Longitude);
			//������ġ���� �Է�
			psmt.setString(3, Latiude);
			//���� �ɹ�
			psmt.setInt(4, member_id);
			
			rs= psmt.executeQuery();
			if(rs.next()) {
				while(rs.next()) {
					System.out.println("������Ī ����!!.");
					game_id = rs.getInt("game_id");
					GameMatchinglist.add(game_id);
					}
			}else {
				System.out.println("���� ���п�");
			}
			
			
			
		}catch(java.sql.SQLSyntaxErrorException e){
			System.out.println("��ġ�ϴ� ���� ����");
			e.printStackTrace();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return GameMatchinglist;
		} 
}
