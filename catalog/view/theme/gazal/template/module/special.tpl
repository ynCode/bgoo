<div class="box latest">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content">
    <div class="box-product">


      <?php foreach ($products as $product) { ?>
      <div class="main grid_2">
        <!-- image //
            =============-->
            <!--for swap image-->
            <?php if ($product['thumb_swap']) { ?>
              <div class="image">
                  <a href="<?php echo $product['href']; ?>">
                     <img oversrc="<?php echo $product['thumb_swap']; ?>" src="<?php echo $product['thumb']; ?>"
                     title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" style="border:none"/>
                  </a>
              </div>

              <?php } else {?>

              <div class="image">
                  <a href="<?php echo $product['href']; ?>">
                      <img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>"
                      alt="<?php echo $product['name']; ?>" style="border:none"/>
                  </a>
              </div>

              <?php } ?>
            <!--/ swap img-->

        <!-- name //
        =============-->
        <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>

        <!-- price //
        =============-->
        <?php if ($product['price']) { ?>
        <div class="price">
          <?php if (!$product['special']) { ?>
          <?php echo $product['price']; ?>
          <?php } else { ?>
          <span class="price-old"><?php echo $product['price']; ?></span>
          <span class="price-new"><?php echo $product['special']; ?></span>
          <span class="sale"><?php echo $product['saving']; ?>%</span>
          <?php } ?>
        </div>
        <?php } ?>

        <!-- rate //
        =============-->
        <div class="rating">
        <img src="catalog/view/theme/gazal/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" />
        </div>

        <!-- wish  //  compare  //  cart
        =============-->
        <div class="hover-options">
        <div class="cart">
          <input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button" />
        </div>
        <a class="wish tooltip" onclick="addToWishList('<?php echo $product['product_id']; ?>');"><span><?php echo $button_wishlist; ?></span></a>
        <a class="compare tooltip" onclick="addToCompare('<?php echo $product['product_id']; ?>');"><span><?php echo $button_compare; ?></span></a>
        </div>
      </div>
      <?php } ?>


    </div>
  </div>
</div>
