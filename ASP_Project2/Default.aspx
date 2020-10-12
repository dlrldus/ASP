﻿<%@ Page Title="" Language="C#" MasterPageFile="Index.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Simple Multi-Item Slider: Category slider with CSS animations" />
    <meta name="keywords" content="jquery plugin, item slider, categories, apple slider, css animation" />
    <meta name="author" content="Codrops" />

    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <script src="js/modernizr.custom.63321.js"></script>

    <div class="container" runat="server">

        <!--/ Codrops top bar -->
        <div class="main">
            <div id="mi-slider" class="mi-slider">
                <ul>
                    <li><a href="#">
                        <img src="images/1.jpg" alt="img01"><h4>Boots</h4>
                    </a></li>
                    <li><a href="#">
                        <img src="images/2.jpg" alt="img02"><h4>Oxfords</h4>
                    </a></li>
                    <li><a href="#">
                        <img src="images/3.jpg" alt="img03"><h4>Loafers</h4>
                    </a></li>
                    <li><a href="#">
                        <img src="images/4.jpg" alt="img04"><h4>Sneakers</h4>
                    </a></li>
                </ul>
                <ul>
                    <li><a href="#">
                        <img src="images/5.jpg" alt="img05"><h4>Belts</h4>
                    </a></li>
                    <li><a href="#">
                        <img src="images/6.jpg" alt="img06"><h4>Hats &amp; Caps</h4>
                    </a></li>
                    <li><a href="#">
                        <img src="images/7.jpg" alt="img07"><h4>Sunglasses</h4>
                    </a></li>
                    <li><a href="#">
                        <img src="images/8.jpg" alt="img08"><h4>Scarves</h4>
                    </a></li>
                </ul>
                <ul>
                    <li><a href="#">
                        <img src="images/9.jpg" alt="img09"><h4>Casual</h4>
                    </a></li>
                    <li><a href="#">
                        <img src="images/10.jpg" alt="img10"><h4>Luxury</h4>
                    </a></li>
                    <li><a href="#">
                        <img src="images/11.jpg" alt="img11"><h4>Sport</h4>
                    </a></li>
                </ul>
                <ul>
                    <li><a href="#">
                        <img src="images/12.jpg" alt="img12"><h4>Carry-Ons</h4>
                    </a></li>
                    <li><a href="#">
                        <img src="images/13.jpg" alt="img13"><h4>Duffel Bags</h4>
                    </a></li>
                    <li><a href="#">
                        <img src="images/14.jpg" alt="img14"><h4>Laptop Bags</h4>
                    </a></li>
                    <li><a href="#">
                        <img src="images/15.jpg" alt="img15"><h4>Briefcases</h4>
                    </a></li>
                </ul>
                <nav>
                    <a href="#">Shoes</a>
                    <a href="#">Accessories</a>
                    <a href="#">Watches</a>
                    <a href="#">Bags</a>
                </nav>
            </div>
        </div>
    </div>
    <!-- /container -->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script src="js/jquery.catslider.js"></script>
    <script>

        $(function () {
            $('#mi-slider').catslider();
        });
    </script>
    <script src="//tympanus.net/codrops/adpacks/demoad.js"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContent" Runat="Server">
</asp:Content>

