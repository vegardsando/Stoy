<?php
if(isset($_GET['env']) && !empty($_GET['env'])) {
	//Read the favicon template from favicon.png
	//file from current directory
	$im = imagecreatetruecolor(16, 16);

	/* Read the character which needs to be added in favicon from
	 * get request
	 */
	 $label = strtoupper($_GET['env'][0]);
	 $_GET['env'] = strtolower($_GET['env']);

	if ($_GET['env'] == 'local') {
		$farge = imagecolorallocate($im, 229, 69, 69);
	}else if($_GET['env'] == 'production' || $_GET['env'] == 'prod'){
	    $farge = imagecolorallocate($im, 31, 190, 123);
	} else {
		$farge = imagecolorallocate($im, 255, 165, 0);
	}


	/* background color for the favicon */
	imagefill($im, 0, 0, $farge);

	$font_color = imagecolorallocate($im, 255, 255, 255);

	/* Write the character in favicon
	 * arguements: image, fontsize, x-coordinate,
	 *				y-coordinate, characterstring, color
	 */
	imagechar($im, 2, 5, 1, $label, $font_color);
	header('Content-type: image/png');
	imagepng($im);
	imagedestroy($im);
}
?>
