<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="AssignmentEC.Register" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign in- Sign up</title>
    <link rel="stylesheet" href="Assignment1/css/style_page.css">
    <link rel="stylesheet" href="Assignment1/css/style_sub-menu.css">
    <link rel="stylesheet" href="Assignment1/css/style_main-menu.css">
    <link rel="stylesheet" href="Assignment1/css/style_banner.css">
    <link rel="stylesheet" href="Assignment1/css/style_content.css">
    <link rel="stylesheet" href="Assignment1/css/style_new.css" />

    <link rel="stylesheet" href="css/gridviewStyle.css" />
    <link href='http://fonts.googleapis.com/css?family=Economica:700,400italic'
        rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<body style="background: url(images/bg.png) repeat center center">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="script1" runat="server"></asp:ScriptManager>

        <div id="header">
            <div class="header-menu">
                <div class="title_page">CUSTOMER</div>
                <div class="sub-menu">
                    <div class="items">
                        <a class="links icons_mail"></a>
                        <div class="item_contents">
                            <h2>Contact us</h2>
                            <p>
                                <a href="mailto:nguyenlanh2580@gmail.com">eMail</a> <a href="#">Twitter</a>
                                <a href="https://www.facebook.com/lanh.nguyen.2580">Facebook</a>
                            </p>
                        </div>
                    </div>
                    <div class="items">
                        <a class="links icons_help"></a>
                        <div class="item_contents">
                            <h2>Help</h2>
                            <p>
                                <a href="#">FAQ</a> <a href="#">Live Support</a> <a href="#">Chat</a>
                            </p>
                        </div>
                    </div>
                    <div class="items">
                        <a class="links icons_buy" href="Shopping.aspx"></a>
                        <div class="item_contents">
                            <h2>Buy</h2>
                            <p>
                                <a href="Shopping.aspx">My Cart</a>
                                <a href="CartHistory.aspx">Cart History</a>
                            </p>
                        </div>
                    </div>
                    <div class="items">
                        <a class="links icons_user"></a>
                        <div class="item_contents">
                            <h2>Customer</h2>
                            <p>
                                <a href="#" id="currentUser" runat="server">Login</a>
                                <a href="#">Log Out</a>
                            </p>
                        </div>
                    </div>
                    <div class="items">
                        <a class="links icons_find"></a>
                        <div class="item_contents">
                            <h2>Search</h2>
                            <p>
                                <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
                                <asp:LinkButton ID="linkBtnSearch" runat="server" OnClick="linkBtnSearch_Click" Text="Go"></asp:LinkButton>
                            </p>
                        </div>
                    </div>
                    <div class="items">
                        <a class="links icons_home" href="Home.aspx"></a>
                        <div class="item_contents">
                            <h2>Start from here</h2>
                            <p>
                                <a href="Home.aspx">Home</a>
                                <a href="Product.aspx">Products</a>
                                <a href="Shopping.aspx">Buy</a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <br />
        <br />

        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button>
                    <h4 class="modal-title" id="myModalLabel1">Please enter..</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-8" style="border-right: 1px dotted #C2C2C2; padding-right: 30px;">
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#Login" data-toggle="tab">Login</a></li>
                                <li><a href="#Registration" data-toggle="tab">Sign up</a></li>
                            </ul>
                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div class="tab-pane active" id="Login">
                                    <div role="form" class="form-horizontal">
                                        <div class="form-group">
                                            <label for="email" class="col-sm-2 control-label">
                                                Email</label>
                                            <div class="col-sm-10">
                                                <input type="email" class="form-control" id="txtEmailLogin" runat="server" placeholder="Email" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputPassword1" class="col-sm-2 control-label">
                                                Password</label>
                                            <div class="col-sm-10">
                                                <input type="password" class="form-control" id="txtPasswordLogin" title="Must contain at least one number and one uppercase and lowercase letter, and at least 6" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" runat="server" />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-2">
                                            </div>
                                            <div class="col-sm-10">
                                                <asp:Button ID="btnSignIn" runat="server" OnClick="btnSignIn_Click" type="submit" Text="Sign In" CssClass="btn btn-primary btn-sm" />
                                                <a href="javascript:;">Forgot your password?</a>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label style="color: red; margin-left: 120px" id="lblMessageSignIn" runat="server"></label>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="Registration">
                                    <div role="form" class="form-horizontal">
                                        <div class="form-group">
                                            <label for="txtFirstNameSignUp" class="col-sm-2 control-label">
                                                FirstName</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" placeholder="Name" id="txtFirstNameSignUp" pattern=".{1,}" title="One or more characters" runat="server" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtLastNameSignUp" class="col-sm-2 control-label">
                                                LastName</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" id="txtLastNameSignUp" pattern=".{1,}" title="One or more characters" runat="server" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtEmailSignUp" class="col-sm-2 control-label">
                                                Email</label>
                                            <div class="col-sm-10">
                                                <input type="email" class="form-control" id="txtEmailSignUp" placeholder="Email" runat="server" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtAddressSignUp" class="col-sm-2 control-label">
                                                Address</label>
                                            <div class="col-sm-10">
                                                <input class="form-control" id="txtAddressSignUp" runat="server" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="mobile" class="col-sm-2 control-label">
                                                Mobile</label>
                                            <div class="col-sm-10">
                                                <input class="form-control" id="txtMobileSignUp" onkeypress="return numbersOnly(this, event);" pattern="[0-9]{6,}" title="Six or more digits" runat="server" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="password" class="col-sm-2 control-label">
                                                Password</label>
                                            <div class="col-sm-10">
                                                <input type="password" class="form-control" id="txtPasswordSignUp" title="Must contain at least one number and one uppercase and lowercase letter, and at least 6" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" runat="server" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="password" class="col-sm-2 control-label">
                                                Confirm Password</label>
                                            <div class="col-sm-10">
                                                <input type="password" class="form-control" id="txtConfirmPassword" runat="server" />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-2">
                                            </div>
                                            <div class="col-sm-10">
                                                <%--ASP.NET CODE--%>
                                                <asp:Button ID="btnSignUp" runat="server" OnClick="btnSignUp_Click" CssClass="btn btn-primary btn-sm" Text="Sign Up" />
                                                <button type="button" class="btn btn-default btn-sm" onclick="window.location.href='../Home.aspx'">Cancel</button>

                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label style="color: red; margin-left: 120px" id="lblMessageSignUp" runat="server"></label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="OR" class="hidden-xs">
                                OR
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="row text-center sign-with">
                                <div class="col-md-12">
                                    <h3>Sign in with</h3>
                                </div>
                                <div class="col-md-12">
                                    <div class="btn-group btn-group-justified">
                                        <a href="https://www.facebook.com" class="btn btn-primary">Facebook</a>
                                        <a href="https://mail.google.com" class="btn btn-danger">Google</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script type="text/javascript"
            src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
        <script>
            $('.items').hover(function () {
                var $this = $(this);
                expand($this);
            }, function () {
                var $this = $(this);
                collapse($this);
            });
            function expand($elem) {
                var angle = 0;
                var t = setInterval(function () {
                    if (angle == 1440) {
                        clearInterval(t);
                        return;
                    }
                    angle += 40;
                    $('.link', $elem).stop().animate({
                        rotate: '+=-40deg'
                    }, 0);
                }, 10);
                $elem.stop().animate({
                    width: '15em'
                }, 1000).find('.item_contents').fadeIn(400, function () {
                    $(this).find('p').stop(true, true).fadeIn(600);
                });
            }
            function collapse($elem) {
                var angle = 1440;
                var t = setInterval(function () {
                    if (angle == 0) {
                        clearInterval(t);
                        return;
                    }
                    angle -= 40;
                    $('.link', $elem).stop().animate({
                        rotate: '+=40deg'
                    }, 0);
                }, 10);
                $elem.stop().animate({
                    width: '52px'
                }, 1000).find('.item_contents').stop(true, true).fadeOut().find('p')
                        .stop(true, true).fadeOut();
            }
            function numbersOnly(n, t) {
                var i = String.fromCharCode(t.charCode), r = /\./.test(n.value); return t.charCode === 0 || /\d/.test(i) || /\./.test(i) && !r
            }
        </script>
    </form>
    <script type="text/javascript"
        src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <script>
        $('.items').hover(function () {
            var $this = $(this);
            expand($this);
        }, function () {
            var $this = $(this);
            collapse($this);
        });
        function expand($elem) {
            var angle = 0;
            var t = setInterval(function () {
                if (angle == 1440) {
                    clearInterval(t);
                    return;
                }
                angle += 40;
                $('.link', $elem).stop().animate({
                    rotate: '+=-40deg'
                }, 0);
            }, 10);
            $elem.stop().animate({
                width: '15em'
            }, 1000).find('.item_contents').fadeIn(400, function () {
                $(this).find('p').stop(true, true).fadeIn(600);
            });
        }
        function collapse($elem) {
            var angle = 1440;
            var t = setInterval(function () {
                if (angle == 0) {
                    clearInterval(t);
                    return;
                }
                angle -= 40;
                $('.link', $elem).stop().animate({
                    rotate: '+=40deg'
                }, 0);
            }, 10);
            $elem.stop().animate({
                width: '52px'
            }, 1000).find('.item_contents').stop(true, true).fadeOut().find('p')
                    .stop(true, true).fadeOut();
        }
    </script>

    <script type="text/javascript">

        function numbersOnly(n, t) { var i = String.fromCharCode(t.charCode), r = /\./.test(n.value); return t.charCode === 0 || /\d/.test(i) || /\./.test(i) && !r }

        function isValidEmailAddress(emailAddress) {
            var pattern = /^([a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+(\.[a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+)*|"((([ \t]*\r\n)?[ \t]+)?([\x01-\x08\x0b\x0c\x0e-\x1f\x7f\x21\x23-\x5b\x5d-\x7e\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|\\[\x01-\x09\x0b\x0c\x0d-\x7f\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))*(([ \t]*\r\n)?[ \t]+)?")@(([a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.)+([a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.?$/i;
            return pattern.test(emailAddress);
        };

        //Code Validate form Sign In
        $("#btnSignIn").click(function () {
            var valid = true;
            valid &= $("#txtEmailLogin").val().length > 0;
            valid &= $("#txtPasswordLogin").val().length > 0;
            if (!valid) {
                $("#lblMessageSignIn").text("Please fill all the fields");
                return false;
            }
            return true;
        })
        //Code Validate form Sign Up
        $("#btnSignUp").click(function () {
            var valid = true;
            valid &= isValidEmailAddress($('#txtEmailSignUp').val());
            valid &= $("#txtPasswordSignUp").val().length > 0;
            valid &= $("#txtConfirmPassword").val().length > 0;
            valid &= $("#txtFirstNameSignUp").val().length > 0;
            valid &= $("#txtLastNameSignUp").val().length > 0;
            valid &= $("#txtEmailSignUp").val().length > 0;
            valid &= $("#txtMobileSignUp").val().length > 0;
            valid &= $("#txtAddressSignUp").val().length > 0;
            if (!valid) {
                $("#lblMessageSignUp").text("Please fill all the fields");
                return false;
            }
            if ($("#txtPasswordSignUp").val() != $("#txtConfirmPassword").val()) {
                $("#lblMessageSignUp").text("The confirm password does not match");
                return false;
            }
            return true;
        })
    </script>

</body>
</html>
