package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOimpl;
import com.DAO.CartDAOimpl;
import com.DB.DBConnect;
import com.entity.BookDtls;
import com.entity.Cart;

@WebServlet("/cart")
public class CartServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			int idbook = Integer.parseInt(req.getParameter("idbook"));
			int iduser = Integer.parseInt(req.getParameter("iduser"));
			
			BookDAOimpl dao=new BookDAOimpl(DBConnect.getConn());
			BookDtls b =dao.getBookById(idbook);
			
			Cart c=new Cart();
			c.setIdbook(idbook);
			c.setIduser(iduser);
			c.setBookName(b.getBookname());
			c.setAuthor(b.getAuthor());
			c.setPrice(Double.parseDouble(b.getPrice()));
			c.setTotalPrice(Double.parseDouble(b.getPrice()));
			
			CartDAOimpl dao2=new CartDAOimpl(DBConnect.getConn());
			boolean f=dao2.addCart(c);
			
			HttpSession session=req.getSession();
			
			if(f)
			{
				session.setAttribute("addCart", "Book Added to cart");
				resp.sendRedirect("all_new_book.jsp");
			}else {
				session.setAttribute("failed", "Something Wrong on sever");
				resp.sendRedirect("all_new_book.jsp");
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
	}
    
}
