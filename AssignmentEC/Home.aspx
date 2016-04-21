<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="AssignmentEC.Home" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>

    <link rel="stylesheet" href="Update_Ass2_08Nov2015/css/style_page.css" />
    <link rel="stylesheet" href="Update_Ass2_08Nov2015/css/style_sub-menu.css" />
    <link rel="stylesheet" href="Update_Ass2_08Nov2015/css/style_main-menu.css" />
    <link rel="stylesheet" href="Update_Ass2_08Nov2015/css/style_banner.css" />
    <link rel="stylesheet" href="Update_Ass2_08Nov2015/css/style_content.css" />
    <link rel="stylesheet" href="Update_Ass2_08Nov2015/css/style_new.css" />


    <link href='http://fonts.googleapis.com/css?family=Economica:700,400italic'
        rel='stylesheet' type='text/css' />
    <!---begin new ass2---->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

</head>
<body>
    <!-------------------------------------header-menu-------------->
    <form id="form1" runat="server">
        <asp:ScriptManager ID="script1" runat="server">
        </asp:ScriptManager>
        <header>
            <div class="header-logo">
                <img src="images/logo.png">
            </div>
            <div class="header-menu">
                <div class="sub-menu">
                    <div class="items">
                        <a class="links icons_mail"></a>
                        <div class="item_contents">
                            <h2>Contact us</h2>
                            <p>
                                <a href="mailto:nguyenlanh2580@gmail.com">Email</a> <a href="#">Twitter</a>
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

                    <!---end new ass2---->


                    <div class="items">
                        <a class="links icons_buy"></a>
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
                                <asp:LinkButton ID="btnSearch" runat="server" OnClick="linkBtnSearch_Click">Go</asp:LinkButton>
                            </p>
                        </div>
                    </div>
                    <div class="items">
                        <a class="links icons_home"></a>
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
            <div class="main-menu">
                <ul>
                    <li><a href="Home.aspx">Home</a></li>
                    <li><a href="Product.aspx">Products</a></li>
                    <li><a href="Shopping.aspx">Buy</a></li>
                    <li><a href="https://www.facebook.com/lanh.nguyen.2580">Support</a></li>
                    <li><a href="https://www.facebook.com/lanh.nguyen.2580">About Us</a></li>
                </ul>
            </div>


        </header>
        <div class="tittle_page">PRODUCTS</div>

        <!-------------------------------------banner------------------>
        <nav>
            <div id="da-slider" class="da-slider">
                <div class="da-slide">
                    <h2>iPhone 6S</h2>
                    <p>
                        The only thing that's changed is everything. Every iPhone
					comes with one year of repair coverage and 90 days of complimentary
					support. Extend your coverage with AppleCare+.
                    </p>
                    <a href="#" class="da-link">Read more</a>
                    <div class="da-img">
                        <img src="images/iphone6.png" alt="image01" />
                    </div>
                </div>
                <div class="da-slide">
                    <h2>Galaxy S6</h2>
                    <p>
                        With its impressive spec sheet, premium materials and solid
					look and feel the Galaxy S6 Edge falls firmly into the high-end
					bracket of the smartphone market.
                    </p>
                    <a href="#" class="da-link">Read more</a>
                    <div class="da-img">
                        <img src="images/samsung_galaxy_s6_5.png" alt="image02" />
                    </div>
                </div>
                <div class="da-slide">
                    <h2>Microsoft Lumia 950 XL</h2>
                    <p>
                        With a stunning 5.'' Quad HD display and a powerful octa-core
					processor, it's the Lumia you've been waiting for. Get the phone
					that works like your PC and push the limits of what’s possible.
                    </p>
                    <a href="#" class="da-link">Read more</a>
                    <div class="da-img">
                        <img src="images/lumia_950.png" alt="image03" />
                    </div>
                </div>
                <div class="da-slide">
                    <h2>ASUS ZenFone 5</h2>
                    <p>
                        Zen means living up to the present moment. It is an attitude,
					a different way of living that brings happiness. Zen can be trendy
					and it is also the key ingredient in life.
                    </p>
                    <a href="#" class="da-link">Read more</a>
                    <div class="da-img">
                        <img src="images/zenfone.png" alt="image04" />
                    </div>
                </div>

                <nav class="da-arrows">
                    <span class="da-arrows-prev"></span><span class="da-arrows-next"></span>
                </nav>
            </div>
        </nav>

        <!-------------------------------------content body------------>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div id="content">
                    <div class="best-value">
                        <div class="title">
                            <div class="title-sub">
                                <p>
                                    Best Seller<p>
                            </div>
                            <div class="content-phone" id="bestSeller" runat="server">
                            </div>
                        </div>
                    </div>

                    <div class="best-value">
                        <div class="title">
                            <div class="title-sub">
                                <p>
                                    New Products<p>
                            </div>
                            <div class="content-phone" id="newProducts" runat="server">
                            </div>
                        </div>
                    </div>

                    <div class="best-value">
                        <div class="title">
                            <div class="title-sub">
                                <p>
                                    Best Favourites<p>
                            </div>
                            <div class="content-phone" id="bestFavorite" runat="server">
                            </div>
                        </div>
                    </div>

                </div>

                <footer>
                    <div class="fimg" style="padding-left: 40em;">
                        <img src="images/fb.png">
                        <img src="images/tw.png">
                        <img
                            src="images/gg.png">
                        <p>Copyright &copy; 2015</p>
                    </div>
                </footer>


                <!--sub menu-->
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

                <!--banner-->
                <script type="text/javascript"
                    src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>


                <script type="text/javascript" src="js/modernizr.custom.28468.js"></script>
                <script type="text/javascript" src="js/jquery.cslider.js"></script>

                <script type="text/javascript">
                    $(function () {
                        $('#da-slider').cslider({
                            autoplay: true,
                            bgincrement: 450
                        });
                    });
                </script>

                <!--content-->

            </ContentTemplate>
        </asp:UpdatePanel>
    </form>

</body>

</html>
