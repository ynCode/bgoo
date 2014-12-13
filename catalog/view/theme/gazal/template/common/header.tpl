<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="zh-cn">
<!--<![endif]--><head>

    <meta charset="UTF-8" />

    <!-- Mobile Specific Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />

    <title><?php echo $title; ?></title>

    <base href="<?php echo $base; ?>" />
    <link rel="stylesheet" type="text/css" href="catalog/view/theme/gazal/stylesheet/side-bar.css">
    <?php if ($description) { ?>
    <meta name="description" content="<?php echo $description; ?>" />
    <?php } ?>

    <?php if ($keywords) { ?>
    <meta name="keywords" content="<?php echo $keywords; ?>" />
    <?php } ?>

    <?php if ($icon) { ?>
    <link href="<?php echo $icon; ?>" rel="icon" />
    <?php } ?>

    <?php foreach ($links as $link) { ?>
    <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
    <?php } ?>

    <?php foreach ($styles as $style) { ?>
    <link rel="<?php echo $style['rel']; ?>" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
    <?php } ?>

    <!-- jQuery Library --><script src="http://apps.bdimg.com/libs/jquery/1.7.1/jquery.min.js"></script>
    <!--[if lt IE 9]><script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->

    <!-- ///////////// IF RTL ///////////////// -->
    <?php if ($direction == 'rtl') { ?>
    <!-- MAIN STYLE --><link rel="stylesheet" href="catalog/view/theme/gazal/stylesheet/rtl/stylesheet.css" />
    <!-- cloud zoom --><link href="catalog/view/theme/gazal/stylesheet/rtl/cloud-zoom.css" />
    <!-- Custom.js for included scripts --><script src="catalog/view/javascript/jquery/custom-rtl.js"></script>
    <!-- cloud zoom --><script src="catalog/view/javascript/jquery/cloud-zoom.1.0.2.min-rtl.js"></script>

    <!-- ///////////// IF LTR ///////////////// -->
    <?php } else { ?>
    <!-- MAIN STYLE --><link rel="stylesheet" href="catalog/view/theme/gazal/stylesheet/stylesheet.css" />
    <!-- MENU-SIDE-BAR STYLE --><link rel="stylesheet" href="catalog/view/theme/gazal/stylesheet/menu-side-bar.css" />
	<!-- cloud zoom --><link href="catalog/view/theme/gazal/stylesheet/cloud-zoom.css" />
    <!-- Custom.js for included scripts --><script src="catalog/view/javascript/jquery/custom.js"></script>
    <!-- cloud zoom --><script src="catalog/view/javascript/jquery/cloud-zoom.1.0.2.min.js"></script>
    <?php } ?>

	<!--960 GRID SYSTEM--><script src="catalog/view/javascript/jquery/adapt.min.js"></script>
    <!-- UItoTop plugin --><link rel="stylesheet" media="screen,projection" href="catalog/view/theme/gazal/stylesheet/ui.totop.css" />
	<!-- UItoTop plugin --><script src="catalog/view/javascript/jquery/jquery.ui.totop.js" ></script>
    <!--flex slider--><link rel="stylesheet" href="catalog/view/theme/gazal/stylesheet/flexslider.css" media="screen" />
    <!--flex slider--><script src="catalog/view/javascript/jquery/jquery.easing.js"></script>
	<!--flex slider--><script defer src="catalog/view/javascript/jquery/jquery.flexslider.min.js"></script>
    <!--carouFredSel--><script src="catalog/view/javascript/jquery/jquery.carouFredSel-6.1.0-packed.js"></script>
    <!--carouFredSel - optional--><script src="catalog/view/javascript/jquery/jquery.touchSwipe.min.js"></script>
    <!--carouFredSel - optional--><script src="catalog/view/javascript/jquery/jquery.ba-throttle-debounce.min.js"></script>
    <?php
    $_SESSION['consumer_keyy']=$this->config->get('consumer_keyy');
    $_SESSION['consumer_secrett']=$this->config->get('consumer_secrett');
    $_SESSION['access_token']=$this->config->get('access_token');
    $_SESSION['token_secret']=$this->config->get('token_secret');
    ?>

    <!-- Autofill search --><script src="catalog/view/javascript/jquery/livesearch.js"></script>

    <script src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
    <link rel="stylesheet" href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />
    <script src="catalog/view/javascript/jquery/colorbox/jquery.colorbox.js"></script>
    <link rel="stylesheet" href="catalog/view/javascript/jquery/colorbox/colorbox.css" media="screen" />
    <script src="catalog/view/javascript/common.js"></script>
    <?php foreach ($scripts as $script) { ?>
    <script src="<?php echo $script; ?>"></script>
    <?php } ?>

    <?php if ($stores) { ?>
    <script type="text/javascript"><!--
    $(document).ready(function() {
    <?php foreach ($stores as $store) { ?>
    $('body').prepend('<iframe src="<?php echo $store; ?>" style="display: none;"></iframe>');
    <?php } ?>
    });
    //--></script>
    <?php } ?>


<!--****************************************************************************************************************-->

<!--=========================================================== THEME OPTIONS START HERE ===========================-->

