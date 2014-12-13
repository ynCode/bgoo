</div><!--/container_12-->
<div class="container_12 footer-bg">

    <!--Aboutus-->
    <?php if($this->config->get('gazal_custom_widget_title_' . $this->config->get('config_language_id')) != '') { ?>
	<div class="grid_3">
    	<h3 class="widgetsTitle"><?php echo $this->config->get('gazal_custom_widget_title_' . $this->config->get('config_language_id'))?></h3>
    	<div class="marB30">
    	<div class="about">
            <p>
            <?php echo $this->config->get('gazal_footer_info_text_' . $this->config->get('config_language_id'))?>
            </p>
        </div>

        <div class="clearfix"></div>

        <?php if($this->config->get('gazal_shipping_text_' . $this->config->get('config_language_id')) != '') { ?>
        <div class="shipping">
        	<?php if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') $path_image = HTTPS_IMAGE;
            else $path_image = HTTP_IMAGE;
            if($this->config->get('gazal_cus_img')!='') { ?>
            <img src="<?php echo $path_image . $this->config->get('gazal_cus_img') ?>" alt="" width="75" >
            <?php } ?>
            <span class="second-line"><?php echo $this->config->get('gazal_shipping_text_' . $this->config->get('config_language_id'))?></span> <br />
            <span class="third-line"><?php echo $this->config->get('gazal_shipping_last_text_' . $this->config->get('config_language_id'))?></span>
        </div>
        <?php } ?>
        </div>
    </div>
    <?php } ?>

    <!--contact us-->

    <?php if($this->config->get('gazal_phone') != '') { ?>
    <div class="grid_3">
    <h3 class="widgetsTitle"><?php echo $text_contact; ?></h3>
    	<div class="contact marB30">
            <?php if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') $path_image = HTTPS_IMAGE;
            else $path_image = HTTP_IMAGE;
            if($this->config->get('gazal_contact_img')!='') { ?>
            <img src="<?php echo $path_image . $this->config->get('gazal_contact_img') ?>" alt="" width="100" class="contactImg" >
            <?php } ?>
                <div class="rightCont">
                <?php if($this->config->get('gazal_address_' . $this->config->get('config_language_id')) != '') { ?>
                    <img class="icon" src="catalog/view/theme/gazal/image/home-2.png" width="25" alt="" > <?php echo $this->config->get('gazal_address_' . $this->config->get('config_language_id'))?>
                <?php } ?>
                <div style="clear: both"></div><br />
                <?php if($this->config->get('gazal_phone') != '') { ?>
                    <img class="icon" src="catalog/view/theme/gazal/image/phone.png" width="25" alt="" > <?php echo $this->config->get('gazal_phone')?> - <?php echo $this->config->get('gazal_phone_second')?>
                <?php } ?>
                <div style="clear: both"></div><br />
                <?php if($this->config->get('gazal_email') != '') { ?>
                    <img class="icon" src="catalog/view/theme/gazal/image/mail.png" width="25" alt="" > <a href="mailto:<?php echo $this->config->get('gazal_email')?>"><?php echo $this->config->get('gazal_email')?></a> -
                    <a href="mailto:<?php echo $this->config->get('gazal_email_second')?>"><?php echo $this->config->get('gazal_email_second')?></a>
                <?php } ?>
                </div>
            </div>
    </div>
    <?php } ?>


    <div class="clearfix"></div>

    <footer>
      <?php if ($informations) { ?>
      <div class="column grid_3">
        <h3><?php echo $text_information; ?></h3>
        <ul>
          <?php foreach ($informations as $information) { ?>
          <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
          <?php } ?>
            <li><a href="http://zhan.renren.com/bigome">人人小站</a></li>
            <li><a href="http://weibo.com/u/5377303903">微博</a></li>
        </ul>
      </div>
      <?php } ?>
      <div class="column grid_3">
        <h3><?php echo $text_service; ?></h3>
        <ul>
          <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
          <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
          <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
        </ul>
      </div>
      <div class="column grid_3">
        <h3><?php echo $text_extra; ?></h3>
        <ul>
          <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
          <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
          <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
          <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
        </ul>
      </div>
      <div class="column grid_3">
        <h3><?php echo $text_account; ?></h3>
        <ul>
          <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
          <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
          <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
          <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
        </ul>
      </div>

      <hr /><div class="clearfix"></div>

      <div class="grid_6">
      	  <ul class="payment">

          	<?php if($this->config->get('gazal_pay1_img') != '') { ?>
          	<li>
            	<a href="<?php echo $this->config->get('gazal_pay1_link')?>" target="_blank">
            	<?php if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') $path_image = HTTPS_IMAGE;
				else $path_image = HTTP_IMAGE;
                if($this->config->get('gazal_pay1_img')!='') { ?>
            	<img src="<?php echo $path_image . $this->config->get('gazal_pay1_img') ?>" alt="" width="45" ><!--custom image-->
                <?php } ?>
                </a>
            </li>
            <?php } ?>

            <?php if($this->config->get('gazal_pay2_img') != '') { ?>
          	<li>
            	<a href="<?php echo $this->config->get('gazal_pay2_link')?>" target="_blank">
            	<?php if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') $path_image = HTTPS_IMAGE;
				else $path_image = HTTP_IMAGE;
                if($this->config->get('gazal_pay2_img')!='') { ?>
            	<img src="<?php echo $path_image . $this->config->get('gazal_pay2_img') ?>" alt="" width="45" ><!--custom image-->
                <?php } ?>
                </a>
            </li>
            <?php } ?>

            <?php if($this->config->get('gazal_pay3_img') != '') { ?>
          	<li>
            	<a href="<?php echo $this->config->get('gazal_pay3_link')?>" target="_blank">
            	<?php if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') $path_image = HTTPS_IMAGE;
				else $path_image = HTTP_IMAGE;
                if($this->config->get('gazal_pay3_img')!='') { ?>
            	<img src="<?php echo $path_image . $this->config->get('gazal_pay3_img') ?>" alt="" width="45" ><!--custom image-->
                <?php } ?>
                </a>
            </li>
            <?php } ?>

            <?php if($this->config->get('gazal_pay4_img') != '') { ?>
          	<li>
            	<a href="<?php echo $this->config->get('gazal_pay4_link')?>" target="_blank">
            	<?php if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') $path_image = HTTPS_IMAGE;
				else $path_image = HTTP_IMAGE;
                if($this->config->get('gazal_pay4_img')!='') { ?>
            	<img src="<?php echo $path_image . $this->config->get('gazal_pay4_img') ?>" alt="" width="45" ><!--custom image-->
                <?php } ?>
                </a>
            </li>
            <?php } ?>

            <?php if($this->config->get('gazal_pay5_img') != '') { ?>
          	<li>
            	<a href="<?php echo $this->config->get('gazal_pay5_link')?>" target="_blank">
            	<?php if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') $path_image = HTTPS_IMAGE;
				else $path_image = HTTP_IMAGE;
                if($this->config->get('gazal_pay5_img')!='') { ?>
            	<img src="<?php echo $path_image . $this->config->get('gazal_pay5_img') ?>" alt="" width="45" ><!--custom image-->
                <?php } ?>
                </a>
            </li>
            <?php } ?>

            <?php if($this->config->get('gazal_pay6_img') != '') { ?>
          	<li>
            	<a href="<?php echo $this->config->get('gazal_pay6_link')?>" target="_blank">
            	<?php if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') $path_image = HTTPS_IMAGE;
				else $path_image = HTTP_IMAGE;
                if($this->config->get('gazal_pay6_img')!='') { ?>
            	<img src="<?php echo $path_image . $this->config->get('gazal_pay6_img') ?>" alt="" width="45" ><!--custom image-->
                <?php } ?>
                </a>
            </li>
            <?php } ?>

            <?php if($this->config->get('gazal_pay7_img') != '') { ?>
          	<li>
            	<a href="<?php echo $this->config->get('gazal_pay7_link')?>" target="_blank">
            	<?php if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') $path_image = HTTPS_IMAGE;
				else $path_image = HTTP_IMAGE;
                if($this->config->get('gazal_pay7_img')!='') { ?>
            	<img src="<?php echo $path_image . $this->config->get('gazal_pay7_img') ?>" alt="" width="45" ><!--custom image-->
                <?php } ?>
                </a>
            </li>
            <?php } ?>

            <?php if($this->config->get('gazal_pay8_img') != '') { ?>
          	<li>
            	<a href="<?php echo $this->config->get('gazal_pay8_link')?>" target="_blank">
            	<?php if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') $path_image = HTTPS_IMAGE;
				else $path_image = HTTP_IMAGE;
                if($this->config->get('gazal_pay8_img')!='') { ?>
            	<img src="<?php echo $path_image . $this->config->get('gazal_pay8_img') ?>" alt="" width="45" ><!--custom image-->
                <?php } ?>
                </a>
            </li>
            <?php } ?>

            <?php if($this->config->get('gazal_pay9_img') != '') { ?>
          	<li>
            	<a href="<?php echo $this->config->get('gazal_pay9_link')?>" target="_blank">
            	<?php if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') $path_image = HTTPS_IMAGE;
				else $path_image = HTTP_IMAGE;
                if($this->config->get('gazal_pay9_img')!='') { ?>
            	<img src="<?php echo $path_image . $this->config->get('gazal_pay9_img') ?>" alt="" width="45" ><!--custom image-->
                <?php } ?>
                </a>
            </li>
            <?php } ?>

            <?php if($this->config->get('gazal_pay10_img') != '') { ?>
          	<li>
            	<a href="<?php echo $this->config->get('gazal_pay10_link')?>" target="_blank">
            	<?php if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') $path_image = HTTPS_IMAGE;
				else $path_image = HTTP_IMAGE;
                if($this->config->get('gazal_pay10_img')!='') { ?>
            	<img src="<?php echo $path_image . $this->config->get('gazal_pay10_img') ?>" alt="" width="45" ><!--custom image-->
                <?php } ?>
                </a>
            </li>
            <?php } ?>
          </ul>
      </div>

      <div class="grid_6">
      	<ul class="socials">

        	<?php if($this->config->get('gazal_facebook_link') != '') { ?>
        	<li>
                <a href="<?php echo $this->config->get('gazal_facebook_link'); ?>" title="facebook" target="_blank">
                	<img src="catalog/view/theme/gazal/image/social/facebook.png" width="30" alt="" />
                </a>
            </li>
            <?php } ?>
            <?php if($this->config->get('gazal_twitter_link') != '') { ?>
            <li>
                <a href="<?php echo $this->config->get('gazal_twitter_link'); ?>" title="twitter" target="_blank">
                	<img src="catalog/view/theme/gazal/image/social/twitter.png" width="30" alt="" />
                </a>
            </li>
            <?php } ?>
            <?php if($this->config->get('gazal_google_link') != '') { ?>
            <li>
                <a href="<?php echo $this->config->get('gazal_google_link'); ?>" title="google" target="_blank">
                	<img src="catalog/view/theme/gazal/image/social/google.png" width="30" alt="" />
                </a>
            </li>
            <?php } ?>
            <?php if($this->config->get('gazal_youtube_link') != '') { ?>
            <li>
                <a href="<?php echo $this->config->get('gazal_youtube_link'); ?>" title="youtube" target="_blank">
                	<img src="catalog/view/theme/gazal/image/social/youtube.png" width="30" alt="" />
                </a>
            </li>
            <?php } ?>
            <?php if($this->config->get('gazal_linkedin_link') != '') { ?>
            <li>
                <a href="<?php echo $this->config->get('gazal_linkedin_link'); ?>" title="linkedin" target="_blank">
                    <img src="catalog/view/theme/gazal/image/social/linkedin.png" width="30" alt="" />
                </a>
            </li>
            <?php } ?>
            <?php if($this->config->get('gazal_digg_link') != '') { ?>
            <li>
                <a href="<?php echo $this->config->get('gazal_digg_link'); ?>" title="digg" target="_blank">
                    <img src="catalog/view/theme/gazal/image/social/digg.png" width="30" alt="" />
                </a>
            </li>
            <?php } ?>
            <?php if($this->config->get('gazal_dribbble_link') != '') { ?>
            <li>
                <a href="<?php echo $this->config->get('gazal_dribbble_link'); ?>" title="dribbble" target="_blank">
                    <img src="catalog/view/theme/gazal/image/social/dribbble.png" width="30" alt="" />
                </a>
            </li>
            <?php } ?>
            <?php if($this->config->get('gazal_flickr_link') != '') { ?>
            <li>
                <a href="<?php echo $this->config->get('gazal_flickr_link'); ?>" title="flickr" target="_blank">
                    <img src="catalog/view/theme/gazal/image/social/flickr.png" width="30" alt="" />
                </a>
            </li>
            <?php } ?>
            <?php if($this->config->get('gazal_pinterest_link') != '') { ?>
            <li>
                <a href="<?php echo $this->config->get('gazal_pinterest_link'); ?>" title="pinterest" target="_blank">
                    <img src="catalog/view/theme/gazal/image/social/pinterest.png" width="30" alt="" />
                </a>
            </li>
            <?php } ?>
            <?php if($this->config->get('gazal_skype_link') != '') { ?>
            <li>
                <a href="<?php echo $this->config->get('gazal_skype_link'); ?>" title="skype" target="_blank">
                    <img src="catalog/view/theme/gazal/image/social/skype.png" width="30" alt="" />
                </a>
            </li>
            <?php } ?>
            <?php if($this->config->get('gazal_vimeo_link') != '') { ?>
            <li>
                <a href="<?php echo $this->config->get('gazal_vimeo_link'); ?>" title="vimeo" target="_blank">
                    <img src="catalog/view/theme/gazal/image/social/vimeo.png" width="30" alt="" />
                </a>
            </li>
            <?php } ?>
            <?php if($this->config->get('gazal_rss_link') != '') { ?>
            <li>
                <a href="<?php echo $this->config->get('gazal_rss_link'); ?>" title="rss" target="_blank">
                	<img src="catalog/view/theme/gazal/image/social/rss.png" width="30" alt="" />
                </a>
            </li>
            <?php } ?>
        </ul>

      </div>
      <div id="powered"><?php echo $powered; ?></div>
    </footer>


</div><!--/container_12-->

</body></html>
