<%@page import="entity.User"%>
<%@page import="entity.BookDtls"%>
<%@page import="DAO.BookDAOImpl"%>
<%@page import="DB.DBConnection"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Store</title>
<c:import url="all_component/allCss.jsp" />
</head>
<body class="site-shell">
<%
	
	User u = (User) session.getAttribute("userobj");
	%>

	<c:import url="all_component/navbar.jsp" />
	<div id="carouselExampleFade" class="carousel slide carousel-fade bookstore-hero"
		data-bs-ride="carousel" data-bs-interval="6000">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="img/b1.jpg" class="d-block" alt="A cozy shelf of well-loved books">
				<div class="carousel-caption">
					<span class="hero-kicker"><i class="fa-solid fa-sparkles me-2"></i>Stories worth keeping</span>
					<h2>Find a book<br>that <em>stays with you.</em></h2>
					<p class="hero-copy">A thoughtfully gathered collection of new reads and pre-loved favorites, waiting for their next chapter.</p>
					<div class="hero-actions"><a href="all_new_book.jsp" class="btn btn-light btn-lg">Explore the shelves <i class="fa-solid fa-arrow-right ms-2"></i></a><a href="all_old_book.jsp" class="hero-secondary-link">Browse pre-loved</a></div>
				</div>
			</div>
			<div class="carousel-item">
				<img src="img/b2.jpg" class="d-block" alt="A wall of books in a quiet library">
				<div class="carousel-caption">
					<span class="hero-kicker"><i class="fa-solid fa-sparkles me-2"></i>Stories worth keeping</span>
					<h2>Find a book<br>that <em>stays with you.</em></h2>
					<p class="hero-copy">A thoughtfully gathered collection of new reads and pre-loved favorites, waiting for their next chapter.</p>
					<div class="hero-actions"><a href="all_new_book.jsp" class="btn btn-light btn-lg">Explore the shelves <i class="fa-solid fa-arrow-right ms-2"></i></a><a href="all_old_book.jsp" class="hero-secondary-link">Browse pre-loved</a></div>
				</div>
			</div>
			<div class="carousel-item">
				<img src="img/b3.jpg" class="d-block" alt="A table of books ready to be discovered">
				<div class="carousel-caption">
					<span class="hero-kicker"><i class="fa-solid fa-sparkles me-2"></i>Stories worth keeping</span>
					<h2>Find a book<br>that <em>stays with you.</em></h2>
					<p class="hero-copy">A thoughtfully gathered collection of new reads and pre-loved favorites, waiting for their next chapter.</p>
					<div class="hero-actions"><a href="all_new_book.jsp" class="btn btn-light btn-lg">Explore the shelves <i class="fa-solid fa-arrow-right ms-2"></i></a><a href="all_old_book.jsp" class="hero-secondary-link">Browse pre-loved</a></div>
				</div>
			</div>
		</div>

		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleFade" data-bs-slide="prev">
			<span class="carousel-control-prev-icon"></span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleFade" data-bs-slide="next">
			<span class="carousel-control-next-icon"></span>
		</button>
	</div>
	<div class="container benefits-strip" aria-label="BookStore highlights">
		<div class="benefit-item"><span class="benefit-icon"><i class="fa-solid fa-book-open"></i></span><span><strong>A shelf for every mood</strong><small>New reads and old favorites</small></span></div>
		<div class="benefit-item"><span class="benefit-icon"><i class="fa-solid fa-repeat"></i></span><span><strong>Stories live on</strong><small>Give pre-loved books a new home</small></span></div>
		<div class="benefit-item"><span class="benefit-icon"><i class="fa-solid fa-heart"></i></span><span><strong>Made for readers</strong><small>Find your next favorite today</small></span></div>
	</div>

	<!---------------------------- Start Recent Book -------------------------------->

	<div class="container book-section">
		<div class="section-heading"><div><span class="section-kicker">JUST ARRIVED</span><h3>Fresh off the shelf</h3><p>New stories readers are discovering right now.</p></div><a href="all_recent_book.jsp" class="section-link">See all recent <i class="fa-solid fa-arrow-right ms-1"></i></a></div>
		<div class="row">
			<%
			try {
				BookDAOImpl dao = new BookDAOImpl(DBConnection.getConn());
				List<BookDtls> list = dao.getRecentBook(); 

				if (list == null || list.isEmpty()) {
					out.println("<div class='empty-state'><i class='fa-regular fa-bookmark fa-3x'></i><h4>No recent books yet</h4><p>Check back soon for new additions.</p></div>");
				} else {
					for (BookDtls b : list) {
			%>
			<div class="col-sm-6 col-lg-3 mt-3">
				<div class="card crd-ho shadow-sm">
					<div class="card-body text-center d-flex flex-column">
						<img alt="<%=b.getBookName()%>" src="book/<%=b.getPhotoName()%>" class="book-cover mb-2">
						<h5 class="card-title text-primary"><%=b.getBookName()%></h5>
						<p class="card-text text-muted mb-1">
							Author:
							<%=b.getAuthor()%></p>

						
						<%
						if ("Old".equals(b.getBookCategory())) {
						%>
						<p class="badge bg-warning text-dark">
							Category:
							<%=b.getBookCategory()%></p>
						<%
						} else {
						%>
						<p class="badge bg-info">
							Category:
							<%=b.getBookCategory()%></p>
						<%
						}
						%>

						<div class="d-flex justify-content-center gap-1 mt-2">
							<%
							if ("Old".equals(b.getBookCategory())) {
							%>
							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-outline-success btn-sm">View Details</a> <span class="book-price"><%=b.getPrice()%> Ks</span>
							<%
							} else {
							%>
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm">Add to Cart</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookId()%>&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm add-cart-btn">Add to Cart</a>
							<%
							}
							%>
							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-outline-success btn-sm">View</a> <span class="book-price"><%=b.getPrice()%> Ks</span>
							<%
							}
							%>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			}
			} catch (Exception e) {
			e.printStackTrace();
			}
			%>
		</div>
		<div class="text-center mt-4 d-md-none"><a href="all_recent_book.jsp" class="btn btn-outline-success">See all recent books</a></div>
	</div>

	<!---------------------------- End Recent Book -------------------------------->
	<hr>
	<!---------------------------- Start New Book -------------------------------->

	<div class="container book-section">
		<div class="section-heading"><div><span class="section-kicker">GOOD READS, NEW CHAPTERS</span><h3>New arrivals</h3><p>Meet the latest additions to our collection.</p></div><a href="all_new_book.jsp" class="section-link">Explore new books <i class="fa-solid fa-arrow-right ms-1"></i></a></div>
		<div class="row">
			<%
			try {
				BookDAOImpl dao = new BookDAOImpl(DBConnection.getConn());
				List<BookDtls> list = dao.getNewBook();

				if (list == null || list.isEmpty()) {
					out.println("<div class='empty-state'><i class='fa-solid fa-book-open fa-3x'></i><h4>New arrivals are on their way</h4><p>Our next collection will be ready soon.</p></div>");
				} else {
					for (BookDtls b : list) {
			%>
			<div class="col-sm-6 col-lg-3 mt-3">
				<div class="card crd-ho shadow-sm">
					<div class="card-body text-center d-flex flex-column">
						<img alt="<%=b.getBookName()%>" src="book/<%=b.getPhotoName()%>" class="book-cover mb-2">
						<h5 class="card-title text-primary"><%=b.getBookName()%></h5>
						<p class="card-text text-muted mb-1">
							Author:
							<%=b.getAuthor()%></p>
						<p class="badge bg-info">
							Category:
							<%=b.getBookCategory()%></p>
						<div class="d-flex justify-content-center gap-1 mt-2">
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm add-cart-btn">Add to Cart</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookId()%>&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm">Add to Cart</a>
							<%
							}
							%>

							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-outline-success btn-sm">View</a> <span class="book-price"><%=b.getPrice()%> Ks</span>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			}
			} catch (Exception e) {
			out.println("<p class='text-danger'>Error: " + e.getMessage() + "</p>");
			}
			%>
		</div>
		<div class="text-center mt-4 d-md-none"><a href="all_new_book.jsp" class="btn btn-outline-success">See all new arrivals</a></div>
	</div>

	<!---------------------------- End New Book -------------------------------->
	<hr>
	<!---------------------------- Start old Book -------------------------------->

	<div class="container book-section" id="old_book_section">
		<div class="section-heading"><div><span class="section-kicker">A SECOND LIFE FOR STORIES</span><h3>Pre-loved treasures</h3><p>Well-loved books, ready to be loved again.</p></div><a href="all_old_book.jsp" class="section-link">Browse pre-loved <i class="fa-solid fa-arrow-right ms-1"></i></a></div>
		<div class="row">
			<%
			try {
				BookDAOImpl dao3 = new BookDAOImpl(DBConnection.getConn());
				List<BookDtls> list3 = dao3.getOldBook();

				if (list3 == null || list3.isEmpty()) {
					out.println("<div class='empty-state'><i class='fa-solid fa-book-open fa-3x'></i><h4>No pre-loved books just yet</h4><p>Come back soon to discover a new-to-you favorite.</p></div>");
				} else {
					for (BookDtls b : list3) {
			%>
			<div class="col-sm-6 col-lg-3 mt-3">
				<div class="card crd-ho shadow-sm">
					<div class="card-body text-center d-flex flex-column">
						<img alt="<%=b.getBookName()%>" src="book/<%=b.getPhotoName()%>" class="book-cover mb-2">
						<h5 class="card-title text-primary"><%=b.getBookName()%></h5>
						<p class="card-text text-muted mb-1">
							Author:
							<%=b.getAuthor()%></p>
						<p class="badge bg-warning text-dark">
							Category:
							<%=b.getBookCategory()%></p>

						<div class="d-flex justify-content-center gap-1 mt-2">
							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-outline-success btn-sm">View Details</a> <span class="book-price"><%=b.getPrice()%> Ks</span>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			}
			} catch (Exception e) {
			e.printStackTrace();
			}
			%>
		</div>
		<div class="text-center mt-4 d-md-none"><a href="all_old_book.jsp" class="btn btn-outline-success">Browse pre-loved books</a></div>
	</div>

	<!---------------------------- End Old Book -------------------------------->

	<c:import url="all_component/footer.jsp"></c:import>
</body>
</html>
