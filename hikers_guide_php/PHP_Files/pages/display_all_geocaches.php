
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
 
// attempt insert query execution

$sql = "SELECT * FROM geocaches";
$query = mysqli_query($link, $sql);
if($query){
	foreach(mysqli_fetch_all ( $query, MYSQLI_ASSOC ) as $result){
		echo "<pre>";
		print_r($result);
		echo "</pre>";
		
		$gps = $result['gps_id'];
		$user = $result['user_id'];
		echo '<form action="pages/remove_geocache.php" method="post">';
		echo '<input type="hidden" name="gps" value='."$gps>".'
		<input type="hidden" name="user" value=' . '"' . $user . '">
		<input type="submit" value="Steal Geocache (Delete)">
		</form>';
	}

} else{
    echo "ERROR: Could not able to execute $sql. " . mysqli_error($link);
}

// close connection
mysqli_close($link);
?>
</html>
