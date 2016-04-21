<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Shopping.aspx.cs" Inherits="AssignmentEC.Shopping" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Shopping</title>
    <link rel="stylesheet" href="css/style_page.css">
    <link rel="stylesheet" href="Assignment1/css/style_sub-menu.css">
    <link rel="stylesheet" href="css/style_banner.css">
    <link rel="stylesheet" href="css/style_content_index.css">
    <link rel="stylesheet" href="css/style_index.css">
    <link rel="stylesheet" href="css/gridviewStyle.css" />
    <link href='http://fonts.googleapis.com/css?family=Economica:700,400italic'
        rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function () {
            var today = new Date();
            var dd = today.getDate();
            var mm = today.getMonth() + 1; //January is 0!
            var yyyy = today.getFullYear();
            if (dd < 10) { dd = '0' + dd } if (mm < 10) { mm = '0' + mm } today = yyyy + '-' + mm + '-' + dd;
            $('#txtGiaoHang').attr('value', today);
        })
        $('#Button1').click(function () {
            var now = new Date();
            var day = new Date($('#txtGiaoHang').val());
            if ((day - now) < 0) {
                alert('Invalid delivery date !');
            }
        });
    </script>
</head>
<body style="background: url(images/bg.png) repeat center center">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="script1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="update1" runat="server">
            <ContentTemplate>
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
                                        <li><a href="Shopping.aspx">Buy</a></li>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tittle_page" style="font-family: Dotum; font-weight:normal;">SHOPPING</div>
                <br />
                <br />
                <br />
                <br />
                <asp:GridView ID="gvProducts" runat="server"
                    AutoGenerateColumns="False"
                    GridLines="None"
                    AllowPaging="true"
                    CssClass="mGrid"
                    PagerStyle-CssClass="pgr"
                    AlternatingRowStyle-CssClass="alt">
                    <Columns>
                        <asp:BoundField DataField="ProductID" HeaderText="Mobile ID" />
                        <asp:BoundField DataField="ProductName" HeaderText="Mobile Name" />
                        <asp:TemplateField HeaderText="Color">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlColor" runat="server">
                                    <asp:ListItem Text="Black" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="White" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="Grey" Value="3"></asp:ListItem>
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="timeInsurance" HeaderText="Insurance Time" />
                        <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="{0:0,0 vnđ}" />
                    </Columns>
                </asp:GridView>
                <br />
                <label id="lblTongcong" style="margin-left: 70em">Total :</label><span><label id="lblTotal" runat="server" style="margin-left: 15px"></label></span>
                <br />
                <br />
                <span style="margin-left: 73em">
                    <asp:Button ID="btnCancel" runat="server" Text="Delete Carts" CssClass="btn btn-danger" OnClick="btnCancel_Click" OnClientClick="if ( !confirm('Delete Carts ?')) return false;" CausesValidation="false" UseSubmitBehavior="false" /></span>
                <h1 style="text-align: center; color: #0094ff">Customer Information</h1>
                <table id="infoCustomer" style="margin: 5px auto" border="1">
                    <tr>
                        <td>
                            <label for="txtCustomer">Payment Type</label></td>
                        <td>
                            <select id="ddlTypePayment" runat="server">
                                <option value="Online">Credit & Debit Cart</option>
                                <option value="Cash">Cash on delivery</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="txtAddress">Delivery Date</label></td>
                        <td>
                            <input type="date" id="txtGiaoHang" runat="server" /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Button ID="Button1" Text="Buy products" runat="server" OnClick="btnSubmit_Click" CssClass="btn btn-primary" OnClientClick="if ( !confirm('Confirm buying products ?')) return false;" />
                        </td>
                    </tr>
                </table>


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