<!--****************************************************************************************************************-->
<?php
// If gazal module is enabled
if($this->config->get('gazal_status')== 1) { ?>
<?php } ?>
<!--**************************************************************************************************************-->
<!--=========================================================== THEME OPTIONS END HERE ===========================-->
<!--**************************************************************************************************************-->

</head>

<body>
      <div class="strip">
        <div class="header">
            <!-- Links -->
            <div class="links">
              <a href="<?php echo $wishlist; ?>" id="wishlist-total"><?php echo $text_wishlist; ?></a>
              <a href="<?php echo $account; ?>"><?php echo $text_account; ?></a>
              <a href="<?php echo $shopping_cart; ?>"><?php echo $text_shopping_cart; ?></a>
              <a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a>
          </div>
            <!-- Login -->
          <div id="welcome" class="grid_6">
            <?php if (!$logged) { ?>
            <?php echo $text_welcome; ?>
            <?php } else { ?>
            <?php echo $text_logged; ?>
            <?php } ?>
          </div>
        </div>
      </div><!--/strip-->
      <style>
        .img-banner-header {
            margin: 0 auto;
            display: block;
            width: 1200px;
        }
        .banner-header {
            width: 100%;
            height: auto;
            background: #1CBD95;
            margin: -20px 0 20px 0;
        }
      </style>
      <div class="banner-header">
        <div class="img-banner-header">
            <img src="http://www.bgoo.me/image/banner-header.png" alt="">
        </div>
      </div>
<div class="container_12">

    <header>



      <div class="clearfix"></div>




      <?php if ($logo) { ?>
      <div id="logo" class="grid_3">
      	<a href="<?php echo $home; ?>">
        	<img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" />
        </a>
      </div>
      <?php } ?>

    <div class="clearfix"></div>

    </header>

    <div class="clearfix"></div>

    <!-- top-menu -->
    <div class="top-menu grid_12">
    	<ul>
        	<li><a href="<?php echo $home; ?>" class="font-icon home-main-menu"></a></li>
            <?php if ($categories) { ?>
            <li class="cats"><a href="#"><?php echo $text_categories; ?></a>
            	<div class="cat-wrap">
                	<?php foreach ($categories as $category) { ?>
                    	<div class="one-dept">
                            <a class="mainCat" href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
                              <?php if ($category['children']) { ?>
                                  <div>
                                    <?php for ($i = 0; $i < count($category['children']);) { ?>
                                        <ul>
                                          <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
                                          <?php for (; $i < $j; $i++) { ?>
                                          <?php if (isset($category['children'][$i])) { ?>
                                          <li><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a></li>
                                          <?php } ?>
                                          <?php } ?>
                                        </ul>
                                    <?php } ?>
                                  </div>
                              <?php } ?>
                       </div><!--/one-dept-->
                    <?php } ?>
                </div><!--/cat-wrap-->
            </li>
            <?php } ?>
           <!--  <li><a href="index.php?route=information/information&information_id=4"><?php echo $text_about; ?></a></li> -->
            <li><a href="index.php?route=product/special"><?php echo $text_special; ?></a></li>
            <li><a href="index.php?route=product/manufacturer"><?php echo $text_manufacturer; ?></a></li>
            <li><a href="index.php?route=information/contact"><?php echo $text_contact; ?></a></li>
            <li><a href="index.php?route=information/information&information_id=8">零食架申请</a></li>
            <!-- <li><a href="index.php?route=news/headlines"><?php echo $text_blog; ?></a></li> -->
        </ul>
        <div class="search">
            <div id="search">
                <!--btn-->
                <div class="button-search"></div>
                <!--input-->
                <input type="text" name="search" placeholder="<?php echo $text_search; ?>" value="<?php echo $search; ?>" />
            </div>
        </div>
    </div><!-- /top-menu -->


    <!--***** MENU FOR MOBILE DEVICES RETURNS INTO SELECT ****-->
    <?php if ($categories) { ?>
    <div class="menuDevices grid_12" style="display:none">
      <div class="select_outer">
          <div class="bg_select"></div>
          <select onchange="location=this.value">
                <option>MENU</option>
                <option value="index.php?route=news/headlines"><?php echo $text_blog; ?></option>
                <?php foreach ($categories as $category) { ?>
                <option value="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></option>
                <?php } ?>
          </select>
      </div><!--/select_outer-->
    </div>
    <?php } ?>

    <!-- Search -->
<!-- side-bar -->
<div class="side-bar">
    <ul>
        <li><a class="collection font-icon" href="<?php echo $wishlist; ?>"><span>我的收藏</span></a></li>
        <li><a class="side-bar-cart font-icon" href="<?php echo $shopping_cart; ?>">
            <p class="num-cart-side-bar">
                <?php echo $product_count = $this->cart->countProducts(); ?>
            </p>
            <span>
                购物车
                <p class="total-cart-side-bar"><?php echo $cart_total = $this->cart->getTotal(); ?><em>元</em></p>
            </span>
        </a></li>
        <li><a class="bill font-icon" href="<?php echo $checkout; ?>"><span>结账</span></a></li>
        <li><a class="customer font-icon" href="http://wpa.qq.com/msgrd?v=3&uin=1055506398&site=qq&menu=yes" target="_blank"><span>联系客服</span></a></li>
    </ul>
</div>
    <div class="clearfix"></div>

    <div id="notification"></div>

    <div class="clearfix"></div>
