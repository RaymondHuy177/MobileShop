<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DetailProduct.aspx.cs" Inherits="AssignmentEC.Detail.DetailProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Information</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href='http://fonts.googleapis.com/css?family=Ubuntu+Condensed' rel='stylesheet' type='text/css'>
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    <!--<link rel='stylesheet' href='http://codepen.io/assets/libs/fullpage/jquery-ui.css'>-->

    <script src="js/jquery_and_jqueryui.js"></script>


    <!--<script type="text/javascript" src="js/jquery-1.9.0.min.js"></script>-->
    <script src="js/jquery.openCarousel.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/easing.js"></script>
    <script type="text/javascript" src="js/move-top.js"></script>
    <script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
    <link href="css/easy-responsive-tabs.css" rel="stylesheet" type="text/css" media="all" />
    <script type="text/javascript">
        $(document).ready(function () {
            $('#horizontalTab').easyResponsiveTabs({
                type: 'default', //Types: default, vertical, accordion
                width: 'auto', //auto or any width like 600px
                fit: true   // 100% fit in a container
            });

            $('#etalage').etalage({
                thumb_image_width: 300,
                thumb_image_height: 400,
                source_image_width: 900,
                source_image_height: 1200,
                show_hint: true,
                click_callback: function (image_anchor, instance_id) {
                    alert('Callback example:\nYou clicked on an image with the anchor: "' + image_anchor + '"\n(in Etalage instance: "' + instance_id + '")');
                }
            });
        });
    </script>
    <link rel="stylesheet" href="css/etalage.css">
    <script src="js/jquery.etalage.min.js"></script>
    <script src="js/star-rating.js" type="text/javascript"></script>

    <link rel="stylesheet" href="css1/style.css">
    <link rel="stylesheet" type="text/css" href="css1/style_common.css" />
    <link rel="stylesheet" type="text/css" href="css1/style2.css" />

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css">
    <link rel="stylesheet" href="../css/style_page.css">
    <link rel="stylesheet" href="../css/style_sub-menu_index.css">
    <link rel="stylesheet" href="../css/style_main-menu.css">
    <link rel="stylesheet" href="../css/style_banner.css">
    <link rel="stylesheet" href="../css/style_page.css" />
    <link rel="stylesheet" href="../css/style_content_index.css" />

    <link href='http://fonts.googleapis.com/css?family=Economica:700,400italic'
        rel='stylesheet' type='text/css'>

    <!-- Item shopping fly effect-->
    <script>
        $(document).ready(function () {
            $('.add-to-cart').on('click', function () {
                var cart = $('.shopping-cart');
                //var imgtodrag = $(this).parent('.item').find("img").eq(0);
                var imgtodrag = $('.etalage_smallthumb_active');
                if (imgtodrag) {
                    var imgclone = imgtodrag.clone()
                            .offset({
                                top: imgtodrag.offset().top,
                                left: imgtodrag.offset().left
                            })
                            .css({
                                'opacity': '0.5',
                                'position': 'absolute',
                                'height': '150px',
                                'width': '150px',
                                'z-index': '100'
                            })
                            .appendTo($('body'))
                            .animate({
                                'top': cart.offset().top + 10,
                                'left': cart.offset().left + 10,
                                'width': 75,
                                'height': 75
                            }, 1000, 'easeInOutExpo');

                    setTimeout(function () {
                        cart.effect("shake", {
                            times: 2
                        }, 200);
                    }, 1500);

                    imgclone.animate({
                        'width': 0,
                        'height': 0
                    }, function () {
                        $(this).detach()
                    });
                }
            });
        });
    </script>
