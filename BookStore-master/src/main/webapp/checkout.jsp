<%@page import="java.util.List"%>
<%@page import="entity.User"%>
<%@page import="DB.DBConnection"%>
<%@page import="DAO.CartDAOImpl"%>
<%@page import="entity.Cart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shopping Cart | Online Book Store</title>
<c:import url="all_component/allCss.jsp" />
<style>
/* Table & Card styling */
.table thead {
	background-color: #303f9f;
	color: white;
}

.card {
	border-radius: 12px;
	border: none;
}

.btn-checkout {
	background-color: #ff9800;
	color: white;
	font-weight: bold;
	width: 100%;
	transition: 0.3s;
}

.btn-checkout:hover {
	background-color: #e68a00;
	color: white;
	transform: translateY(-2px);
}

.total-price {
	font-size: 1.3rem;
	font-weight: bold;
	color: #d32f2f;
}

.my-alert {
	position: fixed;
	top: 70px;
	right: 20px;
	z-index: 1050;
	min-width: 250px;
}
</style>
</head>
<body style="background-color: #f7f8fa;">
	<c:import url="all_component/navbar.jsp" />


	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<%-- Alert Messages --%>
	<c:if test="${not empty succMsg}">
		<div class="alert alert-success my-alert text-center shadow"
			role="alert">
			<i class="fa-solid fa-circle-check"></i> ${succMsg}
		</div>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<c:if test="${not empty failedMsg}">
		<div class="alert alert-danger my-alert text-center shadow"
			role="alert">
			<i class="fa-solid fa-circle-exclamation"></i> ${failedMsg}
		</div>
		<c:remove var="failedMsg" scope="session" />
	</c:if>

	<div class="container mt-4 mb-5">
		<div class="row">
			<div class="col-md-7">
				<div class="card shadow-sm">
					<div class="card-body">
						<h4 class="text-center text-primary fw-bold mb-4">
							<i class="fa-solid fa-cart-shopping me-2"></i>Your Selected Items
						</h4>
						<table class="table table-hover align-middle">
							<thead>
								<tr>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col" class="text-center">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								User u = (User) session.getAttribute("userobj");
								CartDAOImpl dao = new CartDAOImpl(DBConnection.getConn());
								List<Cart> cart = dao.getBookByUser(u.getId());
								Double totalPrice = 0.00;

								if (cart.isEmpty()) {
								%>
								<tr>
									<td colspan="4" class="text-center text-muted py-4">Your
										cart is empty.</td>
								</tr>
								<%
								} else {
								for (Cart c : cart) {

									totalPrice += c.getPrice();
								%>
								<tr>
									<td class="fw-bold"><%=c.getBookName()%></td>
									<td><%=c.getAuthor()%></td>
									<td><%=c.getPrice()%> ks</td>
									<td class="text-center"><a
										href="remove_book?cid=<%=c.getCid()%>"
										class="btn btn-sm btn-outline-danger"> <i
											class="fa-solid fa-trash-can"></i> Remove
									</a></td>
								</tr>
								<%
								}
								}
								%>
							</tbody>
						</table>

						<div class="text-end mt-4 p-3 border-top">
							<span class="text-muted fw-bold">Total Bill: </span> <span
								class="total-price"><%=totalPrice%> ks</span>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-5">
				<div class="card shadow-sm">
					<div class="card-body">
						<h4 class="text-center text-success fw-bold mb-4">
							<i class="fa-solid fa-truck-fast me-2"></i>Shipping Details
						</h4>
						<form action="order" method="post">

							<input type="hidden" value="${userobj.id}" name="id">

							<div class="row">
								<div class="col-md-6 mb-3">
									<label class="form-label small fw-bold">Full Name</label> <input
										type="text" name="username" class="form-control"
										value="${userobj.name}" required readonly>
								</div>
								<div class="col-md-6 mb-3">
									<label class="form-label small fw-bold">Email Address</label> <input
										type="email" name="email" class="form-control"
										value="${userobj.email}" required readonly>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6 mb-3">
									<label class="form-label small fw-bold">Mobile No</label> <input
										type="text" name="phoneNo" class="form-control"
										value="${userobj.phoneNo}" required>
								</div>
								<div class="col-md-6 mb-3">
									<label class="form-label small fw-bold">Address</label> <input
										type="text" name="address" class="form-control" required>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6 mb-3">
									<label class="form-label small fw-bold">City</label> <input
										type="text" name="city" class="form-control" required>
								</div>
								<div class="col-md-6 mb-3">
									<label class="form-label small fw-bold">Landmark</label> <input
										type="text" name="landmark" class="form-control" required>
								</div>
							</div>

							<div class="mb-4">
								<label class="form-label small fw-bold">Payment Mode</label> <select
									name="payment" class="form-select">
									<option value="noselect">---Select---</option>
									<option value="COD">Cash On Delivery</option>
								</select>
							</div>

							<div class="d-grid gap-2">
								<%
								if (cart.isEmpty()) {
								%>
								<button type="button" class="btn btn-checkout btn-lg shadow-sm"
									disabled>Your Cart is Empty</button>
								<%
								} else {
								%>
								<button type="submit" class="btn btn-checkout btn-lg shadow-sm">Place
									Order Now</button>
								<%
								}
								%>

								<a href="index.jsp" class="btn btn-outline-success"> <i
									class="fa-solid fa-arrow-left me-1"></i> Continue Shopping
								</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<c:import url="all_component/footer.jsp" />

	<script>document.querySelectorAll(".my-alert").forEach((alert) => setTimeout(() => alert.classList.add("fade-away"), 2200));</script>
</body>
</html>
