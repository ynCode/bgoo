<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <h1><?php echo $heading_title; ?></h1>
  <style>
	.content ul{margin: 0px;padding: 0;}
	.content li{list-style-type: none;background:#eee ;margin-bottom:10px;display:block;padding: 10px;}
	.content p{padding: 5px 0;margin: 0px;font-size:18px}
	.content label{display:block;padding:10px 0}
  </style>

  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
    <div class="contact-info">
		<div class="content">
		<ul>
			<?php foreach($message['rows'] as $v) {?>
			<li>
				<p><?php echo $v['username']?>留言：</p>
				<span style="font-size:14px;padding:5px 0px;display:block"><?php echo $v['content']; ?></span>
				<br><span style="font-size:10px">留言时间：<?php echo date('Y-m-d',$v['create_time'])?></span>
				<?php if(!empty($v['reply'])): ?><p>管理员回复：<?php echo $v['reply']?></p><?php endif;?>
			</li>
			<?php } ?>
		</ul>
		<?php for($i=1;$i<=$page;$i++){?>
		<a style="" href="index.php?route=information/contact&page=<?php echo $i;?>"><span><?php echo $i;?></span></a>
		<?php }?>
		</div>
    </div>
    <h2>给我们留言</h2>
    <div class="content">
    <b>您的姓名：<br />
    <input type="text" name="name" value="" />
	<br />
    <?php if ($error_name) { ?>
    <span class="error"><?php echo $error_name; ?></span>
    <?php } ?>
    <br />
    <b>您的联系方式<br />
    <input type="text" name="contact" value="" />
	<br />
	 <?php if ($error_moblie) { ?>
    <span class="error"><?php echo $error_moblie; ?></span>
    <?php } ?>
    <br />
    <b>内容<br />
    <textarea name="enquiry" cols="40" rows="10" style="width: 99%;"></textarea>
	<br />
    <?php if ($error_enquiry) { ?>
    <span class="error"><?php echo $error_enquiry; ?></span>
    <?php } ?>
    <br />
    <b>验证码<br />
    <input type="text" name="captcha" value="" />
    <br />
    <img src="index.php?route=information/contact/captcha" alt="" />
	 <?php if ($error_captcha) { ?>
    <span class="error"><?php echo $error_captcha; ?></span>
    <?php } ?>
    </div>
	<div>
		留言
	</div>
    <div class="buttons">
      <div class="right"><input type="submit" value="<?php echo $button_continue; ?>" class="button" /></div>
    </div>
  </form>
  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>
