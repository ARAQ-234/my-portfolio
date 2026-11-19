<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<header class="bg-white border-bottom">
  <div class="container py-3">
    <div class="row align-items-center g-3">
      <div class="col-6 col-lg-3"><a class="text-decoration-none brand-mark fs-3" href="index.jsp"><i class="fa-solid fa-book-open-reader me-2"></i>BookStore</a></div>
      <div class="col-12 col-lg-5 order-3 order-lg-2">
        <form class="d-flex" action="search.jsp" method="get" role="search">
          <input class="form-control me-2" type="search" name="ch" placeholder="Search books or authors" aria-label="Search books">
          <button class="btn btn-primary px-3" type="submit"><i class="fa-solid fa-magnifying-glass"></i><span class="d-none d-sm-inline ms-2">Search</span></button>
        </form>
      </div>
      <div class="col-6 col-lg-4 order-2 order-lg-3 text-end">
        <c:choose>
          <c:when test="${not empty userobj}">
            <a href="checkout.jsp" class="btn btn-outline-success me-1" aria-label="Shopping cart"><i class="fa-solid fa-bag-shopping"></i><span class="d-none d-md-inline ms-2">Cart</span></a>
            <a href="setting.jsp" class="btn btn-light border me-1"><i class="fa-regular fa-circle-user me-1"></i><span class="d-none d-md-inline">${userobj.name}</span></a>
            <a href="logout" class="btn btn-outline-secondary"><span class="d-none d-md-inline">Logout</span><i class="fa-solid fa-arrow-right-from-bracket d-md-none"></i></a>
          </c:when>
          <c:otherwise>
            <a href="login.jsp" class="btn btn-outline-success">Login</a>
            <a href="register.jsp" class="btn btn-primary ms-1">Join free</a>
          </c:otherwise>
        </c:choose>
      </div>
    </div>
  </div>
</header>
<nav class="navbar navbar-expand-lg navbar-dark bg-custom sticky-top shadow-sm">
  <div class="container">
    <span class="navbar-brand d-lg-none text-white">Browse</span>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item"><a class="nav-link" href="index.jsp"><i class="fa-solid fa-house me-1"></i>Home</a></li>
        <li class="nav-item"><a class="nav-link" href="all_recent_book.jsp">Recent books</a></li>
        <li class="nav-item"><a class="nav-link" href="all_new_book.jsp">New arrivals</a></li>
        <li class="nav-item"><a class="nav-link" href="all_old_book.jsp">Pre-loved books</a></li>
      </ul>
      <a href="help_center.jsp" class="nav-link"><i class="fa-regular fa-circle-question me-1"></i>Help center</a>
    </div>
  </div>
</nav>
