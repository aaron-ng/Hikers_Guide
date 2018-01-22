
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>User Home Page</title>
</head>
<body>

<form action="./pages/look_up_user.php" method="post">
    <p> Search For A User: 
	<input type="text" name="username" id="username" placeholder="Username" required> 
	<input type="submit" value="Search">
</form>

<?php session_start();
	$link = mysqli_connect("localhost", "root", "");
	// Check connection
	if($link === false){
		die("ERROR: Could not connect. " . mysqli_connect_error());
	}
	$db_selected = mysqli_select_db($link, 'hikers_guide_to_the_galaxy');
    
	if (isset($_SESSION['username'])) {
		$username = $_SESSION['username'];
		
		echo '<form action="./pages/check_in_user_location.php" method="post">
				<p><input type="submit" value="Check In Your Location!">
				</form>';

		$sql = "CALL get_pictures('$username');";
		$query = mysqli_query($link, $sql);
		if($query){
			foreach(mysqli_fetch_all ( $query, MYSQLI_ASSOC ) as $result){
				echo "Trail Name: " . $result['name'] . "</br>";
				echo "LON: " . $result['Lon'] . "</br>";
				echo "LAT: " . $result['Lat'] . "</br>";
				echo "<img src=". 'media/' . $result['pic'] . ' height=250 width=250>'. "</p>";
				echo '<form action="pages/remove_picture.php" method="post">';
				echo '<input type="hidden" name="picID" value=' . $result['pic_id'] . '>
				
				<input type="hidden" name="user" value=' . '"' . $username . '">
				<input type="submit" value="Remove Picture">
				</form>';
			}
		}
	}
?>

<button onclick="window.location.href='../Hikers_Guide.php'">Home Page</button>

</body>
</html>


