package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOimpl;
import com.DB.DBConnect;

@WebServlet("/remove_book")
public class RemoveBookCart extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int idbook=Integer.parseInt(req.getParameter("idbook"));
		int iduser=Integer.parseInt(req.getParameter("iduser"));
		CartDAOimpl dao=new CartDAOimpl(DBConnect.getConn());
		boolean f = dao.deleteBook(idbook, iduser);
		HttpSession session=req.getSession();
		
		if(f)
		{
			session.setAttribute("succMsg", "Book Removed from Cart");
			resp.sendRedirect("checkout.jsp");
		}else {
			session.setAttribute("failedMsg", "Something wrong on sever");
			resp.sendRedirect("checkout.jsp");
		}
	}
	 

}
