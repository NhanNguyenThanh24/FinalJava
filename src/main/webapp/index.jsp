<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDAOimpl"%>
<%@page import="com.DAO.BookDAO"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NhanBook: Index</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
body {
	background: #525252;
	background: -webkit-linear-gradient(to top, #3d72b4, #525252);
	background: linear-gradient(to top, #3d72b4, #525252);
}

.back-img {
	background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)),
		url("img/book.jpg");
	height: 60vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center;
	display: flex;
	align-items: center;
	justify-content: center;
}

.back-img h2 {
	color: white;
	font-size: 3em;
	text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
}

.card.crd-ho {
	border: none;
	border-radius: 15px;
	transition: transform 0.3s ease, box-shadow 0.3s ease;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	background: #ffffff;
	overflow: hidden;
	margin-bottom: 20px;
}

.card.crd-ho:hover {
	transform: translateY(-10px);
	box-shadow: 0 12px 20px rgba(0, 0, 0, 0.3);
	background: #f1f1f1;
}

.card-body img {
	border-radius: 10px;
	margin-bottom: 10px;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.2);
}

.card-body p {
	font-weight: 500;
	margin-bottom: 5px;
	color: #333;
}

.card-body .btn {
	border-radius: 20px;
	font-size: 0.9em;
	transition: all 0.2s ease-in-out;
}

.card-body .btn:hover {
	opacity: 0.85;
	transform: scale(1.05);
}

hr {
	border: 0;
	height: 1px;
	background: linear-gradient(to right, rgba(255, 255, 255, 0),
		rgba(255, 255, 255, 0.7) 20%, rgba(255, 255, 255, 0.9) 50%,
		rgba(255, 255, 255, 0.7) 80%, rgba(255, 255, 255, 0));
	margin: 40px auto;
	width: 85%;
	position: relative;
	box-shadow: 0 0 10px rgba(255, 255, 255, 0.3);
}

hr:before {
	color: rgba(255, 255, 255, 0.9);
	background: #f7f7f7;
	font-size: 16px;
	padding: 0 15px;
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
}

hr:after {
	content: '';
	position: absolute;
	width: 100%;
	height: 1px;
	background: linear-gradient(to right, transparent, rgba(255, 255, 255, 0.3),
		transparent);
	bottom: -3px;
	left: 0;
}
</style>

</head>
<body>

	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid back-img">
		<h2 class="text-center">NhanBooks - Where Stories Begin</h2>
	</div>
	<hr>

	<!-- Start Recent Book -->

	<div class="container">
		<h3 class="text-center text-white">Recent Book</h3>
		<div class="row">
			<%
			BookDAOimpl dao2 = new BookDAOimpl(DBConnect.getConn());
			List<BookDtls> list2 = dao2.getRecentBook();
			for (BookDtls b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px;">
						<p><%=b.getBookname()%></p>
						<p><%=b.getAuthor()%></p>
						<p>

							<%
							if (b.getBookCategory().equals("Old")) {
							%>
							Categories:<%=b.getBookCategory()%></p>
						<div class="d-flex justify-content-center flex-wrap gap-1 mt-2">
							<!-- Học Câu ni-->
							<a href="view_book.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%> <i
								class="fas fa-dollar-sign"></i> </a>
						</div>
						<%
						} else {
						%>
						Categories:<%=b.getBookCategory()%></p>
						<div class="d-flexjustify-content-centerflex-wrap gap-1mt-2">
						
						<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm">Add Cart</a>
							<%
							} else {
							%>
							<a href="cart?idbook=<%=b.getBookId() %>&&iduser=<%=u.getId() %>" class="btn btn-danger btn-sm">Add Cart</a>

							<%
							}
							%>
						
							 <a href="view_book.jsp?bid=<%=b.getBookId()%> "
								class="btn btn-success btn-sm">View Details</a> 
								
								<a href="" class="btn btn-danger btn-sm mt-2"><%=b.getPrice()%> <i
								class="fas fa-dollar-sign"></i> </a>
						</div>
						<%
						}
						%>

					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>
		<div class="text-center mt-2">
			<a href="all_recent_book.jsp"
				class="btn btn-danger btn-sm text-white mt-3">View All</a>
		</div>

	</div>
	<!-- End Recent Book -->
	<hr>
	<!-- Start New Book -->

	<div class="container">
		<h3 class="text-center text-white">New Book</h3>
		<div class="row">

			<%
			BookDAOimpl dao = new BookDAOimpl(DBConnect.getConn());
			List<BookDtls> list = dao.getNewBook();
			for (BookDtls b : list) {
			%>

			<div class="col-md-3">

				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px;">
						<p><%=b.getBookname()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Categories:
							<%=b.getBookCategory()%></p>
						<div class="d-flexjustify-content-centerflex-wrap gap-1mt-2">

							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm">Add Cart</a>
							<%
							} else {
							%>
							<a href="cart?idbook=<%=b.getBookId() %>&&iduser=<%=u.getId() %>" class="btn btn-danger btn-sm">Add Cart</a>

							<%
							}
							%>

							<a href="view_book.jsp?bid=<%=b.getBookId()%> "
								class="btn btn-success btn-sm">View Details</a> <a href=""
								class="btn btn-danger btn-sm mt-2"><%=b.getPrice()%> <i
								class="fas fa-dollar-sign"></i> </a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>





		</div>
		<div class="text-center mt-2">
			<a href="all_new_book.jsp"
				class="btn btn-danger btn-sm text-white mt-3">View All</a>
		</div>

	</div>
	<!-- End New Book -->
	<hr>

	<!-- Start Old Book -->

	<div class="container">
		<h3 class="text-center text-white">Old Book</h3>
		<div class="row">

			<%
			BookDAOimpl dao3 = new BookDAOimpl(DBConnect.getConn());
			List<BookDtls> list3 = dao3.getOldBook();
			for (BookDtls b : list3) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px;">
						<p><%=b.getBookname()%></p>
						<p><%=b.getAuthor()%></p>
						<p><%=b.getBookCategory()%></p>
						<div class="class="d-flexjustify-content-centerflex-wrapgap-1mt-2"">
							<a href="view_book.jsp?bid=<%=b.getBookId()%> "
								class="btn btn-success btn-sm">View Details</a><a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%> <i
								class="fas fa-dollar-sign"></i> </a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>
		<div class="text-center mt-2">
			<a herf="all_old_book.jsp"
				class="btn btn-danger btn-sm text-white mt-3">View All</a>
		</div>

	</div>
	<!-- End Old Book -->

	<%@include file="all_component/footer.jsp"%>
</body>
</html>
