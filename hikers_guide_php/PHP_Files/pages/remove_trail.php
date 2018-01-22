

<?php

include "admin_check.php";

$link = mysqli_connect("localhost", "root", "");
 
// Check connection
if($link === false){
    die("ERROR: Could not connect. " . mysqli_connect_error());
}
 
$db_selected = mysqli_select_db($link, 'hikers_guide_to_the_galaxy');
$trail = mysqli_real_escape_string($link, $_POST['trail']);
 
// attempt insert query execution
$sql = "CALL remove_trail($trail);";
if(mysqli_query($link, $sql)){
    echo "Records deleted successfully.";
} else{
    echo "ERROR: Could not able to execute $sql. " . mysqli_error($link);
}

?>

</br>
<button onclick="window.location.href='../Admin_Controls.php'">Admin Page</button>


 