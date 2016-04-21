<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CartHistory.aspx.cs" Inherits="AssignmentEC.CartHistory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cart History</title>
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
    <style>
        .selectedRow {
            background-color: yellow;
        }
    </style>
</head>
<body style="background: url(images/bg.png) repeat center center">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="script1" runat="server"></asp:ScriptManager>
        <div id="header">
            <div class="header-menu">
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
                                <a href="Register.aspx" id="currentUser" runat="server">Login</a>
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
        <div class="title_page" style="font-size: 32px;">CART HISTORY</div>
        <asp:UpdatePanel ID="update1" runat="server">
            <ContentTemplate>

                <br />
                <br />
                <br />
                <br />
                <asp:GridView ID="gvCarts" runat="server"
                    AutoGenerateColumns="False"
                    GridLines="None"
                    AllowPaging="true"
                    CssClass="mGrid"
                    PagerStyle-CssClass="pgr"
                    AlternatingRowStyle-CssClass="alt"
                    OnSelectedIndexChanged="gvCarts_SelectedIndexChanged" AutoGenerateSelectButton="true" SelectedRowStyle-CssClass="selectedRow">
                    <Columns>
                        <asp:BoundField DataField="CartID" HeaderText="CartID" />
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" />

                        <asp:BoundField DataField="TotalPrice" HeaderText="TotalPrice" />
                        <asp:BoundField DataField="CreatedDate" HeaderText="CreatedDate" />
                        <asp:BoundField DataField="DateTransfer" HeaderText="DateTransfer" />
                        <asp:BoundField DataField="Status" HeaderText="Status" />
                        <asp:BoundField DataField="TypePayment" HeaderText="TypePayment" />
                    </Columns>
                </asp:GridView>
                <br />
                <br />
                <asp:GridView ID="gvCartItems" runat="server"
                    AutoGenerateColumns="False"
                    GridLines="None"
                    AllowPaging="true"
                    CssClass="mGrid"
                    PagerStyle-CssClass="pgr"
                    AlternatingRowStyle-CssClass="alt">
                    <Columns>
                        <asp:BoundField DataField="MobileName" HeaderText="MobileName" />
                        <asp:BoundField DataField="Color" HeaderText="Color" />
                        <asp:BoundField DataField="Price" HeaderText="Price" />
                    </Columns>
                </asp:GridView>

            </ContentTemplate>
        </asp:UpdatePanel>
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

