<h1>Forsiktig med å bruke denne filen!</h1>
<?php
echo '<meta charset="UTF-8">';
/* 
 * php delete function that deals with directories recursively
 */

function rrmdir($dir) {
  if (is_dir($dir)) {
    $objects = scandir($dir);
    foreach ($objects as $object) {
      if ($object != "." && $object != "..") {
        if (filetype($dir."/".$object) == "dir") 
           rrmdir($dir."/".$object); 
        else unlink   ($dir."/".$object);
      }
    }
    reset($objects);
    rmdir($dir);
  }
  return true;
 }

$dir = '__slett/';

if(isset($_POST['slett_confirm']) && $_POST['slett_confirm'] == 'SLETT'){
	if(file_exists($dir)){
		if(rrmdir($dir)){
			echo 'Mappe '.$dir.' er slettet!';
		}
	}else{
		echo 'Mappen '.$dir.' eksisterer ikke';
	}
}
if(file_exists($dir)){
?>
<p><b>Legg filer/mapper du vil slette i mappen '__slett' </b></p>
<form method="post">
<input type="text" name="slett_confirm" placeholder="SLETT"><br/>
<input type="submit" name="slett" value="SLETT mappe: slett/">
</form>
<?php 
}else{
	echo "<p><b>Legg filer i mappe '__slett' med denne filen i samme nivå.</b></p>";
}?>