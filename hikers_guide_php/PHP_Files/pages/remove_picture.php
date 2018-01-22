

<?php session_start();

if (!isset($_SESSION['username']) || ($_SESSION['username'] != "admin" && $_SESSION['username'] != $_POST['user'])) {
		echo "<h1> RESTRICTED ACCESS </h1>";
		echo '<button onclick="window.location.href=\'../../Hikers_Guide.php\'">Home Page</button>';
		die();
}


$link = mysqli_connect("localhost", "root", "");
 
// Check connection
if($link === false){
    die("ERROR: Could not connect. " . mysqli_connect_error());
}
 
$db_selected = mysqli_select_db($link, 'hikers_guide_to_the_galaxy');
$picid = mysqli_real_escape_string($link, $_POST['picID']);
 
// attempt insert query execution
$sql = "CALL remove_picture($picid);";
if(mysqli_query($link, $sql)){
    echo "Records deleted successfully.";
} else{
    echo "ERROR: Could not able to execute $sql. " . mysqli_error($link);
}

?>

</br>
<button onclick="window.location.href='../User_Page.php'">User Page</button>


 