<%--
  Created by IntelliJ IDEA.
  User: rxlogix
  Date: 30/07/21
  Time: 10:56 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%--
  Created by IntelliJ IDEA.
  User: rxlogix
  Date: 29/07/21
  Time: 2:18 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Topic List</title>

    <!--Bootsrap 4 CDN-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-    				MCw98SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <!--Fontawesome CDN-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="bootstrap.bundle.min.js / bootstrap.bundle.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.js"></script>


    <!--Custom styles-->
    <asset:stylesheet src= "userStyle.css"></asset:stylesheet>

</head>
<body>


<nav class="navbar navbar-icon-top navbar-expand-lg navbar-dark">
    <a class="navbar-brand" href="/dashboard/dashboard">Link Sharing</a>
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

                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item" href="">profile</a>
                    <a class="dropdown-item" href="">Users</a>
                    <a class="dropdown-item" href="">topic</a>
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
                </div>-->

            </li>
        </ul>
    </div>
</nav>
<div class="container">


    <div class="cardprofile">
        <div class="card-header" style="background-color:#190033;">
            <h8 syle="float:left">Users</h8>
        </div>
        <div class="card-body">
            <table id="selectedColumn" class="table  table-bordered table-sm" cellspacing="0" width="100%">
                <thead>
                <tr>
                    <th class="txt">Id
                    </th>
                    <th class="txt">Topic Name
                    </th>
                    <th class="txt">Created By
                    </th>
                    <th class="txt">Visibility
                    </th>
                    <th class="txt">Manage
                    </th>
                </tr>
                </thead>
                <tbody>
                <g:each var="topic" in="${topicList}">
                    <tr>
                        <td class="txt">${topic.id}</td>
                        <td  class="txt">${topic.topicName}</td>
                        <td  class="txt">${topic.createdBy.userName}</td>
                        <td  class="txt">${topic.visibility}</td>
                        <td>
                            <button class="btn btn-warning">
                                <a>Delete</a>
                            </button>
                        </td>
                    </tr>
                </g:each>
                </tbody>
                <script type="text/javascript">
                    $(document).ready(function () {
                        $('#selectedColumn').DataTable({
                            "aaSorting": [],
                            columnDefs: [{
                                orderable: false,
                                targets: 6
                            }]
                        });
                        $('.dataTables_length').addClass('bs-select');
                    });
                </script>
            </table>
        </div>

    </div>

</div>


</body>
</html>