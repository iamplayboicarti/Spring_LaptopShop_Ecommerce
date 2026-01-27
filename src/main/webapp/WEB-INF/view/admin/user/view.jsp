<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View User</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/demo.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-6 col-12 mx-auto">
                <h3>User Detail</h3>
                <hr />
                
                <div class="card">
                    <div class="card-header">
                        User ID: ${id}
                    </div>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">
                            <strong>Email:</strong> ${user.email}
                        </li>
                        <li class="list-group-item">
                            <strong>Full Name:</strong> ${user.fullName}
                        </li>
                        <li class="list-group-item">
                            <strong>Address:</strong> ${user.address}
                        </li>
                        <li class="list-group-item">
                            <strong>Phone:</strong> ${user.phone}
                        </li>
                    </ul>
                </div>
                
                <div class="mt-3">
                    <a href="/admin/user" class="btn btn-secondary">Back</a>
                    <a href="/admin/user/update/${user.id}" class="btn btn-warning">Update</a>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>