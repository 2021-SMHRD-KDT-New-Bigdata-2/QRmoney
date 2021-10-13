package com.model;

import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;



public class FollowDAO extends DAO{
	int result = 0;
	
	
	
//	입력값이 제대로 들어왓나 확인하는 기능 text용 실제로 쓸지는 모르겟음
	public String FollowEmailConfirm(String email) {
		getConn();
		String get_memberid=null;
		try {
			String sql="select member_id, nickname from members where email=?";
			psmt =conn.prepareStatement(sql);
			psmt.setString(1, email);
			
			rs=psmt.executeQuery();
			
			if (rs.next()) {
				System.out.println("제대로된 이메일값이 들어왓습니다. 팔로우기능을 실행합니다.");
				get_memberid=rs.getString("member_id");
				
			}else {
				System.out.println("잘못된 이메일이 들어왔습니다.");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return get_memberid;
	}
		
	
	
//	팔로우하는 기능
	public int FollowHaJa(FollowVO vo) {
		getConn();
		try {
									
			String sql="insert into follow values(FOLLOW_SEQ.nextval,?,?)";
			
			psmt =conn.prepareStatement(sql);
			
			psmt.setInt(1, Integer.parseInt(vo.getFOLLOWER_ID()));
			psmt.setInt(2, Integer.parseInt(vo.getFOLLOWING_ID()));
			
			result = psmt.executeUpdate();
					
					
					
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return result;
	}
//	팔로우 끊는기능
	public int FollowAnHe(FollowVO vo) {
		getConn();
		try {
			String sql ="delete from follow where follower_id=? and following_id=?";
			
			psmt =conn.prepareStatement(sql);
			
			psmt.setInt(1, Integer.parseInt(vo.getFOLLOWER_ID()));
			psmt.setInt(2, Integer.parseInt(vo.getFOLLOWING_ID()));
			
			result =psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return result;
	}
	
	public ArrayList<FollowVO> ShowFollower(String member_id){
		ArrayList<FollowVO> followlist = new ArrayList<FollowVO>();
		getConn();
		
		try {
			String sql ="select nickname, gender from members where member_id in (select following_id from follow where follower_id=?)";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, Integer.parseInt(member_id));
			
			
			rs=psmt.executeQuery();
			
			while (rs.next()) {
				String nickname = rs.getString("nickname");
				String gender = rs.getString("gender");
				
				FollowVO vo = new FollowVO(nickname, gender);
				followlist.add(vo);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return followlist;
	}
	
	public ArrayList<FollowVO> ShowFolloweing(String member_id){
		ArrayList<FollowVO> followlist = new ArrayList<FollowVO>();
		getConn();
		
		try {
			String sql ="select nickname, gender from members where member_id in (select follower_id from follow where following_id=?)";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, Integer.parseInt(member_id));
			
			
			rs=psmt.executeQuery();
			
			while (rs.next()) {
				String nickname = rs.getString("nickname");
				System.out.println(nickname);
				String gender = rs.getString("gender");
				System.out.println(gender);
				FollowVO vo = new FollowVO(nickname, gender);
				System.out.println(vo);
				followlist.add(vo);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return followlist;
	}
}
