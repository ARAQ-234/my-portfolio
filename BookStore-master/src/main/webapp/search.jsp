<%@page import="entity.User"%>
<%@page import="entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="DB.DBConnection"%>
<%@page import="DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Search Results</title>
<c:import url="all_component/allCss.jsp" />
<style>
    .crd-ho:hover { 
        background-color: #f7f7f7; 
        transform: scale(1.02); 
        transition: 0.3s; 
    }
</style>
</head>
<body style="background-color: #f0f1f2;">
    <c:import url="all_component/navbar.jsp" />

    <div class="container-fluid p-4 catalog-page">
        <h4 class="text-center mb-4">Search Results for: <span class="text-primary">"${param.ch}"</span></h4>
        <div class="row px-lg-5">
            <%
            String ch = request.getParameter("ch");
            User u = (User) session.getAttribute("userobj");
            BookDAOImpl dao = new BookDAOImpl(DBConnection.getConn());
            List<BookDtls> list = dao.getBookBySearch(ch);
            
            if(list == null || list.isEmpty()) {
            %>
                <div class="col-md-12 text-center py-5">
                    <i class="fa-solid fa-magnifying-glass-blur fa-5x text-muted mb-3"></i>
                    <h3 class="text-muted">စိတ်မရှိပါနဲ့... သင်ရှာနေတဲ့စာအုပ် မရှိသေးပါဘူး။</h3>
                    <a href="index.jsp" class="btn btn-primary mt-3">Back to Home</a>
                </div>
            <%
            } else {
                for (BookDtls b : list) {
            %>
            <div class="col-md-3 mt-3">
                <div class="card crd-ho shadow-sm h-100">
                    <div class="card-body text-center d-flex flex-column">
                        <img alt="<%=b.getBookName()%>" src="book/<%=b.getPhotoName()%>" class="catalog-cover mb-2">
                        <h6 class="mt-2 fw-bold text-dark"><%=b.getBookName()%></h6>
                        <p class="small text-muted mb-1">Author: <%=b.getAuthor()%></p>
                        
                        <div class="mt-auto">
                            <% if ("Old".equals(b.getBookCategory())) { %>
                                <p class="badge bg-warning text-dark">Category: <%=b.getBookCategory()%></p>
                            <% } else { %>
                                <p class="badge bg-info">Category: <%=b.getBookCategory()%></p>
                            <% } %>
                            
                            <div class="d-grid gap-1 mt-2">
                                <% if(u == null) { %>
                                    <a href="login.jsp" class="btn btn-danger btn-sm">Add to Cart</a>
                                <% } else { %>
                                    <a href="cart?bid=<%=b.getBookId()%>&uid=<%=u.getId()%>" class="btn btn-danger btn-sm">Add to Cart</a>
                                <% } %>
                                <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm">View Details</a>
                                <span class="book-price"><%=b.getPrice()%> Ks</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%
                }
            }
            %>
        </div>
    </div>
    
    <div style="margin-top: 100px;">
        <c:import url="all_component/footer.jsp" />
    </div>
</body>
</html>
