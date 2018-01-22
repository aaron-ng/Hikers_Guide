<?php 
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}
if (isset($_SESSION['username'])) {
	if ($_SESSION['username'] != "admin") {
		echo "<h1> RESTRICTED ACCESS </h1>";
		echo '<button onclick="window.location.href=\'../Hikers_Guide.php\'">Home Page</button>';
		die();
		}
	}
else {
	echo "<h1> RESTRICTED ACCESS </h1>";
	echo '<button onclick="window.location.href=\'/hikers_guide/Hikers_Guide.php\'">Home Page</button>';
	die();
}
?>