</head>
<body style="background: url(../images/bg.png) repeat center center; margin: 0 auto;">

    <form id="form1" runat="server">
        <asp:ScriptManager ID="script1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="update1" runat="server">
            <ContentTemplate>

                <div id="header">
                    <div class="header-menu">
                        <div class="title_page">INFORMATION</div>
                        <div class="sub-menu">
                            <div class="items">
                                <a class="links icons_mail"></a>
                                <div class="item_contents">
                                    <h2>Contact us</h2>
                                    <p>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="#">FAQ</a> <a href="#">Live Support</a>
                                    </p>
                                </div>
                            </div>
                            <div class="items">
                                <a class="links icons_buy" href="../Shopping.aspx"></a>
                                <div class="item_contents">
                                    <h2>Buy</h2>
                                    <p>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="../Shopping.aspx">Products</a>
                                    </p>
                                </div>
                            </div>
                            <div class="items">
                                <a class="links icons_find"></a>
                                <div class="item_contents">
                                    <h2>Search</h2>
                                    <p>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="txtSearch" runat="server" Width="130px"></asp:TextBox>
                                        <asp:LinkButton ID="linkBtnSearch" runat="server" OnClick="linkBtnSearch_Click" Text="Go"></asp:LinkButton>
                                    </p>
                                </div>
                            </div>
                            <div class="items">
                                <a class="links icons_home" href="../Home.aspx"></a>
                                <div class="item_contents">
                                    <h2>Start from here</h2>
                                    <p>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <a href="../Home.aspx">Home</a>
                                        <a href="../Product.aspx">Products</a>
                                        <li><a href="../Shopping.aspx">Buy</a></li>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <br />
                <br />
                <!-- Main Content -->
                <div class="main">
                    <div class="wrap">
                        <div class="preview-page">
                            <div class="section group">
                                <div class="cont-desc span_1_of_2">
                                    <ul class="back-links">
                                        <li><a href="~/Home.aspx">Home</a> ::</li>
                                        <li><a href="../Product.aspx">Products</a> ::</li>
                                        <li id="liProductName" runat="server"></li>
                                        <div class="clear"></div>
                                    </ul>
                                    <div class="product-details">
                                        <div class="grid images_3_of_2">
                                            <ul id="etalage">
                                                <li id="liImage1" runat="server">
                                                    <a href="optionallink.html">
                                                        <img class="etalage_thumb_image" id="image1" runat="server" />
                                                        <img class="etalage_source_image" id="bigImage1" title="" runat="server" />
                                                    </a>
                                                </li>
                                                <li id="liImage2" runat="server">
                                                    <img class="etalage_thumb_image" id="image2" runat="server" />
                                                    <img class="etalage_source_image" id="bigImage2" title="" runat="server" />
                                                </li>
                                                <li id="liImage3" runat="server" hidden="hidden">
                                                    <img class="etalage_thumb_image" id="image3" runat="server" />
                                                    <img class="etalage_source_image" id="bigImage3" runat="server" />
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="desc span_3_of_2">
                                            <h2 id="namePhone" runat="server">Whirlpool LTE5243D 3.4 CuFt.... </h2>
                                            <p>Warranty at all warranty centers</p>
                                            <div class="price">
                                                <p id="pricePhone" runat="server">Giá: <span>$839.93</span></p>
                                            </div>
                                            <div class="available">
                                                <ul>
                                                    <li id="mobileOS" runat="server"><span>Operating System:</span> &nbsp; Model 1</li>
                                                    <li id="mobileSize" runat="server"><span>Display Size:</span>&nbsp; 75.58 kg</li>
                                                    <li id="nPhoneLeft" runat="server"><span>Remains:</span>&nbsp; 566</li>
                                                </ul>
                                            </div>
                                            <div class="share-desc">
                                                <div class="share">
                                                    <p>Quantity:</p>
                                                    <input id="nPhoneBought" runat="server" type="number" class="text_box" value="1" min="1" />
                                                </div>
                                                <div class="button">
                                                    <span>
                                                        <asp:LinkButton ID="linkBtnAddToCart" runat="server" CssClass="add-to-cart" OnClick="linkBtnAddToCart_Click" OnClientClick="if ( !confirm('Bạn muốn thêm sản phẩm này vào giỏ hàng ?')) return false;">Add to Cart</asp:LinkButton></span>
                                                </div>
                                                <div class="clear"></div>
                                            </div>
                                            <div class="wish-list">
                                                <ul>
                                                    <li class="compare"><a href="#">Add to Compare</a></li>
                                                </ul>
                                            </div>

                                        </div>
                                        <div class="clear"></div>
                                    </div>
                                    <div class="product_desc">
                                        <div id="horizontalTab">
                                            <ul class="resp-tabs-list">
                                                <li>Details</li>
                                                <li>Tags</li>
                                                <li>Comment</li>
                                                <div class="clear"></div>
                                            </ul>
                                            <div class="resp-tabs-container">
                                                <div class="product-specifications" id="productSpecification" runat="server">
                                                    <ul>
                                                        <li><span class="specification-heading">Body type</span> <span>Metal</span><div class="clear"></div>
                                                        </li>
                                                        <li><span class="specification-heading">Spin Speed (rpm)</span> <span>0/400/800/1000/1200</span><div class="clear"></div>
                                                        </li>
                                                        <li><span class="specification-heading">Machine weight (kg)</span> <span>75</span><div class="clear"></div>
                                                        </li>
                                                        <li><span class="specification-heading">Wash System</span> <span>Tumble wash</span><div class="clear"></div>
                                                        </li>
                                                        <li><span class="specification-heading">Door diameter (mm)</span> <span>300</span><div class="clear"></div>
                                                        </li>
                                                        <li><span class="specification-heading">Dimensions (w*d*h) without packing</span> <span>595x595x850</span><div class="clear"></div>
                                                        </li>
                                                        <li><span class="specification-heading">Power Supply</span> <span>230V, 50Hz, 16Amps</span><div class="clear"></div>
                                                        </li>
                                                        <li><span class="specification-heading">Motor (Watts)</span> <span>440 for Wash/490 for Spin</span><div class="clear"></div>
                                                        </li>
                                                        <li><span class="specification-heading">Drum basket</span> <span>stainless steel</span><div class="clear"></div>
                                                        </li>
                                                        <li><span class="specification-heading">Adjustable Feet</span> <span>4 </span>
                                                            <div class="clear"></div>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                </div>
                <!-- End Main Content -->


                <!-- Footer -->
                <!-- End Footer -->

                <div class="footer">
                    <div class="fimg" style="padding-left: 40em;">
                        <img src="../images/fb.png">
                        <img src="../images/tw.png" />
                        <img
                            src="images/gg.png">
                        <p>Copyright &copy; 2015</p>
                    </div>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>
        <!-- Scroll to Top -->
        <script type="text/javascript">
            $(document).ready(function () {
                $().UItoTop({ easingType: 'easeOutQuart' });

                $('.items').hover(function () {
                    var $this = $(this);
                    expand($this);
                }, function () {
                    var $this = $(this);
                    collapse($this);
                });
                function addToCart() {
                    alert("Đã thêm vào giỏ hàng");
                }
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
            });
        </script>
        <a href="#" id="toTop"></a>
        <script type="text/javascript" src="js/navigation.js"></script>

    </form>
</body>
</html>
