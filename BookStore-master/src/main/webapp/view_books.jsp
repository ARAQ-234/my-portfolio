<%@page import="entity.BookDtls"%>
<%@page import="DB.DBConnection"%>
<%@page import="DAO.BookDAOImpl"%>
<%@page import="entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Details</title>
<c:import url="all_component/allCss.jsp" />
</head>
<body>
	<c:import url="all_component/navbar.jsp" />

	<%
	int bid = Integer.parseInt(request.getParameter("bid"));
	BookDAOImpl dao = new BookDAOImpl(DBConnection.getConn());
	BookDtls b = dao.getBookById(bid);
	User u = (User) session.getAttribute("userobj");
	%>

	<div class="container mb-5">
		<div class="row detail-card p-4">

			<div class="col-md-6 text-center p-4">
				<img src="book/<%=b.getPhotoName()%>" alt="<%=b.getBookName()%>" class="book-img">
			</div>

			<div class="col-md-6 detail-section p-4 border-start">
				<h2 class="fw-bold text-dark mb-4">
					<%=b.getBookName()%></h2>

				<div class="mb-3">
					<span class="text-muted me-3"
						style="width: 100px; display: inline-block;">Author:</span> <span
						class="fw-bold"><%=b.getAuthor()%></span>
				</div>
				<%
				if ("Old".equals(b.getBookCategory())) {
				%>
				<div class="mb-3">
					<span class="text-muted me-3"
						style="width: 100px; display: inline-block;">Email:</span> <span
						class="fw-bold"><%=b.getEmail()%></span>
				</div>
				<%
				}
				%>

				<div class="mb-3">
					<span class="text-muted me-3"
						style="width: 100px; display: inline-block;">Condition:</span> <span
						class="text-success fw-bold"> <%=b.getBookCategory()%></span>
				</div>

				<hr class="my-4">

				<div class="row text-center mb-4">
					<div class="col-4">
						<div class="service-item shadow-sm">
							<i class="fa-solid fa-money-bill-1-wave fa-2x"></i>
							<p class="small mb-0 fw-bold">Cash On Delivery</p>
						</div>
					</div>
					<div class="col-4">
						<div class="service-item shadow-sm">
							<i class="fa-solid fa-rotate-left fa-2x"></i>
							<p class="small mb-0 fw-bold">Return Policy</p>
						</div>
					</div>
					<div class="col-4">
						<div class="service-item shadow-sm">
							<i class="fa-solid fa-truck-fast fa-2x"></i>
							<p class="small mb-0 fw-bold">Free Delivery</p>
						</div>
					</div>
				</div>

				<div
					class="d-flex align-items-center justify-content-between mt-5 p-3 rounded bg-light">
					<%
					if ("Old".equals(b.getBookCategory())) {
					%>
					<div>
						<span class="d-block text-muted small">Total Price</span> <span
							class="price-label"><%=b.getPrice()%> Ks</span>
					</div>
				<a href="index.jsp" class="btn btn-outline-success btn-lg px-4"> <i
						class="fa-solid fa-cart-plus me-2"></i> Continue Shopping
					</a>
					<%
					} else {
					%>
					<div>
						<span class="d-block text-muted small">Total Price</span> <span
							class="price-label"><%=b.getPrice()%> Ks</span>
					</div>
					<% if (u == null) { %>
					<a href="login.jsp" class="btn btn-primary btn-lg px-4"><i class="fa-solid fa-cart-plus me-2"></i> Add to Cart</a>
					<% } else { %>
					<a href="cart?bid=<%=b.getBookId()%>&uid=<%=u.getId()%>" class="btn btn-primary btn-lg px-4"><i class="fa-solid fa-cart-plus me-2"></i> Add to Cart</a>
					<% } %>
					<%
					}
					%>

				</div>
			</div>

		</div>
	</div>

	<div class="mt-auto">
		<c:import url="all_component/footer.jsp" />
	</div>
</body>
</html>
