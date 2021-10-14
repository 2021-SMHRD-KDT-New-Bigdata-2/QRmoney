package com.model;

public class FastGameMatchingDAO extends DAO{
	
	public void FastGameMatching5KM(String Latiude,String Longitude) {
		getConn();
		try {
			//(6371 * acos( cos( radians( 현재위치위도 ) ) * cos( radians( 위도) ) * cos( radians( 경도) - radians(현재위치경도)) 
			//sin( radians(현재위치위도) ) * sin( radians(위도) ) ) ) AS distance


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
			//현재위치위도 입력
			psmt.setString(1, Latiude);
			//현재경도위치 입력
			psmt.setString(2, Longitude);
			//현재위치위도 입력
			psmt.setString(3, Latiude);
			
			rs= psmt.executeQuery();
			if(rs.next()) {
				System.out.println("시발 성공햇다.");
			}else {
				System.out.println("ㄴㄴ 실패염");
			}
			
			
			
		}catch(java.sql.SQLSyntaxErrorException e){
			System.out.println("일치하는 방이 없음");
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
	} 
}
