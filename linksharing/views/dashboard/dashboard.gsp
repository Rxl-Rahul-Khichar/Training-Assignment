<%--
  Created by IntelliJ IDEA.
  User: rxlogix
  Date: 24/07/21
  Time: 12:34 AM
--%>
<%@ page import="com.rxlogix.User" contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>

    <!--Bootsrap 4 CDN-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-    				MCw98SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <!--Fontawesome CDN-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!--Custom styles-->
    <asset:stylesheet src= "dashStyle.css"></asset:stylesheet>
    <script type="text/javascript">
        $( document ).ready( function() {
            $( "#save" ).click(function (){
                $.ajax( {
                    url: "${createLink(controller:'topic',action:'addTopic')}",
                    type: "post",
                    data:  $( '#topicForm' ).serialize(),
                    success: function(response) {
                        $("#profile").load(" #profile")
                        $("#subs").load(" #subs")
                        $('#topicModal').modal('hide');
                        console.log(response)
                    },
                    error: function (){
                        console.log("err")
                    }
                } );
            });
        });

    </script>
</head>
<body>


<nav class="navbar navbar-icon-top navbar-expand-lg navbar-dark">
    <a class="navbar-brand" href="/dashboard/dashboard">Link Sharing</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul></ul><ul> </ul><ul></ul> <ul> </ul><ul></ul><ul> </ul><ul></ul><ul> </ul><ul></ul><ul> </ul>
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
        <ul></ul>
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
                        <asset:image src="/profile/${session.user.userName}.jpg" height="25px" width="25px"/>
                    </i>
                    ${session.user.userName}
                </button>

                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item" href="/user/userProfile">profile</a>
                    <a class="dropdown-item" href="/user/showUserList">Users</a>
                    <a class="dropdown-item" href="/topic/showTopicList">topic</a>
                    <a class="dropdown-item" href="">posts</a>
                    <a class="dropdown-item" href="/user/logout">Logout</a>
                </div>

                <!--
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                  <a class="dropdown-item" href="">profile</a>
                  <a class="dropdown-item" href="">Users</a>
                  <a class="dropdown-item" href="">topic</a>
                  <a class="dropdown-item" href="">posts</a>
                  <a class="dropdown-item" href="">Logout</a>
                </div>
            </>-->
            </li>
        </ul>
    </div>
</nav>
<p class="tt" id="tt">${flash.messagetopic}</p>
<p class="tt" id="ts">${flash.success}</p>
<p class="tt" id="th">${flash.error}</p>
<div class="container"  >

    <div class="d-flex justify-content-center h-100">
        <div class="cardprofile">
            <div id = "profile">
            <div class="card-body">
                <table  style="width:100%">
                    <tr>
                        <td rowspan="4" colspan="3" width="10%">
                            <a href="/user/userProfile">
                            <asset:image src="/profile/${session.user.userName}.jpg" height="120px" width= "115px" style="margin-right: 10px"/>
                            </a>
                        </td>
                        <td width=200px class="text" colspan="3">${session.user.firstName} ${session.user.lastName}</td>
                    </tr>
                    <tr>
                        <td width=150px class="text-muted" colspan="3">@${session.user.userName}</td>
                    </tr>
                    <tr>
                        <td width=150px class="txt">Subscriptions</td>
                        <td width="150px" class="txt">topic</td>
                    </tr>
                    <tr>
                        <td width=150px class="txt"><a href="">${scount}</a></td>
                        <td width=150px class="txt"><a href="">${tcount}</a></td>
                    </tr>
                </table>
            </div>
            </div>
        </div>

        <div class="cardlogin">
            <div class="card-header">
                <h8 syle="float:left">Inbox</h8>
            </div>
            <div class="card-body">
                <g:each in="${rsclist}" var="it" >
                <table>
                    <tr>
                    <td rowspan="3"  width=23%>
                        <asset:image src="${it.createdBy.photo}" height="120px" width="115px"/>
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
                            <g:link>Mark read</g:link>
                        </td>

                    <td  class = "view"><a href="">view post</a></td>
                    </tr>
                </table>
                <hr>
                </g:each>
            </div>

        </div>

        <div id ="subs">
        <div class="cardtop">
            <div class="card-header">
                <h8 syle="float:left">Subscriptions</h8>
                <div style="float:right"><a href="">View All </a></div><br>

            </div>
            <div class="card-body">
                <g:each in="${subscription}" var="it" status="i">
                <table  style="width:100%">
                    <tr>
                        <td rowspan="4" colspan="3" width="10%">
                            <asset:image src="${it.topic.createdBy.photo}" height="120px" width="115px" style="margin-right: 10px"/>
                        </td>
                       <td>
                        <g:link controller="topic" action="viewTopic" params="[id:it.topic.id]">${it.topic.topicName}</g:link>
                        </td>
                    </tr>
                    <tr>
                        <td width=200px class="text-muted">@${it.topic.createdBy.userName}</td>

                        <td width=200px class="txxt">Subscriptions</td>
                        <td></td>
                        <td width="150px" class="txxt">Posts</td>
                    </tr>
                    <g:if test="${it.topic.createdBy.userName.equals(session.user.userName)}">
                    <tr>
                        <td></td>
                        <td  class="txxt"><a href="">${it.topic.subscribers.size()}</a></td>
                        <td></td>
                        <td width=150px class="txxt"><a href="">${it.topic.resources.size()}</a></td>
                    </tr>
                        <tr>
                        <td ><g:form  action="addTopics" class="topicForm">
                            <g:field type="hidden" name="id" value="${it.id}"></g:field>
                            <g:select  onChange="submit()" class="form-control" name="seriousness" from="${['SERIOUS','CASUAL','VERY_SERIOUS']}"
                                       value="${it.seriousness}" />
                        </g:form> </td>
                        <td ><g:form  action="addTopics" class="topicForm">
                            <g:field type="hidden" name="id1" value="${it.topicId}"></g:field>
                            <g:select onChange="submit()" class ="form-control" name="visibility" from="${['PUBLIC','PRIVATE']}"
                                      value="${it.topic.visibility}" />
                        </g:form> </td>
                        <td>

                            <button type="button" class="btn btn-info btn-warning" data-toggle="modal" title="invite" data-target="#topicinvite">
                                <i class="fas fa-envelope">
                                </i>
                            </button>
                            <div class="modal" >
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
                        <td>
                            <button type="button" class="btn btn-info btn-warning" data-toggle="modal" title="invite" data-target="#topicinvite">
                                <i class="fas fa-edit">
                                </i>
                            </button>
                        </td>
                        <td>
                            <button type="button" class="btn btn-info btn-warning" data-toggle="modal" title="invite" data-target="#topicinvite">
                                <i class="fas fa-trash">
                                </i>
                            </button>
                        </td>
                    </tr>
                    </g:if>
                    <g:else>
                        <tr>
                            <td width=250px class="txt">
                                    <g:link controller="Subscription" action="unSubscribe" params="[id:it.id,page:'dashboard']">Unsubscribe</g:link>
                            </td>

                            <td width=100px class="txxt"><a href="">${it.topic.subscribers.size()}</a></td>
                            <td></td>
                            <td width=150px class="txxt"><a href="">${it.topic.resources.size()}</a></td>
                        </tr>
                        <tr>
                            <td >
                                <g:form  action="addTopics" class="topicForm">
                                    <g:field type="hidden" name="id" value="${it.id}"></g:field>
                                    <g:select  onChange="submit()" class="form-control" name="seriousness" from="${['SERIOUS','CASUAL','VERY_SERIOUS']}"
                                               value="${it.seriousness}" />
                                </g:form>
                            </td>

                            <td>

                                <button type="button" class="btn btn-info btn-warning" data-toggle="modal" title="invite" data-target="#topicinvite">
                                    <i class="fas fa-envelope">
                                    </i>
                                </button>
                                <div class="modal" id="topicinvt">
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
                        </tr>
                    </g:else>



                </table>
                    <hr>
                    </g:each>
            </div>

        </div>
        </div>

    </div>
