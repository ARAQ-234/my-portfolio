<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Settings | Book Store</title>
<c:import url="all_component/allCss.jsp" />
<style>
    body { background-color: #f4f7f6; }
    .profile-header {
        background: linear-gradient(45deg, #1a237e, #4a148c);
        color: white;
        padding: 50px 0;
        margin-bottom: 30px;
    }
    .setting-card {
        border: none;
        border-radius: 15px;
        transition: 0.3s;
        text-decoration: none !important;
        color: #333 !important;
        background: #fff;
        height: 100%;
    }
    .setting-card:hover {
        transform: translateY(-8px);
        box-shadow: 0 10px 20px rgba(0,0,0,0.1) !important;
    }
    .icon-box {
        width: 60px;
        height: 60px;
        background-color: #f0f2f1;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        margin: 0 auto 15px auto;
        color: #1a237e;
        font-size: 24px;
        transition: 0.3s;
    }
    .setting-card:hover .icon-box {
        background-color: #1a237e;
        color: white;
    }
    .card-title { font-weight: bold; font-size: 1.1rem; }
    .card-text { font-size: 0.85rem; color: #777; }
</style>
</head>
<body>

    <c:if test="${empty userobj}">
        <c:redirect url="login.jsp"></c:redirect>
    </c:if>

    <c:import url="all_component/navbar.jsp" />

    <div class="profile-header text-center shadow">
        <div class="container">
            <div class="mb-2"><i class="fa-solid fa-circle-user fa-4x"></i></div>
            <h3 class="fw-bold">${userobj.name}</h3>
            <p class="mb-0 opacity-75">${userobj.email}</p>
        </div>
    </div>

    <div class="container mb-5">
        <div class="row g-4">
            
            <div class="col-md-4">
                <a href="sell_book.jsp" class="card shadow-sm p-4 text-center setting-card">
                    <div class="icon-box"><i class="fa-solid fa-book-medical"></i></div>
                    <h5 class="card-title">Sell Old Book</h5>
                    <p class="card-text">List your books for sale.</p>
                </a>
            </div>

            <div class="col-md-4">
                <a href="old_book.jsp" class="card shadow-sm p-4 text-center setting-card">
                    <div class="icon-box"><i class="fa-solid fa-book-open-reader"></i></div>
                    <h5 class="card-title">My Old Books</h5>
                    <p class="card-text">View your listed old books.</p>
                </a>
            </div>

            <div class="col-md-4">
                <a href="edit_profile.jsp" class="card shadow-sm p-4 text-center setting-card">
                    <div class="icon-box"><i class="fa-solid fa-user-shield"></i></div>
                    <h5 class="card-title">Login & Security</h5>
                    <p class="card-text">Edit profile and password.</p>
                </a>
            </div>

            

            <div class="col-md-6">
                <a href="order_history.jsp" class="card shadow-sm p-4 text-center setting-card">
                    <div class="icon-box"><i class="fa-solid fa-box-archive"></i></div>
                    <h5 class="card-title">My Orders</h5>
                    <p class="card-text">Track your purchase history.</p>
                </a>
            </div>

            <div class="col-md-6">
                <a href="help_center.jsp" class="card shadow-sm p-4 text-center setting-card">
                    <div class="icon-box"><i class="fa-solid fa-headset"></i></div>
                    <h5 class="card-title">Help Center</h5>
                    <p class="card-text">Contact us for any help.</p>
                </a>
            </div>

        </div>
    </div>

    <c:import url="all_component/footer.jsp" />

</body>
</html>