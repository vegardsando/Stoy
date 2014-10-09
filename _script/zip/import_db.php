<?php
# MySQL Restore Script - revamped by DECEiFER (Last update: May 3rd, 2013)
# Original script by Ivan Stambolic at http://campstamba.com/2010/12/create-your-own-php-backup-solution-complete-tutorial-with-source-files
# This script is compatible with all regular MySQL backup types and also the ones taken by Ivan Stambolic's revamped MySQL backup script at http://pastebin.com/rXb0Vg4q
# -----------------
# Revamped updates:
# - MySQLi now used.
# - Checks the specified MySQL backup file's MIME type (PHP 5.3.0 and above only) to see if it's correct (text/plain).
# - Transactional commit or rollback for InnoDB tables at the end of the operation upon MySQL success or error.
# - MySQL Backup file permission modification (chmod()) to enable reads in case your backup files have permission restrictions. When done, the original permissions are automatically restored.
# - Removed the "<|||||||>" delimiters as they were causing problems during restoration via phpMyAdmin and MySQL Workbench.
# - The SQL file's queries are now run in one execution. There is no more need for a delimiter between each query. Backups from phpMyAdmin and MySQL Workbench can also be handled by this script.
# - Fixes and improvements to error handling.
# - Some variable names and other insignificant things changed/tidied up.


// Get the provided arg
$file = $_POST['sql_file'];

// Check if the URI has the required parameters
if ($file == null){
	echo "<script type=\"text/javascript\">window.alert('You have not provided a backup to restore.');</script>";
	die('<noscript>You have not provided a backup to restore.<br />Click <a href="backup_overview.php">here</a> if your browser doesn\'t automatically redirect you.</noscript>');
}

// Include your database's settings file or replace the line below with the database's credentials
include('../../ee_system/config_bootstrap.php');

// Set the filename path
$filename = "../../db/" . $file;

// Check if the file exists
if (!file_exists($filename)) die('The specified MySQL backup file does not exist.');

// If insufficient, give the SQL Backup file appropriate permissions for reading
$filePerms = substr(decoct(fileperms($filename)), 3);
if ($filePerms[0] < 4) chmod($filename, 0 . intval(4 . $filePerms[1] . $filePerms[2], 8));

// Check if the file's MIME type is correct (PHP 5.3.0 and above only)
if (function_exists('finfo_open')){
	$finfo = finfo_open(FILEINFO_MIME_TYPE);
	if (($mimeType = finfo_file($finfo, $filename)) != "text/plain") die('You have attempted to restore an invalid file type: ' . $mimeType . '<br />Required file type: text/plain');
}

// Restore the backup
$link = mysqli_connect($env_db_config['hostname'], $env_db_config['username'], $env_db_config['password']) or die(mysqli_connect_error());
if ($link){
	// Turn off transation auto commit for InnoDB tables
	mysqli_autocommit($link, false);
	
	// Select the database for restoration to
	mysqli_select_db($link, $env_db_config['database']);
	
	// Get the SQL file's contents into a string variable and then restore the file's original permissions
	if (($sqlFile = file_get_contents($filename)) === false) die('Cannot read the MySQL backup file\'s contents.');
	if (substr(decoct(fileperms($filename)), 3) != $filePerms) chmod($filename, 0 . intval($filePerms, 8));
	
	// Run every query in the SQL file with one execution
	mysqli_multi_query($link, $sqlFile);
	
	// Go through the results and break when there is a MySQL error
	while (mysqli_next_result($link));
	
	$sqlErrorCode = mysqli_errno($link);
}

// Echo handling (success or error)
if ($link && ($sqlErrorCode = mysqli_errno($link)) == 0){
	mysqli_commit($link); // Only for InnoDB tables
	
	echo "Database restored successfully!<br>\n";
	echo "Backup used: " . $file;
} elseif (!$link){
	echo "Could not establish a connection to the database.";
} else{
	echo "An error occurred while restoring the backup!<br /><br />\n";
	echo "Error code: " . $sqlErrorCode . "<br />\n";
	echo "Error text: " . mysqli_error($link) . "<br />\n";
	
	mysqli_rollback($link); // Only for InnoDB tables
}

// Close the connection
mysqli_close($link);
?>