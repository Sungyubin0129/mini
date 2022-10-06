<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<title>Main Page</title>
</head>
<style>
#navbar {
	margin-top: 13px;
}

#icon {
	float: right;
}
/* #shopIcon{
	width:50px; 
	heigh:50px;
} */
</style>

<body>

	<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50"
		fill="currentColor" class="bi bi-shop" viewBox="0 0 16 16">
	  		<path
			d="M2.97 1.35A1 1 0 0 1 3.73 1h8.54a1 1 0 0 1 .76.35l2.609 3.044A1.5 1.5 0 0 1 16 5.37v.255a2.375 2.375 0 0 1-4.25 1.458A2.371 2.371 0 0 1 9.875 8 2.37 2.37 0 0 1 8 7.083 2.37 2.37 0 0 1 6.125 8a2.37 2.37 0 0 1-1.875-.917A2.375 2.375 0 0 1 0 5.625V5.37a1.5 1.5 0 0 1 .361-.976l2.61-3.045zm1.78 4.275a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 1 0 2.75 0V5.37a.5.5 0 0 0-.12-.325L12.27 2H3.73L1.12 5.045A.5.5 0 0 0 1 5.37v.255a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0zM1.5 8.5A.5.5 0 0 1 2 9v6h1v-5a1 1 0 0 1 1-1h3a1 1 0 0 1 1 1v5h6V9a.5.5 0 0 1 1 0v6h.5a.5.5 0 0 1 0 1H.5a.5.5 0 0 1 0-1H1V9a.5.5 0 0 1 .5-.5zM4 15h3v-5H4v5zm5-5a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1v-3zm3 0h-2v3h2v-3z" />
		<span style="font-size: 2em">그들의 옷장</span>
		</svg>
	<div id="icon">
		<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
			fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
	  		<path
				d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
		</svg>
		<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
			fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
	  		<path fill-rule="evenodd"
				d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
		</svg>
		<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
			fill="currentColor" class="bi bi-cart-fill" viewBox="0 0 16 16">
	  		<path
				d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
		</svg>
		<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
			fill="currentColor" class="bi bi-box-arrow-in-right"
			viewBox="0 0 16 16">
	  		<path fill-rule="evenodd"
				d="M6 3.5a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 0-1 0v2A1.5 1.5 0 0 0 6.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-8A1.5 1.5 0 0 0 5 3.5v2a.5.5 0 0 0 1 0v-2z" />
	  		<path fill-rule="evenodd"
				d="M11.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H1.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z" />
		</svg>
	</div>

	<nav class="navbar navbar-expand-lg navbar-light bg-light" id="navbar">
		<div class="container-fluid">
			<!-- <a class="navbar-brand" href="#">Navbar scroll</a> -->

			<div class="collapse navbar-collapse" id="navbarScroll">
				<ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll nav-pills"
					style="-bs-scroll-height: 100px;">

					<li class="nav-item "><a class="nav-link active bg-light"
						aria-current="page" href="#">BEST</a></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarScrollingDropdown" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> WOMEN </a>
						<ul class="dropdown-menu"
							aria-labelledby="navbarScrollingDropdown">
							<li><a class="dropdown-item" href="#">NEW</a></li>
							<li><a class="dropdown-item" href="#">상의</a></li>
							<li><a class="dropdown-item" href="#">아우터</a></li>
							<li><a class="dropdown-item" href="#">바지</a></li>
							<li><a class="dropdown-item" href="#">원피스</a></li>
							<li><a class="dropdown-item" href="#">스커트</a></li>
						</ul>
					</li>
					
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarScrollingDropdown" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> MEN </a>
						<ul class="dropdown-menu"
							aria-labelledby="navbarScrollingDropdown">
							<li><a class="dropdown-item" href="#">NEW</a></li>
							<li><a class="dropdown-item" href="#">상의</a></li>
							<li><a class="dropdown-item" href="#">아우터</a></li>
							<li><a class="dropdown-item" href="#">바지</a></li>
						</ul>
					</li>

					<li class="nav-item"><a class="nav-link active bg-light"
						aria-current="page" href="#">Sale</a></li>

					<li class="nav-item"><a class="nav-link active bg-light"
						aria-current="page" href="#">추천</a></li>
 
					<li class="nav-item"><a class="nav-link active bg-light"
						aria-current="page" href="#">Electronic</a></li>

					<li class="nav-item"><a class="nav-link active bg-light"
						aria-current="page" href="#">Digital</a></li>

					<li class="nav-item"><a class="nav-link active bg-light"
						aria-current="page" href="#">Beauty</a></li>

					<li class="nav-item"><a class="nav-link active bg-light"
						aria-current="page" href="#">Food</a></li>

					<li class="nav-item"><a class="nav-link active bg-light"
						aria-current="page" href="#">Leisure</a></li>

					<li class="nav-item"><a class="nav-link active bg-light"
						aria-current="page" href="#">Kids</a></li>

					<li class="nav-item"><a class="nav-link active bg-light"
						aria-current="page" href="#">Culture</a></li>

				</ul>
			</div>
		</div>
	</nav>
</body>
</html>