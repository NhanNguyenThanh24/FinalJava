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
body{
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

.crd-ho:hover {
	background-color: #F5F5F5;
}

hr {
    border: 0;
    height: 1px;
    background: linear-gradient(to right,
        rgba(255, 255, 255, 0),
        rgba(255, 255, 255, 0.7) 20%,
        rgba(255, 255, 255, 0.9) 50%,
        rgba(255, 255, 255, 0.7) 80%,
        rgba(255, 255, 255, 0)
    );
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
    background: linear-gradient(to right,
        transparent,
        rgba(255, 255, 255, 0.3),
        transparent
    );
    bottom: -3px;
    left: 0;
}

</style>

</head>
<body">
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid back-img">
		<h2 class="text-center">NhanBooks Management System</h2>
	</div>

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
						<div class="row">
							<a href="" class="btn btn-success btn-sm ml-5">View Details</a> <a
								href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%></a>
						</div>
						<%
						} else {
						%>
						Categories:<%=b.getBookCategory()%></p>
						<div class="row">
							<a href="" class="btn btn-danger btn-sm ml-2">Add Cart</a> <a
								href="" class="btn btn-success btn-sm ml-1">View Details</a> <a
								href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%></a>
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
			<a href="" class="btn btn-danger btn-sm text-white">View All</a>
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
						<div class="row">
							<a href="" class="btn btn-danger btn-sm ml-1">Add Cart</a> <a
								href="" class="btn btn-success btn-sm ml-1">View Details</a><a
								href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>





		</div>
		<div class="text-center mt-2">
			<a herf="" class="btn btn-danger btn-sm text-white">View All</a>
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
						<div class="row">
							<a href="" class="btn btn-success btn-sm ml-5">View Details</a><a
								href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>
		<div class="text-center mt-2">
			<a herf="" class="btn btn-danger btn-sm text-white">View All</a>
		</div>

	</div>
	<!-- End Old Book -->

	<%@include file="all_component/footer.jsp"%>
</body>
</html>
