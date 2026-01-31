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
  <h1 class="mt-4">Manage Products</h1>
  <ol class="breadcrumb mb-4">
    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
    <li class="breadcrumb-item active">Products</li>
  </ol>

  <div class="card mb-4">
    <div class="card-header d-flex justify-content-between align-items-center">
      <span>Products table</span>
      <a href="/admin/product/create" class="btn btn-primary btn-sm">Create Product</a>
    </div>
    <div class="card-body">
      <!-- Bỏ phần bảng product hiện tại của bạn ở đây -->
      <div class="table-responsive">
        <table class="table table-striped table-hover align-middle">
          <thead>
            <tr>
              <th>ID</th>
              <th>Image</th>
              <th>Name</th>
              <th>Price</th>
              <th>Quantity</th>
              <th>Sold</th>
              <th>Factory</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="p" items="${products}">
              <tr>
                <td>${p.id}</td>
                <td>
                  <c:if test="${not empty p.image}">
                    <img src="${p.image}" alt="${p.name}" style="height:40px; object-fit:cover;" />
                  </c:if>
                </td>
                <td>${p.name}</td>
                <td><fmt:formatNumber value="${p.price}" type="currency" /></td>
                <td>${p.quantity}</td>
                <td>${p.sold}</td>
                <td>${p.factory}</td>
                <td>
                  <a href="/admin/product/view/${p.id}" class="btn btn-sm btn-success">View</a>
                  <a href="/admin/product/update/${p.id}" class="btn btn-sm btn-warning">Edit</a>
                  <form action="/admin/product/delete/${p.id}" method="post" style="display:inline;">
                    <c:if test="${not empty _csrf}">
                      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    </c:if>
                    <button type="submit" class="btn btn-sm btn-danger"
                            onclick="return confirm('Bạn chắc chắn muốn xóa sản phẩm ${p.name}?');">
                      Delete
                    </button>
                  </form>
                </td>
              </tr>
            </c:forEach>

            <c:if test="${empty products}">
              <tr>
                <td colspan="8" class="text-center">Không có sản phẩm nào</td>
              </tr>
            </c:if>
          </tbody>
        </table>
      </div>
      <!-- Kết thúc bảng -->
    </div>
  </div>
</div>
            </main>
            <jsp:include page="../layout/footer.jsp" />
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