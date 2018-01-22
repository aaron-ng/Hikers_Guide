
<html>
<?php session_start();
/* Attempt MySQL server connection. Assuming you are running MySQL
server with default setting (user 'root' with no password) */
$link = mysqli_connect("localhost", "root", "");
 
// Check connection
if($link === false){
    die("ERROR: Could not connect. " . mysqli_connect_error());
}
 
$db_selected = mysqli_select_db($link, 'hikers_guide_to_the_galaxy');
// Escape user inputs for security
$trail_id = $_REQUEST['trail'];
$sql = "SELECT * FROM trails WHERE trails.trail_id = '$trail_id'";
$query = mysqli_query($link, $sql);

if ($query) {
$trail = mysqli_fetch_all ( $query, MYSQLI_ASSOC )[0];
}
else{
    echo "ERROR: Could not able to execute $sql. " . mysqli_error($link);
	die();
	}
// attempt insert query execution

//$sql = "CALL search('', '', 0, 3, 0, 99999, 800000000, 1, 0, 2)";
//$query = mysqli_query($link, $sql);

echo $trail['name'];
echo "</br>";
echo "DIFFICULTY: ";
$difficulty = $trail['difficulty'];
if ($difficulty = 1) {
	echo "Easy";
}
else if ($difficulty = 2) {
	echo "Medium";
}
else {
	echo "Hard";
}
echo "</br>";
echo "LENGTH: ";
echo $trail['length'] . ' miles';
echo "</br>";
echo "TYPE: ";
include "look_up_trail_type.php";
echo get_type($trail['type_id']); 
echo "</p>";

echo "<h3> Trail Pictures: </h3>";
$sql = "CALL get_pictures_on_trail($trail_id);";
$query = mysqli_query($link, $sql);
if($query){
	foreach(mysqli_fetch_all ( $query, MYSQLI_ASSOC ) as $result){
		$fileLoc = $result['pic'];
		echo "Taken By: " . $result['username'] . "</p>";
		echo "LON: " . $result['Lon'] . "</p>";
		echo "LAT: " . $result['Lat'] . "</p>";
		echo "<img src=". '../media/' . $fileLoc . ' height=250 width=250> </p>';
		echo "-----------------------------------";
	}
} else {
    echo "ERROR: Could not able to execute $sql. " . mysqli_error($link);
}

echo "<h3> Trail Geocaches: </h3>";
mysqli_next_result($link);
$sql = "CALL get_geocaches($trail_id);";
$query = mysqli_query($link, $sql);
if($query){
	foreach(mysqli_fetch_all ( $query, MYSQLI_ASSOC ) as $result){
		echo "Hidden By: " . $result['username'] . "</p>";
		echo "Description: " . $result['desc'] . "</p>";
		echo "LON: " . $result['Lon'] . "</p>";
		echo "LAT: " . $result['Lat'] . "</p>";
		echo "-----------------------------------";
	}
} else {
    echo "ERROR: Could not able to execute $sql. " . mysqli_error($link);
}

echo "<h3> Trail Activities: </h3>";
mysqli_next_result($link);
$sql = "CALL get_activities($trail_id);";
$query = mysqli_query($link, $sql);
if($query){
	foreach(mysqli_fetch_all ( $query, MYSQLI_ASSOC ) as $result){
		echo "Description: " . $result['desc'] . "</p>";
		echo "LON: " . $result['Lon'] . "</p>";
		echo "LAT: " . $result['Lat'] . "</p>";
		echo "-----------------------------------";
	}
} else {
    echo "ERROR: Could not able to execute $sql. " . mysqli_error($link);
}

echo "<h3> Trail Reviews: </h3>";
mysqli_next_result($link);
$sql = "CALL get_reviews($trail_id);";
$query = mysqli_query($link, $sql);
if($query){
	foreach(mysqli_fetch_all ( $query, MYSQLI_ASSOC ) as $result){
		echo "Reviewed By: " . $result['username'] . "</p>";
		echo "Rating: " . $result['rating'] . "/5 </p>";
		echo "Description: " . $result['text'] . "</p>";
		echo "-----------------------------------";
	}
} else {
    echo "ERROR: Could not able to execute $sql. " . mysqli_error($link);
}


if (isset($_SESSION['username'])) {
	echo 
	'<h4> LEAVE REVIEW: </h4>
	<form action="insert_review.php" method="post">
    <p>
		<input type="range" min="1" max="5" value="4" class="slider" name="rating" id="rating" required>
    </p>
    <p>
        <input type="text" name="comment" id="comment">
		</textarea>
    </p>
	<input type="hidden" name="trail_id" value='."$trail_id>".'
    <input type="submit" value="Submit Review">
	</form>';
	
	echo 
	'<h4> ADD PICTURE: </h4>
	<form action="insert_picture.php" method="post" enctype="multipart/form-data">
	<label for="longitude">Longitude:</label>
	<input type="number" min="-180" max="180" name="longitude" id="longitude" step=.000001 required>
	<label for="latitude">Latitude:</label>
	<input type="number" min="-90" max="90" id="latitude" name="latitude" step=.000001 required>
	<input type="file" accept="image/*" id="picture" name="picture" required>
	<input type="hidden" name="trail_id" value='."$trail_id>".'
    <input type="submit" value="Add Picture">
	</form>';
	
	echo 
	'<h4> ADD GEOCACHE: </h4>
	<form action="insert_geocache.php" method="post">
	<label for="desc">Description:</label>
	<input type="text" id="desc" name="desc" required>
	<label for="longitude">Longitude:</label>
	<input type="number" min="-180" max="180" name="longitude" step=.000001 id="longitude" required>
	<label for="latitude">Latitude:</label>
	<input type="number" min="-90" max="90" step=.000001 id="latitude" name="latitude" required>
	<input type="hidden" name="trail_id" value='."$trail_id>".'
    <input type="submit" value="Add Geocache">
	</form>';
	
	echo 
	'<h4> ADD ACTIVITY: </h4>
	<form action="insert_activity.php" method="post">
	<label for="desc">Description:</label>
	<input type="text" id="desc" name="desc" required>
	<label for="longitude">Longitude:</label>
	<input type="number" min="-180" max="180" name="longitude" step=.000001 id="longitude" required>
	<label for="latitude">Latitude:</label>
	<input type="number" min="-90" max="90" id="latitude" name="latitude" step=.000001 required>
	<input type="hidden" name="trail_id" value='."$trail_id>".'
    <input type="submit" value="Add Activity">
	</form>';

}

// close connection
mysqli_close($link);
?>

</br>
<button onclick="window.location.href='../../Hikers_Guide.php'">Home Page</button>
</html>
