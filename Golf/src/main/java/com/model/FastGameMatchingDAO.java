package com.model;

public class FastGameMatchingDAO extends DAO{
	
	public void FastGameMatching5KM(String Latiude,String Longitude) {
		getConn();
		try {
			//(6371 * acos( cos( radians( ������ġ���� ) ) * cos( radians( ����) ) * cos( radians( �浵) - radians(������ġ�浵)) 
			//sin( radians(������ġ����) ) * sin( radians(����) ) ) ) AS distance


			String sql ="SELECT count(*)\r\n"
					+ "\r\n"
					+ "FROM (\r\n"
					+ "\r\n"
					+ "SELECT ( 6371 * acos( cos( radians(?) ) * cos( radians( lat) ) * cos( radians( lot ) - radians(?) ) + sin( radians(?) ) * sin( radians(lat) ) ) ) AS distance\r\n"
					+ "\r\n"
					+ "FROM cf_location\r\n"
					+ "\r\n"
					+ ") DATA\r\n"
					+ "\r\n"
					+ "WHERE DATA.distance < 5";
			
			psmt=conn.prepareStatement(sql);
			//������ġ���� �Է�
			psmt.setString(1, Latiude);
			//����浵��ġ �Է�
			psmt.setString(2, Longitude);
			//������ġ���� �Է�
			psmt.setString(3, Latiude);
			
			rs= psmt.executeQuery();
			if(rs.next()) {
				System.out.println("�ù� �����޴�.");
			}else {
				System.out.println("���� ���п�");
			}
			
			
			
		}catch(java.sql.SQLSyntaxErrorException e){
			System.out.println("��ġ�ϴ� ���� ����");
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
	} 
}
