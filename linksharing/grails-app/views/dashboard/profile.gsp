<%--
  Created by IntelliJ IDEA.
  User: rxlogix
  Date: 06/08/21
  Time: 2:55 PM
--%>

<%@ page import="Enums.VisibilityEnum" contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Profile</title>

    <!--Bootsrap 4 CDN-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-    				MCw98SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <!--Fontawesome CDN-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="bootstrap.bundle.min.js / bootstrap.bundle.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!--Custom styles-->
    <asset:stylesheet src= "profileStyle.css"></asset:stylesheet>

</head>
<body>
<g:if test="${!session.user}">
    <nav class="topnav">
        <a class="active" href="/user/index/">Link Sharing</a>
        <g:form controller="user" action="index" class = "login-container">
            <button  href="/user/index/" class="btn btn-outline-success my-2 my-sm-0" type="submit">Sign In</button>
        </g:form>
    </nav>
</g:if>
<g:else>
    <nav class="navbar navbar-icon-top navbar-expand-lg navbar-dark">
        <a class="navbar-brand" href="/dashboard/dashboard">Link Sharing</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul></ul><ul> </ul><ul></ul> <ul> </ul><ul></ul><ul> </ul><ul></ul><ul> </ul><ul></ul><ul></ul><ul></ul>
            <g:if test="${session.user.admin}">
                <g:form controller="search" action="search" class="form-inline my-1 my-sm-1-0">
                    <input class="form-control my-1 my-sm-1 " type="text" placeholder="Search" aria-label="Search" name="word">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </g:form>
            </g:if>
            <g:else>
                <g:form controller="search" action="search" class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search" name="word" required>
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </g:form>
            </g:else>
            <ul></ul>
            <ul class="navbar-nav ">
                <li class="nav-item">
                    <button type="button" class="btn btn-info btn-warning" data-toggle="modal" title="New Topic" data-target="#topicModal">
                        <i class="fas fa-plus-circle">
                        </i>
                    </button>
                    <div class="modal" id="topicModal">
                        <div class="cardtopic">
                            <div class="card-header">
                                <button type="button" class="close" style="margin-top:2px;" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Create Topic</h4>
                            </div>
                            <div class="card-body">
                                <g:form id ="topicForm" name="topicForm" >
                                    Name *:
                                    <input class="form-control" placeholder="Topic Name" required type="text" name="topicName"/>
                                    Visibility *:
                                    <select class="form-control" name="visibility">
                                        <option>PUBLIC</option>
                                        <option>PRIVATE</option>
                                    </select>
                                </g:form>
                                <input type="submit" id="save" class="btn btn-default" style="float: right; margin-top: 5px;"/>
                                <button type="button" class="btn btn-default" data-dismiss="modal" style="float:left; margin-top: 5px;">Close</button>
                            </div>

                        </div>
                    </div>
                </li>
                <li class="nav-item">
                    <button type="button" class="btn btn-info btn-warning" data-toggle="modal" title="invite" data-target="#invite">
                        <i class="fas fa-envelope">
                        </i>
                    </button>
                    <div class="modal" id="invite">
                        <div class="cardtopic">
                            <div class="card-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title" >Send Invitation</h4>
                            </div>
                            <div class="card-body">
                                <g:form class="form-horizontal" controller="sendLink" action="sendInvite" name="invitation">
                                    <div class="form-group">
                                        <div class="col-sm-2 control-label">Email</div>
                                        <div class="col-sm-12">
                                            <input type="email" name="email" required placeholder="Enter email" class="form-control col-sm-12" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-2 control-label">Topic</div>
                                        <div class="col-sm-12">
                                            <g:select name="topicName" from="${subscription.topic.topicName}" class="dropdown-toggle btn btn-default col-sm-12"></g:select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-2 col-sm-12">
                                            <button type="submit" class="btn btn-default" style="float:right;">Send</button>
                                        </div>
                                    </div>
                                </g:form>


                            </div>

                        </div>
                    </div>
                </li>
                <li class="nav-item">
                    <button type="button" class="btn btn-warning" data-toggle="modal" title="Upload Link" data-target="#uploadLink">
                        <i class="fas fa-link">
                        </i>
                    </button>
                    <div class="modal" id="uploadLink">
                        <div class="cardtopic">
                            <div class="card-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Upload Link</h4>
                            </div>
                            <div class="card-body">
                                <g:uploadForm  class="form-horizontal" controller="Resources" action="saveLink" name="documentCreate" enctype="multipart/form-data" method="POST">
                                    Link *:
                                    <input type="link" class="form-control" required id="link" placeholder="Link" name="link">
                                    Description *:
                                    <textarea class="form-control" required id="select" name="description"></textarea>
                                    <div class="form-group">
                                        <div class="col-sm-2 control-label">Topic</div>
                                        <div class="col-sm-12">
                                            <g:select name="topicName" from="${subscription.topic.topicName}" class="dropdown-toggle btn btn-default col-sm-12"></g:select>
                                        </div>
                                    </div>
                                    <input type="submit" value="Save"   class="btn btn-default" style="float: right; margin-top:-5px;"/>
                                </g:uploadForm>
                            </div>

                        </div>
                    </div>
                </li>

                <li class="nav-item">
                    <button type="button" class="btn btn-info btn-warning" data-toggle="modal" title="Upload Document" data-target="#uploadDocument">
                        <i class="fas fa-file">
                        </i>
                    </button>
                    <div class="modal" id="uploadDocument">
                        <div class="cardtopic">
                            <div class="card-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Upload Document</h4>
                            </div>
                            <div class="card-body">
                                <g:uploadForm  class="form-horizontal" controller="Resources" action="saveDocument" name="documentCreate" enctype="multipart/form-data" method="POST">
                                    Document *:
                                    <input type="file" class="form-control" required id="doc" placeholder="choose" name="document">
                                    Description *:
                                    <textarea class="form-control" required id="select" name="description"></textarea>
                                    <div class="form-group">
                                        <div class="col-sm-2 control-label">Topic</div>
                                        <div class="col-sm-12">
                                            <g:select name="topicName" from="${subscription.topic.topicName}" class="dropdown-toggle btn btn-default col-sm-12"></g:select>
                                        </div>
                                    </div>
                                    <input type="submit" value="Save"   class="btn btn-default" style="float: right; margin-top:-5px;"/>

                                </g:uploadForm>

                            </div>

                        </div>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <button type="button" class="btn btn-info btn-warning" id="navbarDropdownMenuLink" data-toggle="dropdown" title="Profile" data-target="collapse" aria-expanded="true" aria-haspopup="true">
                        <i class="photo" style="text-align:center;">
                            <asset:image src="${session.user.photo}" height="25px" width="25px"/>
                        </i>
                        ${session.user.userName}
                    </button>

                    <g:if test="${session.user.admin}">
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" href="/user/userProfile">profile</a>
                            <a class="dropdown-item" href="/user/showUserList">Users</a>
                            <a class="dropdown-item" href="/topic/showTopicList">topic</a>
                            <a class="dropdown-item" href="/resources/showPostList">posts</a>
                            <a class="dropdown-item" href="/user/logout">Logout</a>
                        </div>
                    </g:if>
                    <g:else>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" href="/user/userProfile">profile</a>
                            %{--<a class="dropdown-item" href="">Users</a>
                            <a class="dropdown-item" href="">topic</a>
                            <a class="dropdown-item" href="">posts</a>--}%
                            <a class="dropdown-item" href="/user/logout">Logout</a>
                        </div>
                    </g:else>
                </li>
            </ul>
        </div>
    </nav>
