<?php

session_start();
$_SESSION['url'] = '';
$_SESSION['content-wrapper'] = '';
//cierra la sesion iniciada
session_destroy();
//redirigue al login
header("location: ../index.php");

?>