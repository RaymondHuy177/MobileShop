<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerInformation.aspx.cs" Inherits="AssignmentEC.CustomerInformation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customer Information</title>
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
                <div class="sub-menu">
                    <div class="title_page" style="margin-top: 0; font-size: 32px;">CUSTOMER INFOMATION</div>
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
                                <a href="#" data-toggle="modal" data-target="#myModal" id="currentUser" runat="server">Login</a>
                                <asp:LinkButton ID="linkBtnLogOut" runat="server" OnClick="linkBtnLogOut_Click">LogOut</asp:LinkButton>
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
        <div class="modal-dialog modal-lg" style="margin-top: 15px">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button>
                    <h4 class="modal-title" id="myModalLabel">Customer</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12" style="border-right: 1px dotted #C2C2C2; padding-right: 30px;">
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs">
                                <li><a href="#Registration" data-toggle="tab">Infomation</a></li>
                            </ul>
                            <!-- Tab panes -->
                            <div class="tab-pane" id="Registration">
                                <div role="form" class="form-horizontal">
                                    <div class="form-group">
                                        <label for="email" class="col-sm-2 control-label">
                                            FirstName</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="txtFirstNameUpdate" runat="server" pattern=".{1,}" title="One or more characters" required="required" />

                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="email" class="col-sm-2 control-label">
                                            LastName</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="txtLastNameUpdate" runat="server" pattern=".{1,}" title="One or more characters" required="required" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="email" class="col-sm-2 control-label">
                                            Email</label>
                                        <div class="col-sm-10">
                                            <input type="email" class="form-control" id="txtEmailUpdate" runat="server" placeholder="Email" required="required" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="mobile" class="col-sm-2 control-label">
                                            Mobile</label>
                                        <div class="col-sm-10">
                                            <input class="form-control" onkeypress="return numbersOnly(this, event);" id="txtMobileUpdate" runat="server" required="required" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="mobile" class="col-sm-2 control-label">
                                            Address</label>
                                        <div class="col-sm-10">
                                            <input class="form-control" id="txtAddressUpdate" runat="server" required="required" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="password" class="col-sm-2 control-label">
                                            Confirm Old Password</label>
                                        <div class="col-sm-10">
                                            <input type="password" class="form-control" id="txtConfirmOldPassword" runat="server" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="password" class="col-sm-2 control-label">
                                            New Password</label>
                                        <div class="col-sm-10">
                                            <input type="password" class="form-control" id="txtPasswordUpdate" title="Must contain at least one number and one uppercase and lowercase letter, and at least 6" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" runat="server" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="password" class="col-sm-2 control-label">
                                            Confirm New Password</label>
                                        <div class="col-sm-10">
                                            <input type="password" class="form-control" id="txtConfirmPasswordUpdate" runat="server" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="password" class="col-sm-2 control-label">
                                            Last Modified</label>
                                        <div class="col-sm-10">
                                            <label id="lblLastModified" runat="server" style="padding-top: 6px">15:00</label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-2">
                                        </div>
                                        <div class="col-sm-10">
                                            <%--ASP.NET CODE--%>
                                            <asp:Button ID="btnUpdateInformation" runat="server" type="submit" OnClick="btnUpdateInformation_Click" CssClass="btn btn-info btn-sm" Text="Save & Continue" />
                                            <button type="button" class="btn btn-default btn-sm" onclick="window.location.href='Home.aspx'">
                                                Cancel</button>
                                            <span style="color: red; margin-left: 50px" id="lblMessageUpdate" runat="server"></span>
                                        </div>
                                        <br />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <script type="text/javascript">
            function numbersOnly(n, t) {
                var i = String.fromCharCode(t.charCode), r = /\./.test(n.value); return t.charCode === 0 || /\d/.test(i) || /\./.test(i) && !r
            }
            //Code Validate Form Update
            $("#btnUpdateInformation").click(function () {
                if ($('#txtConfirmOldPassword').val().length < 1) {
                    alert('You have to enter the current password to confirm updating');
                    return false;
                }
                if ($("#txtPasswordUpdate").val().length > 0 && ($("#txtPasswordUpdate").val() != $("#txtConfirmPasswordUpdate").val())) {
                    $("#lblMessageUpdate").text("Password does not match");
                    return false;
                }
                return true;
            });
        </script>
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

</body>
</html>
