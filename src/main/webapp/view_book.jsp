<%@page import="com.entity.BookDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOimpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="all_component/allCss.jsp"%>
<style>
body {
	background: #525252;
	background: -webkit-linear-gradient(to top, #3d72b4, #525252);
	background: linear-gradient(to top, #3d72b4, #525252);
}
</style>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>

	<%
	int bid = Integer.parseInt(request.getParameter("bid"));
	BookDAOimpl dao = new BookDAOimpl(DBConnect.getConn());
	BookDtls b = dao.getBookById(bid);
	%>



	<div class="container">
		<div class="row p-5">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img src="book/<%=b.getPhotoName()%>"
					style="height: 200px; width: 150px"><br>
				<h4 class="mt-3" style="font-weight: 800;">
					Book Name: <span class="text-success" style="font-weight: 600;"><%=b.getBookname()%></span>
				</h4>
				<h4 style="font-weight: 800;">
					Author Name: <span class="text-success" style="font-weight: 600;"><%=b.getAuthor()%></span>
				</h4>
				<h4 style="font-weight: 800;">
					Category: <span class="text-success" style="font-weight: 600;"><%=b.getBookCategory()%></span>
				</h4>
			</div>

			<div class="col-md-6 text-center p-5 border bg-white">
				<h2><%=b.getBookname()%></h2>
				<div class="text-center">

					<%
					if ("Old".equals(b.getBookCategory())) {
					%>

					<!-- Đặt NGOÀI row -->
					<div class="seller-contact p-3 mb-4"
						style="background: #f8f9fa; border-radius: 10px; box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);">
						<h5 class="mb-3" style="color: #1b3c3d; font-weight: 600;">
							<i class="fas fa-user-circle me-2"></i> Contact Seller
						</h5>
						<div class="d-flex align-items-center justify-content-center">
							<i class="far fa-envelope me-2" style="color: #3d72b4;"></i>
							<h5 class="mb-0" style="color: #666;">
								Email: <span style="color: #3d72b4; font-weight: 500;"><%=b.getEmail()%></span>
							</h5>
						</div>
					</div>
					<%
					}
					%>

					<!-- DÒNG RIÊNG CHO ICON -->
					<div class="row mt-4">
						<div class="col-md-4 text-danger text-center p-2">
							<i class="fas fa-money-bill-wave fa-3x"></i>
							<p>Cash On Delivery</p>
						</div>

						<div class="col-md-4 text-danger text-center p-2">
							<i class="fas fa-undo-alt fa-3x"></i>
							<p>Return Available</p>
						</div>

						<div class="col-md-4 text-danger text-center p-2">
							<i class="fas fa-truck-moving fa-3x"></i>
							<p>Free Shipping</p>
						</div>
					</div>


					<%
					if ("Old".equals(b.getBookCategory())) {
					%>

					<div class="text-center p-3 ">
						<a href="index.jsp" class="btn btn-success"><i class="fas fa-cart-plus"></i>
							Continue Shopping</a> <a href="" class="btn btn-danger">200 <i
							class="fas fa-dollar-sign"></i></a>
					</div>

					<%
					}else{%>
						<div class="text-center p-3 ">
						<a href="" class="btn btn-primary"><i class="fas fa-cart-plus"></i>
							Add Cart</a> <a href="" class="btn btn-danger">200 <i
							class="fas fa-dollar-sign"></i></a>
					</div>
					<%
					}
					%>


				</div>
			</div>
		</div>
</body>
</html>