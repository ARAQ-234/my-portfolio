<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard | Home</title>
<%@include file="allCss.jsp"%>
<style type="text/css">
body {
	display: flex;
	flex-direction: column;
	min-height: 100vh;
	margin: 0;
	background-color: #f7f8fa;
}

.content-wrapper {
	flex: 1;
}

.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.2);
	transition: all 0.3s ease-in-out;
	cursor: pointer;
	border: none;
	border-radius: 10px;
}

.paint-card:hover {
	transform: translateY(-5px);
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.4);
}

.card-body i {
	color: #303f9f;
}
</style>
</head>
<body>

	<div class="content-wrapper">
		<%@include file="navbar.jsp"%>
		
		<c:if test="${empty userobj }">
			<c:redirect url="../login.jsp" />
		</c:if>

		<div class="container p-5">
			<div class="row">
				<div class="col-md-6 my-3">
					<a href="add_books.jsp" class="text-decoration-none text-dark">
						<div class="card paint-card">
							<div class="card-body text-center">
								<i class="fa-solid fa-square-plus fa-3x"></i><br>
								<h4 class="mt-2">Add Books</h4>
								<p class="text-muted">Add new book entries to the system</p>
							</div>
						</div>
					</a>
				</div>

				<div class="col-md-6 my-3">
					<a href="all_books.jsp" class="text-decoration-none text-dark">
						<div class="card paint-card">
							<div class="card-body text-center">
								<i class="fa-solid fa-book-open fa-3x text-warning"></i><br>
								<h4 class="mt-2">All Books</h4>
								<p class="text-muted">View and manage all available books</p>
							</div>
						</div>
					</a>
				</div>

				<div class="col-md-6 my-3">
					<a href="order_books.jsp" class="text-decoration-none text-dark">
						<div class="card paint-card">
							<div class="card-body text-center">
								<i class="fa-solid fa-box-open fa-3x text-success"></i><br>
								<h4 class="mt-2">Orders</h4>
								<p class="text-muted">Check and manage customer orders</p>
							</div>
						</div>
					</a>
				</div>

				<div class="col-md-6 my-3">
					<a data-bs-toggle="modal" data-bs-target="#exampleModalCenter"
						class="text-decoration-none text-dark">
						<div class="card paint-card">
							<div class="card-body text-center">
								<i class="fa-solid fa-right-from-bracket fa-3x text-danger"></i><br>
								<h4 class="mt-2">Logout</h4>
								<p class="text-muted">Exit from the admin panel safely</p>
							</div>
						</div>
					</a>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header border-0">
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="text-center">
						<i class="fa-solid fa-circle-question fa-3x text-primary mb-3"></i>
						<h4>Confirm Logout</h4>
						<p class="text-muted">Are you sure you want to log out of the system?</p>
						<div class="mt-4">
							<button type="button" class="btn btn-secondary px-4"
								data-bs-dismiss="modal">Close</button>
							<a href="../logout" class="btn btn-primary px-4 text-white">Logout</a>
						</div>
					</div>
				</div>
				<div class="modal-footer border-0"></div>
			</div>
		</div>
	</div>

	<%@include file="footer.jsp"%>

</body>
</html>