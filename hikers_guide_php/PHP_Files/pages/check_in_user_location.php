
<!DOCTYPE html>
<html>
<body>

<h1>Updating Position</h1>

<?php session_start();
$user_ip = getenv('REMOTE_ADDR');
$geo = unserialize(file_get_contents("http://www.geoplugin.net/php.gp?ip=$user_ip"));
$lon = 0;
$lat = 0;

if (isset($geo["geoplugin_longitude"]) && isset($geo["geoplugin_latitude"])) {
	$lon = $geo["geoplugin_longitude"];
	$lat = $geo["geoplugin_latitude"];
}

/* Attempt MySQL server connection. Assuming you are running MySQL
server with default setting (user 'root' with no password) */
$link = mysqli_connect("localhost", "root", "");

// Check connection
if($link === false){
    die("ERROR: Could not connect. " . mysqli_connect_error());
}
 
$db_selected = mysqli_select_db($link, 'hikers_guide_to_the_galaxy');
$username = $_SESSION['username'];
 
// attempt insert query execution
$sql = "CALL set_user_gps('$username', $lon, $lat)";
if(mysqli_query($link, $sql)){
    echo "Records added successfully.";
} else{
    echo "ERROR: Could not able to execute $sql. " . mysqli_error($link);
}
 
// close connection
mysqli_close($link);
?>
</br>
<button onclick="window.location.href='../../Hikers_Guide.php'">Home Page</button>

</body>
</html>