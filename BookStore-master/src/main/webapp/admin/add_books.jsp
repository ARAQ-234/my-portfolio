<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Add Books</title>
<%@include file="allCss.jsp"%>
<style type="text/css">
/* Card ကို ပိုလှအောင် shadow နဲ့ border ဖြုတ်မယ် */
.paint-card {
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
	border: none;
	border-radius: 12px;
}
/* Header ကို အရောင်လှလှလေး ပေးမယ် */
.card-header {
	background-color: #303f9f;
	color: white;
	border-radius: 12px 12px 0 0 !important;
	padding: 15px;
}
/* Input field တွေကို focus လုပ်ရင် လှအောင် */
.form-control:focus {
	border-color: #303f9f;
	box-shadow: 0 0 5px rgba(48, 63, 159, 0.5);
}

label {
	font-weight: 500;
	color: #444;
}

.btn-custom {
	border-radius: 25px;
	padding: 8px 30px;
	font-weight: bold;
}
</style>
</head>
<body style="background-color: #f7f8fa;">
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp" />
	</c:if>
	<div style="margin-top: 50px;">
		<div class="container p-4">
			<div class="row">
				<div class="col-md-6 offset-md-3">
					<div class="card paint-card">
						<div class="card-header text-center">
							<i class="fa-solid fa-book-medical fa-2x"></i>
							<h4 class="mt-2">Add New Book</h4>
							<c:if test="${not empty succMsg }">
								<p class="text-center text-success">${succMsg }</p>
								<c:remove var="succMsg" scope="session" />
							</c:if>
							<c:if test="${not empty failedMsg }">
								<p class="text-center text-danger">${failedMsg}</p>
								<c:remove var="failedMsg" scope="session" />
							</c:if>

						</div>
						<div class="card-body p-4">

							<form action="../add_books" method="post"
								enctype="multipart/form-data">

								<div class="mb-3">
									<label class="form-label"><i class="fa-solid fa-book"></i>
										Book Name</label> <input type="text" name="bname" class="form-control"
										placeholder="Enter book title" required>
								</div>

								<div class="mb-3">
									<label class="form-label"><i
										class="fa-solid fa-user-pen"></i> Author Name</label> <input
										type="text" name="author" class="form-control"
										placeholder="Enter author name" required>
								</div>

								<div class="row">
									<div class="col-md-6">
										<div class="mb-3">
											<label class="form-label"><i
												class="fa-solid fa-money-bill-wave"></i> Price</label> <input
												type="number" name="price" class="form-control"
												placeholder="Price" required>
										</div>
									</div>
									<div class="col-md-6">
										<div class="mb-3">
											<label class="form-label"><i class="fa-solid fa-list"></i>
												Category</label> <select name="categories" class="form-select">
												<option value="none">--Select--</option>
												<option value="New">New Book</option>
												<option value="Old">Old Book</option>
											</select>
										</div>
									</div>
								</div>

								<div class="mb-3">
									<label class="form-label"><i
										class="fa-solid fa-circle-info"></i> Book Status</label> <select
										name="status" class="form-select">
										<option value="Active">Active (Available)</option>
										<option value="Inactive">Inactive (Out of Stock)</option>
									</select>
								</div>

								<div class="mb-4">
									<label class="form-label"><i class="fa-solid fa-image"></i>
										Upload Photo</label> <input type="file" name="bimg"
										class="form-control"> <small class="text-muted">Max
										size: 2MB (.jpg, .png)</small>
								</div>

								<div class="text-center">
									<button type="submit" class="btn btn-primary btn-custom">
										<i class="fa-solid fa-plus"></i> Add Book
									</button>
									<button type="reset"
										class="btn btn-outline-secondary btn-custom">Clear</button>
								</div>

							</form>
						</div>
					</div>
				</div>
			</div>
		</div>


		<%@include file="footer.jsp"%>
	</div>
</body>
</html>