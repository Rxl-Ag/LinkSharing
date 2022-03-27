<%--
  Created by IntelliJ IDEA.
  User: anurag
  Date: 24/03/22
  Time: 8:28 PM
--%>

<%@ page import="com.rxlogix.Users" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Topic List</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    %{--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">--}%
    %{--    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css">--}%
    %{--    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap4.min.css">--}%


</head>

<body>

<style>

#table_id_wrapper{
    background-color: #a5a3a3;
}
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}
td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}
tr:nth-child(even) {
    background-color: #dddddd;
}

body {
    background-color: #d9d0d0;
}

.icn{
    color: white;
}


.navbar{
    background-color: #7c7676;
    position: sticky;
    top: 0;
}
a{
    color: #003a8f;
}

.fa {
    padding: 10px;
    font-size: 15px;
    text-align: center;
    text-decoration: none;
    margin-right: 1px;
}

.fa:hover {
    opacity: 0.7;
}

.icon{
    color: #7c7676;
    position: absolute;
    line-height: 1.2em;
    padding-left: 18px;
}
input[type= search]{
    width: 190px;
    padding-left: 35px;
}
</style>
<nav class="navbar sticky-top nav1">
    <div class="container col-lg-6">
        <g:link class="navbar-brand" style="color: white" controller="dashboard" action="dash">Link Sharing</g:link>    </div>
</div>
    <div class="container col-lg-6">
        <span style="margin-left: 250px">
            <i class="fa fa-search icon"></i>
            <g:form controller="search" action="search">
                <input type="search" name="searchElement" placeholder="Search..." class="form-control"/>
            </g:form>
        </span>
        <a href="#" class="icn">
            <svg width="30px" height="30px" viewBox="0 0 16 16" class="bi bi-chat-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg"  onclick="document.getElementById('Modal-topic').style.display='block'">
                <path d="M8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6-.097 1.016-.417 2.13-.771 2.966-.079.186.074.394.273.362 2.256-.37 3.597-.938 4.18-1.234A9.06 9.06 0 0 0 8 15z"/>
            </svg>
        </a>
        <a href="#" class="icn">
            <svg width="30px" height="30px" viewBox="0 0 16 16" class="bi bi-envelope-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg"  onclick=" document.getElementById('Modal-invite').style.display='block'">
                <path fill-rule="evenodd" d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414.05 3.555zM0 4.697v7.104l5.803-3.558L0 4.697zM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586l-1.239-.757zm3.436-.586L16 11.801V4.697l-5.803 3.546z"/>
            </svg>
        </a>
        <a href="#" class="icn">
            <svg width="30px" height="30px" viewBox="0 0 16 16" class="bi bi-link-45deg" fill="currentColor" xmlns="http://www.w3.org/2000/svg"  onclick="document.getElementById('Modal-url').style.display='block'">
                <path d="M4.715 6.542L3.343 7.914a3 3 0 1 0 4.243 4.243l1.828-1.829A3 3 0 0 0 8.586 5.5L8 6.086a1.001 1.001 0 0 0-.154.199 2 2 0 0 1 .861 3.337L6.88 11.45a2 2 0 1 1-2.83-2.83l.793-.792a4.018 4.018 0 0 1-.128-1.287z"/>
                <path d="M5.712 6.96l.167-.167a1.99 1.99 0 0 1 .896-.518 1.99 1.99 0 0 1 .518-.896l.167-.167A3.004 3.004 0 0 0 6 5.499c-.22.46-.316.963-.288 1.46z"/>
                <path d="M6.586 4.672A3 3 0 0 0 7.414 9.5l.775-.776a2 2 0 0 1-.896-3.346L9.12 3.55a2 2 0 0 1 2.83 2.83l-.793.792c.112.42.155.855.128 1.287l1.372-1.372a3 3 0 0 0-4.243-4.243L6.586 4.672z"/>
                <path d="M10 9.5a2.99 2.99 0 0 0 .288-1.46l-.167.167a1.99 1.99 0 0 1-.896.518 1.99 1.99 0 0 1-.518.896l-.167.167A3.004 3.004 0 0 0 10 9.501z"/>
            </svg>
        </a>
        <a href="#" class="icn">
            <svg width="30px" height="30px" viewBox="0 0 16 16" class="bi bi-file-earmark-plus" fill="currentColor" xmlns="http://www.w3.org/2000/svg"  onclick="document.getElementById('Modal-document').style.display='block'">
                <path d="M9 1H4a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h5v-1H4a1 1 0 0 1-1-1V3a1 1 0 0 1 1-1h5v2.5A1.5 1.5 0 0 0 10.5 6H13v2h1V6L9 1z"/>
                <path fill-rule="evenodd" d="M13.5 10a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1H13v-1.5a.5.5 0 0 1 .5-.5z"/>
                <path fill-rule="evenodd" d="M13 12.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0v-2z"/>
            </svg>
        </a>
        <div class="btn-group">
            <button type="button" class="btn" style="color: white">
                <svg width="25px" height="25px" viewBox="0 0 16 16" class="bi bi-person" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" d="M13 14s1 0 1-1-1-4-6-4-6 3-6 4 1 1 1 1h10zm-9.995-.944v-.002.002zM3.022 13h9.956a.274.274 0 0 0 .014-.002l.008-.002c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664a1.05 1.05 0 0 0 .022.004zm9.974.056v-.002.002zM8 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm3-2a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                </svg>
            </button>
            <div class="dropdown">
                <button type="button" class="btn dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: white">
                    ${user.firstname}
                </button>
                <div class="dropdown-menu">
                    <g:link controller="profile" action="editprofile" class="dropdown-item">Profile</g:link>
                    <g:if test="${user.admin}">
                        <g:link controller="admin" action="users" class="dropdown-item">Users</g:link>
                    %{--                            <g:link class="dropdown-item" href="#">Topics</g:link>--}%
                    %{--                            <g:link class="dropdown-item" href="#">Posts</g:link>--}%
                    </g:if>
                    <g:link controller="login" action="logout" class="dropdown-item">Log Out</g:link>
                </div>
            </div>
        </div>
    </div>
</nav>

<table id="table_id" class="display">
    <thead>
    <tr>
        <th>Id</th>
        <th>Topicname</th>
        <th>Username</th>
        <th>Visibility</th>
        <th>Manage</th>
    </tr>
    </thead>
    <tbody>
    <g:each  in="${com.rxlogix.Topic.list()}" var="topic">
        <tr>
            <td>${topic.id}</td>
            <td>${topic.topicName}</td>
            <td>${topic.createdBy.username}</td>
            <td>${topic.visibility}</td>
            <td>
                <g:link controller="topic" action="topicdelete" params="${[tid: topic.id]}">Delete</g:link>
            </td>
        </tr>
    </g:each>
    </tbody>
</table>

<g:render template="/modal/modalTemplate"/>

<script type="text/javascript">
    $(document).ready( function () {
        $('#table_id').DataTable();
    } );
</script>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>