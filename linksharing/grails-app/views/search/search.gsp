<%--
  Created by IntelliJ IDEA.
  User: rxlogix
  Date: 09/08/21
  Time: 11:29 PM
--%>

<%@ page import="Enums.VisibilityEnum" contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Search</title>

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
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.js"></script>
    <!--Custom styles-->
    <asset:stylesheet src= "searchStyle.css"></asset:stylesheet>
</head>
<body>


%{--<nav class="navbar navbar-icon-top navbar-expand-lg navbar-dark">
    <a class="navbar-brand" href="/dashboard/dashboard/">Link Sharing</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul></ul><ul> </ul><ul></ul> <ul> </ul><ul></ul><ul> </ul><ul></ul><ul> </ul><ul></ul><ul> </ul> <ul></ul>


        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
        <ul>
        </ul>
        <ul class="navbar-nav ">
            <li class="nav-item">
                <button type="button" class="btn btn-info btn-warning" data-toggle="modal" title="New Topic" data-target="#topicModal">
                    <i class="fas fa-clipboard">
                    </i>
                </button>
                <div class="modal" id="topicModal">
                    <div class="cardtopic">
                        <div class="card-header">
                            <button type="button" class="close" style="margin-top:2px;" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Create Topic</h4>
                        </div>
                        <div class="card-body">
                            <g:form controller="topics" action="addTopics" class="topicForm">
                                Name *:
                                <input class="form-control" placeholder="Topic Name" required type="text" name="topicName"/>
                                Visibility *:
                                <select class="form-control" name="selection">
                                    <option>PUBLIC</option>
                                    <option>PRIVATE</option>
                                </select>
                                <input type="submit" class="btn btn-default" style="float: right; margin-top: 5px;"/>
                            </g:form>
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
                                        <g:select name="topicName" from="" class="dropdown-toggle btn btn-default col-sm-12"></g:select>
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
                            <g:uploadForm  controller="resources" action="saveLink" class="topicForm">
                                Link *:
                                <input type="url" class="form-control" required id="linkres" placeholder="Link" name="linkres">

                                Description *:
                                <textarea class="form-control" required id="selectlink" name="selectlink"></textarea>

                                <div class="form-group">
                                    <div class="col-sm-2 control-label">Topic</div>
                                    <div class="col-sm-12">
                                        <g:select name="topicName" from="" class="dropdown-toggle btn btn-default col-sm-12"></g:select>
                                    </div>
                                </div>
                                <input type="submit" value="share"   class="btn btn-default" style="float: right;"/>
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
                            <g:uploadForm  class="form-horizontal" controller="Resources" action="saveDocument" name="documentcreate" enctype="multipart/form-data">
                                Document *:
                                <input type="file" class="form-control" required id="doc" placeholder="choose" name="document">
                                Description *:
                                <textarea class="form-control" required id="select" name="select"></textarea>
                                <div class="form-group">
                                    <div class="col-sm-2 control-label">Topic</div>
                                    <div class="col-sm-12">
                                        <g:select name="topicName" from="" class="dropdown-toggle btn btn-default col-sm-12"></g:select>
                                    </div>
                                </div>
                                <input type="submit" value="share"   class="btn btn-default" style="float: right; margin-top:-5px;"/>

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
                    <a class="dropdown-item" href="">profile</a>
                    <a class="dropdown-item" href="">Users</a>
                    <a class="dropdown-item" href="">topic</a>
                    <a class="dropdown-item" href="">posts</a>
                    <a class="dropdown-item" href="">Logout</a>
                </div>
                </g:if>
            <g:else>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                  <a class="dropdown-item" href="">profile</a>
                  <a class="dropdown-item" href="">Logout</a>
                </div>
            </g:else>
            </li>
        </ul>
    </div>
</nav>--}%
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

