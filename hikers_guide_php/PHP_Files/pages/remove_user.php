

<?php

include "admin_check.php";

$link = mysqli_connect("localhost", "root", "");
 
// Check connection
if($link === false){
    die("ERROR: Could not connect. " . mysqli_connect_error());
}
 
$db_selected = mysqli_select_db($link, 'hikers_guide_to_the_galaxy');
$username = mysqli_real_escape_string($link, $_POST['user_to_delete']);
 
// attempt insert query execution
$sql = "CALL remove_user('$username');";
if(mysqli_query($link, $sql)){
    echo "Records deleted successfully.";
} else{
    echo "ERROR: Could not able to execute $sql. " . mysqli_error($link);
}

?>

</br>
<button onclick="window.location.href='../Admin_Controls.php'">Admin Page</button>


 