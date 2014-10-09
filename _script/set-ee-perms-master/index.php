<?PHP
echo "Resultater av chmod <br/>";
echo "--------------------------------<br/>";
chmod("index.php", 0770);
echo 'index.php: '.substr(sprintf('%o', fileperms('index.php')), -4).'<br/>';
chmod("set-ee-perms.sh", 0770);
echo 'shell: '.substr(sprintf('%o', fileperms('set-ee-perms.sh')), -4).'<br/>';
$command = "./set-ee-perms.sh ".$_SERVER['DOCUMENT_ROOT']." apache";
echo exec($command);
?>