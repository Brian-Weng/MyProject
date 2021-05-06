<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="Main.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="js/jquery-3.6.0.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <style>
        .LoginCT{
            border-radius: 10px; 
            box-shadow: -5px -5px 10px #fff, 5px 5px 10px #babebc;
        }
        input{
            border-radius: 20px;
            box-shadow: inset 5px 2px 7px #babebc, inset -5px -5px 12px #fff;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="bg-light">
        <div class="container">
            <div class="row justify-content-center align-items-center" style="height:100vh">
                <div class="col-md-4 text-center bg-white LoginCT">
                    <img src="images/logo-3.png" width="150" height="60" class="my-3"/>
                    <h2 class="mb-4">Please Login</h2>
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Your Account"/>
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" placeholder="Your Password"/>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-secondary mb-2">Login</button>
                        </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
