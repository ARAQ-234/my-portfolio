<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Help Center</title>
<c:import url="all_component/allCss.jsp" />
<style>
    body { background-color: #f8f9fa; }
    .help-header { background: #303f9f; color: white; padding: 30px 0; }
    .card { border: none; border-radius: 10px; }
    .faq-title { color: #303f9f; font-weight: bold; }
</style>
</head>
<body style="background-color: #f7f8fa;">

    <c:import url="all_component/navbar.jsp" />

    <div class="help-header text-center shadow-sm">
        <h3>Help Center</h3>
    </div>

    <div class="container my-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                
                <div class="card shadow-sm p-4 mb-4">
                    <h5 class="faq-title mb-4">Frequently Asked Questions</h5>
                    
                    <div class="mb-3">
                        <p class="fw-bold mb-1">1. How to track my order?</p>
                        <p class="text-muted small">Go to Settings > My Orders to see your status.</p>
                    </div>
                    <hr>
                    <div class="mb-3">
                        <p class="fw-bold mb-1">2. Payment Methods?</p>
                        <p class="text-muted small">We accept KPay, WavePay and Cash on Delivery.</p>
                    </div>
                    <hr>
                    <div class="mb-3">
                        <p class="fw-bold mb-1">3. How to sell books?</p>
                        <p class="text-muted small">Click "Sell Old Book" in Settings and fill the form.</p>
                    </div>
                </div>

                <div class="card shadow-sm p-4 text-center">
                    <h5 class="faq-title mb-3">Contact Support</h5>
                    <p class="mb-1"><i class="fa-solid fa-envelope me-2"></i> support@bookstore.com</p>
                    <p><i class="fa-solid fa-phone me-2"></i> +95 9123456789</p>
                    <a href="setting.jsp" class="btn btn-outline-primary btn-sm mt-2">Back to Settings</a>
                </div>

            </div>
        </div>
    </div>

    <c:import url="all_component/footer.jsp" />

</body>
</html>