</g:else>
<div class="container">
    <div class="d-flex justify-content-center h-100">
        <div class="cardprofile">
            <div class="card-body">
                <table  style="width:100%">
                    <tr>
                        <td rowspan="4" colspan="3" width="10%">
                             <asset:image src="${user.photo}" height="120px" width="115px" style="margin-right:10px"/>
                        </td>
                        <td width=200px class="text" colspan="5">${user.firstName} ${user.lastName}</td>
                    </tr>
                    <tr>
                        <td width=150px class="text-muted" colspan="3">@${user.userName}</td>
                    </tr>
                    <tr>
                        <td width=150px class="txt">Subscriptions</td>
                        <td width="150px" class="txt">topic</td>
                    </tr>
                    <tr>
                        <td width=150px class="txt"><a href="">${user.subscriptions.size()}</a></td>
                        <td width=150px class="txt"><a href="">${user.topics.size()}</a></td>
                    </tr>
                </table>
            </div>
        </div>

        <div class="cardlogin">
            <div class="card-header">
                <h8 syle="float:left">Posts</h8>
            </div>
            <div class="card-body">
                <g:each in="${resource}" var="it">
                    <g:if test="${session.user}">
                    <g:if test="${it.createdBy.userName.equals(session.user.userName)}">
                        <table>
                      <td width=120px colspan="5">
                          <g:link controller="topic" action="viewTopic" params="[id:it.topic.id]">${it.topic.topicName}</g:link>
                      </td>
                    <tr>
                        <td colspan="5" height=80px class="para">
                            ${it.description}
                        </td>
                    </tr>
                    <tr>
                        <td class="d-flex justify-content-end social_icon">
                            <span><i class="fab fa-facebook-square"></i></span>
                            <span><i class="fab fa-google-plus-square"></i></span>
                            <span><i class="fab fa-twitter-square"></i></span>

                        </td>
                        <td width="120px"></td>
                        <td width="210px">
                            <g:if test="${it.hasProperty("filePath")}">
                                <g:link controller="resources" action="downloadFile" params="[id:it.id , flag:1]">Download</g:link>
                            </g:if>
                            <g:else>
                                <a href="${it.url}" target="_blank">Open Link</a>
                            </g:else>
                        </td>
                        <td><g:link controller="resources" action="viewPost" params="[id:it.id]">View Post</g:link>
                        </td>
                    </tr>
                </table>
                    </g:if>
                    <g:else>
                        <g:if test="${it.topic.visibility.equals(Enums.VisibilityEnum.PUBLIC)}">
                        <table>
                            <td width=120px>
                                <g:link controller="topic" action="viewTopic" params="[id:it.topic.id]">${it.topic.topicName}</g:link>
                            </td>
                            <tr>
                                <td colspan="5" height=80px class="para">
                                    ${it.description}
                                </td>
                            </tr>
                            <tr>
                                <td class="d-flex justify-content-end social_icon">
                                    <span><i class="fab fa-facebook-square"></i></span>
                                    <span><i class="fab fa-google-plus-square"></i></span>
                                    <span><i class="fab fa-twitter-square"></i></span>

                                </td>
                                <td width="120px"></td>
                                <td width="210px">
                                    <g:if test="${it.hasProperty("filePath")}">
                                        <g:link controller="resources" action="downloadFile" params="[id:it.id , flag:1]">Download</g:link>
                                    </g:if>
                                    <g:else>
                                        <a href="${it.url}" target="_blank">Open Link</a>
                                    </g:else>
                                </td>
                                <td><g:link controller="resources" action="viewPost" params="[id:it.id]">View Post</g:link>
                                </td>
                            </tr>

                        </table>
                            </g:if>
                    </g:else>
                    </g:if>
                    <g:else>
                        <g:if test="${it.topic.visibility.equals(Enums.VisibilityEnum.PUBLIC)}">
                            <table>
                                <td width=120px>
                                    <g:link controller="topic" action="viewTopic" params="[id:it.topic.id]">${it.topic.topicName}</g:link>
                                </td>
                                <tr>
                                    <td colspan="5" height=80px class="para">
                                        ${it.description}
                                    </td>
                                </tr>
                                <tr>
                                    <td class="d-flex justify-content-end social_icon">
                                        <span><i class="fab fa-facebook-square"></i></span>
                                        <span><i class="fab fa-google-plus-square"></i></span>
                                        <span><i class="fab fa-twitter-square"></i></span>

                                    </td>
                                    <td width="120px"></td>
                                    <td width="210px">
                                        <g:if test="${it.hasProperty("filePath")}">
                                            <g:link controller="resources" action="downloadFile" params="[id:it.id , flag:1]">Download</g:link>
                                        </g:if>
                                        <g:else>
                                            <a href="${it.url}" target="_blank">Open Link</a>
                                        </g:else>
                                    </td>
                                    <td><g:link controller="resources" action="viewPost" params="[id:it.id]">View Post</g:link>
                                    </td>
                                </tr>

                            </table>
                        </g:if>
                    </g:else>
                </g:each>
                <hr>

            </div>

        </div>


        <div class="cardtop">
            <div class="card-header">
                <h8 syle="float:left">Topics</h8>
                <div style="float:right"><a href=""> </a></div><br>

            </div>
            <div class="card-body">
                <g:each in="${topic}" var="it">
                    <g:if test="${session.user}">
                    <g:if test="${it.createdBy.userName.equals(session.user.userName)}">
                        <table  style="width:100%">
                    <tr>
                        <td width=500px >
                            <g:link controller="topic" action="viewTopic" params="[id:it.id]" >${it.topicName} (${it.visibility})</g:link>
                        </td>
                        <td></td>
                        <td width=300px class="txxt">Subscriptions</td>
                        <td></td>
                        <td width="150px" class="txxt">Post</td>
                    </tr>
                    <tr>
                        <td width=200px><g:form  controller="subscription" action="changeVisibility">
                            <g:field type="hidden" name="id1" value="${it.id}"></g:field>
                            <g:select onChange="submit()" class ="form-control" name="visibility" from="${['PUBLIC','PRIVATE']}"
                                      value="${it.visibility}" />
                        </g:form> </td>
                        <td>
                            <button type="button" class="btn btn-info btn-warning" data-toggle="modal" title="invite" data-target="#topicinvite">
                                <i class="fas fa-envelope">
                                </i>
                            </button>
                            <div class="modal" id="editinvite">
                                <div class="cardbodyinvite">
                                    <div class="card-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title" >Send Invitation</h4>
                                    </div>
                                    <div class="card-body">
                                        <g:form class="form-horizontal" controller="sendingLink" action="sendInvite" name="invitation">
                                            <div class="form-group">
                                                <div class="col-sm-2 control-label">Email</div>
                                                <div class="col-sm-12">
                                                    <input type="email" name="email" required placeholder="Enter email" class="form-control col-sm-12" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-sm-2 control-label">Topic</div>
                                                <div class="col-sm-12">
                                                    <input type="text" name="topicName" required placeholder="Topic Name" class="form-control col-sm-12" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-sm-offset-2 col-sm-12">
                                                    <button type="submit" class="btn btn-default" style="float:right;">Send</button>
                                                </div>
                                            </div>
                                        </g:form>


                                    </div>

                                </div>
                            </div>
                        </td>
                        <td width=30px class="txxt"><a href="">${it.subscribers.size()}</a></td>
                        <td></td>
                        <td width=150px class="txxt"><a href="">${it.resources.size()}</a></td>

                    </tr>
                </table>
                    <hr>
                    </g:if>
                    <g:else>
                        <g:if test="${it.visibility.equals(Enums.VisibilityEnum.PUBLIC)}">
                        <table  style="width:100%">
                            <tr>
                                <td width=500px >
                                    <g:link controller="topic" action="viewTopic" params="[id:it.id]" >${it.topicName} (${it.visibility})</g:link>
                                </td>
                                <td></td>
                                <td width=300px class="txxt">Subscriptions</td>
                                <td></td>
                                <td width="150px" class="txxt">Post</td>
                            </tr>
                            <tr>
                                <g:if test="${it.subscribers.user.userName.contains(session.user.userName)}">
                                <td width=200px><g:form controller="subscription" action="changeSeriousness" class="topicForm">
                                    <g:field type="hidden" name="id" value="${it.id}"></g:field>
                                    <g:select  onChange="submit()" class="form-control" name="seriousness" from="${['SERIOUS','CASUAL','VERY_SERIOUS']}"
                                               value="${com.rxlogix.Subscription.findByUserAndTopic(com.rxlogix.User.findByUserName(session.user.userName),it).seriousness}" />
                                </g:form> </td>
                                    <td>
                                        <button type="button" class="btn btn-info btn-warning" data-toggle="modal" title="invite" data-target="#topicinvite">
                                            <i class="fas fa-envelope">
                                            </i>
                                        </button>
                                        <div class="modal" id="einvite">
                                            <div class="cardbodyinvite">
                                                <div class="card-header">
                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                    <h4 class="modal-title" >Send Invitation</h4>
                                                </div>
                                                <div class="card-body">
                                                    <g:form class="form-horizontal" controller="sendingLink" action="sendInvite" name="invitation">
                                                        <div class="form-group">
                                                            <div class="col-sm-2 control-label">Email</div>
                                                            <div class="col-sm-12">
                                                                <input type="email" name="email" required placeholder="Enter email" class="form-control col-sm-12" />
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <div class="col-sm-2 control-label">Topic</div>
                                                            <div class="col-sm-12">
                                                                <input type="text" name="topicName" required placeholder="Topic Name" class="form-control col-sm-12" />
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <div class="col-sm-offset-2 col-sm-12">
                                                                <button type="submit" class="btn btn-default" style="float:right;">Send</button>
                                                            </div>
                                                        </div>
                                                    </g:form>


                                                </div>

                                            </div>
                                        </div>
                                    </td>
                                </g:if>
                                <g:else>
                                    <td>
                                    <g:link controller="Subscription" action="subscribe" params="[id:it.id,page:'dashboard']">Subscribe</g:link>
                                    </td>
                                </g:else>
                                <td width=30px class="txxt"><a href="">${it.subscribers.size()}</a></td>
                                <td></td>
                                <td width=150px class="txxt"><a href="">${it.resources.size()}</a></td>

                            </tr>
                        </table>
                        </g:if>
                    </g:else>
                    </g:if>
                    <g:else>
                        <g:if test="${it.visibility.equals(Enums.VisibilityEnum.PUBLIC)}">
                            <table  style="width:100%">
                                <tr>
                                    <td width=500px >
                                        <g:link controller="topic" action="viewTopic" params="[id:it.id]" >${it.topicName} (${it.visibility})</g:link>
                                    </td>
                                    <td></td>
                                    <td width=300px class="txxt">Subscriptions</td>
                                    <td></td>
                                    <td width="150px" class="txxt">Post</td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td width=30px class="txxt"><a href="">${it.subscribers.size()}</a></td>
                                    <td></td>
                                    <td width=150px class="txxt"><a href="">${it.resources.size()}</a></td>

                                </tr>
                            </table>
                        </g:if>
                    </g:else>
                    <hr>
                </g:each>
            </div>

        </div>
    </div>
