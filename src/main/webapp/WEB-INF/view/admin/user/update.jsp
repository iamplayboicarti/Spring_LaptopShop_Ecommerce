<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update User</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/demo.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-6 col-12 mx-auto">
                <h3>Update User</h3>
                <hr />
                
                <form:form method="post" action="/admin/user/update" modelAttribute="currentUser">
                    
                    <!-- Hidden field để gửi ID -->
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>