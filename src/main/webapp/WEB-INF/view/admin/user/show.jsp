<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8"/>
  <title>Manage Users</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <link href="/css/demo.css" rel="stylesheet"/>
</head>
<body>
  <div id="layoutSidenav">
    <div id="layoutSidenav_nav">
      <!-- optional: include sidebar here -->
    </div>

    <div id="layoutSidenav_content">
      <main>
        <div class="container-fluid px-4">
          <h1 class="mt-4">Manage Users</h1>
          <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
            <li class="breadcrumb-item active">Users</li>
          </ol>

          <div class="card mb-4">
            <div class="card-header d-flex justify-content-between align-items-center">
              <span>Table users</span>
              <a href="/admin/user/create" class="btn btn-primary btn-sm">Create a user</a>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-striped table-hover">
                  <thead>
                    <tr>
                      <th>ID</th>
                      <th>Email</th>
                      <th>Full Name</th>
                      <th>Action</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach var="user" items="${users}">
                      <tr>
                        <td>${user.id}</td>
                        <td>${user.email}</td>
                        <td>${user.fullName}</td>
                        <td>
                          <a href="/admin/user/view/${user.id}" class="btn btn-sm btn-success">View</a>
                          <a href="/admin/user/update/${user.id}" class="btn btn-sm btn-warning">Update</a>

                          <form action="/admin/user/delete/${user.id}" method="post" style="display:inline;">
                            <c:if test="${not empty _csrf}">
                              <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            </c:if>
                            <button type="submit" class="btn btn-sm btn-danger"
                                    onclick="return confirm('Bạn chắc chắn muốn xóa user này?');">Delete</button>
                          </form>
                        </td>
                      </tr>
                    </c:forEach>

                    <c:if test="${empty users}">
                      <tr>
                        <td colspan="4" class="text-center">Không có user nào</td>
                      </tr>
                    </c:if>
                  </tbody>
                </table>
              </div>
            </div>
          </div>

        </div>
      </main>
    </div> <!-- #layoutSidenav_content -->
  </div> <!-- #layoutSidenav -->

  <footer class="py-3 bg-white border-top">
    <div class="container-fluid text-muted small">
      &copy; 2026 Laptopshop
    </div>
  </footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>