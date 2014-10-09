<?php @clearstatcache(TRUE); ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Safe Harbor Installation</title>

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
	#results.pass { background: #191; }
	#results.fail { background: #911; }
	</style>

</head>
<body>

	<h1>Environment Test</h1>

	<p>The following test have been run to determine if <a href="http://eeharbor.com/safe_harbor/documentation">Safe Harbor</a> will work in your environment.</p>

	<?php
	$failed = FALSE;
	$exec = FALSE;
	?>

	<table cellspacing="0">
		<tr>
			<th>PHP Version</th>
			<?php if(version_compare(PHP_VERSION, '5.0', '>=')) : ?>
				<td class="pass"><?php echo PHP_VERSION; ?></td>
			<?php else : $failed = TRUE; ?>
				<td class="fail">Safe Harbor requires PHP 5.0 or newer, this version is <?php echo PHP_VERSION; ?>.</td>
			<?php endif; ?>
		</tr>
		<tr>
			<th>MySQL Version</th>
			<?php
			$mysql_version = mysql_get_client_info();
			$mysql_version = preg_replace('#(^\D*)([0-9.]+).*$#', '\2', $mysql_version);
			?>
			<?php if(version_compare($mysql_version, '4.1', '>=')) : ?>
				<td class="pass"><?php echo $mysql_version; ?></td>
			<?php else : $failed = TRUE; ?>
				<td class="fail">Safe Harbor requires MySQL 4.1 or newer, this version is <?php echo $mysql_version; ?>.</td>
			<?php endif; ?>
		</tr>
		<tr>
			<th>PCRE UTF-8</th>
			<?php if ( !@preg_match('/^.$/u', 'n') ) : $failed = TRUE; ?>
				<td class="fail"><a href="http://php.net/pcre">PCRE</a> has not been compiled with UTF-8 support.</td>
			<?php elseif ( !@preg_match('/^\pL$/u', 'n') ) : $failed = TRUE; ?>
				<td class="fail"><a href="http://php.net/pcre">PCRE</a> has not been compiled with Unicode property support.</td>
			<?php else : ?>
				<td class="pass">Pass</td>
			<?php endif; ?>
		</tr>
		<tr>
			<th>URI Determination</th>
			<?php if( isset($_SERVER['REQUEST_URI']) OR isset($_SERVER['PHP_SELF']) OR isset($_SERVER['PATH_INFO']) ) : ?>
				<td class="pass">Pass</td>
			<?php else : $failed = TRUE; ?>
				<td class="fail">Neither <code>$_SERVER['REQUEST_URI']</code>, <code>$_SERVER['PHP_SELF']</code>, or <code>$_SERVER['PATH_INFO']</code> is available.</td>
			<?php endif; ?>
		</tr>
		<tr>
			<th>Safe Mode</th>
			<?php $safe_mode = ini_get('safe_mode'); ?>
			<?php if( empty($safe_mode) ) : ?>
				<td class="pass">Pass</td>
			<?php else : $failed = TRUE; ?>
				<td class="fail">Safe Harbor requires <code>safe_mode</code> to be off in PHP.</td>
			<?php endif; ?>
		</tr>
		<tr>
			<th>Support for file_get_contents()</th>
			<?php if( function_exists('file_get_contents') ) : ?>
				<td class="pass">Pass</td>
			<?php else : $failed = TRUE; ?>
				<td class="fail">Safe Harbor requires <code>file_get_contents</code> to be enabled.</td>
			<?php endif; ?>
		</tr>
		<tr>
			<th>Support for exec()</th>
			<?php if( function_exists('exec') ) : $exec = TRUE; ?>
				<td class="pass">Pass</td>
			<?php else : $failed = TRUE; ?>
				<td class="fail">Safe Harbor requires <code>exec()</code> to be enabled.</td>
			<?php endif; ?>
		</tr>
		<?php if( $exec === TRUE ) : ?>
			<tr>
				<th>Tar is installed</th>
				<?php exec('command -v tar &>/dev/null && echo "Found" || echo "Not Found"',$output); ?>
				<?php if( $output[0] == "Found" ) : ?>
					<td class="pass">Pass</td>
				<?php else : $failed = TRUE; ?>
					<td class="fail">Safe Harbor requires <code>tar</code> to be installed.</td>
				<?php endif; ?>
			</tr>
			<tr>
				<th>GZip is installed</th>
				<?php exec('command -v gzip &>/dev/null && echo "Found" || echo "Not Found"',$output); ?>
				<?php if( $output[0] == "Found" ) : ?>
					<td class="pass">Pass</td>
				<?php else : $failed = TRUE; ?>
					<td class="fail">Safe Harbor requires <code>gzip</code> to be installed.</td>
				<?php endif; ?>
			</tr>
		<?php endif; ?>
	</table>

	<?php if( $failed === TRUE ) : ?>
		<p id="results" class="fail">&#x2718; Safe Harbor may not work correctly with your environment.</p>
	<?php else : ?>
		<p id="results" class="pass">&#x2714; Your environment passed all requirements.</p>
	<?php endif; ?>

</body>
</html>
