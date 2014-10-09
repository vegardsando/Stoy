<?php include('../login.php');

global $loggedIn;

if (!$loggedIn) {
	header( 'Location: ../' ) ;
	die();
}else{
	echo '<meta charset="UTF-8">';
	function make_DB($host, $user, $pass, $db, $port){
		// Connect to MySQL
		$link = new mysqli($host, $user, $pass, $port);
		if (mysqli_connect_errno()) {
		    die('Could not connect: ' . mysqli_connect_error());
		}
		
		if (!$link->select_db($db)) {
		  if(!$link->query( "CREATE DATABASE ".$db)){
			  die('Kunne ikke opprette database!');
		  }
		}
		
		mysqli_close($link);
	}
	global $ee_installed;
	$ee_installed = false;
	
	function unzip($file_name, $folder = false) {
		global $ee_installed;
		$zip = new ZipArchive;
		$res = $zip->open('./zips/'.$file_name);
		if ($res === TRUE && !file_exists('../../admin.php') && (!$folder || !file_exists('../../'.$folder))) {
		  echo 'Pakker ut '.$file_name.'...<br/>';
		  echo '--------------------------------<br/>';
		  if($folder != false){
		  	mkdir('../../'.$folder, 0755);
		  }
		  $zip->extractTo('../../'.$folder);
		  $zip->close();
		  echo $file_name.' er blitt pakket ut!<br/>';
		  rrmdir('../../'.$folder.'/__MACOSX');
		  echo 'Mappe __MACOSX er slettet<br/>';
		  return true;
		}else if(file_exists('../../admin.php')){
			if(!$ee_installed){
				echo '<p>EE er installert fra før</p>';
			}
			$ee_installed = true;
		} else {
		  echo '<p>Filen '.$file_name.' eksisterer ikke<br/>';
		  return false;
		}
	}
	
	
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
	}
	
	
	if(isset($_POST['db_confirm']) || isset($_POST['db_ja']) ){

		if(isset($_POST['db_confirm']) && isset($_POST['sql_file']) && $_POST['sql_file'] != ''){
			if($_POST['text_confirm'] != 'IMPORTER'){
				echo 'Skriv IMPORTER i tekstfeltet!';
				?>
				<form method="post">
		        <input type="submit" value="GÅ TILBAKE">
				</form>
				<?php
				die();
			}
			include('../../ee_system/config_bootstrap.php');
			if(NSM_ENV == 'local'){
				$path = '/Applications/MAMP/Library/bin/';
			}
			$port = explode(':',$env_db_config['hostname']);
			$port_sql = '';
			$host = $env_db_config['hostname'];
			if(isset($port[1])){$port_sql = ' --port='.$port[1]; $host = $port[0];}
			$sql_exec = $path."mysql --user=".$env_db_config['username']." --password=".$env_db_config['password']." --host=".$host.$port_sql." ".$env_db_config['database']." < ../../db/".$_POST['sql_file'];
			exec($sql_exec, $output);
			echo 'Importering av:'.$_POST['sql_file'].' var velykket!';
			?>
			<form method="post">
	        <input type="submit" value="GÅ TILBAKE">
			</form>
			<?php
		}else if(isset($_POST['sql_file']) && $_POST['sql_file'] == ''){
			?>
			Du må velge fil fra dropdown!<br/>
			<form method="post">
	        <input type="submit" name="db_confirm" value="NEI GÅ TILBAKE">
			</form>
			<?php
		}else{
			?>
			PS! VÆR KLAR OVER AT DETTE VIL OVERSKRIVE DATABASEN!<br/>
			<form method="post">
			<select name="sql_file">
			<option value=""></option>
			<?php 
				if(file_exists('../../db')){
			    $sql_file = scandir('../../db');
			    
			    foreach($sql_file as $file => $value) 
			    {
			       if(!in_array($value, array('..','.', '.DS_Store')) ){
				        echo '<option value="'. $value .'">'. $value .'</option>';
			       }
			    }
			    }
			?>
			</select><br/>
			<input type="text" name="text_confirm" placeholder="IMPORTER"><br/>
			<input type="submit" name="db_confirm" value="JA JEG VIL IMPORTERE ">
	        <input type="submit" value="NEI GÅ TILBAKE">
			</form>
			<?php
		}
		
	}else{
		unzip('dynamic.zip', 'dynamic');
		unzip('site.zip');
		include('../../ee_system/config_bootstrap.php');
		echo 'Importer til følgende:<br/>';
		echo '------------------------------------------------------------<br/>';
		echo 'Du er i følgende enviroment: <b>'.NSM_ENV.'</b><br/>';
		echo '------------------------------------------------------------<br/>';
		echo '<b>Host:</b> '.$env_db_config['hostname'].'<br/>';
		echo '<b>Username:</b> '.$env_db_config['username'].'<br/>';
		echo '<b>Password:</b> '.$env_db_config['password'].'<br/>';
		echo '<b>Database:</b> '.$env_db_config['database'].'<br/>';
		echo '------------------------------------------------------------<br/>';
		$port = explode(':',$env_db_config['hostname']);
		$port_sql = '';
		$host = $env_db_config['hostname'];
		if(isset($port[1])){$port_sql = $port[1]; $host = $port[0];}
		make_DB($host, $env_db_config['username'], $env_db_config['password'], $env_db_config['database'], $port_sql);
		?>
		<form method="post">
		<input type="submit" name="db_ja" value="Importer database til db vist over">
		</form>
		<?php
	}
	


}
?>