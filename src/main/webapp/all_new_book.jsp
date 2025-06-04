<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.BookDtls"%>
<%@ page import="com.DAO.BookDAOimpl"%>
<%@ page import="com.DB.DBConnect"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All New Book</title>
<%@include file="all_component/allCss.jsp"%>
<style>
body {
	background: #525252;
	background: -webkit-linear-gradient(to top, #3d72b4, #525252);
	background: linear-gradient(to top, #3d72b4, #525252);
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

#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5s, fadeOut 0.5s 2.5s;
}

@
keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
keyframes fadeOut {
	from {bottom: 30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
</style>
</head>
<body>
	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<c:if test="${not empty addCart }">

		<div id="toast">${addCart}</div>

		<script type="text/javascript">
    showToast();

    function showToast(content) {
        $('#toast').addClass("display");
        $('#toast').html(content);
        setTimeout(() => {
            $("#toast").removeClass("display");
        }, 2000);
    }
</script>

		<c:remove var="addCart" scope="session" />
	</c:if>

	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">
			<%
			BookDAOimpl dao = new BookDAOimpl(DBConnect.getConn());
			List<BookDtls> list = dao.getAllNewBook();
			for (BookDtls b : list) {
			%>

			<div class="col-md-3">

				<div class="card crd-ho mt-2">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px;">
						<p><%=b.getBookname()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Categories:
							<%=b.getBookCategory()%></p>
						<div class="d-flex justify-content-center flex-wrap gap-1 mt-2">
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
							
							<a href="" class="btn btn-success btn-sm ml-1">View Details</a><a href=""
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
	</div>
</body>
</html>
