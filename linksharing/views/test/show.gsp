<%--
  Created by IntelliJ IDEA.
  User: rxlogix
  Date: 22/07/21
  Time: 10:55 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>
<g:form controller="test" action="action1">
    firstName: <g:textField type="text" name="firstName"/>
   </br>
    lastName: <g:textField type="text" name="lastName"/>
    </br>
    email: <g:textField type="text" name="email"/>
    </br>
    userName: <g:textField type="text" name="userName"/>
    </br>
    password: <g:passwordField type="password" name="password"/>
    </br>
    confirmPassword: <g:passwordField type="password" name="confirmPassword"/>
    </br>
    photo:<g:textField name="photo" type="text"/>
    <g:submitButton value="submit" name="submit"/>
</g:form>

</body>
</html>