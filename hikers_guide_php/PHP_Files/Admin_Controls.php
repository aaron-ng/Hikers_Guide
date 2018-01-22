
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>A Hiker's Guide To The Galaxy</title>

<?php include "pages/admin_check.php"; ?>

<h1>You Control The Galaxy <button onclick="window.location.href='../Hikers_Guide.php'">Go Home</button> </h1>
<?php
		echo 
		'<h4> ADD TRAIL HEAD: </h4>
		<form action="pages/assign_trail_head.php" method="post">
		<label for="longitude">Longitude:</label>
		<input type="number" min="-180" max="180" name="longitude" step=.000001 id="longitude" required>
		<label for="latitude">Latitude:</label>
		<input type="number" min="-90" max="90" id="latitude" step=.000001 name="latitude" required>
		<label for="trail_id">Trail_ID:</label>
		<input type="number" name="trail_id" required>
		<input type="submit" value="Add Trail Head">
		</form>';
?>
<h3> Users </h3>
<?php
	include "pages/display_all_users.php";
?>
<h3> Trails </h3>
<?php
	include "pages/display_all_trails.php";
?>
<h3> Geocaches </h3>
<?php
	include "pages/display_all_geocaches.php";
?>
<h3> Activities </h3>
<?php
	include "pages/display_all_activities.php";
?>
<h3> Trail Heads </h3>
<?php
	include "pages/display_all_trail_heads.php";
?>
<h3> Pictures </h3>
<?php
	include "pages/display_all_pictures.php";
?>

</html>