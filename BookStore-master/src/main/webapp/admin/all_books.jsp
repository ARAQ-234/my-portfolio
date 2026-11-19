<%@page import="java.util.List"%>
<%@page import="entity.BookDtls"%>
<%@page import="DB.DBConnection"%>
<%@page import="DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: All Books</title>
<%@include file="allCss.jsp"%>
<style type="text/css">
/* Footer ကို အောက်ကပ်ရန် body ကို flex ပေးရပါမယ် */
body {
	display: flex;
	flex-direction: column;
	min-height: 100 vh; /* screen အပြည့်ယူမယ် */
	margin: 0;
	background-color: #f7f8fa;
}

/* content နေရာကို အကျယ်ဆုံး ယူခိုင်းမယ် */
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
<body
	style="background-color: #f0f1f2; display: flex; flex-direction: column; min-height: 100vh; margin: 0;">
	<div class="content-wrapper">
		<%@include file="navbar.jsp"%>
		<c:if test="${empty userobj }">
			<c:redirect url="../login.jsp" />
		</c:if>
		<div class="container-fluid p-4">
			<h3 class="text-center text-primary">All Books List</h3>

			<c:if test="${not empty succMsg }">
				<p class="text-center text-success">${succMsg }</p>
				<c:remove var="succMsg" scope="session" />
			</c:if>
			<c:if test="${not empty failedMsg }">
				<p class="text-center text-danger">${failedMsg}</p>
				<c:remove var="failedMsg" scope="session" />
			</c:if>

			<table
				class="table table-hover table-striped mt-4 bg-white shadow-sm rounded">
				<thead class="table-dark">
					<tr>
						<th scope="col">ID</th>
						<th scope="col">Image</th>
						<th scope="col">Book Name</th>
						<th scope="col">Author</th>
						<th scope="col">Price</th>
						<th scope="col">Category</th>
						<th scope="col">Status</th>
						<th scope="col">Action</th>
					</tr>
				</thead>
				<tbody>
					<%
					BookDAOImpl dao = new BookDAOImpl(DBConnection.getConn());
					List<BookDtls> list = dao.getAllBooks();

					// ၁။ ဒီနေရာမှာ count variable ကို စကြေညာပါ
					int count = 0;

					for (BookDtls b : list) {
						// ၂။ Loop ပတ်တိုင်း နံပါတ်စဉ်ကို ၁ တိုးပေးပါ
						count++;
					%>
					<tr>
						<%-- ၃။ b.getBookId() အစား count ကို ပြောင်းသုံးပါ --%>
						<td><%=count%></td>

						<td><img alt="" src="../book/<%=b.getPhotoName()%>"
							style="width: 45px; height: 50px;"></td>
						<td><%=b.getBookName()%></td>
						<td><%=b.getAuthor()%></td>
						<td><%=b.getPrice()%></td>
						<td><%=b.getBookCategory()%></td>
						<td><%=b.getStatus()%></td>
						<td>
							<%-- သတိပြုရန်: Edit နဲ့ Delete link တွေမှာတော့ id ကိုပဲ ဆက်သုံးရပါမယ် --%>
							<a href="edit_books.jsp?id=<%=b.getBookId()%>"
							class="btn btn-sm btn-primary"> <i
								class="fa-solid fa-pen-to-square"></i> Edit
						</a> <a href="../delete_books?id=<%=b.getBookId()%>"
							class="btn btn-sm btn-danger"> <i class="fa-solid fa-trash"></i>
								Delete
						</a>
						</td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>