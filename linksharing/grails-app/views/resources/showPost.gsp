<%--
  Created by IntelliJ IDEA.
  User: rxlogix
  Date: 06/08/21
  Time: 10:25 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Post</title>

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
    <asset:stylesheet src= "postStyle.css"></asset:stylesheet>
    <script>
        function Rating(id , value) {
            /*for(var i = 1; i <= 5; i++) {
                document.getElementById(i).style.color="white";
            }
            for(var i=1; i<=value; i++) {
                document.getElementById(i).style.color="yellow";
            }*/
            $.ajax({
                url:  "${createLink(controller: "resourceRating",action: "resourceRating")}",
                data: {id : id , value : value},
                success: function(response){
                    document.getElementById("test").innerHTML="Saved"
                }
            });
        }

      function Ratingsprint(value) {
            for(var i=1;i<=5;i++) {
                document.getElementById(i).style.color="white";
            }
            for(var i=1;i<=value;i++) {
                document.getElementById(i).style.color="yellow";
            }
        }
    </script>
</head>
<body onload="Ratingsprint('${rating}')">
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
            <div class="card-header">
                <span class="txt" style="text-align: center"><p id="test"></p></span>
            </div>
            <div class="card-body" >

                <table>
                    <td rowspan="5" width=25%>
                        <asset:image src="${post.createdBy.photo}" height="125px" width="115px"/>
                    </td>
                    <td width=140px class="text">${post.createdBy.firstName}</td>
                    <td width=200px class="text-muted">@${post.createdBy.userName}</td>
                    <td></td>
                    <td width=200px class="txt">
                        <g:link controller="topic" action="viewTopic" params="[id:post.topic.id]">${post.topic.topicName}</g:link>
                    </td>
                    <g:if test="${session.user}">
                    <tr> <td colspan="5">
                        <span id="1" onclick="Rating('${post.id}' , '${1}')"class="star"></span>
                        <span id="2" onclick="Rating('${post.id}', '${2}')"class="star"></span>
                        <span id="3" onclick="Rating('${post.id}' , '${3}')"class="star"></span>
                        <span id="4" onclick="Rating('${post.id}', '${4}')"class="star"></span>
                        <span id="5" onclick="Rating('${post.id}', '${5}')"class="star"></span>
                       <span id="7" class="txt"> Rating:${rating}</span>
                        <span id="8" class="txt"> Rated by:${post.resourceRated.size()}</span>
                    </td>
                    </tr>
                    </g:if>
                    <g:else>
                        <tr> <td colspan="5">
                            <span id="7" class="txt"> Rating:${rating}</span>
                            <span id="8" class="txt"> Rated by:${post.resourceRated.size()}</span>
                        </td>
                        </tr>
                    </g:else>
                    <tr>
                        <td colspan="10" class="para">
                            ${post.description}
                        </td>
                    </tr>
                    <tr>
                        <td  class="d-flex justify-content-end social_icon">
                            <span><i class="fab fa-facebook-square"></i></span>
                            <span><i class="fab fa-google-plus-square"></i></span>
                            <span><i class="fab fa-twitter-square"></i></span>

                        </td>
                        <td class ="gl">
                            <g:if test="${post.hasProperty("filePath")}">
                                <g:link controller="resources" action="downloadFile" params="[id:post.id , tid:post.topic.id , flag:1]">Download</g:link>
                            </g:if>
                            <g:else>
                                <a href="${post.url}" target="_blank">Open Link</a>
                            </g:else>
                        </td>
                        %{--<td class = "mrk">
                            <g:link controller="resources" action="markRead" params="[rid:post.id]">Mark as read</g:link>
                        </td>--}%
                        <g:if test="${session.user}">
                        <g:if test="${post.createdBy.userName.equals(session.user.userName)}">
                        <td >
                            <g:if test="${post.hasProperty("filePath")}">
                            <button type="button" class="btn-sm btn-info btn-warning" data-toggle="modal" title="Edit Document" data-target="#editDocument">
                                <i class="fas fa-file">
                                </i>
                            </button>
                            <div class="modal" id="editDocument">
                                <div class="cardtopic">
                                    <div class="card-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Edit Document</h4>
                                    </div>
                                    <div class="card-body">
                                        <g:uploadForm  class="form-horizontal" controller="Resources" action="editDocument" name="documentCreate" enctype="multipart/form-data" method="POST" params="[id:post.id]">
                                            Document *:
                                            <input type="file" class="form-control" id="doc" placeholder="choose" name="document">
                                            Description *:
                                            <textarea class="form-control" required id="select" name="description">${post.description}</textarea>
                                            <div class="form-group">
                                                <div class="col-sm-2 control-label">Topic</div>
                                                <div class="col-sm-12">
                                                    <label name="topicName" value="${post.topic.topicName}"> ${post.topic.topicName}</label>
                                                </div>
                                            </div>
                                            <input type="submit" value="Save"   class="btn btn-default" style="float: right; margin-top:-5px;"/>

                                        </g:uploadForm>

                                    </div>

                                </div>
                            </div>
                            </g:if>
                            <g:else>
                                <button type="button" class="btn-sm btn-info btn-warning" data-toggle="modal" title="Edit Link" data-target="#editLink">
                                    <i class="fas fa-link">
                                    </i>
                                </button>
                                <div class="modal" id="editLink">
                                    <div class="cardtopic">
                                        <div class="card-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">Edit Link</h4>
                                        </div>
                                        <div class="card-body">
                                            <g:uploadForm  class="form-horizontal" controller="Resources" action="editLink" name="documentCreate" enctype="multipart/form-data" method="POST" params="[id:post.id]">
                                                Link *:
                                                <input type="link" class="form-control" required id="link" value="${post.url}" name="link">
                                                Description *:
                                                <textarea class="form-control" required id="select" name="description">${post.description}</textarea>
                                                <div class="form-group">
                                                    <div class="col-sm-2 control-label">Topic</div>
                                                    <div class="col-sm-12">
                                                        <label name="topicName">${post.topic.topicName}</label>
                                                    </div>
                                                </div>
                                                <input type="submit" value="Save"   class="btn btn-default" style="float: right; margin-top:-5px;"/>
                                            </g:uploadForm>
                                        </div>

                                    </div>
                                </div>
                            </g:else>
                        </td>
                            <td>
                            <g:form controller="resources" action="deleteResource" params="[id:post.id]">
                                <button type="submit" onclick="return confirm('Are you sure you want to delete this item')" class="btn-sm btn-info btn-warning" title="Delete">
                                    <i class="fas fa-trash"></i>
                                </button>
                            </g:form>
                        </td>
                        </g:if>
                        </g:if>
                    </tr>
                </table>

            </div>
        </div>

        <div class="cardlogin">
            <div class="card-header">
                <h8 syle="float:left">Trending Topic</h8>
            </div>
            <div class="card-body">
                <g:if test="${session.user}">
                <g:each in="${trending}" var="it">
                    <table  style="width:100%">
                        <tr>
                            <td rowspan="4" colspan="3" width="10%">
                                <g:link controller="dashboard" action="viewUserProfile" params="[id:it.createdBy.id]">
                                    <asset:image src="${it.createdBy.photo}" height="120px" width="115px" style="margin-right: 10px"/>
                                </g:link>
                            </td>
                            <g:if test="${it.createdBy.userName.equals(session.user.userName)}">
                            <td colspan="3">
                                <div class= "tName">
                                    <g:link  controller="topic" action="viewTopic" params="[id:it.id]">${it.topicName}</g:link>
                                </div>
                                <div class="editTopicName" style="display: none">
                                    <g:form controller="topic" action="editTopic" params="[id:it.id]">
                                        <input class="small" type="text" value="${it.topicName}" name="topicName" required/>
                                        <input type="submit" id="afterChange" value="save" name="submitButton" class="btn-sm float-right login_btn">
                                    </g:form>
                                </div>
                            </td>
                            </g:if>
                            <g:else>
                                <td colspan="3">
                                    <g:link controller="topic" action="viewTopic" params="[id:it.id]">Topic: "${it.topicName}"</g:link>
                                </td>
                            </g:else>
                            <td colspan="2" class="txxt">${it.createdBy.firstName} ${it.createdBy.lastName}
                            </td>
                        </tr>
                        <tr>
                            <td width=100px class="text-muted">@${it.createdBy.userName}</td>
                            <td></td>
                            <td width=100px class="txxt">Subscriptions</td>
                            <td></td>
                            <td width="150px" class="txxt">Post</td>
                        </tr>
                        <g:if test="${it.createdBy.userName.equals(session.user.userName)}">
                            <tr>
                                <td></td>
                                <td width="200px"></td>
                                <td width=100px class="txxt"><a href="">${it.subscribers.size()}</a></td>
                                <td></td>
                                <td width=150px class="txxt"><a href="">${it.resources.size()}</a></td>
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
                                <td></td>
                                %{--<td>

                                   --}%%{-- <button type="button" class="btn btn-info btn-warning" data-toggle="modal" title="invite" data-target="#trendinvite">
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
                                                <g:form class="form-horizontal" controller="sendLink" action="sendInvite" name="invitation" params="[topicName:it.topicName]">
                                                    <div class="form-group">
                                                        <div class="col-sm-2 control-label">Email</div>
                                                        <div class="col-sm-12">
                                                            <input type="email" name="email" required placeholder="Enter email" class="form-control col-sm-12" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="col-sm-2 control-label">Topic</div>
                                                        <div class="col-sm-12">
                                                            <label name="topicName">${it.topicName}</label>
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
                                    </div>--}%%{--

                                </td>--}%
                                <td>
                                <div class="btnEdit">
                                    <button type="submit" id="btnchange"  class="btn btn-info btn-warning" title="Edit Topic Name" >
                                        <i class="fas fa-edit"></i>
                                    </button>
                                </div>
                                </td>
                                <td>
                                    <g:form controller="topic" action="deleteTopic" params="[id:it.id]">
                                        <button type="submit" onclick="return confirm('Are you sure you want to delete this item')" class="btn btn-info btn-warning" title="Delete">
                                            <i class="fas fa-trash"></i>
                                        </button>
                                    </g:form>
                                </td>
                            </tr>
                        </g:if>
                        <g:else>
                            <tr>
                                <td class="txt">
                                    <g:if test="${it.subscribers.user.userName.contains(session.user.userName)}">
                                        <g:link controller="Subscription" action="unSubTrend" params="[id:it.id,page:'dashboard']">Unsubscribe</g:link>
                                    </g:if>
                                    <g:else>
                                        <g:link controller="Subscription" action="subscribe" params="[id:it.id,page:'dashboard']">Subscribe</g:link>
                                    </g:else>
                                </td>
                                <td></td>
                                <td width=100px class="txxt"><a href="">${it.subscribers.size()}</a></td>
                                <td></td>
                                <td width=150px class="txxt"><a href="">${it.resources.size()}</a></td>
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

                            </tr>
                        </g:else>
                    </table>
                    <hr>
                </g:each>
                </g:if>
                <g:else>
                    <g:each in="${trending}" var="it">
                        <table  style="width:100%">
                            <tr>
                                <td rowspan="4" colspan="3" width="10%">
                                    <g:link controller="dashboard" action="viewUserProfile" params="[id:it.createdBy.id]">
                                        <asset:image src="${it.createdBy.photo}" height="120px" width="115px" style="margin-right: 10px"/>
                                    </g:link>
                                </td>
                                    <td colspan="3">
                                        <g:link controller="topic" action="viewTopic" params="[id:it.id]">Topic: "${it.topicName}"</g:link>
                                    </td>
                                <td colspan="2" class="txxt">${it.createdBy.firstName} ${it.createdBy.lastName}
                                </td>
                            </tr>
                            <tr>
                                <td width=100px class="text-muted">@${it.createdBy.userName}</td>
                                <td></td>
                                <td width=100px class="txxt">Subscriptions</td>
                                <td></td>
                                <td width="150px" class="txxt">Post</td>
                            </tr>
                            <tr>
                                    <td></td>
                                    <td width=100px class="txxt"><a href="">${it.subscribers.size()}</a></td>
                                    <td></td>
                                    <td width=150px class="txxt"><a href="">${it.resources.size()}</a></td>
                                </tr>
                                <tr>

                                </tr>
                        </table>
                        <hr>
                    </g:each>
                </g:else>
            </div>

        </div>




    </div>
</div>
<script>
    $(document).ready(function(){
        $(".btnEdit").click(function(){
            $(".tName").hide();
            $(".editTopicName").toggle("slow");
        });
    });
</script>
</body>
</html>