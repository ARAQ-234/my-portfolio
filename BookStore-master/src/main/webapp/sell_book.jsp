<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sell Old Book | Book Store</title>
<c:import url="all_component/allCss.jsp" />
<style>
    body { background-color: #f0f2f5; }
    .card { border: none; border-radius: 15px; }
    .bg-custom { background-color: #303f9f; color: white; border-radius: 15px 15px 0 0; }
    .btn-sell { background-color: #303f9f; color: white; font-weight: bold; transition: 0.3s; }
    .btn-sell:hover { background-color: #1a237e; color: white; }
    .my-alert { position: fixed; top: 70px; right: 20px; z-index: 1050; }
</style>
</head>
<body style="background-color: #f7f8fa;">

    <%-- Login မဝင်ထားရင် ပေးမဝင်ဘူး --%>
    <c:if test="${empty userobj}">
        <c:redirect url="login.jsp"/>
    </c:if>

    <c:import url="all_component/navbar.jsp" />

    <%-- Success/Failed Messages --%>
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
                        <h4><i class="fa-solid fa-book-open me-2"></i>Sell Your Old Book</h4>
                    </div>
                    <div class="card-body p-4">
                        <form action="add_old_book" method="post" enctype="multipart/form-data">
                        	
                             <%-- User ID ကို Hidden နဲ့ပို့ပေးရမယ် --%>
                            <input type="hidden" name="user_email" value="${userobj.email}">

                            <div class="mb-3">
                                <label class="form-label fw-bold">Book Name</label>
                                <input type="text" name="bname" class="form-control" placeholder="Enter book title" required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label fw-bold">Author Name</label>
                                <input type="text" name="author" class="form-control" placeholder="Enter author name" required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label fw-bold">Price</label>
                                <input type="number" name="price" class="form-control" placeholder="Enter price in Ks" required>
                            </div>

                            <%-- Category က Old ဖြစ်လို့ Hidden နဲ့ပို့မယ် --%>
                            <input type="hidden" name="btype" value="Old">

                            <div class="mb-4">
                                <label class="form-label fw-bold">Upload Book Photo</label>
                                <input type="file" name="bimg" class="form-control" required>
                                <div class="form-text">Clear photo of the book cover is recommended.</div>
                            </div>

                            <div class="d-grid gap-2">
                                <button type="submit" class="btn btn-sell btn-lg shadow-sm">Post Now</button>
                                <a href="setting.jsp" class="btn btn-light border">Back to Settings</a>
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
