<?php
header('Content-Type: application/json');
if (!isset($_GET['ENV']) && $_GET['ENV'] !== 'PROD'){ die(); }
	$env = $_GET['ENV'];
	$make_dump = false;
	$root_folder = dirname(__FILE__) .'/../../../../';
	$db_folder = $root_folder.'db/';
	$files = glob($db_folder.'AUTO_dump_'.$env.'*.sql');
	$db = include_once($root_folder.'craft/config/db.php');
	$db = $db[$env];
	$host = isset($db['port']) ? $db['server'].':'.$db['port'] : $db['server'];
	// Create connection
	$conn = new mysqli($host, $db['user'], $db['password']);
	// Check connection
	if ($conn->connect_errno) {
		$result['console'] = $conn->connect_errno;
		print json_encode($result, JSON_PRETTY_PRINT);
		die();
	}

	if( empty( $files ) ) {
		$make_dump = true;
	} else {

		$table = $db['database'];
		$dbesult = $conn->query("SELECT MAX(update_time) as updated FROM information_schema.tables WHERE table_schema = '$table'");
		if (!$dbesult) {
			$result['console'] = $dbesult->error;
			print json_encode($result, JSON_PRETTY_PRINT);
	    }
		$row = $dbesult->fetch_assoc();
		$last_dump_time = filemtime($files[0]);
		$updated_time = date('Y-m-d-H-i-s', strtotime($row['updated']));

		if ($updated_time >= date('Y-m-d-H-i-s', $last_dump_time)) {
			$make_dump = true;
		}
	}

	if(isset ($_GET['force'])) { $make_dump = true; }

	if ($make_dump) {

		include_once(dirname(__FILE__) . '/Mysqldump.php');

	    if (!file_exists($db_folder)) {
	        mkdir($db_folder, 0775, true);
	    }

	    foreach ($files as $f) {
	    	unlink($f);
	    }

		try {
			$dump = new Ifsnop\Mysqldump\Mysqldump('mysql:host='.$host.';dbname='.$db['database'], $db['user'], $db['password']);
			$dump->start($db_folder.'AUTO_dump_'.$env.'.sql');
		} catch (\Exception $e) {
			$result['console'] = 'Auto DB dump error: '.$e->getMessage();
			print json_encode($result, JSON_PRETTY_PRINT);
		    die();
		}

	    $result['html'] = '<div style="position: fixed; top: 10px; left: 5px; right:5px; z-index: 9999999; text-align: center;"><span style="background: gray; color: white; padding: 5px 7px;">Auto DB dump made!</span></div>';
		$result['console'] = 'Auto DB dump made!';
	} else {
		$result['console'] = 'No auto DB dump made. Last dump: '.date('d M Y H:i', $last_dump_time);
	}
	$conn->close();
	print json_encode($result, JSON_PRETTY_PRINT);
?>
