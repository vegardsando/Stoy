<?php
	header('Content-type: image/svg+xml');
	session_cache_limiter('private_no_expire');

	$color = 'fill="white"';
	if(isset($_GET['color'])){
		$color = 'fill="'.$_GET['color'].'"';
	}

	$size = 'width="32" height="32"';
	if(isset($_GET['size'])){
		$size = 'width="'.$_GET['size'].'" height="'.$_GET['size'].'"';
	}

	$duration = 'dur="0.8s"';
	if(isset($_GET['dur'])){
		$duration = 'dur="'.$_GET['dur'].'s"';
	}

	echo '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" '.$size.' '.$color.'>
  <path opacity=".25" d="M16 0 A16 16 0 0 0 16 32 A16 16 0 0 0 16 0 M16 4 A12 12 0 0 1 16 28 A12 12 0 0 1 16 4"/>
  <path d="M16 0 A16 16 0 0 1 32 16 L28 16 A12 12 0 0 0 16 4z">
    <animateTransform attributeName="transform" type="rotate" from="0 16 16" to="360 16 16" '.$duration.' repeatCount="indefinite" />
  </path>
</svg>';
?>
