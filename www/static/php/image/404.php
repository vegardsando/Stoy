<?php

$height = 40;
$width = 40;

$transparency = 95;
$prosent = $transparency/100;
$transparency = 127*$prosent;

$img = imagecreatetruecolor($width,$height);
imagesavealpha($img, true);
$color = imagecolorallocatealpha($img, 0, 0, 0, $transparency);
imagefill($img, 0, 0, $color);
$url = 'error.png';
$icon = imagecreatefrompng($url);
list($iconWidth, $iconHeight, $iconType, $iconAttr) = getimagesize($url);
imagealphablending($icon, true);
imagesavealpha($icon, true);
if ($transparency > 70) { imagefilter($icon, IMG_FILTER_NEGATE); }
imagecopy($img, $icon, ($width/2)-($iconWidth/2), ($height/2)-($iconHeight/2), 0, 0, $iconWidth, $iconHeight);
imagedestroy($icon);

header("HTTP/1.0 404 Not Found");
header('Content-type: image/png');
imagepng($img);
imagedestroy($img);
?>
