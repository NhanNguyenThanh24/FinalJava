<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook: Register</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body
	style="background-image: url('img/bookbackground.jpg'); background-size: cover;">
	<%@include file="all_component/navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-2"
					style="background-color: rgba(255, 255, 255, 0.8);">
					<div class="card-body">
						<h4 class="text-center">Registration</h4>
						
						<c:if test="${not empty succMsg}">
						<p class="text-center text-success">${ succMsg }</p>
						<c:remove var="succMsg" scope="session"/>
						</c:if>
						
						<c:if test="${not empty failedMsg }">
						<p class="text-center text-danger">${ failedMsg }</p>
						<c:remove var="failedMsg" scope="session"/>
						</c:if>
						<form action="register" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Enter Full Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Full Name"
									required="required" name="fname">
								<div class="form-group mt-3">
									<label for="exampleInputEmail1">Email address</label> <input
										type="email" class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" placeholder="Email"
										required="required" name="email">
								</div>
								</div>
								<div class="form-group">
									<label for="exampleInputEmail1">Phone Number</label> <input
										type="number" class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" placeholder="PhoneNumber"
										required="required" name="phno">
									<div class="form-group mt-3">
										<label for="exampleInputPassword1">Password</label> <input
											type="password" class="form-control"
											id="exampleInputPassword1" placeholder="Password"
											required="required" name="password">
									</div>
									<div class="form-check">
										<input type="checkbox" class="form-check-input" name="check"
											id="exampleCheck1"> <label class="form-check-label"
											for="exampleCheck1">Agree terms & Condition</label>
									</div>
									<button type="submit" class="btn btn-primary mt-3">Submit</button>
									</div>
						</form>
					</div>
				</div>
			</div>

		</div>
	</div>
	<div class="container-fluid text-center text-white p-3 mt-2"
		style="background-color: #303f9f">
		<h5>Design and Developed by NhanVKU</h5>


	</div>
</body>
</html>