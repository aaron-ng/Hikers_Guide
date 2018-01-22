

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>A Hiker's Guide To The Galaxy</title>
<?php session_start();
	$dirpath =  realpath(dirname(getcwd()));
	$target_file = $dirpath . "\\media\\" . basename($_FILES["picture"]["name"]);
    if (move_uploaded_file($_FILES["picture"]["tmp_name"], $target_file)) {
        echo "The file ". basename( $_FILES["picture"]["name"]). " has been uploaded.";
    } else {
        echo "Sorry, there was an error uploading your file.";
    }

$link = mysqli_connect("localhost", "root", "");
 
// Check connection
if($link === false){
    die("ERROR: Could not connect. " . mysqli_connect_error());
}
$db_selected = mysqli_select_db($link, 'hikers_guide_to_the_galaxy');
	$trail_id = $_POST['trail_id'];
	$lat = $_POST['latitude'];
	$lon = $_REQUEST['longitude'];
	$picture = $_FILES["picture"]["name"];
	$username = $_SESSION['username'];
	$sql = "CALL add_picture('$username', $trail_id, $lon, $lat, '$picture')";
	
	if(mysqli_query($link, $sql)){
    echo "<h1>Your Picture Has Been Submitted</h1>";
	} else{
    echo "ERROR: Could not able to execute $sql. " . mysqli_error($link);
	}

?>

<button onclick="window.location.href='../../Hikers_Guide.php'">Home Page</button>
</html>
