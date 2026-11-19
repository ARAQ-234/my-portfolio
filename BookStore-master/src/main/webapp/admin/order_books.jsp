<%@page import="entity.Book_order"%>
<%@page import="java.util.List"%>
<%@page import="DB.DBConnection"%>
<%@page import="DAO.OrderImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: All Orders</title>
<c:import url="allCss.jsp" />
<style>
    .admin-table-card {
        border-radius: 12px;
        border: none;
        box-shadow: 0 5px 15px rgba(0,0,0,0.1);
    }
    .thead-dark-custom {
        background-color: #2c3e50;
        color: white;
    }
</style>
</head>
<body style="background-color: #f8f9fa;">
    <c:import url="navbar.jsp" />

    <div class="container-fluid p-4">
        <h3 class="text-center fw-bold mb-4">Customer Orders Management</h3>
        
        <div class="card admin-table-card">
            <div class="card-body p-0">
                <table class="table table-hover mb-0">
                    <thead class="thead-dark-custom text-center">
                        <tr>
                            <th>Order ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Book Name</th>
                            <th>Price</th>
                            <th>Payment</th>
                        </tr>
                    </thead>
                    <tbody class="text-center">
                        <%
                        OrderImpl dao = new OrderImpl(DBConnection.getConn());
                        List<Book_order> list = dao.getAllOrder();
                        for (Book_order o : list) {
                        %>
                        <tr>
                            <td><b class="text-primary">#<%=o.getOrderId()%></b></td>
                            <td><%=o.getUserName()%></td>
                            <td><%=o.getEmail()%></td>
                            <td><%=o.getPhno()%></td>
                            <td><%=o.getBookName()%></td>
                            <td><%=o.getPrice()%> KS</td>
                            <td>
                                <span class="badge bg-success"><%=o.getPayment()%></span>
                            </td>
                        </tr>
                        <%
                        }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>