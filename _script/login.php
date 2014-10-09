<?php 
session_start();
global $pass;
global $loggedIn;
$pass = 'bart1999';
$loggedIn = isset($_SESSION['pass']) && $_SESSION['pass'] == $pass;
?>