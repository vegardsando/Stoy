<?php
$adminBar['bar'] = '';
$root = substr(__FILE__, 0, -strlen($_SERVER['SCRIPT_NAME']));
/**
 * @filename: currentgitbranch.php
 * @usage: Include this file after the '<body>' tag in your project
 * @author Kevin Ridgway
 */
    $branchname = '';
    $stringfromfile = file($root.'/../.git/HEAD', FILE_USE_INCLUDE_PATH);

    $firstLine = $stringfromfile[0]; //get the string from the array

    $explodedstring = explode("/", $firstLine, 3); //seperate out by the "/" in the string

    $branchname = $explodedstring[2]; //get the one that is always the branch name
    $branchname = trim(preg_replace('/\s+/', ' ', $branchname));

    $adminBar['bar'] .= '<span class="git">'.$branchname.'</span>'; //show it on the page

// Read .mustasj.json


if (file_exists($root.'/../.mustasj.json')) {

    $mustasjconfig = file_get_contents($root.'/../.mustasj.json');
    $mustasjconfig_json = json_decode($mustasjconfig, true);

    if (array_key_exists('deployhqProjecturi', $mustasjconfig_json)) {
        $id = $mustasjconfig_json['deployhqProjecturi'];
        if($id != false) {
            $adminBar['bar'] .= '<button onclick="getDeployRSS(\''.$id.'\')">DeployHQ</button>';
    	}
    }
}

if (isset($_GET['debug'])) {
    echo '<pre>';
    print_r($mustasjconfig_json);
    echo '</pre>';
} else {
    print json_encode($adminBar, JSON_PRETTY_PRINT);
}
