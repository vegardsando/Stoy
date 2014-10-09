<?php

function sort_backup($a, $b) 
{
	if( $a == $b )
	{
		return 0;
	}
	else if( $a < $b )
	{
		return -1;
	}
	else
	{
		return 1;
	}
}

if( !empty($_GET['download']) )
{
	$file = $_GET['download'];
	$filename = str_replace(dirname($file).'/', '', $file);

	$data = file_get_contents($file);

	header('Content-Type: "application/text"');
	header('Content-Disposition: attachment; filename="'.$filename.'"');
	header('Content-Transfer-Encoding: binary');
	header('Expires: 0');
	header('Pragma: no-cache');
	header('Content-Length: '.strlen($data));
	exit($data);
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Safe Harbor Restoration Script</title>

	<style type="text/css">
	body { width: 42em; margin: 0 auto; font-family: sans-serif; background: #fff; font-size: 1em; }
	h1 { letter-spacing: -0.04em; }
	h1 + p { margin: 0 0 2em; color: #333; font-size: 90%; font-style: italic; }
	code { font-family: monaco, monospace; }
	table { border-collapse: collapse; width: 100%; }
	table th,
	table td { padding: 0.4em; text-align: left; vertical-align: top; }
	table th { width: 12em; font-weight: normal; }
	table tr:nth-child(odd) { background: #eee; }
	table td.pass { color: #191; }
	table td.fail { color: #911; }
	#results { padding: 0.8em; color: #fff; font-size: 1.5em; }
	#results a { color:#fff; text-decoration:none; }
	#results a:hover { text-decoration:underline; }
	#results.pass { background: #191; }
	#results.fail { background: #911; }
	</style>

</head>
<body>

	<h1>Restore from Backup</h1>

	<p>This script will restore your website files from the backup created by Safe Harbor.</p>

	<?php
	// initial bytes to force flush
	print str_repeat(' ', 1000);

	ob_implicit_flush();
	ob_end_flush();

	// define paths
	define('PATH', dirname(__FILE__).'/');
	define('RESTORE_PATH', dirname(PATH).'/');
	define('WORKING_PATH', PATH.'working/');

	function directory_filter($var) {
		if( preg_match('/^[\.]{1,2}$/', $var) )
		{
			return FALSE;
		}
		else
		{
			return TRUE;
		}
	}

	$failed = FALSE;
	?>

	<?php if( !isset($_GET['backup']) ) : ?>

		<table cellspacing="0">
			<tr>
				<?php if( !is_dir(PATH) OR !is_writeable(PATH) OR !is_readable(PATH) ) : $failed = TRUE; ?>
					<td class="fail"><?php echo PATH; ?> must be writeable</td>
				<?php else : ?>
					<td class="pass"><?php echo PATH; ?> is writeable</td>
				<?php endif; ?>
			</tr>

			<tr>
				<?php if( !is_dir(RESTORE_PATH) OR !is_writeable(RESTORE_PATH) OR !is_readable(RESTORE_PATH) ) : $failed = TRUE; ?>
					<td class="fail"><?php echo RESTORE_PATH; ?> must be writeable</td>
				<?php else : ?>
					<td class="pass"><?php echo RESTORE_PATH; ?> is writeable</td>
				<?php endif; ?>
			</tr>

			<tr>
				<?php $backup_found = array_values(preg_grep('/\.(tgz|tar)$/', scandir(PATH))); ?>
				<?php if( empty($backup_found) OR count($backup_found) > 2 ) : $failed = TRUE; ?>
					<td class="fail">Backup archive not found</td>
				<?php else : ?>
					<td class="pass">Backup archive<?php if(count($backup_found) > 1) : ?>s<?php endif; ?> found:<pre><?php echo implode('<br/>', $backup_found); ?></pre></td>
				<?php endif; ?>
			</tr>

			<?php if( $failed === FALSE ) : ?>
				<tr>
					<td class="fail">Your site will be restored at: <?php echo RESTORE_PATH; ?></td>
				</tr>
			<?php endif; ?>
		</table>

		<?php if( $failed === TRUE ) : ?>
			<p id="results" class="fail">&#x2718; Cannot begin the restore</p>
		<?php else : ?>
			<p id="results" class="pass">&#x2714; Ready to start the restoration process. <a href="?backup=begin">Begin &rarr;</a></p>
		<?php endif; ?>

	<?php else : ?>

		<table cellspacing="0">
			<?php
			// create a directory we will be working in
			if( !is_dir(WORKING_PATH) )
			{
				mkdir(PATH.'working');
			}

			// check directory for a potential backup file (tar or tgz)
			$listing = scandir(PATH);
			$backup_found = array_values(preg_grep('/\.(tgz|tar)$/', $listing));
			$backup_extracted = FALSE;

			// grab our backup and decompress it into the working dir
			if( !empty($backup_found) AND count($backup_found) == 1 AND $backup_found[0] == 'complete_backup.tar')
			{
				// build our system command
				$command = 'tar -xf '.PATH.$backup_found[0].' -C '.WORKING_PATH.' && echo "TRUE" || echo "FALSE"';

				echo '<tr><td>Decompressing backup file: '.$backup_found[0].'</td></tr>';

				// run command
				exec($command, $output);
				if( (boolean)$output )
				{
					$backup_extracted = TRUE;
				}
				else
				{
					$failed = TRUE;
					echo '<tr><td class="fail">Failed to extract backup</td></tr>';
				}
			}
			else if( !empty($backup_found) AND count($backup_found) >= 1 )
			{
				foreach( $backup_found as $backup )
				{
					copy(PATH.$backup, WORKING_PATH.$backup);
					$backup_extracted = TRUE;
				}
			}
			else
			{
				$failed = TRUE;
				echo '<tr><td class="fail">Backup not found</td></tr>';
			}

			// locate backups in differential if more than one, we need to figure out which
			// is the full backup and which is the differential.
			if( $backup_extracted )
			{
				$listing = scandir(WORKING_PATH);
				$backup_archives = array_values(preg_grep('/\.(tgz|tar)$/', $listing));

				foreach( $backup_archives as $key => $value )
				{
					preg_match_all('/(\d{10})/', $value, $matches);

					$backup_archives[$key] = array(
						'filename' => $value,
						'timestamp' => $matches[1][0]
					);
				}

				// if we have more than one backup archive, sort by timestamp
				if( count($backup_archives) > 1 )
				{
					usort($backup_archives, 'sort_backup');
				}

				// decompress each backup
				$last_backup = NULL;
				foreach( $backup_archives as $backup )
				{
					$last_backup = $backup['filename'];

					// run command
					$command = 'tar -xf '.WORKING_PATH.$backup['filename'].' -C '.RESTORE_PATH.' && echo "TRUE" || echo "FALSE"';

					echo '<tr><td>Restoring from: '.$backup['filename'].'</td></tr>';

					exec($command, $output);
					if( !(boolean)$output )
					{
						$failed = TRUE;
						echo '<tr><td class="fail">Failed to extract backup</td></tr>';
					}
				}

				// clean up (remove backup archives)
				echo '<tr><td>Cleaning up...</td></tr>';
				$listing = array_filter($listing, 'directory_filter');
				foreach( $listing as $filename )
				{
					unlink(WORKING_PATH.$filename);
				}
				rmdir(WORKING_PATH);

				// locate latest database export
				$command = 'tar -ztf '.$last_backup;
				exec($command, $output);

				$sql_file = array_values(preg_grep('/\.sql$/', $output));
				$sql_file = RESTORE_PATH.$sql_file[0];

				preg_match_all('/^([^\.]*)/', $last_backup, $matches);
				$database_file = $matches[1][0].'.sql';
			}
			?>
		</table>

		<?php if( $failed === TRUE ) : ?>
			<p id="results" class="fail">&#x2718; Backup restore failed.</p>
		<?php else : ?>
			<p id="results" class="pass">&#x2714; Backup restore complete! </p>
			<p>You will need to restore your database manually. You can download the database backup here: <a href="?download=<?php echo $sql_file; ?>"><?php echo $database_file; ?></a></p>
		<?php endif; ?>

	<?php endif; ?>

</body>
</html>
