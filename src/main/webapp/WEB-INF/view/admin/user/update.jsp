<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Update User - Admin</title>
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
                    <h1 class="mt-4">Manage Users</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                        <li class="breadcrumb-item"><a href="/admin/user">Users</a></li>
                        <li class="breadcrumb-item active">Update</li>
                    </ol>

                    <div class="row">
                        <div class="col-md-6 col-12 mx-auto">
                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-user-edit me-1"></i> Update User Info
                                </div>
                                <div class="card-body">
                                    <form:form method="post" action="/admin/user/update" modelAttribute="currentUser">
                                        <form:input type="hidden" path="id" />
                                        <div class="mb-3">
                                            <label class="form-label">Email:</label>
                                            <form:input type="email" class="form-control" path="email" required="true" />
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Password:</label>
                                            <form:input type="password" class="form-control" path="password" 
                                                        placeholder="Leave blank to keep current password" />
                                            <small class="form-text text-muted">Để trống nếu không muốn đổi mật khẩu</small>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Full Name:</label>
                                            <form:input type="text" class="form-control" path="fullName" required="true" />
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Address:</label>
                                            <form:input type="text" class="form-control" path="address" />
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Phone:</label>
                                            <form:input type="tel" class="form-control" path="phone" />
                                        </div>
                                        <button type="submit" class="btn btn-warning">Update</button>
                                        <a href="/admin/user" class="btn btn-secondary">Cancel</a>
                                    </form:form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
            <jsp:include page="../layout/footer.jsp" />
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="/js/scripts.js"></script>
</body>

</html>