<%@page import="entity.BookDtls"%>
<%-- နာမည် မှန်အောင် စစ်ပါ --%>
<%@page import="java.util.List"%>
<%@page import="DB.DBConnection"%>
<%@page import="DAO.BookDAOImpl"%>
<%@page import="entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Old Books | Book Store</title>
<c:import url="all_component/allCss.jsp" />
<style>
body {
	background-color: #f4f7f6;
}

.card {
	border: none;
	border-radius: 12px;
}

.thead-dark {
	background-color: #303f9f;
	color: white;
}

.book-img {
	width: 50px;
	height: 60px;
	object-fit: cover;
	border-radius: 5px;
}

.btn-delete {
	color: #d32f2f;
	cursor: pointer;
	transition: 0.3s;
}

.btn-delete:hover {
	color: #b71c1c;
	transform: scale(1.1);
}
</style>
</head>
<body>

	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<c:import url="all_component/navbar.jsp" />
	<c:if test="${not empty succMsg }">
		<p class="text-center text-success">${succMsg }</p>
		<c:remove var="succMsg" scope="session" />
	</c:if>
	<%-- Success/Failed Messages --%>
	<c:if test="${not empty succMsg}">
		<div class="alert alert-success text-center border-0 shadow-sm">${succMsg}</div>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<div class="container my-5">
		<div class="card shadow-sm">
			<div class="card-header bg-white py-3">
				<h4 class="text-center text-primary mb-0 fw-bold">
					<i class="fa-solid fa-book-open-reader me-2"></i>My Listed Old
					Books
				</h4>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-hover align-middle">
						<thead class="thead-dark">
							<tr>
								<th>Photo</th>
								<th>Book Name</th>
								<th>Author</th>
								<th>Price</th>
								<th>Category</th>
								<th class="text-center">Action</th>
							</tr>
						</thead>
						<tbody>

							<%
							User u = (User) session.getAttribute("userobj");
							String email = u.getEmail();
							BookDAOImpl dao = new BookDAOImpl(DBConnection.getConn());
							List<BookDtls> list = dao.getBookByOld(email, "old");

							if (list == null || list.isEmpty()) {
							%>
							<tr>
								<td colspan="6" class="text-center py-5 text-muted"><i
									class="fa-solid fa-face-meh fa-3x mb-3"></i><br> You
									haven't listed any old books for sale.</td>
							</tr>
							<%
							} else {
							for (BookDtls b : list) { // ⚠️ BookDtls ဖြစ်ရပါမယ်
							%>
							<tr>
								<td><img src="book/<%=b.getPhotoName()%>"
									class="book-img shadow-sm"></td>
								<td class="fw-bold"><%=b.getBookName()%></td>
								<td><%=b.getAuthor()%></td>
								<td class="text-danger fw-bold"><%=b.getPrice()%> Ks</td>
								<td><span class="badge bg-light text-dark border"><%=b.getBookCategory()%></span></td>
								<td class="text-center"><a
									href="delete_old_book?id=<%=b.getBookId()%>&em=<%=email%>"
									class="btn-delete" title="Remove Book"> <i
										class="fa-solid fa-trash-can fa-lg"></i>
								</a></td>
							</tr>
							<%
							}
							}
							%>

						</tbody>
					</table>
				</div>
			</div>
			<div class="card-footer bg-white text-center py-3">
				<a href="setting.jsp" class="btn btn-outline-secondary btn-sm px-4">Back
					to Settings</a>
			</div>
		</div>
	</div>

	<c:import url="all_component/footer.jsp" />

</body>
</html>