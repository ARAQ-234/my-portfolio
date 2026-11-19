<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Success | Online Book Store</title>
<c:import url="all_component/allCss.jsp" />
<style>
.success-container {
    margin-top: 100px;
    text-align: center;
}

.success-icon {
    font-size: 80px;
    color: #28a745;
    margin-bottom: 20px;
}

.success-title {
    font-size: 2.5rem;
    font-weight: bold;
    color: #333;
}

.btn-home {
    background-color: #303f9f;
    color: white;
    padding: 12px 30px;
    border-radius: 5px;
    text-decoration: none;
    transition: 0.3s;
    font-weight: 500;
}

.btn-home:hover {
    background-color: #1a237e;
    color: white;
    box-shadow: 0 4px 8px rgba(0,0,0,0.2);
}

.card {
    border: none;
    border-radius: 15px;
}
</style>
</head>
<body style="background-color: #f7f8fa;">
    <c:import url="all_component/navbar.jsp" />

    <div class="container success-container">
        <div class="row justify-content-center">
            <div class="col-md-7">
                <div class="card shadow-sm p-5">
                    <div class="success-icon">
                        <i class="fa-solid fa-circle-check"></i>
                    </div>
                    <h2 class="success-title">Order Placed Successfully!</h2>
                    <p class="text-muted mt-3 mb-4">
                        Thank you for your purchase. Your order has been received and is being processed.<br>
                        You will receive a confirmation email shortly.
                    </p>
                    
                    <div class="d-flex justify-content-center gap-3 mt-2">
                        <a href="index.jsp" class="btn btn-home">
                            <i class="fa-solid fa-cart-shopping me-2"></i>Continue Shopping
                        </a>
                        <a href="order_history.jsp" class="btn btn-outline-primary px-4 py-2">
                            <i class="fa-solid fa-list-ul me-2"></i>My Orders
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div style="margin-top: 150px;">
        <c:import url="all_component/footer.jsp" />
    </div>
</body>
</html>