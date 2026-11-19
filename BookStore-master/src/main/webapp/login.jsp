<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Store Login</title>
<c:import url="all_component/allCss.jsp" />
</head>
<body class="auth-page">
	<c:import url="all_component/navbar.jsp" />
	<div class="container">
		<div class="row pt-5 pb-5">
			<div class="col-12">
				<div class="card auth-card">
					<div class="card-body mt-3">
					<h2 class="text-center mt-2"><i class="fa-regular fa-circle-user me-2"></i>Welcome back</h2>
					
					<c:if test="${not empty failedMsg}">
					<h5 class="text-center text-danger">${failedMsg}</h5>
					<c:remove var="failedMsg" scope="session"/>
					</c:if>
					
					<c:if test="${not empty succMsg}">
					<h5 class="text-center text-success">${succMsg}</h5>
					<c:remove var="succMsg" scope="session"/>
					</c:if>
					
					
					
					
						<form action="login" method="post">
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> <input type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="email">
							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input type="password" class="form-control"
									id="exampleInputPassword1" required="required" name="password">
							</div>
							<div class="text-center">
							<button type="submit" class="btn btn-primary btn-lg px-5">Sign in</button><br>
							<p class="mt-4 mb-0 text-muted">New to BookStore? <a href="register.jsp">Create your account</a></p>
							</div>
							
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>



	<div class="pt-5 pb-3"></div>


	<c:import url="all_component/footer.jsp"></c:import>
</body>
</html>
