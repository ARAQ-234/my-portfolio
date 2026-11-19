<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Addresses | Book Store</title>
<c:import url="all_component/allCss.jsp" />
<style>
    body { background-color: #f0f2f5; }
    .card { border: none; border-radius: 12px; }
    .address-card { border-left: 5px solid #303f9f; transition: 0.3s; background: #fff; }
    .address-card:hover { transform: scale(1.01); box-shadow: 0 5px 15px rgba(0,0,0,0.1); }
    .btn-save { background-color: #303f9f; color: white; font-weight: 600; }
    .btn-save:hover { background-color: #1a237e; color: white; }
    .icon-box { color: #303f9f; font-size: 1.1rem; width: 25px; }
    .my-alert { position: fixed; top: 70px; right: 20px; z-index: 1050; }
</style>
</head>
<body style="background-color: #f7f8fa;">

    <c:if test="${empty userobj}">
        <c:redirect url="login.jsp"></c:redirect>
    </c:if>

    <c:import url="all_component/navbar.jsp" />

    <%-- Alert Messages --%>
    <c:if test="${not empty succMsg}">
        <div class="alert alert-success my-alert shadow border-0" role="alert">
            <i class="fa-solid fa-circle-check me-2"></i> ${succMsg}
        </div>
        <c:remove var="succMsg" scope="session" />
    </c:if>

    <div class="container mt-5 mb-5">
        <div class="row">
            <div class="col-md-5">
                <div class="card shadow">
                    <div class="card-body p-4">
                        <h4 class="fw-bold mb-4 text-primary text-center">
                            <i class="fa-solid fa-map-location-dot me-2"></i>Add Address
                        </h4>
                        <form action="add_address" method="post">
                            <input type="hidden" name="uid" value="${userobj.id}">
                            
                            <div class="mb-3">
                                <label class="form-label fw-semibold">Address / Street</label>
                                <input type="text" name="address" class="form-control" placeholder="123 Main St..." required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label fw-semibold">Landmark</label>
                                <input type="text" name="landmark" class="form-control" placeholder="Near Hospital, Junction City..." required>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label fw-semibold">City</label>
                                    <input type="text" name="city" class="form-control" placeholder="City" required>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label fw-semibold">State</label>
                                    <input type="text" name="state" class="form-control" placeholder="State" required>
                                </div>
                            </div>

                            <div class="mb-4">
                                <label class="form-label fw-semibold">Zip Code</label>
                                <input type="text" name="zip" class="form-control" placeholder="11101" required>
                            </div>

                            <div class="d-grid gap-2">
                                <button type="submit" class="btn btn-save btn-lg shadow-sm">Save Address</button>
                                <a href="setting.jsp" class="btn btn-light border">Back to Settings</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div class="col-md-7">
                <div class="card shadow">
                    <div class="card-body p-4">
                        <h4 class="fw-bold mb-4 text-center"><i class="fa-solid fa-house-user me-2 text-success"></i>Saved Addresses</h4>
                        
                        <div class="card mb-3 address-card shadow-sm border-0">
                            <div class="card-body">
                                <div class="d-flex justify-content-between align-items-center mb-3">
                                    <span class="badge bg-primary px-3">Primary</span>
                                    <div class="dropdown">
                                        <button class="btn btn-sm" type="button" data-bs-toggle="dropdown">
                                            <i class="fa-solid fa-ellipsis-vertical"></i>
                                        </button>
                                        <ul class="dropdown-menu">
                                            <li><a class="dropdown-item" href="#"><i class="fa-solid fa-pen-to-square me-2"></i>Edit</a></li>
                                            <li><a class="dropdown-item text-danger" href="#"><i class="fa-solid fa-trash me-2"></i>Delete</a></li>
                                        </ul>
                                    </div>
                                </div>
                                
                                <div class="ps-2">
                                    <p class="mb-1 text-dark fw-bold">${userobj.name}</p>
                                    <p class="mb-1 text-muted small"><i class="fa-solid fa-location-dot icon-box"></i> ${userobj.address}</p>
                                    <p class="mb-1 text-muted small"><i class="fa-solid fa-map-pin icon-box"></i> ${userobj.landmark}</p>
                                    <p class="mb-0 text-muted small"><i class="fa-solid fa-city icon-box"></i> ${userobj.city}, ${userobj.state} - ${userobj.zip}</p>
                                </div>
                            </div>
                        </div>

                        <%-- အကယ်၍ List မရှိသေးပါက ပြသရန် --%>
                        <c:if test="${empty userobj.address}">
                            <div class="text-center py-5">
                                <i class="fa-solid fa-folder-open fa-3x text-light mb-3"></i>
                                <p class="text-muted">No address details saved yet.</p>
                            </div>
                        </c:if>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <c:import url="all_component/footer.jsp" />

	<script>document.querySelectorAll(".my-alert").forEach((alert) => setTimeout(() => alert.classList.add("fade-away"), 2500));</script>
</body>
</html>
