package com.model;

import java.util.ArrayList;

public class FollowDAO2 extends DAO {

	int cnt = 0;
	int you = 0; // ���� �ȷο��� ��� 
	
	public int follow(String me, String nickName) {
		
		getConn();
		
		try {
			
			String sql = "select * from members where nickname=?";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, nickName);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				you = rs.getInt("member_id");
				System.out.println("ã�� ����");
			}else {
				System.out.println("ã�� ����");
			}
			
			sql="insert into follow values(FOLLOW_SEQ.nextval,?,?)";
			
			psmt =conn.prepareStatement(sql);
			
			psmt.setInt(1, Integer.parseInt(me));
			psmt.setInt(2, you);
			
			cnt = psmt.executeUpdate();
			
			if(cnt>0) {
				System.out.println("���� ����");
			}else {
				System.out.println("���� ����");
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
				System.out.println("ã�� ����");
			}else {
				System.out.println("ã�� ����");
			}
			
			sql ="delete from follow where follower_id=? and following_id=?";
			
			psmt =conn.prepareStatement(sql);
			
			psmt.setInt(1, Integer.parseInt(me));
			psmt.setInt(2, you);
			
			cnt = psmt.executeUpdate();
			
			if(cnt>0) {
				System.out.println("���� ����");
			}else {
				System.out.println("���� ����");
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return cnt;
	}
	
	// ���� �ȷο��� ��� ���
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
	
	// ���� �ȷο��� ��� 
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
	
	// ���� �ȷο� ���ִ��� Ȯ���ϴ� �޼���
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
