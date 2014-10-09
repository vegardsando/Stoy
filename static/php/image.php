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
	$transparency = $_GET['t'];
}

$img = imagecreatetruecolor($width,$height);
imagesavealpha($img, true);
$color = imagecolorallocatealpha($img, 0, 0, 0, $transparency);
imagefill($img, 0, 0, $color);
header('Content-type: image/png');
imagepng($img);
imagedestroy($img);
?>