
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Add Trail Form</title>
</head>
<body>
<form action="./pages/insert_trail.php" method="post">
    <p>
        <label for="trailname">Trail Name:</label>
        <input type="text" name="trailname" id="trailname" required>
    </p>
	<p>
		<label for="traillength">Trail Length:</label>
		<input type="number" name="traillength" id="traillength" min="1" max="15000" step=.05 required>
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
        <label for="difficulty">Difficulty:</label><br>
        <input type="radio" name="difficulty" value="1"> Easy<br>
		<input type="radio" name="difficulty" value="2" checked> Medium<br>
		<input type="radio" name="difficulty" value="3"> Hard <br>  
    </p>
    <input type="submit" value="Add Trail">
</form>
</br>
<button onclick="window.location.href='../Hikers_Guide.php'">Home Page</button>
</body>
</html>

