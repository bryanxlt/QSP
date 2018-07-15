<?php
// ERROR
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// PROJECT INFO
$project_name = "My New Project";
$page = $_GET['page'];
$page = ucfirst($page);