<%@page import="entity.User"%>
<%@page import="java.util.List"%>
<%@page import="entity.BookDtls"%>
<%@page import="DAO.BookDAOImpl"%>
<%@page import="DB.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<title>All Old Books</title>
<c:import url="all_component/allCss.jsp" />
<style>
    .crd-ho:hover {
        background-color: #fdfdfd;
        transform: scale(1.02);
        transition: all 0.3s ease;
        box-shadow: 0 8px 15px rgba(0,0,0,0.1) !important;
    }
</style>
</head>
<body style="background-color: #f8f9fa;">
	<c:import url="all_component/navbar.jsp" />
	
	
	<c:if test="${not empty addCart}">
		<div class="alert alert-success text-center" role="alert">
			${addCart}
		</div>
		<c:remove var="addCart" scope="session"/>
	</c:if>

	<div class="container-fluid py-4 catalog-page">
		<div class="row px-lg-5">
			<div class="col-12 text-center mb-4">
				<h3 class="fw-bold text-dark text-uppercase">Pre-owned (Old) Books</h3>
				<p class="text-muted">Find the best deals on quality used books</p>
			</div>
			
			<%
			try {
				BookDAOImpl dao = new BookDAOImpl(DBConnection.getConn());
				List<BookDtls> list = dao.getAllOldBooks();
				
				if(list.isEmpty()) {
					out.println("<div class='text-center p-5'><h4 class='text-muted'>Currently, no old books are available.</h4></div>");
				} else {
					for (BookDtls b : list) {
			%>
			<div class="col-sm-6 col-md-4 col-lg-3 mb-4">
				<div class="card crd-ho h-100 border-0 shadow-sm">
					<div class="card-body text-center d-flex flex-column">
						<img alt="<%=b.getBookName()%>" src="book/<%=b.getPhotoName()%>" class="catalog-cover mb-3">
						<h6 class="fw-bold text-dark"><%=b.getBookName()%></h6>
						<p class="text-muted small mb-1">Author: <%=b.getAuthor()%></p>
						<p class="mb-3"><span class="badge bg-warning text-dark px-3">Old Condition</span></p>
						
						<%
						
						User u = (User) session.getAttribute("userobj");
						%>
						
						<div class="d-grid gap-2 d-md-block mt-auto">
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm">
								<i class="fa-solid fa-cart-plus"></i> Add to Cart
							</a>
							<%
							} else {
							%>
							
							<a href="cart?bid=<%=b.getBookId()%>&uid=<%=u.getId()%>&page=old"
								class="btn btn-danger btn-sm add-cart-btn">
								<i class="fa-solid fa-cart-plus"></i> Add to Cart
							</a>
							<%
							}
							%>

							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm"> <i class="fa-solid fa-eye"></i>
								View
							</a>
						</div>
					</div>
				</div>
			</div>
			<%
					}
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
			%>
		</div>
	</div>
	
	<c:import url="all_component/footer.jsp" />

	<script>
		
		document.addEventListener("DOMContentLoaded", function() {
			var scrollpos = localStorage.getItem('scrollpos_old');
			if (scrollpos) {
				window.scrollTo(0, scrollpos);
				localStorage.removeItem('scrollpos_old');
			}
		});

		
		document.querySelectorAll('.add-cart-btn').forEach(button => {
			button.addEventListener('click', function() {
				localStorage.setItem('scrollpos_old', window.scrollY);
			});
		});
	</script>

</body>
</html>