<div class="container">

    <div class="d-flex justify-content-center h-100">

        <div class="cardprofile">
            <div class="card-header">
                <h8 syle="float:left">Trending Topic</h8>
            </div>
            <div class="card-body">
                <g:each in="${trending}" var="it">
                    <table  style="width:100%">
                        <tr>
                            <td rowspan="4" colspan="3" width="10%">
                                <g:link controller="dashboard" action="viewUserProfile" params="[id:it.createdBy.id]">
                                    <asset:image src="${it.createdBy.photo}" height="120px" width="115px" style="margin-right: 10px"/>
                                </g:link>
                            </td>
                            <g:if test="${it.createdBy.userName.equals(session.user.userName)}">
                                <td colspan="10">
                                    <div class= "tName">
                                        <g:link  controller="topic" action="viewTopic" params="[id:it.id]">Topic: "${it.topicName}"</g:link>
                                    </div>
                                    <div class="editTopicName" style="display: none">
                                        <g:form controller="topic" action="editTopic" params="[id:it.id]">
                                            <input type="text" value="${it.topicName}" name="topicName" required/>
                                            <input type="submit" id="afterChange" value="save" name="submitButton" class="btn-sm float-right login_btn">
                                        </g:form>
                                    </div>

                                </td>
                            </g:if>
                            <g:else>
                                <td colspan="10">
                                    <g:link controller="topic" action="viewTopic" params="[id:it.id]">Topic: "${it.topicName}"</g:link>
                                </td>
                            </g:else>
                        </tr>
                        <tr>
                            <td width=100px class="text-muted">@${it.createdBy.userName}</td>

                            <td width=100px class="txxt">Subscriptions</td>
                            <td></td>
                            <td width="150px" class="txxt">Post</td>
                        </tr>
                        <g:if test="${it.createdBy.userName.equals(session.user.userName)}">
                            <tr>
                                <td></td>

                                <td width=100px class="txxt"><g:link controller="topic" action="viewTopic" params="[id:it.id]">${it.subscribers.size()}</g:link></td>
                                <td></td>
                                <td width=150px class="txxt"><g:link controller="topic" action="viewTopic" params="[id:it.id]">${it.resources.size()}</g:link></td>
                            </tr>

                            <tr>
                                <td ><g:form controller="subscription" action="changeSeriousness" class="topicForm">
                                    <g:field type="hidden" name="id" value="${it.id}"></g:field>
                                    <g:select  onChange="submit()" class="form-control" name="seriousness" from="${['SERIOUS','CASUAL','VERY_SERIOUS']}"
                                               value="${com.rxlogix.Subscription.findByUserAndTopic(com.rxlogix.User.findByUserName(session.user.userName),it).seriousness}" />
                                </g:form> </td>
                                <td ><g:form  controller="subscription" action="changeVisibility" class="topicForm">
                                    <g:field type="hidden" name="id1" value="${it.id}"></g:field>
                                    <g:select onChange="submit()" class ="form-control" name="visibility" from="${['PUBLIC','PRIVATE']}"
                                              value="${it.visibility}" />
                                </g:form> </td>
                                <td>

                                    <button type="button" class="btn btn-info btn-warning" data-toggle="modal" title="invite" data-target="#trendinvite">
                                        <i class="fas fa-envelope">
                                        </i>
                                    </button>
                                    <div class="modal" id="trendinvite">
                                        <div class="cardbodyinvite">
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
                                                            <g:select name="topicName" from="${trending.topicName}" class="dropdown-toggle btn btn-default col-sm-12" ></g:select>
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
                                <td>
                                    <button type="submit" id="btnchange"  class="btn btn-info btn-warning" title="Edit Topic Name" >
                                        <i class="fas fa-edit"></i>
                                    </button>
                                </td>
                                <td>
                                    <g:form controller="topic" action="deleteTopic" params="[id:it.id]">
                                        <button type="button" class="btn btn-info btn-warning" title="Delete">
                                            <i class="fas fa-trash"></i>
                                        </button>
                                    </g:form>
                                </td>
                            </tr>
                        </g:if>
                        <g:else>
                            <tr>
                                <td width=250px class="txt">
                                    <g:if test="${it.subscribers.user.userName.contains(session.user.userName)}">
                                        <g:link controller="Subscription" action="unSubTrend" params="[id:it.id,page:'dashboard']">Unsubscribe</g:link>
                                    </g:if>
                                    <g:else>
                                        <g:link controller="Subscription" action="subscribe" params="[id:it.id,page:'dashboard']">Subscribe</g:link>
                                    </g:else>
                                </td>

                                <td width=100px class="txxt"><g:link controller="topic" action="viewTopic" params="[id:it.id]">${it.subscribers.size()}</g:link></td>
                                <td></td>
                                <td width=150px class="txxt"><g:link controller="topic" action="viewTopic" params="[id:it.id]">${it.resources.size()}</g:link></td>
                            </tr>
                            <tr>
                                <g:if test="${it.subscribers.user.userName.contains(session.user.userName)}">
                                    <td ><g:form controller="subscription" action="changeSeriousness">
                                        <g:field type="hidden" name="id" value="${it.id}"></g:field>
                                        <g:select  onChange="submit()" class="form-control" name="seriousness" from="${['SERIOUS','CASUAL','VERY_SERIOUS']}"
                                                   value="${com.rxlogix.Subscription.findByUserAndTopic(com.rxlogix.User.findByUserName(session.user.userName),it).seriousness}" />
                                    </g:form> </td>
                                </g:if>
                                <g:else>
                                </g:else>
                                <td>

                                    <button type="button" class="btn btn-info btn-warning" data-toggle="modal" title="invite" data-target="#trendinvite">
                                        <i class="fas fa-envelope">
                                        </i>
                                    </button>
                                    <div class="modal" id="trendinvite">
                                        <div class="cardbodyinvite">
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
                                                            <g:select name="topicName" from="${trending.topicName}" class="dropdown-toggle btn btn-default col-sm-12"></g:select>
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
                            </tr>
                        </g:else>
                    </table>
                    <hr>
                </g:each>
            </div>
        </div>

        <div class="cardlogin">
            <div class="card-header">
                <h8 syle="float:left">Search Result for "${word}"</h8>
            </div>
            <div class="card-body">
                <g:if test="${!com.rxlogix.Resource.findAllByDescriptionIlike("%${word}%")}">
                <g:each in="${com.rxlogix.Topic.findAllByTopicNameIlike("%${word}%")}" var="it">
                <g:each in="${com.rxlogix.Resource.findAllByTopic(it)}" var="rsc">
                <g:if test="${it.visibility.equals(Enums.VisibilityEnum.PUBLIC)}">

                            <table>
                            <tr>
                                <td rowspan="3"  width=23%>
                                    <g:link controller="dashboard" action="viewUserProfile" params="[id:rsc.createdBy.id]">
                                        <asset:image src="${rsc.createdBy.photo}" height="120px" width="115px"/>
                                    </g:link>
                                </td>
                                <td width=140px class="text">${rsc.createdBy.firstName}</td>
                                <td width=120px class ="usr">@${rsc.createdBy.userName}</td>
                                <td width= 120px></td>
                                <td width=120px>
                                    <g:link controller="topic" action="viewTopic" params="[id:rsc.topic.id]">${rsc.topic.topicName}</g:link>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="10" height=50px class="para">
                                    ${rsc.description}
                                </td>
                            </tr>
                            <tr>
                                <td  class="d-flex justify-content-end social_icon">
                                    <span><i class="fab fa-facebook-square"></i></span>
                                    <span><i class="fab fa-google-plus-square"></i></span>
                                    <span><i class="fab fa-twitter-square"></i></span>

                                </td>
                                <td class ="gl">
                                    <g:if test="${rsc.hasProperty("filePath")}">
                                        <g:link controller="resources" action="downloadFile" params="[id:rsc.id , flag:1]">Download</g:link>
                                    </g:if>
                                    <g:else>
                                        <a href="${rsc.url}" target="_blank">Open Link</a>
                                    </g:else>
                                </td>
                                <td class = "mrk">
                                    <g:link controller="resources" action="markRead" params="[rid:rsc.id]">Mark read</g:link>
                                </td>
                                <td><g:link controller="resources" action="viewPost" params="[id:rsc.id]">View Post</g:link>
                                </td>
                            </tr>
                            </table>
                        <hr>
                </g:if>
                </g:each>
                </g:each>
                </g:if>
                <g:else>
               <g:each in="${com.rxlogix.Resource.findAllByDescriptionIlike("%${word}%")}" var="it">
                    <g:if test="${it.topic.visibility.equals(Enums.VisibilityEnum.PUBLIC)}">
                        <table>
                            <tr>
                                <td rowspan="3"  width=23%>
                                    <g:link controller="dashboard" action="viewUserProfile" params="[id:it.createdBy.id]">
                                        <asset:image src="${it.createdBy.photo}" height="120px" width="115px"/>
                                    </g:link>
                                </td>
                                <td width=140px class="text">${it.createdBy.firstName}</td>
                                <td width=120px class ="usr">@${it.createdBy.userName}</td>
                                <td width= 120px></td>
                                <td width=120px>
                                    <g:link controller="topic" action="viewTopic" params="[id:it.topic.id]">${it.topic.topicName}</g:link>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="10" height=50px class="para">
                                    ${it.description}
                                </td>
                            </tr>
                            <tr>
                                <td  class="d-flex justify-content-end social_icon">
                                    <span><i class="fab fa-facebook-square"></i></span>
                                    <span><i class="fab fa-google-plus-square"></i></span>
                                    <span><i class="fab fa-twitter-square"></i></span>

                                </td>
                                <td class ="gl">
                                    <g:if test="${it.hasProperty("filePath")}">
                                        <g:link controller="resources" action="downloadFile" params="[id:it.id , flag:1]">Download</g:link>
                                    </g:if>
                                    <g:else>
                                        <a href="${it.url}" target="_blank">Open Link</a>
                                    </g:else>
                                </td>
                                <td class = "mrk">
                                    <g:link controller="resources" action="markRead" params="[rid:it.id]">Mark read</g:link>
                                </td>
                                <td><g:link controller="resources" action="viewPost" params="[id:it.id]">View Post</g:link>
                                </td>
                            </tr>
                        </table>
                        <hr>
                    </g:if>
                </g:each>
                </g:else>
            </div>

        </div>


        <div class="cardtop">
            <div class="card-header">
                <h8 syle="float:left">Top Post</h8>
            </div>
            <div class="card-body">
                <g:each in="${top}" var="it" >
                    <g:if test="${it.createdBy.userName.equals(session.user.userName)}">
                    </g:if>
                    <g:else>
                        <table>
                            <tr>
                                <td rowspan="3"  width=23%>
                                    <g:link controller="dashboard" action="viewUserProfile" params="[id:it.createdBy.id]">
                                        <asset:image src="${it.createdBy.photo}" height="120px" width="115px"/>
                                    </g:link>
                                </td>
                                <td width=140px class="text">${it.createdBy.firstName}</td>
                                <td width=120px class ="usr">@${it.createdBy.userName}</td>
                                <td width= 120px></td>
                                <td width=120px>
                                    <g:link controller="topic" action="viewTopic" params="[id:it.topic.id]">${it.topic.topicName}</g:link>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="10" height=50px class="para">
                                    ${it.description}
                                </td>
                            </tr>
                            <tr>
                                <td  class="d-flex justify-content-end social_icon">
                                    <span><i class="fab fa-facebook-square"></i></span>
                                    <span><i class="fab fa-google-plus-square"></i></span>
                                    <span><i class="fab fa-twitter-square"></i></span>

                                </td>
                                <td class ="gl">
                                    <g:if test="${it.hasProperty("filePath")}">
                                        <g:link controller="resources" action="downloadFile" params="[id:it.id , tid:it.id , flag:1]">Download</g:link>
                                    </g:if>
                                    <g:else>
                                        <a href="${it.url}" target="_blank">Open Link</a>
                                    </g:else>
                                </td>
                                <td class = "mrk">
                                    <g:link controller="resources" action="markRead" params="[rid:it.id]">Mark read</g:link>
                                </td>
                                <td><g:link controller="resources" action="viewPost" params="[id:it.id]">View Post</g:link>
                                </td>
                            </tr>
                        </table>
                        <hr>
                    </g:else>
                </g:each>
            </div>

        </div>

    </div>
</div>

</div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $("#srch").DataTable();
        $('.dataTables_length').addClass('bs-select');
    });
</script>
</body>
</html>