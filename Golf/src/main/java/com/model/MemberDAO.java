package com.model;

public class MemberDAO extends DAO{
	int result =0;
	MemberVO vo =null;
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
			psmt.setString(7, vo.getTel());
			psmt.setString(8, vo.getAddress());
			psmt.setString(9, vo.getGametype());
			try {
				if(vo.getAge().equals("")) {
					psmt.setNull(6, 4);
				}else {
					psmt.setInt(6, Integer.parseInt(vo.getAge()));
				}
				if(vo.getField_Score().equals("")) {
					psmt.setNull(10,4);;
				}else {
					
					psmt.setDouble(10, Integer.parseInt(vo.getField_Score()));
				}
				if(vo.getScreen_Score().equals("")) {	
					psmt.setNull(11,4);
				}else {
					psmt.setDouble(11, Integer.parseInt(vo.getScreen_Score()));
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
	
}
