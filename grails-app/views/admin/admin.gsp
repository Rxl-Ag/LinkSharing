<%--
  Created by IntelliJ IDEA.
  User: anurag
  Date: 24/03/22
  Time: 8:28 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>User List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>

<body>

<style>
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



<nav class="navbar sticky-top nav">
    <div class="container col-lg-11">
        <g:link class="navbar-brand" style="color: white" controller="dashboard" action="dash">Link Sharing</g:link>
    </div>
    <div class="container col-lg-1">
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
                        <g:link controller="topic" action="topicshow"  class="dropdown-item" href="#">Topics</g:link>
                        <g:link class="dropdown-item" href="#">Posts</g:link>
                    </g:if>
                    <g:link controller="login" action="logout" class="dropdown-item">Log Out</g:link>
                </div>
            </div>
        </div>
    </div>
</nav>
<table>
    <tr>
        <th>Id</th>
        <th>Username</th>
        <th>Email</th>
        <th>FirstName</th>
        <th>LastName</th>
        <th>Active</th>
        <th></th>
        <th>Admin</th>
    </tr>

    <g:each var="user" in="${userlist}">
        <tr>
            <td>${user.id}</td>
            <td>${user.username}</td>
            <td>${user.email}</td>
            <td>${user.firstname}</td>
            <td>${user.lastname}</td>
            <td>${user.active}</td>
            <td>
                <button class="btn">
                    <g:if test="${user.active}">
                        <g:link controller="admin" action="active" params="${[email: user.email]}">Deactivate</g:link>
                    </g:if>
                    <g:else>
                        <g:link controller="admin" action="active" params="${[email: user.email]}">Activate</g:link>
                    </g:else>
                </button>
            </td>
            <td>${user.admin}</td>
            <td>
                <button class="btn ">
                    <g:if test="${user.admin}">
                        <g:link controller="admin" action="makeAdmin" params="[email: user.email]">Normal</g:link>
                    </g:if>
                    <g:else>
                        <g:link controller="admin" action="makeAdmin" params="[email: user.email]">Admin</g:link>
                    </g:else>
                </button>
            </td>
        </tr>
    </g:each>

</table>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>