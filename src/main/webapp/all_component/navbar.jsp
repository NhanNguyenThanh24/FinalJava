<div class="container-fluid"
	style="height: 10px; background-color: #303f9f"></div>

<div class="container-fluid p-3 bg-light">
	<div class="row align-items-center">
		<!-- Thêm align-items-center vào đây -->
		<div class="col-md-3 text-success d-flex align-items-center">
			<!-- Thêm d-flex và align-items-center -->
			<h3 class="mb-0">
				<!-- Thêm mb-0 để bỏ margin bottom mặc định của h3 -->
				<i class="fas fa-book-reader"></i> NhanBooks
			</h3>
		</div>
		<div class="col-md-6 d-flex align-items-center">
			<div class="search-wrapper w-100">
				<div class="search-box">
					<input type="text" class="search-input"
						placeholder="What are you looking for?">
					<button class="search-button">
						<i class="fas fa-search"></i>
					</button>
				</div>
			</div>
		</div>

		<div class="col-md-3">

			<a href="login.jsp" class="button button-login"> <span
				class="button__text">Login</span> <span class="button__icon">
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
						fill="none" viewBox="0 0 24 24" stroke="#fff" stroke-width="2">
      <path stroke-linecap="round" stroke-linejoin="round"
							d="M10 16l4-4m0 0l-4-4m4 4H3m13-7h4a2 2 0 012 2v10a2 2 0 01-2 2h-4" />
    </svg>
			</span>
			</a> <a href="register.jsp" class="button"> <span
				class="button__text">Register</span> <span class="button__icon">
					<svg xmlns="http://www.w3.org/2000/svg" width="24"
						viewBox="0 0 24 24" stroke-width="2" stroke-linejoin="round"
						stroke-linecap="round" stroke="currentColor" height="24"
						fill="none" class="svg">
      <line y2="19" y1="5" x2="12" x1="12"></line>
      <line y2="12" y1="12" x2="19" x1="5"></line>
    </svg>
			</span>
			</a>

		</div>

	</div>
</div>
</div>



<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<a class="navbar-brand" href="#"><i class="fas fa-home"></i></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto nav-items-custom">
			<li class="nav-item"><a class="nav-link" href="index.jsp">Home
					<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="all_new_book.jsp">New
					Book</a></li>
			<li class="nav-item"><a class="nav-link" href="all_recent_book.jsp">Recent
					Book</a></li>
			<li class="nav-item"><a class="nav-link" href="all_old_book.jsp">Old
					Book</a></li>
		</ul>

		<form class="form-inline my-2 my-lg-0">
			<button class="btn btn-light my-2 my-sm-0" type="submit">
				<i class="fas fa-cog"></i> Setting
			</button>
			<button class="btn btn-light my-2 my-sm-0 ml-1" type="submit">
				<i class="fas fa-phone-square-alt"></i> Contact
			</button>
		</form>
	</div>
</nav>


<style>
.button {
	position: relative;
	width: 150px;
	height: 40px;
	cursor: pointer;
	display: flex;
	align-items: center;
	border: 1px solid #34974d;
	background-color: #3aa856;
	text-decoration: none; /* Xóa underline mặc định của <a> */
	margin-top: 5px;
	margin-left: 100px;
}

.button, .button__icon, .button__text {
	transition: all 0.3s;
}

.button .button__text {
	transform: translateX(30px);
	color: #fff;
	font-weight: 600;
}

.button .button__icon {
	position: absolute;
	transform: translateX(109px);
	height: 100%;
	width: 39px;
	background-color: #34974d;
	display: flex;
	align-items: center;
	justify-content: center;
}

.button .svg {
	width: 30px;
	stroke: #fff;
}

.button:hover {
	background: #34974d;
}

.button:hover .button__text {
	color: transparent;
}

.button:hover .button__icon {
	width: 148px;
	transform: translateX(0);
}

.button:active .button__icon {
	background-color: #2e8644;
}

.button:active {
	border: 1px solid #2e8644;
}

.button-login {
	border: 1px solid #1e88e5;
	background-color: #2196f3;
}

.button-login .button__icon {
	background-color: #1e88e5;
}

.button-login:hover {
	background-color: #1e88e5;
}

.button-login:active {
	border-color: #1565c0;
}

.button-login:active .button__icon {
	background-color: #1565c0;
}

.search-wrapper {
	padding: 0 15px;
}

.search-box {
	position: relative;
	width: 100%;
	background: #fff;
	border-radius: 30px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	transition: all 0.3s ease;
}

.search-box:hover, .search-box:focus-within {
	box-shadow: 0 3px 15px rgba(0, 0, 0, 0.15);
	transform: translateY(-1px);
}

.search-input {
	width: 100%;
	padding: 12px 50px 12px 25px;
	border: 2px solid transparent;
	border-radius: 30px;
	font-size: 16px;
	color: #333;
	transition: all 0.3s;
	background: transparent;
}

.search-input:focus {
	outline: none;
	border-color: #303f9f;
}

.search-input::placeholder {
	color: #999;
	font-style: italic;
}

.search-button {
	position: absolute;
	right: 5px;
	top: 50%;
	transform: translateY(-50%);
	height: 40px;
	width: 40px;
	border: none;
	background: linear-gradient(145deg, #303f9f, #3f51b5);
	border-radius: 50%;
	cursor: pointer;
	display: flex;
	align-items: center;
	justify-content: center;
	transition: all 0.3s;
}

.search-button:hover {
	background: linear-gradient(145deg, #3f51b5, #303f9f);
	transform: translateY(-50%) scale(1.05);
}

.search-button i {
	color: white;
	font-size: 18px;
}
/* Căn chỉnh nav-item và tăng khoảng cách */
.nav-items-custom .nav-item {
    margin-right: 20px;
}

.navbar-dark .navbar-nav .nav-link {
    color: #fff;
    font-weight: 500;
    font-size: 16px;
    padding: 8px 12px;
    transition: color 0.3s ease;
    border-radius: 5px;
}

.navbar-dark .navbar-nav .nav-link:hover {
    color: #cfd8dc;
    background-color: rgba(255, 255, 255, 0.1);
}

</style>