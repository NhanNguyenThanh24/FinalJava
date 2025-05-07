package com.admin.servlet;

import java.io.InputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.BookDAOimpl;
import com.DB.DBConnect;
import com.entity.BookDtls;

@WebServlet("/add_books")
@MultipartConfig
public class BooksAdd extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String bookname = req.getParameter("bname");
            String author = req.getParameter("author");
            String price = req.getParameter("price");
            String categories = req.getParameter("categories");
            String status = req.getParameter("status");
            Part part = req.getPart("bimg");
            String fileName = part.getSubmittedFileName();

            BookDtls b = new BookDtls(bookname, author, price, categories, status, fileName, "admin");

            BookDAOimpl dao = new BookDAOimpl(DBConnect.getConn());
            boolean f = dao.addBooks(b);
            HttpSession session = req.getSession();

            if (f) {
                // Tạo đường dẫn tới thư mục lưu file
                String path = getServletContext().getRealPath("") + "book";

                // Mở InputStream từ phần file của form
                InputStream inputStream = part.getInputStream();

                // Tạo OutputStream để ghi vào file
                FileOutputStream outputStream = new FileOutputStream(path + File.separator + fileName);

                // Đọc từ InputStream và ghi vào OutputStream
                byte[] buffer = new byte[1024];
                int bytesRead;
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }

                // Đóng các luồng sau khi hoàn tất
                inputStream.close();
                outputStream.close();

                session.setAttribute("succMsg", "Book Add Successfully");
                resp.sendRedirect("admin/add_books.jsp");
            } else {
                session.setAttribute("failedMsg", "Something wrong on Server");
                resp.sendRedirect("admin/add_books.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
