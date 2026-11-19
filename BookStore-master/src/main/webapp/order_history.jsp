<%@page import="entity.Book_order"%>
<%@page import="java.util.List"%>
<%@page import="DB.DBConnection"%>
<%@page import="DAO.OrderImpl"%>
<%@page import="entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Orders | Online Book Store</title>
<c:import url="all_component/allCss.jsp" />
<style>
    /* Table styling */
    .table-container {
        background: white;
        border-radius: 15px;
        overflow: hidden;
        box-shadow: 0 4px 20px rgba(0,0,0,0.08);
    }
    .thead-custom {
        background: linear-gradient(45deg, #303f9f, #1a237e);
        color: white;
    }
    .table thead th {
        border: none;
        padding: 15px;
        font-weight: 500;
        text-transform: uppercase;
        font-size: 0.85rem;
    }
    .table tbody td {
        padding: 15px;
        vertical-align: middle;
        color: #444;
        border-bottom: 1px solid #f2f2f2;
    }
    .table-hover tbody tr:hover {
        background-color: #f8f9ff;
        transition: 0.3s;
    }
    .order-id-badge {
        background-color: #e8eaf6;
        color: #3f51b5;
        padding: 5px 10px;
        border-radius: 6px;
        font-weight: bold;
        font-size: 0.8rem;
    }
    .price-text {
        font-weight: bold;
        color: #2e7d32;
    }
    .status-badge {
        font-size: 0.75rem;
        padding: 5px 12px;
        border-radius: 20px;
    }
</style>
</head>
<body style="background-color: #f4f6f9;">
    <c:import url="all_component/navbar.jsp" />

    <div class="container py-5">
        <div class="row">
            <div class="col-md-12">
                <div class="d-flex align-items-center mb-4">
                    <div class="bg-primary text-white p-3 rounded-3 me-3">
                        <i class="fa-solid fa-box-open fa-2x"></i>
                    </div>
                    <div>
                        <h2 class="fw-bold mb-0">Order History</h2>
                        <p class="text-muted mb-0">Manage and track your previous purchases</p>
                    </div>
                </div>

                <div class="table-container">
                    <table class="table table-hover mb-0">
                        <thead class="thead-custom">
                            <tr>
                                <th scope="col">Order ID</th>
                                <th scope="col">Book Details</th>
                                <th scope="col">Author</th>
                                <th scope="col" class="text-center">Price</th>
                                <th scope="col" class="text-center">Payment Mode</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                            User u = (User) session.getAttribute("userobj");
                            if (u != null) {
                                OrderImpl dao = new OrderImpl(DBConnection.getConn());
                                List<Book_order> list = dao.getOrderByUser(u.getEmail());
                                
                                if (list.isEmpty()) {
                            %>
                                <tr>
                                    <td colspan="5" class="text-center py-5">
                                        <img src="img/empty-cart.png" style="width: 100px; opacity: 0.5;" alt="No Orders"><br>
                                        <p class="mt-3 text-muted">You haven't placed any orders yet.</p>
                                        <a href="all_recent_book.jsp" class="btn btn-primary btn-sm mt-2">Start Shopping</a>
                                    </td>
                                </tr>
                            <%
                                } else {
                                    for (Book_order o : list) {
                            %>
                                <tr>
                                    <td><span class="order-id-badge">#<%=o.getOrderId()%></span></td>
                                    <td>
                                        <div class="fw-bold text-dark"><%=o.getBookName()%></div>
                                    </td>
                                    <td><span class="text-muted"><%=o.getAuthor()%></span></td>
                                    <td class="text-center">
                                        <span class="price-text"><%=o.getPrice()%> <small>KS</small></span>
                                    </td>
                                    <td class="text-center">
                                        <span class="badge bg-light text-dark border p-2 px-3 shadow-sm" style="border-radius: 5px;">
                                            <i class="fa-solid fa-credit-card me-1 text-primary"></i> <%=o.getPayment()%>
                                        </span>
                                    </td>
                                </tr>
                            <%
                                    }
                                }
                            } else {
                                response.sendRedirect("login.jsp");
                            }
                            %>
                        </tbody>
                    </table>
                </div>
                
                <div class="mt-4 text-center">
                    <a href="index.jsp" class="btn btn-outline-secondary px-4">
                        <i class="fa-solid fa-arrow-left me-2"></i>Back to Home
                    </a>
                </div>
            </div>
        </div>
    </div>

    <c:import url="all_component/footer.jsp" />
</body>
</html>