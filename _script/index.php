<?php include('login.php'); ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Script</title>
	<style type="text/css">
	html{font-family: "arial", sans-serif;}
	a{padding:5px 8px; background-color: #525252; text-decoration: none; color:#fff; font-size: 0.8em; display: inline-block;}
	a:hover, a.hover{background-color: #828282;}
	a.klar{background-color: #82aa2f;}
	a.ikke{background-color: #c73939;}
	#slett{background: red; color:white; padding:5px; text-decoration: none; margin-top: 20px;}
	
	</style>
</head>
<body>
<?php
if (!$loggedIn && isset($_POST['pass']) && $_POST['pass'] == $pass) {
    $_SESSION['pass'] = $pass;
    $loggedIn = true;
}

if (!$loggedIn) {?>
    <form method="post" id="login">
        <input name="pass">
        <button type="submit">Logg inn</button>
    </form>
<?php
} else {
?>

<h1>Side for diverse script</h1>
<p><a href="./ee_wizard">EE Wizard</a></p>
<p><a href="compatible.php">Safe Harbour Environment Test</a></p>
<p><a href="restore">Restore Safe Harbour backup</a></p>
<p><a href="./set-ee-perms-master">Make chmode changes</a></p>
<p><a href="./zip/make_zip.php">Make site.zip and dynamic.zip</a> <span style="font-size: 11px;">legges i /script/zip/zips</span></p>
<?php if(file_exists('./zip/zips/site.zip') || file_exists('./zip/zips/dynamic.zip')) { ?>
<p><a href="./zip/unzip.php" class="<?php if(file_exists('../admin.php')){ echo 'ikke'; }else{echo 'klar';}?>">Unzip .zip filer</a></p>
<?php } 
echo 'PHP version: '.phpversion();
} ?>
</body>
</html>