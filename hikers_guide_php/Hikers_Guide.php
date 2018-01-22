
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>A Hiker's Guide To The Galaxy</title>
<h1>A Hiker's Guide To The Galaxy</h1>
<?php session_start();
	if (isset($_SESSION['username'])) {
		$user = $_SESSION['username'];
		echo "<h3>Bring a Towel, $user. ";
		echo '<button onclick="window.location.href=\'PHP_Files/Log_Out.php\'">Log Out</button>';
	}
	else {
		echo "<h3> Bring a Towel, Stranger. ";
		echo '<button onclick="window.location.href=\'PHP_Files/Log_In.php\'">Log In</button>';
	}
?>
</h3>

</head>
<body>
<button onclick="window.location.href='PHP_Files/Search_Trail.php'">Search For A Trail</button>
<button onclick="window.location.href='PHP_Files/New_Trail.php'">Add A Trail</button>
<button onclick="window.location.href='PHP_Files/User_Page.php'">User Page</button>
<?php
	if (!isset($_SESSION['username']) || $_SESSION['username'] == "admin") {
		echo '<button onclick="window.location.href=\'PHP_Files/New_User.php\'">Create A New User</button>';
	}
?>
</body>

<?php 
if (isset($_SESSION['username'])) {
	if ($_SESSION['username'] == "admin") {
		echo '<button onclick="window.location.href=\'PHP_Files/Admin_Controls.php\'">42</button>';
	}
	}
?>
</html>