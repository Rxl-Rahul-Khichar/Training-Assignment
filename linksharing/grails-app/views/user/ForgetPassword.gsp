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
    <title>Forgot Password</title>

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
            <div class="card-header">
                <h3>Find Your Account</h3>
            </div>
            <div class="card-body">
                <h8 > Type your Registered Email to find your account </h8>
                <g:form controller="sendLink" action="resetPassword">
                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                        </div>
                        <input type="text" class="form-control"  name="email" required placeholder="Email">
                    </div>
                    <p class="txt" id="ts">${flash.success}</p>
                    <p class="txt" id="th">${flash.error}</p>
                    <div class="form-group">
                        <input type="submit" value="Get Link" class="btn float-right login_btn">
                    </div>

                </g:form>
                <a class="cancel" href="/user/index/">Cancel</a>
            </div>
            <div class="card-footer">

                <div class="d-flex justify-content-center links">
                    Don't have account?<a href="/user/index">Sign Up</a>
                </div>
            </div>
        </div>


    </div>
</div>
</body>
</html>