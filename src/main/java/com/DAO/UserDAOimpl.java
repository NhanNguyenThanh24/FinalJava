package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.mindrot.jbcrypt.BCrypt;

import com.entity.User;

public class UserDAOimpl implements UserDAO{
        private Connection conn;
        
        public UserDAOimpl(Connection conn) {
        	this.conn = conn;
        }

		@Override
		public boolean userRegister(User us) {
			boolean f=false;
			try {
				String sql ="insert into user(name, email, phno, password) values(?, ?, ?, ?)";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, us.getName());
				ps.setString(2, us.getEmail());
				ps.setString(3, us.getPhno());
				ps.setString(4, us.getPassword());
				
				int i=ps.executeUpdate();
				if(i==1) {
					f=true;
				}				
			} catch (Exception e) {
				
				e.printStackTrace();
			}
			
			
			return f;
		}

		@Override
		public User login(String email, String password) {
			
			User us = null;
			
			try {
				String sql = "select * from user where email = ?";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, email);
				
				ResultSet rs = ps.executeQuery();
				if(rs.next()) {
					String hashedPassword = rs.getString("password");
					if(BCrypt.checkpw(password, hashedPassword)) {
					us = new User();
					us.setId(rs.getInt(1));
					us.setName(rs.getString(2));
					us.setEmail(rs.getString(3));
					us.setPhno(rs.getString(4));
					us.setPassword(rs.getString(5));
					us.setAddress(rs.getString(6));
					us.setLandmark(rs.getString(7));
					us.setCity(rs.getString(8));
					us.setState(rs.getString(9));
					us.setPincode(rs.getString(10));
				}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return us;
		}
		
		
        
        
}
