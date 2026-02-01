<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Create User - Admin</title>
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
                        <li class="breadcrumb-item active">Create</li>
                    </ol>

                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-user-plus me-1"></i> Create a user
                        </div>
                        <div class="card-body">
                            <form:form method="post" action="/admin/user/create" modelAttribute="newUser" enctype="multipart/form-data">
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label">Email:</label>
                                        <form:input type="email" class="form-control" path="email" required="true" />
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label">Password:</label>
                                        <form:input type="password" class="form-control" path="password" required="true" />
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label">Phone number:</label>
                                        <form:input type="tel" class="form-control" path="phone" />
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label">Full Name:</label>
                                        <form:input type="text" class="form-control" path="fullName" required="true" />
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-12 mb-3">
                                        <label class="form-label">Address:</label>
                                        <form:input type="text" class="form-control" path="address" />
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label">Role:</label>
                                        <form:select class="form-select" path="role.name">
                                            <form:option value="USER">USER</form:option>
                                            <form:option value="ADMIN">ADMIN</form:option>
                                        </form:select>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label">Avatar:</label>
                                        <input class="form-control" type="file" id="avatarFile" name="avatarFile" accept=".png, .jpg, .jpeg" />
                                        
                                        <div class="mt-3">
                                            <img id="avatarPreview" src="" alt="Avatar Preview" 
                                                 style="max-height: 250px; display: none; border: 1px solid #ddd; padding: 5px; border-radius: 5px;" />
                                        </div>
                                    </div>
                                </div>

                                <div class="mt-3">
                                    <button type="submit" class="btn btn-primary">Create</button>
                                    <a href="/admin/user" class="btn btn-secondary">Back</a>
                                </div>
                            </form:form>
                        </div>
                    </div>
                </div>
            </main>
            <jsp:include page="../layout/footer.jsp" />
        </div>
    </div>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="/js/scripts.js"></script>

    <script>
        $(document).ready(() => {
            const avatarFile = $("#avatarFile");
            avatarFile.change(function (e) {
                if (e.target.files && e.target.files[0]) {
                    const imgURL = URL.createObjectURL(e.target.files[0]);
                    $("#avatarPreview").attr("src", imgURL);
                    $("#avatarPreview").css({ "display": "block" });
                }
            });
        });
    </script>
</body>
</html>