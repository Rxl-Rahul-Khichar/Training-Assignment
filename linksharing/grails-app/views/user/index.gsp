<%--
  Created by IntelliJ IDEA.
  User: rxlogix
  Date: 22/07/21
  Time: 4:42 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>

    <!--Bootsrap 4 CDN-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <!--Fontawesome CDN-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!--Custom styles-->
    <asset:stylesheet src= "Style.css"></asset:stylesheet>
    <asset:stylesheet src= "jquery.twbsPagination.js"></asset:stylesheet>

</head>
<body>
<nav class="topnav">
    <a class="active" href="#home">Link Sharing</a>
    <div class = "login-container">
        %{--<form class="form-inline">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>--}%
    </div>
</nav>
<p class="txt" id="mess">${flash.mess}</p>
<p class="txt" id="mes">${flash.message}</p>
<div class="container">

    <div class="d-flex justify-content-center h-100">
        <div class="cardrecent">
            <div class="card-header">
                <h3>Recent Shares</h3>
            </div>
            <div class="card-body" >
                <g:each in="${resource}" var="it" >
                    <table>
                        <tr>
                            <td rowspan="3"  width=23%>
                                <g:link controller="dashboard" action="viewUserProfile" params="[id:it.createdBy.id]">
                                    <asset:image src="${it.createdBy.photo}" height="120px" width="115px"/>
                                </g:link>
                            </td>
                            <td width=auto class="text">${it.createdBy.firstName}</td>
                            <td width=120px class ="usr">@${it.createdBy.userName}</td>
                            <td width= 120px></td>
                            <td width=120px>
                                <g:link controller="topic" action="viewTopic" params="[id:it.topic.id]">${it.topic.topicName}</g:link>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="10" height=60px class="para">
                                ${it.description}
                            </td>
                        </tr>
                        <tr>
                            <td  class="d-flex justify-content-end social_icon">
                                <span><i class="fab fa-facebook-square"></i></span>
                                <span><i class="fab fa-google-plus-square"></i></span>
                                <span><i class="fab fa-twitter-square"></i></span>
                            </td>
                            <td><g:link controller="resources" action="viewPost" params="[id:it.id]">View Post</g:link>
                            <td colspan="8" class="para">${((date.getTime() -it.dateCreated.getTime())/60000).toBigInteger()} minutes ago</td>
                        </tr>
                    </table>
                    <hr>
                </g:each>
%{--                <g:paginate total="${resource.size()}"/>--}%
             %{-- <g:paginate next="Forward" prev="Back"
                         maxsteps="0" max="1" offset="1" controller="user"
                         action="index" total="${resource.size()}" />--}--}%
                %{--<td class="paginateButtons">
                    <g:paginate total="${resource.size()}" max="2" offset="${session.recentPagination?.offset}"/></td>--}%
                %{--<div class="pagination">
                    <a href="#">&laquo;</a>
                    <a href="#" class="active">1</a>
                    <a href="#">2</a>
                    <a href="#">3</a>
                    <a href="#">4</a>
                    <a href="#">&raquo;</a>
                </div>--}%
            </div>

        </div>

        <div class="cardlogin">
            <div class="card-header">
                <h3>! Welcome Back !</h3>
            </div>
            <div class="card-body">
                <g:form controller="user" action="loginUser" method="POST">
                    <div class="input-group form-group" for="userName">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                        </div>
                        <input type="text" name="userName" class="form-control" placeholder="username" required>

                    </div>
                    <div class="input-group form-group" for="password">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-key"></i></span>
                        </div>
                        <input type="password" name="password" class="form-control" placeholder="password" required>

                    </div>
                    <span>
                        <p class="txt" id="message">${flash.message}</p>
                        <p class="txt" id="message1">${flash.message1}</p>
                    </span>
                    <div class="row align-items-center remember">
                        <input type="checkbox">Remember Me </input>
                    </div>
                    <div class="form-group">
                        <input type="submit" name="submitButton" value="Login" class="btn float-right login_btn">
                    </div>
                </g:form>
            </div>
            <div class="card-footer">

                <div class="d-flex justify-content-center">

                    <g:link controller="user" action="forgetPassword">Forgot your password?</g:link>

                </div>
            </div>
        </div>


        <div class="cardtop">
            <div class="card-header">
                <h3>Top post</h3>
                <div class="dropdown" >
                                    <button class="btn btn-basic dropdown-toggle" type="button" id="about-us" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Today
                                    </button>
                                    <div class="dropdown-menu w-50">
                                        <a class="dropdown-item" href="#">One Week</a>
                                        <a class="dropdown-item" href="#">One Month</a>
                                        <a class="dropdown-item" href="#">One Year</a>
                                    </div>

                                </div>

            </div>
            <div class="card-body">
                <g:each in="${top}" var="it" >
                    <table>
                        <tr>
                            <td rowspan="3"  width=23%>
                                <asset:image src="${it.createdBy.photo}" height="120px" width="115px"/>
                            </td>
                            <td width=auto class="text">${it.createdBy.firstName}</td>
                            <td width=120px class ="usr">@${it.createdBy.userName}</td>
                            <td width= 120px></td>
                            <td width=120px>
                                <g:link controller="topic" action="viewTopic" params="[id:it.topic.id]">${it.topic.topicName}</g:link>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="10" height=60px class="para">
                                ${it.description}
                            </td>
                        </tr>
                        <tr>
                            <td  class="d-flex justify-content-end social_icon">
                                <span><i class="fab fa-facebook-square"></i></span>
                                <span><i class="fab fa-google-plus-square"></i></span>
                                <span><i class="fab fa-twitter-square"></i></span>
                            </td>
                            <td><g:link controller="resources" action="viewPost" params="[id:it.id]">View Post</g:link>
                        </tr>
                    </table>
                    <hr>
                </g:each>
                <div class="pagination">
                    <a href="#">&laquo;</a>
                    <a href="#" class="active">1</a>
                    <a href="#">2</a>
                    <a href="#">3</a>
                    <a href="#">4</a>
                    <a href="#">&raquo;</a>
                </div>
            </div>

        </div>

    </div>
