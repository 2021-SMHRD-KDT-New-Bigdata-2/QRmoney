package com.model;

public class MessageVO {
	// 필드
	private int sender_id;
	private int receive_id;
	private String message;
	private String message_date;
	
	// getter 메서드 
	public int getSender_id() {
		return sender_id;
	}


	public int getReceive_id() {
		return receive_id;
	}


	public String getMessage() {
		return message;
	}


	public String getMessage_date() {
		return message_date;
	}

	// 생성자
	public MessageVO(int sender_id, int receive_id, String message, String message_date) {
		this.sender_id = sender_id;
		this.receive_id = receive_id;
		this.message = message;
		this.message_date = message_date;
	}


	public MessageVO(int sender_id, int receiver_id, String message) {
		this.sender_id = sender_id;
		this.receive_id = receiver_id;
		this.message = message;
	}
	
	
}
