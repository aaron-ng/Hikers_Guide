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
$name = mysqli_real_escape_string($link, $_REQUEST['trailname']);
$diff = mysqli_real_escape_string($link, $_REQUEST['difficulty']);
$length = mysqli_real_escape_string($link, $_REQUEST['traillength']);
$type_id = mysqli_real_escape_string($link, $_REQUEST['type']);
$park = mysqli_real_escape_string($link, $_REQUEST['park']);
 
// attempt insert query execution
$sql = "CALL add_trails('$name', $diff, $length, $type_id, '$park')";

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
</html>
