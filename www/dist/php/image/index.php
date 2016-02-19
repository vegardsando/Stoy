<?php

$height = 2;
if(isset($_GET['h'])){
	$height = $_GET['h'];
}

$width = 2;
if(isset($_GET['w'])){
	$width = $_GET['w'];
}

$transparency = 127;
if(isset($_GET['t'])){
	$prosent = $transparency/100;
	$transparency = $_GET['t']*$prosent;
}

$img = imagecreatetruecolor($width,$height);
imagesavealpha($img, true);
$color = imagecolorallocatealpha($img, 0, 0, 0, $transparency);
imagefill($img, 0, 0, $color);

if (isset($_GET['icon'])) {
	$url = 'error.png';
	if ($_GET['icon'] !== '') {$url = $_GET['icon'].'.png';}
	if (file_exists($url)) {
		$icon = imagecreatefrompng($url);
		list($iconWidth, $iconHeight, $iconType, $iconAttr) = getimagesize($url);
		imagealphablending($icon, true);
		imagesavealpha($icon, true);
		if (isset($_GET['t']) && $_GET['t'] > 70) { imagefilter($icon, IMG_FILTER_NEGATE); }
		imagecopy($img, $icon, ($width/2)-($iconWidth/2), ($height/2)-($iconHeight/2), 0, 0, $iconWidth, $iconHeight);
		imagedestroy($icon);
	}
}

header('Content-type: image/png');
session_cache_limiter('private_no_expire');
imagepng($img);
imagedestroy($img);
?>
