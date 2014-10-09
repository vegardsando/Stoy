<?php
# MySQL Backup Script - revamped by DECEiFER (Last update: May 3rd, 2013)
# Original script by Ivan Stambolic at http://campstamba.com/2010/12/create-your-own-php-backup-solution-complete-tutorial-with-source-files
# Created backup files are compatible for restoration with MySQL Workbench, phpMyAdmin, and also Ivan Stambolic's revamped MySQL restoration script at http://pastebin.com/4MDneH9U
# -----------------
# Revamped updates:
# - MySQLi now used.
# - Removed an unnecessary FOR loop.
# - Added grave accents (``) before and after each table name to avoid MySQL reserved keyword conflicts. Queries on table names like “index” or “order” will fail without them because they are MySQL reserved keywords.
# - Used DROP TABLE IF EXISTS instead of DROP TABLE.
# - Added column/field names to the INSERT queries (with grave accents included).
# - INSERT queries condensed – now only one query per table (phpMyAdmin formatting) – as this reduces the backup file size.
# - Fixed the get tables ELSE body where the $tables variable is checked for being an array (old psuedocode: if (is array) then create an array; new psuedocode: if (is not an array) then create an array). The FOREACH loop will now always receive an array argument.
# - Added an array for MySQL number types for the determination of whether a row value should be inserted to the database with quotes or not.
# - Removed the "<|||||||>" delimiters as they were causing problems during restoration via phpMyAdmin and MySQL Workbench, so now the backup will be compatible with all the regular restoration methods.
# - Fixes and improvements to error handling.
# - Some variable names and other insignificant things changed/tidied up.

include('../../ee_system/config_bootstrap.php');

// List the tables you want backed up, separated by commas, or use a * for all the tables
// Or list them into an array
// Do not put grave accents before and after the table names - they will be formatted appropriately by the script
$tables = "*";

// Set the suffix of the backup file name
if ($tables == "*"){
	$fileSuffix = "all";
} else{
	$fileSuffix = str_replace(',', '_', $tables);
	$fileSuffix = str_replace(' ', '_', $fileSuffix);
}

// List all the SQL numeric data types in this array
// It's only necessary to put in short words (eg. int for int, smallint, bigint, etc.)
$sqlNumberTypes = array('int', 'decimal', 'numeric', 'float', 'double');

// Call the backup function
backup_tables($env_db_config['hostname'], $env_db_config['username'], $env_db_config['password'], $env_db_config['database'], $tables, $fileSuffix, $sqlNumberTypes);

// Backup the tables and save them to an SQL file
function backup_tables($host, $user, $pass, $name, $tables, $fileSuffix, $sqlNumberTypes){
	// Open the MySQL connection and select the appropriate database
	$link = mysqli_connect($host, $user, $pass) or die(mysqli_connect_error());
	if ($link) mysqli_select_db($link, $name) or die(mysqli_error($link));
	$output = "";
	
	// Get all of the tables
	if ($tables == "*"){
		$tables = array();
		$result = mysqli_query($link, 'SHOW TABLES');
		while($row = mysqli_fetch_row($result))	$tables[] = $row[0];
	} else{
		if (!is_array($tables)) $tables = explode(',', trim($tables));
	}
	
	// Cycle through each provided table
	foreach ($tables as $table){
		$table = str_replace('`', '', $table);
		
		$result = mysqli_query($link, 'SELECT * FROM `' . $table . '`');
		$num_fields = ($result) ? mysqli_num_fields($result) : 0;
		$num_rows = ($num_fields > 0 && $result) ? mysqli_num_rows($result) : 0;
		
		// Put all of the table's columns into a SQL-formatted string and push each column type into an array
		$cols = "";
		$colsArray = array();
		$colsType = array();
		$res = mysqli_query($link, 'SHOW COLUMNS FROM `' . $table . '`');
		while ($col = mysqli_fetch_row($res)){
			$colsArray[] = $col[0];
			$colsType[] = $col[1];
		}
		$sizeOf = sizeof($colsArray);
		foreach ($colsArray as $key => $col){
			$cols .= "`" . $col . "`";
			if ($key < ($sizeOf - 1)) $cols .= ", ";
		}
		
		// First part of the output – remove the table
		$output .= "DROP TABLE IF EXISTS `" . $table . "`;";
		
		// Second part of the output – create table
		$row = mysqli_fetch_row(mysqli_query($link, 'SHOW CREATE TABLE `' . $table . '`'));
		$output .= $row[1] . ";\n\n";
		
		// Third part of the output – insert values into new table
		$i = 0;
		if ($num_rows > 0) $output .= "INSERT INTO `" . $table . "` (" . $cols . ") VALUES ";
		while ($row = mysqli_fetch_row($result)){
			$output .= "(";
			for ($j = 0; $j < $num_fields; $j++) {
				$row[$j] = mysqli_real_escape_string($link, $row[$j]);
				echo $row[$j]
				if (isset($row[$j])){
					$output .= (striposa($colsType[$j], $sqlNumberTypes) === false) ? "'" . $row[$j] . "'" : $row[$j];
				} else{
					$output .= (striposa($colsType[$j], $sqlNumberTypes) === false) ? "''" : "NULL";
				}
				if ($j < ($num_fields - 1)){
					$output .= ", ";
				}
			}
			$output .= ($i < ($num_rows - 1)) ? "),\n" : ");";
			$i++;
		}
		$output .= "\n\n\n";
	}
	
	// Close the MySQL Connection
	mysqli_close($link);
	
	// Generate the filename for the sql file
	$backupFile = $name.'_fra_'.NSM_ENV.'_'.date('d_m_Y').'.sql';
	
	// Save the SQL file
	$handle = fopen('../../db/'.$backupFile, 'w+') or die('Cannot create file.');
	if ($handle){
		fwrite($handle, $output);
		fclose($handle);
	}
	
	// Echo the success message
	echo $backupFile." har blitt laget i DB mappen.<br />\n";
}

// Returns the first index of an array of string search term values based on a character offset defaulting to 0 (false on failure)
// Only the lowest index from the search term values will returned
function striposa($haystack, $needles = array(), $offset = 0){
	$chr = array();
	foreach($needles as $needle) {
		if (($pos = stripos($haystack, $needle, $offset)) !== false) $chr[] = $pos;
	}
	if(empty($chr)) return false;
	return min($chr);
}
?>