package com.model;

import java.util.ArrayList;

public class MessageDAO extends DAO {

	int cnt = 0;
	
	// 메시지 전송
	public int insertMessage(MessageVO vo1) {

		getConn();

		try {
			String sql = "insert into messages values(messages_seq.nextval, ?, ?, ?, sysdate)";

			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, vo1.getSender_id());
			psmt.setInt(2, vo1.getReceive_id());
			psmt.setString(3, vo1.getMessage());

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	// 나에게 온 메세지 확인하기
	public ArrayList<MessageVO> showMessage(int senderId) {
		ArrayList<MessageVO> messageList = new ArrayList<MessageVO>();
		getConn();

		try {
			String sql = "select * from messages where receiver_id = ?";

			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, senderId);
			rs = psmt.executeQuery();

			// sender_id => nickname으로 수정하기 
			while (rs.next()) {
				int sender_id = rs.getInt("sender_id");
				int receiver_id = rs.getInt("receiver_id");
				String message = rs.getString("message");
				String message_date = rs.getString("message_date");

				MessageVO vo = new MessageVO(sender_id, receiver_id, message, message_date);
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
