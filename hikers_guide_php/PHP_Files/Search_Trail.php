
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Search Trail Form</title>
</head>
<body>
<form action="./pages/look_up_trail.php" method="post">
    <p>
        <label for="trailname">Trail Name:</label>
        <input type="text" name="trailname" id="trailname">
    </p>
	<p>
		<label for="traillengthmin">Trail Length (MIN):</label>
		<input type="number" step=.05 name="traillengthmin" id="traillengthmin" value=0 min="0" max="15000">
	</p>
	<p>
		<label for="traillengthmax">Trail Length (MAX):</label>
		<input type="number" name="traillengthmax" step=.05 id="traillengthmax" value=15000 min="1" max="15000">
	</p>
	<p>
		<label for="maxdis">Max Distance From Your Last Check-In:</label>
		<input type="number" name="maxdis" value=100 id="maxdis" min="0" required>
	</p>
    <p>
        <label for="type">Type:</label><br>
        <input type="radio" name="type" value="1"> Shared-use trail<br>
		<input type="radio" name="type" value="2"> Forest road<br>
		<input type="radio" name="type" value="3"> Rail trail <br>  
        <input type="radio" name="type" value="4"> Towpath<br>
		<input type="radio" name="type" value="5"> Urban trail<br>
		<input type="radio" name="type" value="6"> Segregated trail <br>  
        <input type="radio" name="type" value="7" checked> Footpath<br>
		<input type="radio" name="type" value="8"> Bicycle trail<br>
		<input type="radio" name="type" value="9"> Equestrian trail <br>  
        <input type="radio" name="type" value="10"> Cross-country skiing trail<br>
		<input type="radio" name="type" value="11"> Water trail<br>
		<input type="radio" name="type" value="12"> Motorized trail<br>  
    </p>
    <p>
        <label for="park">Park:</label>
        <input type="text" name="park" id="park">
    </p>
	<p>
        <label for="difficulty">Max Difficulty:</label><br>
        <input type="radio" name="difficulty" value="1"> Easy<br>
		<input type="radio" name="difficulty" value="2"> Medium<br>
		<input type="radio" name="difficulty" value="3" checked> Hard <br>  
    </p>
    <p>
        <label for="minrating">Minimum Rating:</label><br>
		<input type="range" name="minrating" min="1" max="5" value="1" step=1 class="slider" id="minrating">
	</p>
    <input type="submit" value="Search">
</form>
</br>
<button onclick="window.location.href='../Hikers_Guide.php'">Home Page</button>
</body>
</html>

