<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Store Register</title>
<c:import url="all_component/allCss.jsp" />
</head>
<body class="auth-page">
	<c:import url="all_component/navbar.jsp" />

	<div class="container p-2">
		<div class="row pt-1.5">
			<div class="col-12">
				<div class="card auth-card">
					<div class="card-body">
						<h3 class="text-center mt-3"><i class="fa-solid fa-user-plus me-2"></i>Create your account</h3>
						<c:if test="${not empty succMsg }">
						<p class="text-center text-success">${succMsg }</p>
						<c:remove var="succMsg" scope="session"/>
						</c:if>
						
						<c:if test="${not empty failedMsg }">
						<p class="text-center text-danger">${failedMsg}</p>
						<c:remove var="failedMsg" scope="session"/>
						</c:if>
						<form action="register" method="post" class="mt-3">
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Enter Name</label>
								 <input type="text" class="form-control"
								 		id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="fname">
							</div>
							
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email Address</label> 
								<input type="email" class="form-control"
									   id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="email">
							</div>
							
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Phone No</label> 
								<input type="number" class="form-control"
									   id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="phoneNo">
							</div>
							
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input type="password" class="form-control"
									id="exampleInputPassword1" required="required" name="password">
							</div>
							<div class="mb-3 form-check">
								<input type="checkbox" class="form-check-input" name="check"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Agree terms & Condition</label>
							</div>
							<button type="submit" class="btn btn-primary btn-lg w-100">Create account</button>
							<p class="text-center text-muted mt-3 mb-0">Already a member? <a href="login.jsp">Sign in</a></p>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<c:import url="all_component/footer.jsp"></c:import>
</body>
</html>
