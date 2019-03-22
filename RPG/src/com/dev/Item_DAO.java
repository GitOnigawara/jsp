package com.dev;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Item_DAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public List<Item_bean> getItemList() {
		System.out.println("- Item_DAO getItemList");
		String sql = "SELECT * FROM item";
		List<Item_bean> list = new ArrayList<>();
		
		try {
			conn	= DriverManager.getConnection("jdbc:apache:commons:dbcp:rpg");
			pstmt	= conn.prepareStatement(sql);
			rs		= pstmt.executeQuery();
			while(rs.next()) {
				Item_bean temp = new Item_bean(
						rs.getInt(		"item_code"	),
						rs.getString(	"item_name"	),
						rs.getInt(		"item_atk"	), 
						rs.getInt(		"item_def"	), 
						rs.getInt(		"item_opt1"	),
						rs.getInt(		"item_opt2"	),
						rs.getInt(		"item_opt3"	),
						rs.getInt(		"item_opt4"	),
						rs.getInt(		"item_opt5"	),
						rs.getString(	"item_sub"	), 
						rs.getInt(		"item_prop"	),
						rs.getInt(		"item_price")
				);
				list.add(temp);
			}
			return list;
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public void setItem(Item_bean ib) {
		System.out.println("- Item_DAO setItem");
		String sql = "INSERT INTO item(item_code, item_name, item_atk, item_def, item_opt1, item_opt2, item_opt3, item_opt4, item_opt5, item_sub, item_prop, item_price) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			conn	= DriverManager.getConnection("jdbc:apache:commons:dbcp:rpg");
			pstmt	= conn.prepareStatement(sql);
			pstmt.setInt(	1,	ib.getItem_code()	);
			pstmt.setString(2,	ib.getItem_name()	);
			pstmt.setInt(	3,	ib.getItem_atk()	);
			pstmt.setInt(	4,	ib.getItem_def()	);
			pstmt.setInt(	5,	ib.getItem_opt1()	);
			pstmt.setInt(	6,	ib.getItem_opt2()	);
			pstmt.setInt(	7,	ib.getItem_opt3()	);
			pstmt.setInt(	8,	ib.getItem_opt4()	);
			pstmt.setInt(	9,	ib.getItem_opt5()	);
			pstmt.setString(10,	ib.getItem_sub()	);
			pstmt.setInt(	11,	ib.getItem_prop()	);
			pstmt.setInt(	12,	ib.getItem_price()	);
			rs		= pstmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void modifyItem(Item_bean ib) {
		System.out.println("- Item_DAO modifyItem");
		String sql = "UPDATE item SET item_name = ?, item_atk = ?, item_def = ?, item_opt1 = ?, item_opt2 = ?, item_opt3 = ?, item_opt4 = ?, item_opt5 = ?, item_sub = ?, item_prop = ?, item_price = ? WHERE item_code = ?";
		try {
			conn	= DriverManager.getConnection("jdbc:apache:commons:dbcp:rpg");
			pstmt	= conn.prepareStatement(sql);
			pstmt.setString(1,	ib.getItem_name()	);
			pstmt.setInt(	2,	ib.getItem_atk()	);
			pstmt.setInt(	3,	ib.getItem_def()	);
			pstmt.setInt(	4,	ib.getItem_opt1()	);
			pstmt.setInt(	5,	ib.getItem_opt2()	);
			pstmt.setInt(	6,	ib.getItem_opt3()	);
			pstmt.setInt(	7,	ib.getItem_opt4()	);
			pstmt.setInt(	8,	ib.getItem_opt5()	);
			pstmt.setString(9,	ib.getItem_sub()	);
			pstmt.setInt(	10,	ib.getItem_prop()	);
			pstmt.setInt(	11,	ib.getItem_price()	);
			pstmt.setInt(	12,	ib.getItem_code()	);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void deleteItem(String item_code) {
		System.out.println("- Item_DAO deleteItem");
		String sql = "DELETE FROM item WHERE item_code = '" + item_code + "'";
		try {
			conn	= DriverManager.getConnection("jdbc:apache:commons:dbcp:rpg");
			pstmt	= conn.prepareStatement(sql);
			pstmt.executeQuery();
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
}
