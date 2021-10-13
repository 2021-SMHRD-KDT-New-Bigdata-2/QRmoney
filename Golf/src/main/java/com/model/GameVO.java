package com.model;

public class GameVO {
	private int game_id;
	private String game_name;
	private String game_type;
	private int location;
	private int game_fee;
	private String game_length;
	private int total_member;
	
	public int getGame_id() {
		return game_id;
	}
	public String getGame_name() {
		return game_name;
	}
	public String getGame_type() {
		return game_type;
	}
	public int getLocation() {
		return location;
	}
	public int getGame_fee() {
		return game_fee;
	}
	public String getGame_length() {
		return game_length;
	}
	public int getTotal_member() {
		return total_member;
	}
	
	public GameVO(int game_id, String game_name, String game_type, int location, int game_fee, String game_length,
			int total_member) {
		super();
		this.game_id = game_id;
		this.game_name = game_name;
		this.game_type = game_type;
		this.location = location;
		this.game_fee = game_fee;
		this.game_length = game_length;
		this.total_member = total_member;
	}
	
}
