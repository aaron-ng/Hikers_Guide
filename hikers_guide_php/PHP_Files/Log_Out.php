
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>A Hiker's Guide To The Galaxy</title>
<h1>A Hiker's Guide To The Galaxy</h1>

<?php session_start();
	$user = $_SESSION['username'];
	$_SESSION['username'] = null;
	echo "<h3>Goodbye, $user. </h3>";
?>

<button onclick="window.location.href='Log_In.php'">Log In</button>
</h3>

</head>
<body>
<button onclick="window.location.href='../Hikers_Guide.php'">Home Page</button>
</body>
</html>