</div>
<div class="cardsignup">
    <div class="card-header">
        <h3>Register</h3>
    </div>
    <div class="card-body">
        <g:form controller="user" action="registerUser" enctype='multipart/form-data'>
            <span>
                <p class="txt" id="success">${flash.success}</p>
                <p class="txt" id="error">${flash.error}</p>
            </span>
            <div class="input-group form-group" for="firstName">
                <div class="input-group-prepend">
                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                </div>
                <input type="text" class="form-control" name="firstName" required placeholder="First Name">

            </div>
            <div class="input-group form-group" for="lastName">
                <div class="input-group-prepend">
                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                </div>
                <input type="text" class="form-control" name="lastName"  placeholder="Last Name">

            </div>

            <div class="input-group form-group" for="email">
                <div class="input-group-prepend">
                    <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                </div>
                <input type="email" class="form-control" name="email" required title="please type valid email" placeholder="Email">

            </div>
            <p class="txt" id="message2">${flash.message2}</p>
            <div class="input-group form-group" for="userName">
                <div class="input-group-prepend">
                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                </div>
                <input type="text" class="form-control" name="userName" required placeholder="username">

            </div>
            <p class="txt" id="message3">${flash.message3}</p>
            <div class="input-group form-group" for="password">
                <div class="input-group-prepend">
                    <span class="input-group-text"><i class="fas fa-key"></i></span>
                </div>
                <input type="password" class="form-control" name="password" id="myInput" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required placeholder="password">
            </div>
            <div class="text">
                <input type="checkbox" onclick="myFunction()">Show Password
            </div>
            <div class="input-group form-group" for="confirmPassword">
                <div class="input-group-prepend">
                    <span class="input-group-text"><i class="fas fa-key"></i></span>
                </div>
                <input type="password" class="form-control" name="confirmPassword"  pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required placeholder="confirm password">
            </div>
            <p class="txt" id="message4">${flash.message4}</p>
            <div class="input-group form-group" for="photo">
                <div class="input-group-prepend">
                    <span class="input-group-text"><i class="fas fa-images"></i></span>
                </div>
                <input type="file" class="form-control" name="image" placeholder="choose" accept="image/*" ><br>

            </div>

            <div class="form-group">
                <input type="submit" value="Sign Up" name="submitButton" class="btn float-right login_btn">
            </div>
        </g:form>
    </div>

</div>
<script>
    function myFunction() {
        var x = document.getElementById("myInput");
        if (x.type === "password") {
            x.type = "text";
        } else {
            x.type = "password";
        }
    }
</script>
<script>
    $('#pagination-demo').twbsPagination({
        totalPages: 3,
        startPage: 1,
        visiblePages: 3,
        initiateStartPageClick: true,
        hideOnlyOnePage: false,
        href: false,
        pageVariable: '{{page}}',
        totalPagesVariable: '{{total_pages}}',
        page: null,
        first: 'First',
        prev: 'Previous',
        next: 'Next',
        last: 'Last',
        loop: false,
        beforePageClick: null,
        onPageClick: function (event, page) {
            $('.page-active').removeClass('page-active');
            $('#page'+page).addClass('page-active');
        },
        paginationClass: 'pagination',
        nextClass: 'page-item next',
        prevClass: 'page-item prev',
        lastClass: 'page-item last',
        firstClass: 'page-item first',
        pageClass: 'page-item',
        activeClass: 'active',
        disabledClass: 'disabled',
        anchorClass: 'page-link'
    });

</script>
</body>
</html>