</div>
<div class="cardtrend">
    <div class="card-header">
        <h8 syle="float:left">Subscriptions</h8>
    </div>
    <div class="card-body">
        <g:each in="${subscriber}" var="it">
            <g:if test="${session.user}">
            <g:if test="${it.topic.createdBy.userName.equals(session.user.userName)}">
                <table  style="width:100%">
                    <tr>
                        <td width=500px>
                            <g:link controller="topic" action="viewTopic" params="[id:it.topic.id]">${it.topic.topicName} (${it.topic.visibility})</g:link>
                        </td>
                        <td></td>
                        <td width=300px class="txxt">Subscriptions</td>
                        <td></td>
                        <td width="150px" class="txxt">Post</td>
                    </tr>
                    <tr>
                        <td width=200px><g:form controller="subscription" action="changeSeriousness" >
                            <g:field type="hidden" name="id" value="${it.id}"></g:field>
                            <g:select  onChange="submit()" class="form-control" name="seriousness" from="${['SERIOUS','CASUAL','VERY_SERIOUS']}"
                                       value="${it.seriousness}" />
                        </g:form></td>
                        <td>
                            <button type="button" class="btn btn-info btn-warning" data-toggle="modal" title="invite" data-target="#topicinvite">
                                <i class="fas fa-envelope">
                                </i>
                            </button>
                            <div class="modal" id="editnvite">
                                <div class="cardbodyinvite">
                                    <div class="card-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title" >Send Invitation</h4>
                                    </div>
                                    <div class="card-body">
                                        <g:form class="form-horizontal" controller="sendingLink" action="sendInvite" name="invitation">
                                            <div class="form-group">
                                                <div class="col-sm-2 control-label">Email</div>
                                                <div class="col-sm-12">
                                                    <input type="email" name="email" required placeholder="Enter email" class="form-control col-sm-12" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-sm-2 control-label">Topic</div>
                                                <div class="col-sm-12">
                                                    <input type="text" name="topicName" required placeholder="Topic Name" class="form-control col-sm-12" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-sm-offset-2 col-sm-12">
                                                    <button type="submit" class="btn btn-default" style="float:right;">Send</button>
                                                </div>
                                            </div>
                                        </g:form>


                                    </div>

                                </div>
                            </div>
                        </td>
                        <td width=30px class="txxt"><a href="">${it.topic.subscribers.size()}</a></td>
                        <td></td>
                        <td width=150px class="txxt"><a href="">${it.topic.resources.size()}</a></td>

                    </tr>
                </table>
            </g:if>
            <g:else>
                <g:if test="${it.topic.visibility.equals(Enums.VisibilityEnum.PUBLIC)}">
                    <table  style="width:100%">
                        <tr>
                            <td width=500px >
                                <g:link controller="topic" action="viewTopic" params="[id:it.topic.id]" >${it.topic.topicName} (${it.topic.visibility})</g:link>
                            </td>
                            <td></td>
                            <td width=300px class="txxt">Subscriptions</td>
                            <td></td>
                            <td width="150px" class="txxt">Post</td>
                        </tr>
                        <tr>
                            <g:if test="${it.topic.subscribers.user.userName.contains(session.user.userName)}">
                                <td width=300px><g:form controller="subscription" action="changeSeriousness" >
                                    <g:field type="hidden" name="id" value="${it.id}"></g:field>
                                    <g:select  onChange="submit()" class="form-control" name="seriousness" from="${['SERIOUS','CASUAL','VERY_SERIOUS']}"
                                               value="${it.seriousness}" />
                                </g:form> </td>
                                <td>
                                    <button type="button" class="btn btn-info btn-warning" data-toggle="modal" title="invite" data-target="#topicinvite">
                                        <i class="fas fa-envelope">
                                        </i>
                                    </button>
                                    <div class="modal" id="innvite">
                                        <div class="cardbodyinvite">
                                            <div class="card-header">
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                <h4 class="modal-title" >Send Invitation</h4>
                                            </div>
                                            <div class="card-body">
                                                <g:form class="form-horizontal" controller="sendingLink" action="sendInvite" name="invitation">
                                                    <div class="form-group">
                                                        <div class="col-sm-2 control-label">Email</div>
                                                        <div class="col-sm-12">
                                                            <input type="email" name="email" required placeholder="Enter email" class="form-control col-sm-12" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="col-sm-2 control-label">Topic</div>
                                                        <div class="col-sm-12">
                                                            <input type="text" name="topicName" required placeholder="Topic Name" class="form-control col-sm-12" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="col-sm-offset-2 col-sm-12">
                                                            <button type="submit" class="btn btn-default" style="float:right;">Send</button>
                                                        </div>
                                                    </div>
                                                </g:form>


                                            </div>

                                        </div>
                                    </div>
                                </td>
                            </g:if>
                            <g:else>
                                <td>
                                    <g:link controller="Subscription" action="subscribe" params="[id:it.topic.id,page:'dashboard']">Subscribe</g:link>
                                </td>
                            </g:else>
                            <td width=30px class="txxt"><a href="">${it.topic.subscribers.size()}</a></td>
                            <td></td>
                            <td width=150px class="txxt"><a href="">${it.topic.resources.size()}</a></td>

                        </tr>
                    </table>
                </g:if>
            </g:else>
            </g:if>
            <g:else>
                <g:if test="${it.topic.visibility.equals(Enums.VisibilityEnum.PUBLIC)}">
                    <table  style="width:100%">
                        <tr>
                            <td width=500px >
                                <g:link controller="topic" action="viewTopic" params="[id:it.topic.id]" >${it.topic.topicName} (${it.topic.visibility})</g:link>
                            </td>
                            <td></td>
                            <td width=300px class="txxt">Subscriptions</td>
                            <td></td>
                            <td width="150px" class="txxt">Post</td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td width=30px class="txxt"><a href="">${it.topic.subscribers.size()}</a></td>
                            <td></td>
                            <td width=150px class="txxt"><a href="">${it.topic.resources.size()}</a></td>

                        </tr>
                    </table>
                </g:if>
            </g:else>
        <hr>
        </g:each>

    </div>

</div>

</div>

</div>

</div>
</div>

</body>
</html>