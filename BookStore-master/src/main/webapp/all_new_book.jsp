<%@page import="entity.User"%>
<%@page import="java.util.List"%>
<%@page import="entity.BookDtls"%>
<%@page import="DAO.BookDAOImpl"%>
<%@page import="DB.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>All New Books</title>
<c:import url="all_component/allCss.jsp" />
</head>
<body style="background-color: #f0f2f5;">

	<c:if test="${not empty addCart}">
        <div id="toast">${addCart}</div>
		<script>const cartToast = document.getElementById("toast"); cartToast.classList.add("display"); setTimeout(() => cartToast.classList.remove("display"), 2400);</script>
        <%-- ပြပြီးတာနဲ့ Session ကို ဖြုတ်ချမယ် --%>
        <c:remove var="addCart" scope="session" />
    </c:if>

	<c:import url="all_component/navbar.jsp" />

	<div class="container-fluid py-4 catalog-page">
		<div class="row px-lg-5">
			<div class="col-12">
				<h3
					class="text-center mb-4 fw-bold text-uppercase border-bottom pb-2">All
					New Books</h3>
			</div>

			<%
			try {
				BookDAOImpl dao = new BookDAOImpl(DBConnection.getConn());
				List<BookDtls> list = dao.getNewBook(); // DAO ထဲမှာ ဒီ method ဆောက်ထားဖို့လိုပါတယ်
				for (BookDtls b : list) {
			%>
			<div class="col-sm-6 col-md-4 col-lg-3 mb-4">
				<div class="card crd-ho h-100 border-0 shadow-sm">
					<div class="card-body text-center d-flex flex-column">
						<img src="book/<%=b.getPhotoName()%>" class="catalog-cover"
							alt="<%=b.getBookName()%>">
						<h6 class="card-title fw-bold mt-2"><%=b.getBookName()%></h6>
						<p class="text-muted small mb-1">
							Author:
							<%=b.getAuthor()%></p>
						<p class="mb-2">
							<span class="badge rounded-pill bg-primary">New</span>
						</p>
						<%
						// Session ထဲက User object ကို ယူမယ်
						User u = (User) session.getAttribute("userobj");
						%>
						<div class="d-grid gap-2 d-md-block">
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm">Add to Cart</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookId()%>&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm">Add to Cart</a>
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
			} catch (Exception e) {
			e.printStackTrace();
			}
			%>
		</div>
	</div>

	<c:import url="all_component/footer.jsp" />
</body>
</html>
