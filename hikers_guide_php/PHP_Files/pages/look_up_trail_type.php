
<?php
function get_type($typeid) {
/* Attempt MySQL server connection. Assuming you are running MySQL
server with default setting (user 'root' with no password) */
$link = mysqli_connect("localhost", "root", "");
 
// Check connection
if($link === false){
    die("ERROR: Could not connect. " . mysqli_connect_error());
}
 
$db_selected = mysqli_select_db($link, 'hikers_guide_to_the_galaxy');
// Escape user inputs for security
//$typeid = mysqli_real_escape_string($link, $_REQUEST['type_id']);
 
// attempt insert query execution
$sql = "SELECT type FROM trail_types WHERE trail_types.type_id = '$typeid';";
$result = mysqli_query($link, $sql);
if($result){
	$result = mysqli_fetch_all ( $result, MYSQLI_ASSOC );
    echo ($result[0]['type']);
} else{
    echo "ERROR: Could not able to execute $sql. " . mysqli_error($link);
}

// close connection
mysqli_close($link);
}
?>
