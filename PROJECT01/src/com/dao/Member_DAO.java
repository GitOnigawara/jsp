package com.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

import com.model.Member;

public class Member_DAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private String driver = "jdbc:apache:commons:dbcp:pr01";
	
	public Member_DAO() {
		
	}
	
	public Member getMemberId(String id) throws SQLException, IOException {
		String sql = "SELECT * FROM member WHERE member_id = '" + id + "'";
		try {
			conn	= DriverManager.getConnection(driver);
			pstmt	=  conn.prepareStatement(sql);
			// SELECT * FROM member WHERE member_id = ?
			// pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			Member data = null;
			
			if(rs.next()) {
				data = new Member(
						rs.getString("member_id"),
						rs.getString("name"),
						rs.getString("password"),
						toDate(rs.getTimestamp("ndate")),
						rs.getString("birth")
						);
			}
			return data;
		} finally {}
	}
	
	public Date toDate(Timestamp date) {
		return date == null? null:new Date(date.getTime());
	}
	
	public void insert(Member data) throws SQLException, IOException {
		String sql	= "INSERT INTO member(member_id, name, password, ndate, birth) VALUES(?, ?, ?, ?, ?)";
		try {
			conn = DriverManager.getConnection(driver);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(	1, data.getId());
			pstmt.setString(	2, data.getName());
			pstmt.setString(	3, data.getPassword());
			pstmt.setTimestamp(	4, new Timestamp(data.getDate().getTime()));
			pstmt.setString(	5, data.getBirth());
			pstmt.executeQuery();
		} finally {}
	}
}
