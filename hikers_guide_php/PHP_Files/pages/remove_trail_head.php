

<?php session_start();


include "admin_check.php";

$link = mysqli_connect("localhost", "root", "");
 
// Check connection
if($link === false){
    die("ERROR: Could not connect. " . mysqli_connect_error());
}
 
$db_selected = mysqli_select_db($link, 'hikers_guide_to_the_galaxy');
$gps = mysqli_real_escape_string($link, $_POST['trail']);
$trail = mysqli_real_escape_string($link, $_POST['gps']);
 
// attempt insert query execution
$sql = "CALL remove_trail_head($gps, $trail);";
if(mysqli_query($link, $sql)){
    echo "Records deleted successfully.";
} else{
    echo "ERROR: Could not able to execute $sql. " . mysqli_error($link);
}

?>

</br>
<button onclick="window.location.href='../User_Page.php'">User Page</button>


 