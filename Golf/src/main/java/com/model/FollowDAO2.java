package com.model;

import java.util.ArrayList;

public class FollowDAO2 extends DAO {

	int cnt = 0;
	int you = 0; // 내가 팔로우한 사람 
	
	public int follow(String me, String nickName) {
		
		getConn();
		
		try {
			
			String sql = "select * from members where nickname=?";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, nickName);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				you = rs.getInt("member_id");
				System.out.println("찾기 성공");
			}else {
				System.out.println("찾기 실패");
			}
			
			sql="insert into follow values(FOLLOW_SEQ.nextval,?,?)";
			
			psmt =conn.prepareStatement(sql);
			
			psmt.setInt(1, Integer.parseInt(me));
			psmt.setInt(2, you);
			
			cnt = psmt.executeUpdate();
			
			if(cnt>0) {
				System.out.println("삽입 성공");
			}else {
				System.out.println("삽입 실패");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return cnt;
	}
	
	public int followcancel(String me, String nickName) {
		
		getConn();
		
		try {
			
			String sql = "select * from members where nickname=?";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, nickName);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				you = rs.getInt("member_id");
				System.out.println("찾기 성공");
			}else {
				System.out.println("찾기 실패");
			}
			
			sql ="delete from follow where follower_id=? and following_id=?";
			
			psmt =conn.prepareStatement(sql);
			
			psmt.setInt(1, Integer.parseInt(me));
			psmt.setInt(2, you);
			
			cnt = psmt.executeUpdate();
			
			if(cnt>0) {
				System.out.println("삭제 성공");
			}else {
				System.out.println("삭제 실패");
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return cnt;
	}
	
	// 나를 팔로우한 사람 목록
	public ArrayList<String> followList(String me) {
		
		ArrayList<String> nickList = new ArrayList<String>();
		String nickName = "";
		
		getConn();
		
		try {

			String sql = "select * from follow f, members m "
					+ "where f.follower_id = m.member_id and f.following_id= ?";
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, Integer.parseInt(me));
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				nickName = rs.getString("follower_id");

				nickList.add(nickName);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return nickList;
	}
	
	// 내가 팔로우한 사람 
	public ArrayList<String> followingList(String me) {
		
		ArrayList<String> nickList2 = new ArrayList<String>();
		String nickName = "";
		
		getConn();
		
		try {
			String sql = "select * from follow f, members m "
					+ "where f.following_id = m.member_id and f.follower_id= ?";
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, Integer.parseInt(me));
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				nickName = rs.getString("follower_id");

				nickList2.add(nickName);
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return nickList2;
	}
	
	// 나랑 팔로우 돼있는지 확인하는 메서드
	public boolean followCheck(int me, String you) {
		
		boolean chk = false;
		
		getConn();
		
		try {
			String sql = "select * from follow, members "
					+ "where follow.following_id = members.member_id and follower_id = ? and nickname = ?";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, me);
			psmt.setString(2, you);
			
			rs = psmt.executeQuery();
			
			chk = rs.next();

		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return chk;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
