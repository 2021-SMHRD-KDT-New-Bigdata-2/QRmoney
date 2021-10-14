package com.model;

import java.util.ArrayList;

public class MessageDAO extends DAO {

	int cnt = 0;
	
	// 메시지 전송
	public int insertMessage(String recieverNick, MessageVO vo1) {

		getConn();
		int receiver_id = 0;
		
		try {
			String sql = "select * from members where nickname=?";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, recieverNick);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				receiver_id = rs.getInt("member_id");
				System.out.println("찾기 성공");
			}else {
				System.out.println("찾기 실패");
			}
			
			sql = "insert into messages values(messages_seq.nextval, ?, ?, ?, sysdate)";

			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, vo1.getSender_id()); 
			psmt.setInt(2, receiver_id);
			psmt.setString(3, vo1.getMessage());

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	// 내가 받은 메세지 확인하기
	public ArrayList<MessageVO> showMessage(int senderId) {
		
		ArrayList<MessageVO> messageList = new ArrayList<MessageVO>();
		
		getConn();

		try {
			
			String sql = "select * from messages, members "
					+ "where messages.sender_id = members.member_id and messages.receiver_id = ?";

			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, senderId);
			rs = psmt.executeQuery();

			while (rs.next()) {
				String sender_nick = rs.getString("nickname"); 
				String message = rs.getString("message");
				String message_date = rs.getString("message_date");	
				
				MessageVO vo = new MessageVO(sender_nick, message, message_date);
				messageList.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return messageList;
	}
	
	// 메세지 전체 삭제하기
	public int deleteAll(int senderId){
		
		getConn();
		
		try {
			String sql = "delete from messages where receiver_id=?";
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, senderId);
			
			cnt = psmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return cnt;
	}
	
	// 메세지 선택 삭제하기 
	public int deleteOne(String num) {
		
		getConn();
		
		try {
			
			String sql = "delete from messages where message_id=?";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, num);
			
			cnt = psmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return cnt;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
