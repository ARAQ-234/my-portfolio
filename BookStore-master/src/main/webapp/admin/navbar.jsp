<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>

<div class="container-fluid" style="height: 10px; background-color: #303f9f"></div>

<div class="container-fluid p-3 bg-light">
	<div class="row align-items-center">
		<div class="col-md-3 text-success">
			<h3 class="fw-bold">
				<i class="fa-solid fa-book-shield"></i> BookStore <small class="text-muted" style="font-size: 14px;">(Admin)</small>
			</h3>
		</div>
		
		<div class="col-md-6 text-center">
			<h4 class="text-primary fw-bold">Admin Control Panel</h4>
		</div>

		<div class="col-md-3 text-end">
			<c:if test="${not empty userobj}">
				<a class="btn btn-success text-white">
					<i class="fa-solid fa-user-tie"></i> ${userobj.name}
				</a>
				<a data-bs-toggle="modal" data-bs-target="#logoutModal" class="btn btn-primary text-white">
					<i class="fa-solid fa-right-from-bracket"></i> Logout
				</a>
			</c:if>
			
			<c:if test="${empty userobj}">
				<a href="../login.jsp" class="btn btn-success">
					<i class="fa-solid fa-right-to-bracket"></i> Login
				</a>
			</c:if>
		</div>
	</div>
</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom" style="background-color: #303f9f;">
	<div class="container-fluid">
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#adminNavbar" aria-controls="adminNavbar"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="adminNavbar">
			<ul class="navbar-nav me-auto">
				<li class="nav-item active">
					<a class="nav-link" href="home.jsp"><i class="fa-solid fa-house"></i> Home</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="add_books.jsp"><i class="fa-solid fa-plus-circle"></i> Add Book</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="all_books.jsp"><i class="fa-solid fa-book-open"></i> All Books</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="order_books.jsp"><i class="fa-solid fa-list-check"></i> Orders</a>
				</li>
			</ul>
		</div>
	</div>
</nav>

<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="logoutModalTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header border-0">
				<button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body text-center">
				<div class="text-danger mb-3">
					<i class="fa-solid fa-circle-exclamation fa-4x"></i>
				</div>
				<h4>Are you sure you want to logout?</h4>
				<p class="text-muted">You will need to login again to access admin panel.</p>
				<div class="mt-4">
					<button type="button" class="btn btn-secondary px-4" data-bs-dismiss="modal">Cancel</button>
					<a href="../logout" class="btn btn-primary px-4">Logout Now</a>
				</div>
			</div>
			<div class="modal-footer border-0"></div>
		</div>
	</div>
</div>