<!DOCTYPE HTML>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="Sat, 01 Dec 2001 00:00:00 GMT">

    <title>Note Manager | Home</title>

    <link href="static/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
     <div role="navigation">
     <div class="navbar navbar-inverse">
     <a href="/" class = "navbar-brand">Notes</a>
     <div class="navbar-collapse collapse">
         <ul class="nav navbar-nav">
             <li><a href="new-note">New Note</a>/li>
             <li><a href="all-notes">All Notes</a>/li>
         </ul>
     </div>
     </div>
     </div>

     <c:choose>
     <c:when test="${mode == 'MODE_HOME'}">
     <div class="container" id="homeDiv">
         <div class="jumbotron text-center">
             <h1>Welcome to Note Manager</h1>
         </div>
     </div>
     </c:when>
     <c:when test="${mode == 'MODE_NOTES'}">
     <div class="container text-center" id="notesDiv">
             <h3>My Notes</h3>
             <hr>
             <div class="table-responsive">
                 <table class="table table-striped table-bordered text-left">
                     <thead>
                     <tr>
                         <th>Id</th>
                         <th>Name</th>
                         <th>Description</th>
                         <th>Created Date</th>
                         <th>Finished</th>
                         <th></th>
                         <th></th>
                     </tr>
                     </thead>
                     <tbody>
                     <c:forEach var="note" items="${notes}">
                         <tr>
                             <td>${note.id}</td>
                             <td>${note.name}</td>
                             <td>${note.description}</td>
                             <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${note.createdDate}"/></td>
                             <td>${note.finished}</td>
                             <td><a href="update-note?id=${note.id}"><span class="glyphicon glyphicon-pencil"></span></a></td>
                             <td><a href="delete-note?id=${note.id}"><span class="glyphicon glyphicon-trash"></span></a></td>
                         </tr>
                     </c:forEach>
                     </tbody>
                 </table>
             </div>
         </div>
     </c:when>
     <c:when test="${mode == 'MODE_NEW' || mode == 'MODE_UPDATE'}">
             <div class="container text-center">
                 <h3>Manage Note</h3>
                 <form class="form-horizontal" method="POST" action="save-note">
                     <input type="hidden" name="id" value="${note.id}"/>
                     <div class="form-group">
                         <label class="control-label col-md-3">Name</label>
                         <div class="col-md-7">
                         <input type="text" class="form-control" name="name" value="${note.name}"/>
                         </div>
                     </div>
                     <div class="form-group">
                         <label class="control-label col-md-3">Description</label>
                         <div class="col-md-7">
                             <input type="text" class="form-control" name="description" value="${note.description}"/>
                         </div>
                     </div>
                     <div class="form-group">
                         <label class="control-label col-md-3">Finished</label>
                         <div class="col-md-7">
                             <input type="radio" class="col-sm-1" name="finished" value="true"/>
                             <div class="col-sm-1">Yes</div>
                             <input type="radio" class="col-sm-1" name="finished" value="false" checked/>
                             <div class="col-sm-1">No</div>
                         </div>
                     </div>
                     <div class="form-group">
                         <input type="submit" class="btn btn-primary" value="Save"/>
                     </div>
                 </form>
             </div>
     </c:when>
     </c:choose>
     <script src="/static/js/bootstrap.min.js"/>
</body>
</html>