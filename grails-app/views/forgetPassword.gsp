<%--
  Created by IntelliJ IDEA.
  User: anurag
  Date: 26/03/22
  Time: 6:23 PM
--%>

<html>

<head>
    <title>Forget Password</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <style>
    body {
        background-color: #d9d0d0;
    }
    .c-0{
        background-color:#7c7676;
    }

    .c-1{
        max-width: 665px;
        margin: 25px auto;
    }
    .login-form {
        width: 340px;
        margin: 25px auto;
        font-size: 15px;
    }
    .login-form form {
        margin-bottom: 15px;
        background: #f7f7f7;
        box-shadow: 0px 2px 2px rgb(0 0 0 / 30%);
        padding: 30px;
    }
    .login-form h2 {
        margin: 0 0 15px;
    }
    .form-group {
        margin-bottom: 1rem;
    }

    .g-0{
        background: #f7f7f7;
    }
    .h-1{
        text-align: center;
        border: 1px solid black;
        background-color: #7c7676;
        height: 30px;

    }
    .h-1 h5{
        margin-top: 2px;
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

    .fa-facebook {
        background: #3B5998;
        color: white;
    }

    .fa-twitter {
        background: #55ACEE;
        color: white;
    }
    .fa-google {
        background: #dd4b39;
        color: white;
    }

    </style>

</head>

<body>
<div class="container">
    <div class="panel-body">
        <div class="login-form">
            <g:form name="myForm" url="[controller:'login',action:'forgotpassword']">
                <h2 class="text-center">Register</h2>
                <div>
                    <g:if test="${flash.message}">
                        <div class="alert alert-success alert-dismissible fade show" id="fm" role="alert">
                            <strong>${flash.message}!</strong>
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    </g:if>
                </div>
                <div class="form-group">
                    <label for="email">Email Id</label>
                    <g:field type="email" required="required" name="email" id="email" />
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <g:passwordField minlength="4" required="required" name="password" id="password"/>
                </div>
                <div class="form-group">
                    <label for="confirmpassword">Confirm Password</label>
                    <g:passwordField required="required" name="confirmpassword" id="confirmpassword"/>
                </div>
                <div class="form-group">
                    <g:submitButton name="Submit" id="submit" value="Reset Password"/>
                </div>
            </g:form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
