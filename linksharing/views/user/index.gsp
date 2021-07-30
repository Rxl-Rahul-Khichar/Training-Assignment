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
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="bootstrap.bundle.min.js / bootstrap.bundle.js"></script>

    <!--Custom styles-->
    <asset:stylesheet src= "Style.css"></asset:stylesheet>

</head>
<body>
<nav class="topnav">
    <a class="active" href="#home">Link Sharing</a>
    <div class = "login-container">
        <form class="form-inline">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>
</nav>

<div class="container">

    <div class="d-flex justify-content-center h-100">
        <div class="cardrecent">
            <div class="card-header">
                <h3>Recent Searches</h3>


            </div>
            <div class="card-body">
                <table>
                    <td rowspan="2" width=25%>
                        <img src="https://image.flaticon.com/icons/png/512/3135/3135715.png" height=120px width=125px>
                    </td>
                    <td width=140px class="text">Rahul Kumar</td>
                    <td width=200px class ="usr">@rkhichar</td>

                    <td width=80px><a href="#">Grails</a></td>
                    <tr>
                        <td colspan="5" height=100px class="para">
                            Grails is Open Source, full stack, web application framework for the JVM Uses Groovy and is built on 							“convention over configuration” philosophy
                        </td>
                    </tr>
                    <td  class="d-flex justify-content-end social_icon">
                        <span><i class="fab fa-facebook-square"></i></span>
                        <span><i class="fab fa-google-plus-square"></i></span>
                        <span><i class="fab fa-twitter-square"></i></span>

                    </td>
                    <td  class = "view"><a href="">view post</a></td>
                </table>
                <table>
                    <td rowspan="2" width=25%>
                        <img src="https://image.flaticon.com/icons/png/512/3135/3135715.png" height=120px width=125px>
                    </td>
                    <td width=140px class="text">Rahul Kumar</td>
                    <td width=200px class ="usr">@rkhichar</td>

                    <td width=80px><a href="#">Grails</a></td>
                    <tr>
                        <td colspan="5" height=100px class="para">
                            Grails is Open Source, full stack, web application framework for the JVM Uses Groovy and is built on 							“convention over configuration” philosophy
                        </td>
                    </tr>
                    <td  class="d-flex justify-content-end social_icon">
                        <span><i class="fab fa-facebook-square"></i></span>
                        <span><i class="fab fa-google-plus-square"></i></span>
                        <span><i class="fab fa-twitter-square"></i></span>

                    </td>
                    <td  class = "view"><a href="">view post</a></td>
                </table>
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
                <div class="dropdown">
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-  							toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Today
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        <a class="dropdown-item" href="#">Action</a>
                        <a class="dropdown-item" href="#">Another action</a>
                        <a class="dropdown-item" href="#">Something else here</a>
                    </div>
                </div>
                <!--<div class="dropdown">
                                    <button class="btn btn-basic dropdown-toggle" type="button" id="about-us" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Today

                                    </button>
                                    <div class="dropdown-menu" >
                                        <a href="#">One Week</a>
                                        <a href="#">One Month</a>
                                        <a href="#">One Year</a>
                                    </div>

                                </div>-->

            </div>
            <div class="card-body">
                <table>
                    <td rowspan="2" width=25%>
                        <img src="https://image.flaticon.com/icons/png/512/3135/3135715.png" height=120px width=125px>
                    </td>
                    <td width=140px class="text">Rahul Kumar</td>
                    <td width=200px class ="usr">@rkhichar</td>

                    <td width=80px><a href="#">Grails</a></td>
                    <tr>
                        <td colspan="5" height=100px class="para">
                            Grails is Open Source, full stack, web application framework for the JVM Uses Groovy and is built 						on “convention over configuration” philosophy
                        </td>
                    </tr>
                    <td  class="d-flex justify-content-end social_icon">
                        <span><i class="fab fa-facebook-square"></i></span>
                        <span><i class="fab fa-google-plus-square"></i></span>
                        <span><i class="fab fa-twitter-square"></i></span>

                    </td>
                    <td  class = "view"><a href="">view post</a></td>
                </table>
                <table>
                    <td rowspan="2" width=25%>
                        <img src="https://image.flaticon.com/icons/png/512/3135/3135715.png" height=120px width=125px>
                    </td>
                    <td width=140px class="text">Rahul Kumar</td>
                    <td width=200px class ="usr">@rkhichar</td>

                    <td width=80px><a href="#">Grails</a></td>
                    <tr>
                        <td colspan="5" height=100px class="para">
                            Grails is Open Source, full stack, web application framework for the JVM Uses Groovy and is built 						on “convention over configuration” philosophy
                        </td>
                    </tr>
                    <td  class="d-flex justify-content-end social_icon">
                        <span><i class="fab fa-facebook-square"></i></span>
                        <span><i class="fab fa-google-plus-square"></i></span>
                        <span><i class="fab fa-twitter-square"></i></span>

                    </td>
                    <td  class = "view"><a href="">view post</a></td>
                </table>
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
                <input type="text" class="form-control" name="email" required placeholder="Email">

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
                <input type="password" class="form-control" name="password" required placeholder="password">
            </div>
            <div class="input-group form-group" for="confirmPassword">
                <div class="input-group-prepend">
                    <span class="input-group-text"><i class="fas fa-key"></i></span>
                </div>
                <input type="password" class="form-control" name="confirmPassword" required placeholder="confirm password">
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
</body>
</html>