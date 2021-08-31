<%--
  Created by IntelliJ IDEA.
  User: rxlogix
  Date: 09/08/21
  Time: 1:31 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%--
  Created by IntelliJ IDEA.
  User: rxlogix
  Date: 26/07/21
  Time: 10:34 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Reset Password</title>

    <!--Bootsrap 4 CDN-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <!--Fontawesome CDN-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="bootstrap.bundle.min.js / bootstrap.bundle.js"></script>

    <!--Custom styles-->
    <asset:stylesheet src= "Style.css"></asset:stylesheet>

</head>
<body>
<nav class="topnav">
    <a class="active" href="/user/index/">Link Sharing</a>
    <div class = "login-container">
    </div>
</nav>
<div class="container">

    <div class="d-flex justify-content-center h-100">


        <div class="cardforgot">
            <div class="card-body">
                <g:form controller="user" action="resetPassword" params="[name:name]">
                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-key"></i></span>
                        </div>
                        <input type="password" class="form-control" name="newPassword" placeholder="password" required>
                    </div>
                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-key"></i></span>
                        </div>
                        <input type="password" class="form-control" name="newConfirmPassword" placeholder="confirm password" required>
                    </div>
                    <p class="txt" id="msg">${flash.msg}</p>
                    <div class="form-group">
                        <input type="submit" value="Save" class="btn float-right login_btn">
                    </div>
                </g:form>
            </div>
        </div>


    </div>
</div>
</body>
</html>