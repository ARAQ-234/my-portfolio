<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile | Book Store</title>
<c:import url="all_component/allCss.jsp" />
<style>
    body { background-color: #f0f2f5; }
    .card { border: none; border-radius: 15px; }
    .bg-custom { background-color: #303f9f; color: white; border-radius: 15px 15px 0 0; }
    .btn-update { background-color: #303f9f; color: white; font-weight: bold; transition: 0.3s; }
    .btn-update:hover { background-color: #1a237e; color: white; }
    .my-alert { position: fixed; top: 70px; right: 20px; z-index: 1050; }
    .form-label { font-weight: 600; color: #444; }
</style>
</head>
<body>

    <%-- Login မဝင်ထားရင် Setting/Profile ကို ပေးမဝင်ဘူး --%>
    <c:if test="${empty userobj}">
        <c:redirect url="login.jsp"></c:redirect>
    </c:if>

    <c:import url="all_component/navbar.jsp" />

    <%-- Alert Messages --%>
    <c:if test="${not empty succMsg}">
        <div class="alert alert-success my-alert shadow" role="alert">
            <i class="fa-solid fa-circle-check"></i> ${succMsg}
        </div>
        <c:remove var="succMsg" scope="session" />
    </c:if>

    <c:if test="${not empty failedMsg}">
        <div class="alert alert-danger my-alert shadow" role="alert">
            <i class="fa-solid fa-circle-exclamation"></i> ${failedMsg}
        </div>
        <c:remove var="failedMsg" scope="session" />
    </c:if>

    <div class="container mt-5 mb-5">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <div class="card shadow">
                    <div class="card-header bg-custom text-center p-3">
                        <h4><i class="fa-solid fa-user-pen me-2"></i>Edit Your Profile</h4>
                    </div>
                    <div class="card-body p-4">
                        <form action="update_profile" method="post">
                            
                            <%-- User ID ကို Hidden နဲ့ပို့မယ် (Update လုပ်ဖို့အတွက်) --%>
                            <input type="hidden" name="id" value="${userobj.id}">

                            <div class="mb-3">
                                <label class="form-label">Full Name</label>
                                <input type="text" name="fname" class="form-control" 
                                       value="${userobj.name}" required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Email Address</label>
                                <input type="email" name="email" class="form-control" 
                                       value="${userobj.email}" required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Phone Number</label>
                                <input type="text" name="phno" class="form-control" 
                                       value="${userobj.phoneNo}" required>
                            </div>

                            <div class="mb-4">
                                <label class="form-label">Confirm Password</label>
                                <input type="password" name="password" class="form-control" 
                                       placeholder="Enter your password to save changes" required>
                                <div class="form-text text-danger">Security Check: Verification is required to update info.</div>
                            </div>

                            <div class="d-grid gap-2">
                                <button type="submit" class="btn btn-update btn-lg shadow-sm">Update Profile</button>
                                <a href="setting.jsp" class="btn btn-light border">Cancel</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <c:import url="all_component/footer.jsp" />

	<script>document.querySelectorAll(".my-alert").forEach((alert) => setTimeout(() => alert.classList.add("fade-away"), 2200));</script>
</body>
</html>
