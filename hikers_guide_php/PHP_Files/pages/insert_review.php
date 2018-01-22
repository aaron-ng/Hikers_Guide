

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>A Hiker's Guide To The Galaxy</title>
<?php session_start();
$link = mysqli_connect("localhost", "root", "");
 
// Check connection
if($link === false){
    die("ERROR: Could not connect. " . mysqli_connect_error());
}
$db_selected = mysqli_select_db($link, 'hikers_guide_to_the_galaxy');
	$trail_id = $_POST['trail_id'];
	$rating = $_POST['rating'];
	$comment = $_REQUEST['comment'];
	$username = $_SESSION['username'];
	$sql = "CALL add_review('$username', $trail_id, $rating, '$comment')";
	if(mysqli_query($link, $sql)){
    echo "<h1>Your Review Has Been Submitted</h1>";
	} else{
    echo "ERROR: Could not able to execute $sql. " . mysqli_error($link);
	}

?>

<button onclick="window.location.href='../../Hikers_Guide.php'">Home Page</button>
</html>
