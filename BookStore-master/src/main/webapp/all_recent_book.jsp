<%@page import="java.util.List"%>
<%@page import="entity.BookDtls"%>
<%@page import="DAO.BookDAOImpl"%>
<%@page import="DB.DBConnection"%>
<%@page import="entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>All Recent Books</title>
<c:import url="all_component/allCss.jsp" />
<style>
    .crd-ho:hover {
        background-color: #f8f9fa;
        transform: translateY(-5px);
        transition: all 0.3s ease;
        box-shadow: 0 10px 20px rgba(0,0,0,0.1) !important;
    }
</style>
</head>
<body style="background-color: #f0f2f5;">
	<c:import url="all_component/navbar.jsp" />
	
	<div class="container-fluid py-4 catalog-page">
		<div class="row px-lg-5">
			<div class="col-12">
				<h3 class="text-center mb-4 fw-bold text-uppercase">All Recent Books</h3>
			</div>
			
			<%
			try {
				BookDAOImpl dao = new BookDAOImpl(DBConnection.getConn());
				List<BookDtls> list = dao.getAllRecentBooks();
				
				if(list.isEmpty()) {
					out.println("<h4 class='text-center text-muted'>No Books Found</h4>");
				} else {
					for (BookDtls b : list) {
			%>
			<div class="col-sm-6 col-md-4 col-lg-3 mb-4">
				<div class="card crd-ho h-100 border-0 shadow-sm">
					<div class="card-body text-center d-flex flex-column">
						<img alt="<%=b.getBookName()%>" src="book/<%=b.getPhotoName()%>" class="catalog-cover mb-3">
						<h6 class="fw-bold"><%=b.getBookName()%></h6>
						<p class="text-muted small">Author: <%=b.getAuthor()%></p>
						
						<%-- Category အလိုက် Badge အရောင်ခွဲမယ် --%>
						<p class="mb-3">
							<% if("Old".equals(b.getBookCategory())) { %>
								<span class="badge bg-warning text-dark">Old</span>
							<% } else { %>
								<span class="badge bg-primary">New</span>
							<% } %>
						</p>
						
						<div class="mt-auto border-top pt-3">
							<div class="d-grid gap-2 d-md-block">
								<% if("Old".equals(b.getBookCategory())) { %>
									<a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-outline-success btn-sm">View Details</a>
									<span class="book-price"><%=b.getPrice()%> Ks</span>
								<% } else { %>
									<% User u = (User) session.getAttribute("userobj"); if (u == null) { %>
									<a href="login.jsp" class="btn btn-primary btn-sm"><i class="fa-solid fa-cart-plus"></i> Add</a>
									<% } else { %>
									<a href="cart?bid=<%=b.getBookId()%>&uid=<%=u.getId()%>&page=recent" class="btn btn-primary btn-sm"><i class="fa-solid fa-cart-plus"></i> Add</a>
									<% } %>
									<a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-outline-success btn-sm">View</a>
									<span class="book-price"><%=b.getPrice()%> Ks</span>
								<% } %>
							</div>
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
</body>
</html>
