package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDtls;
import com.entity.Cart;

public class CartDAOimpl implements CartDAO {

	private Connection conn;
	public CartDAOimpl(Connection conn) {
		this.conn=conn;
	}
	
	
	
	@Override
	public boolean addCart(Cart c) {
	    boolean f=false;
		try {
			
			String sql ="insert into cart(idbook, iduser, bookName, author, price, total_price) values(?, ?, ?, ?, ?, ?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, c.getIdbook());
			ps.setInt(2, c.getIduser());
			ps.setString(3, c.getBookName());
			ps.setString(4, c.getAuthor());
			ps.setDouble(5, c.getPrice());
			ps.setDouble(6, c.getTotalPrice());
			
			int i = ps.executeUpdate();
			if(i==1) {
				f=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return f;
	}



	@Override
	public List<Cart> getBookByUser(int userId) {
		List<Cart> list = new ArrayList<Cart>();
		Cart c=null;
		double totalPrice=0;
		try {
			
			String sql = "select * from cart where iduser=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				c = new Cart();
				c.setIdcart(rs.getInt(1));
				c.setIdbook(rs.getInt(2));
				c.setIduser(rs.getInt(3));
				c.setBookName(rs.getString(4));
				c.setAuthor(rs.getString(5));
				c.setPrice(rs.getDouble(6));
				
				totalPrice = totalPrice+rs.getDouble(7);
				c.setTotalPrice(totalPrice);
				
				list.add(c);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}



	@Override
	public boolean deleteBook(int idbook, int iduser) {
		boolean f=false;
		try {
			String sql="delete from cart where idbook=? and iduser=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, idbook);
			ps.setInt(2, iduser);
			int i = ps.executeUpdate();
			if(i==1) {
				f=true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	
	
    
	
	
}
