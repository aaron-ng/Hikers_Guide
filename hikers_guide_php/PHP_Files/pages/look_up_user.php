<html>
<?php
/* Attempt MySQL server connection. Assuming you are running MySQL
server with default setting (user 'root' with no password) */
$link = mysqli_connect("localhost", "root", "");
 
// Check connection
if($link === false){
    die("ERROR: Could not connect. " . mysqli_connect_error());
}
 
$db_selected = mysqli_select_db($link, 'hikers_guide_to_the_galaxy');
// Escape user inputs for security
$username = mysqli_real_escape_string($link, $_REQUEST['username']);
 
// attempt insert query execution
$sql = "SELECT * FROM users WHERE users.username = '$username';";
if(mysqli_query($link, $sql)){
	$result = mysqli_query($link, $sql);
	$row = mysqli_fetch_array($result);
	echo "USERNAME: ";
	echo $row['username'];
	echo "</br>";
	echo "EMAIL:";
	echo $row['email'];
	echo "</br>";
	echo "LOCATION:";
	$sql = "SELECT ST_X(users.loc) as lon, ST_Y(users.loc) as lat FROM users WHERE users.username = '$username';";
	$result = mysqli_query($link, $sql);
	$row = mysqli_fetch_array($result);
	echo "Lon: ";
	echo $row['lon'];
	echo " Lat: ";
	echo $row['lat'];
} else{
    echo "ERROR: Could not able to execute $sql. " . mysqli_error($link);
}

// close connection
mysqli_close($link);
?>
</br>
<button onclick="window.location.href='../../Hikers_Guide.php'">Home Page</button>
</html>
