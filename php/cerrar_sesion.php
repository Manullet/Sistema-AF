<?php

session_start();
//cierra la sesion iniciada
session_destroy();
//redirigue al login
header("location: ../index.php");

?>