</div>
<div id="trend">
<div class="cardtrend">
    <div class="card-header">
        <h8 syle="float:left">Trending Topics</h8>


    </div>
    <div class="card-body">
        <g:each in="${trending}" var="it">
        <table  style="width:100%">
            <tr>
                <td rowspan="4" colspan="3" width="10%">
                    <asset:image src="${it.createdBy.photo}" height="120px" width="115px" style="margin-right: 10px"/>
                </td>
                <td>
                    <g:link controller="topic" action="viewTopic" params="[id:it.id]">${it.topicName}</g:link>
                </td>
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

                <td width=100px class="txxt"><a href="">${it.subscribers.size()}</a></td>
                <td></td>
                <td width=150px class="txxt"><a href="">${it.resources.size()}</a></td>
            </tr>

            <tr>
                <td ><g:form  action="addTopics" class="topicForm">
                    <g:select  onChange="submit()" class="form-control" name="seriousness" from="${['SERIOUS','CASUAL','VERY_SERIOUS']}"
                               value="${seriousness}" />
                </g:form> </td>
                <td ><g:form  action="addTopics" class="topicForm">
                    <g:select onChange="submit()" class ="form-control" name="visibility" from="${['PUBLIC','PRIVATE']}"
                              value="${it.visibility}" />
                </g:form> </td>
                <td>

                    <button type="button" class="btn btn-info btn-warning" data-toggle="modal" title="invite" data-target="#topicinvite">
                        <i class="fas fa-envelope">
                        </i>
                    </button>
                    <div class="modal" id="topicinvite">
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
                <td>
                    <button type="button" class="btn btn-info btn-warning" data-toggle="modal" title="invite" data-target="#topicinvite">
                        <i class="fas fa-edit">
                        </i>
                    </button>
                </td>
                <td>
                    <button type="button" class="btn btn-info btn-warning" data-toggle="modal" title="invite" data-target="#topicinvite">
                        <i class="fas fa-trash">
                        </i>
                    </button>
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

                    <td width=100px class="txxt"><a href="">${it.subscribers.size()}</a></td>
                    <td></td>
                    <td width=150px class="txxt"><a href="">${it.resources.size()}</a></td>
                </tr>
                <tr>
                    <td ><g:form  action="addTopics" class="topicForm">
                        <select class="form-control" name="selection">
                            <option>CASUAL</option>
                            <option>SERIOUS</option>
                            <option>VERY SERIOUS</option>
                        </select>
                    </g:form> </td>

                    <td>

                        <button type="button" class="btn btn-info btn-warning" data-toggle="modal" title="invite" data-target="#topicinvite">
                            <i class="fas fa-envelope">
                            </i>
                        </button>
                        <div class="modal" id="topicinvit">
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
                </tr>
            </g:else>
        </table>
            <hr>
        </g:each>
    </div>

</div>
</div>
</div>
</div>

</body>
</html>