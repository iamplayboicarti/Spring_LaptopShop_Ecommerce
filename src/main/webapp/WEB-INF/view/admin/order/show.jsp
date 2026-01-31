<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="Dự án laptopshop" />
    <meta name="author" content="Dao Anh Tuan" />
    <title>Dashboard - Dao Anh Tuan</title>
    <link href="/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>

<body class="sb-nav-fixed">
    <jsp:include page="../layout/header.jsp" />
    <div id="layoutSidenav">
        <jsp:include page="../layout/sidebar.jsp" />    
        <div id="layoutSidenav_content">
            <main>
<div class="container-fluid px-4">
  <h1 class="mt-4">Manage Orders</h1>
  <ol class="breadcrumb mb-4">
    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
    <li class="breadcrumb-item active">Orders</li>
  </ol>

  <div class="card mb-4">
    <div class="card-header d-flex justify-content-between align-items-center">
      <span>Orders table</span>
      <a href="/admin/order/create" class="btn btn-primary btn-sm">Create Order</a>
    </div>
    <div class="card-body">
      <!-- Bỏ phần bảng vào đây (table hiện tại của bạn) -->
      <!-- Ví dụ: -->
      <div class="table-responsive">
        <table class="table table-striped table-hover">
          <thead>
            <tr>
              <th>ID</th>
              <th>User</th>
              <th>Total</th>
              <th>Status</th>
              <th>Created At</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="order" items="${orders}">
              <tr>
                <td>${order.id}</td>
                <td>
                  <c:choose>
                    <c:when test="${not empty order.user}">
                      ${order.user.fullName} (<small>${order.user.email}</small>)
                    </c:when>
                    <c:otherwise>—</c:otherwise>
                  </c:choose>
                </td>
                <td><fmt:formatNumber value="${order.totalPrice}" type="currency" /></td>
                <td>${order.status}</td>
                <td><fmt:formatDate value="${order.createdAt}" pattern="yyyy-MM-dd HH:mm" /></td>
                <td>
                  <a href="/admin/order/view/${order.id}" class="btn btn-sm btn-success">View</a>
                  <a href="/admin/order/update/${order.id}" class="btn btn-sm btn-warning">Edit</a>
                  <form action="/admin/order/delete/${order.id}" method="post" style="display:inline;">
                    <c:if test="${not empty _csrf}">
                      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    </c:if>
                    <button type="submit" class="btn btn-sm btn-danger"
                            onclick="return confirm('Bạn có chắc chắn muốn xóa đơn hàng #${order.id}?');">
                      Delete
                    </button>
                  </form>
                </td>
              </tr>
            </c:forEach>

            <c:if test="${empty orders}">
              <tr>
                <td colspan="6" class="text-center">Không có đơn hàng nào</td>
              </tr>
            </c:if>
          </tbody>
        </table>
      </div>
      <!-- Kết thúc bảng -->
    </div>
  </div>
</div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
    <script src="/js/scripts.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <script src="/assets/demo/chart-area-demo.js"></script>
    <script src="/assets/demo/chart-bar-demo.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
        crossorigin="anonymous"></script>
    <script src="/js/datatables-simple-demo.js"></script>
</body>

</html>