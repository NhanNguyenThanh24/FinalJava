package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;

import com.DAO.UserDAOimpl;
import com.DB.DBConnect;
import com.entity.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String name = req.getParameter("fname");
            String email = req.getParameter("email");
            String phno = req.getParameter("phno");
            String password = req.getParameter("password");
            String check = req.getParameter("check");

            String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

            User us = new User();
            us.setName(name);
            us.setEmail(email);
            us.setPhno(phno);
            us.setPassword(hashedPassword);  // Lưu mật khẩu đã mã hóa   
            HttpSession session = req.getSession();
            if(check != null) {
                UserDAOimpl dao = new UserDAOimpl(DBConnect.getConn());
                boolean f = dao.userRegister(us);
                if(f) {
                    session.setAttribute("succMsg", "Registration Successfully..");
                    resp.sendRedirect("register.jsp");
                } else {
                    session.setAttribute("failedMsg", "Something went wrong on server..");
                    resp.sendRedirect("register.jsp");
                }
            } else {
                session.setAttribute("failedMsg", "Please Check Agree Terms & Condition");
                resp.sendRedirect("register.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
