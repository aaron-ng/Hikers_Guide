
<html>
<?php session_start();

/* Attempt MySQL server connection. Assuming you are running MySQL
server with default setting (user 'root' with no password) */
$link = mysqli_connect("localhost", "root", "");
 
// Check connection
if($link === false){
    die("ERROR: Could not connect. " . mysqli_connect_error());
}
 
$db_selected = mysqli_select_db($link, 'hikers_guide_to_the_galaxy');
// Escape user inputs for security
$name = mysqli_real_escape_string($link, $_REQUEST['trailname']);
$diff = mysqli_real_escape_string($link, $_REQUEST['difficulty']);
$lengthmin = mysqli_real_escape_string($link, $_REQUEST['traillengthmin']);
$lengthmax = mysqli_real_escape_string($link, $_REQUEST['traillengthmax']);
$type_id = mysqli_real_escape_string($link, $_REQUEST['type']);
$maxdis = mysqli_real_escape_string($link, $_REQUEST['maxdis']) * 1.60934;
$park = mysqli_real_escape_string($link, $_REQUEST['park']);
$minrating = mysqli_real_escape_string($link, $_REQUEST['minrating']);

if (isset($_SESSION['username'])) {
	$user = $_SESSION['username'];
}
else {
	$user = "Guest";
}
 
// attempt insert query execution

$sql = "CALL search('$name', '$park', 1, $diff, $lengthmin, $lengthmax, $maxdis, $type_id, $minrating, '$user')"; 
$query = mysqli_query($link, $sql);
if($query){
	
	foreach(mysqli_fetch_all ( $query, MYSQLI_ASSOC ) as $result){
		echo '<form action="display_result_trail.php" method="get">';
		echo $result['name'] . "</br>";
		echo $result['Trail_rating'] . '/5' . "</br>";
		echo 'Length: ' . $result['length'] . "</br>";
		echo 'Distance from you: ' . (0.62137 * $result['distance_to_user']) . " miles </br>";
		$trail_id = $result['trail_id'];
		$string1 = '<input type="hidden" name="trail" ';
		$string2 = "value='$trail_id'>";
		echo $string1, $string2, " ";
		echo '<input type="submit" value="View Trail Page">';
		echo "</form>";
	}

} else{
    echo "ERROR: Could not able to execute $sql. " . mysqli_error($link);
}

// close connection
mysqli_close($link);
?>
</br>
<button onclick="window.location.href='../../Hikers_Guide.php'">Home Page</button>
</html>
