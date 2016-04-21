<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="AssignmentEC.Product" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title id="titleProductPage">Product</title>
    <link rel="stylesheet" href="css/style_page.css">
    <link rel="stylesheet" href="Update_Ass2_08Nov2015/css/style_sub-menu.css" />
    <link rel="stylesheet" href="css/style_main-menu.css">
    <link rel="stylesheet" href="css/style_banner.css">
    <link rel="stylesheet" href="css/style_content_index.css">
    <link rel="stylesheet" href="css/style_index.css">

    <link href='http://fonts.googleapis.com/css?family=Economica:700,400italic'
        rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<body>
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
                                <asp:LinkButton ID="linkBtnLogOut" runat="server">LogOut</asp:LinkButton>
                            </p>
                        </div>
                    </div>
                    <div class="items">
                        <a class="links icons_find"></a>
                        <div class="item_contents">
                            <h2>Search</h2>
                            <p>
                                <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
                                <asp:LinkButton ID="linkBtnSearch" runat="server" Text="Go" OnClick="linkBtnSearch_Click1"></asp:LinkButton>
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
        <div class="tittle_page">PRODUCTS</div>
        <asp:UpdatePanel ID="update1" runat="server">
            <ContentTemplate>
                <!-------------------------------------banner------------------>
                <div class="content_index">
                    <div class="container-fluid">
                        <div class="row" style="margin-top: 20px; margin-left: 20px; margin-bottom: 20px;">
                            <div class="col-md-2">
                                <div class="panel panel-default producer">
                                    <div class="panel-heading">
                                        <h2 class="panel-title">Manufacturers</h2>
                                    </div>
                                    <div class="panel-body" style="padding: 0;">
                                        <ul class="nav nav-pills nav-stacked">
                                            <li id="allCategory" runat="server">
                                                <asp:LinkButton ID="linkBtnAllCategory" runat="server" OnClick="linkBtnAllCategory_Click">All category</asp:LinkButton></li>
                                            <li id="Apple" runat="server">
                                                <asp:LinkButton ID="linkBtnApple" runat="server" OnClick="linkBtnApple_Click">Apple</asp:LinkButton></li>
                                            <li id="Lenovo" runat="server">
                                                <asp:LinkButton ID="LinkBtnLenovo" runat="server" OnClick="LinkBtnLenovo_Click">Lenovo</asp:LinkButton></li>
                                            <li id="OPPO" runat="server">
                                                <asp:LinkButton ID="LinkBtnOPPO" runat="server" OnClick="LinkBtnOPPO_Click">OPPO</asp:LinkButton></li>
                                            <li id="Sony" runat="server">
                                                <asp:LinkButton ID="LinkBtnSony" runat="server" OnClick="LinkBtnSony_Click">Sony</asp:LinkButton></li>
                                            <li id="SamSung" runat="server">
                                                <asp:LinkButton ID="LinkBtnSamsung" runat="server" OnClick="LinkBtnSamsung_Click">Sam Sung</asp:LinkButton></li>
                                            <li id="BlackBerry" runat="server">
                                                <asp:LinkButton ID="LinkBtnBlackBerry" runat="server" OnClick="LinkBtnBlackBerry_Click">BlackBerry</asp:LinkButton></li>
                                            <li id="QMobile" runat="server">
                                                <asp:LinkButton ID="LinkBtnQMobile" runat="server" OnClick="LinkBtnQMobile_Click">Nokia</asp:LinkButton></li>
                                            <li id="Asus" runat="server">
                                                <asp:LinkButton ID="linkBtnAsus" runat="server" OnClick="linkBtnAsus_Click">Asus</asp:LinkButton></li>
                                            <li id="HTC" runat="server">
                                                <asp:LinkButton ID="linkBtnHTC" runat="server" OnClick="linkBtnHTC_Click">HTC</asp:LinkButton></li>
                                            <li id="LG" runat="server">
                                                <asp:LinkButton ID="LinkBtnLG" runat="server" OnClick="LinkBtnLG_Click">LG</asp:LinkButton></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-9 gallery">
                                <div class="filter">
                                    <nav class="navbar navbar-default">
                                        <div class="navbar-header">
                                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                                                <span class="sr-only">Toggle navigation</span>
                                                <span class="icon-bar"></span>
                                                <span class="icon-bar"></span>
                                                <span class="icon-bar"></span>
                                            </button>
                                        </div>
                                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                            <ul class="nav navbar-nav featureSelect">
                                                <li class="dropdown">
                                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" id="captionPrice" runat="server">Price : <span class="featureValue">All</span> <span class="caret"></span>
                                                    </a>
                                                    <ul class="dropdown-menu">
                                                        <li>
                                                            <asp:LinkButton ID="linkBtnPriceBelow2Million" runat="server" OnClick="linkBtnPriceBelow2Million_Click">< 2 millions</asp:LinkButton></li>
                                                        <li>
                                                            <asp:LinkButton ID="LinkBtnPriceBelow4Million" runat="server" OnClick="LinkBtnPriceBelow4Million_Click">< 4 millions</asp:LinkButton></li>
                                                        <li>
                                                            <asp:LinkButton ID="LinkBtnPriceBelow6Million" runat="server" OnClick="LinkBtnPriceBelow6Million_Click">< 6 millions</asp:LinkButton></li>
                                                        <li>
                                                            <asp:LinkButton ID="LinkBtnPriceAll" runat="server" OnClick="LinkBtnPriceAll_Click">All</asp:LinkButton></li>
                                                    </ul>
                                                </li>
                                                <li class="dropdown">
                                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" id="captionScreen" runat="server">Size : <span class="featureValue">All</span> <span class="caret"></span>
                                                    </a>
                                                    <ul class="dropdown-menu">
                                                        <li>
                                                            <asp:LinkButton ID="linkBtn3Inches" runat="server" OnClick="linkBtn3Inches_Click"> 3. inches</asp:LinkButton></li>
                                                        <li>
                                                            <asp:LinkButton ID="linkBtn4Inches" runat="server" OnClick="linkBtn4Inches_Click"> 4. inches</asp:LinkButton></li>
                                                        <li>
                                                            <asp:LinkButton ID="linkBtn5Inches" runat="server" OnClick="linkBtn5Inches_Click"> 5. inches</asp:LinkButton></li>
                                                        <li>
                                                            <asp:LinkButton ID="linkBtn6Inches" runat="server" OnClick="linkBtn6Inches_Click"> 6. inches</asp:LinkButton></li>
                                                        <li>
                                                            <asp:LinkButton ID="linkBtnAllInches" runat="server" OnClick="linkBtnAllInches_Click">All</asp:LinkButton></li>
                                                    </ul>
                                                </li>
                                                <li class="dropdown">
                                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" id="captionCamera" runat="server">Camera : <span class="featureValue">All</span> <span class="caret"></span>
                                                    </a>
                                                    <ul class="dropdown-menu">
                                                        <li>
                                                            <asp:LinkButton ID="linkBtnBelow5MP" runat="server" OnClick="linkBtnBelow5MP_Click">< 5 MP</asp:LinkButton></li>
                                                        <li>
                                                            <asp:LinkButton ID="linkBtnBelow7MP" runat="server" OnClick="linkBtnBelow7MP_Click">< 7 MP</asp:LinkButton></li>
                                                        <li>
                                                            <asp:LinkButton ID="linkBtnBelow13MP" runat="server" OnClick="linkBtnBelow13MP_Click">< 13 MP</asp:LinkButton></li>
                                                        <li>
                                                            <asp:LinkButton ID="linkBtnAllMP" runat="server" OnClick="linkBtnAllMP_Click">All</asp:LinkButton></li>
                                                    </ul>
                                                </li>
                                                <li class="dropdown">
                                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" id="captionOS" runat="server">OS : <span class="featureValue">All</span> <span class="caret"></span>
                                                    </a>
                                                    <ul class="dropdown-menu">
                                                        <li>
                                                            <asp:LinkButton ID="linkBtnAndroid" runat="server" OnClick="linkBtnAndroid_Click">Android</asp:LinkButton></li>
                                                        <li>
                                                            <asp:LinkButton ID="linkBtnIOS" runat="server" OnClick="linkBtnIOS_Click">iOS (iPhone)</asp:LinkButton></li>
                                                        <li>
                                                            <asp:LinkButton ID="linkBtnWindowPhone" runat="server" OnClick="linkBtnWindowPhone_Click">Windows Phone</asp:LinkButton></li>
                                                        <li>
                                                            <asp:LinkButton ID="linkBtnAllOS" runat="server" OnClick="linkBtnAllOS_Click">OS : <span class="featureValue">All</span></asp:LinkButton></li>
                                                    </ul>
                                                </li>
                                                <li class="dropdown">
                                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" id="captionRAM" runat="server">RAM : <span class="featureValue">All</span> <span class="caret"></span>
                                                    </a>
                                                    <ul class="dropdown-menu">
                                                        <li>
                                                            <asp:LinkButton ID="linkBtn1GB" runat="server" OnClick="linkBtn1GB_Click">1 GB</asp:LinkButton></li>
                                                        <li>
                                                            <asp:LinkButton ID="LinkBtn2GB" runat="server" OnClick="LinkBtn2GB_Click">2 GB</asp:LinkButton></li>
                                                        <li>
                                                            <asp:LinkButton ID="LinkBtn3GB" runat="server" OnClick="LinkBtn3GB_Click">3 GB</asp:LinkButton></li>
                                                        <li>
                                                            <asp:LinkButton ID="LinkBtn4GB" runat="server" OnClick="LinkBtn4GB_Click">4 GB</asp:LinkButton></li>
                                                        <li>
                                                            <asp:LinkButton ID="LinkBtnAllGB" runat="server" OnClick="LinkBtnAllGB_Click">All</asp:LinkButton></li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </div>
                                    </nav>
                                </div>

                                <div class="row" id="contentPhone" runat="server">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
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
        <!--content-->
        <script>
            $(".item").hover(function () {
                $(this).find('.item-shape').hide();
                $(this).find('.item-info').fadeIn(700);
                $(this).css({ "background-color": "ghostwhite", "cursor": "pointer" });
            }, function () {
                $(this).css({ "background-color": "white" });
                $(this).find('.item-info').hide();
                $(this).find('.item-shape').fadeIn();
            });

            $('.filter .dropdown-menu a').click(function () {
                var val = $(this).text();
                $(this).closest("ul").parent().find('.featureValue').text(val);
            });
        </script>
    </form>
</body>
</html>
