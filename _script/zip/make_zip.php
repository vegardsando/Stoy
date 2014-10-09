<?php include('../login.php');

global $loggedIn;

if (!$loggedIn) {
	header( 'Location: ../' ) ;
	die();
}else{
	echo '<meta charset="UTF-8">';
	function strpos_arr($haystack, $needle) {
	    if(!is_array($needle)) $needle = array($needle);
	    foreach($needle as $what) {
	        if(($pos = strpos($haystack, $what))!==false) return $pos;
	    }
	    return false;
	}
	
	function rmdir_recursive($dir) {
		if(is_dir($dir)){
		    foreach(scandir($dir) as $file) {
		        if ('.' === $file || '..' === $file) continue;
		        if (is_dir("$dir/$file")) rmdir_recursive("$dir/$file");
		        else unlink("$dir/$file");
		    }
		    rmdir($dir);
	    }
	    mkdir($dir);
	}

	function Zip($source, $destination, $exlude = false)
	{
		
	    if (!extension_loaded('zip') || !file_exists($source)) {
	        return false;
	    }
	
	    $zip = new ZipArchive();
	    if (!$zip->open($destination, ZIPARCHIVE::CREATE)) {
	        return false;
	    }
	
	    $source = str_replace('\\', '/', realpath($source));
	
	    if (is_dir($source) === true)
	    {
	        $files = new RecursiveIteratorIterator(new RecursiveDirectoryIterator($source), RecursiveIteratorIterator::SELF_FIRST);
	
	        foreach ($files as $file)
	        {
	            $file = str_replace('\\', '/', $file);
	
	            // Ignore "." and ".." folders
	            if( in_array(substr($file, strrpos($file, '/')+1), array('.','..')) )
	                continue;
	                
	            $file = realpath($file);
	            
	            if($exlude != false){
			        if (is_array($exlude)) {
				          if(strpos_arr($file, $exlude))
						  continue;
				     }else {
				          if(strpos($file, $exlude) !== false)
						  continue;
				     }
	            }
	                
	
	            if (is_dir($file) === true)
	            {
	                $zip->addEmptyDir(str_replace($source . '/', '', $file . '/'));
	                
	            }
	            else if (is_file($file) === true)
	            {
	            	if( in_array(substr($file, strrpos($file, '/')+1), array('script.zip','.DS_Store')) )
	                continue;
	                $zip->addFromString(str_replace($source . '/', '', $file), file_get_contents($file));
	            }
	            
	            if(isset($_GET['debug'])){
		            echo $file.'<br/>';
	            }
	        }
	        
	        
	    }
	    else if (is_file($source) === true)
	    {
	        $zip->addFromString(basename($source), file_get_contents($source));
	    }
	
	    return $zip->close();
	}
	
	if(isset($_POST['db_ja']) || isset($_POST['db_nei'])){
		echo 'Starting to zip!<br/>';
		echo '----------------------------------<br/>';
		if(isset($_POST['db_ja'])){
			include('../../ee_system/config_bootstrap.php');
			$name = $env_db_config['database'].'_fra_'.NSM_ENV.'_'.date('d_m_Y').'.sql';
			$path = '';
			$port = explode(':',$env_db_config['hostname']);
			$port_sql = '';
			$host = $env_db_config['hostname'];
			if(isset($port[1])){$port_sql = ' --port='.$port[1]; $host = $port[0];}
			if(NSM_ENV == 'local'){
				$path = '/Applications/MAMP/Library/bin/';
			}
			$dir = '../../db';
		    if (!file_exists($dir) && !is_dir($dir)) {
			    mkdir($dir);         
			} 
			$outpu_int = 0;
			$sql_exec = $path."mysqldump --user=".$env_db_config['username']." --password=".$env_db_config['password']." --host=".$host.$port_sql." ".$env_db_config['database']." > ".$dir."/".$name;
			//die($sql_exec);
			exec($sql_exec);
			echo 'DB fil: '.$name.' ble laget!<br/>';
			$db_import = true;
		}else{
			$db_import = true;
		}
		rmdir_recursive('./zips');
		if($db_import && Zip('../../', './zips/site.zip', array('/dynamic','/images/made/','/images/remote/'))){
			echo 'site.zip ble laget ';
			echo '<a href="zips/site.zip">Last ned</a><br/>';
			
			if(Zip('../../dynamic/', './zips/dynamic.zip', array('/dynamic/minimee/', '/dynamic/backup/updater/', '/dynamic/backup/safeharbor_backups/'))){
				echo 'dynamic.zip ble laget ';
				echo '<a href="zips/dynamic.zip">Last ned</a><br/>';
				
				if(Zip('../../script/', '../../script.zip')){
					echo '----------------------------------<br/>';
					echo 'script.zip ble laget ';
					echo '<a href="../../script.zip">Last ned</a><br/>';
				}
			}
		}else{
			echo 'Det skjedde en feil';
		}
	}else{
		?>
		<b>Velg hva du vil gjøre:</b><br/>
		<form method="post">
		<input type="submit" name="db_ja" value="Lag SQL dump av database deretter zip filer">
        <input type="submit" name="db_nei" value="Bare zip filer">
		</form>
		<?php
	}
	
}
?>