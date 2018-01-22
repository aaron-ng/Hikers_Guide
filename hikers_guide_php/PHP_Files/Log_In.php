

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>A Hiker's Guide To The Galaxy</title>
<h1>A Hiker's Guide To The Galaxy</h1>
<h3>Bring a Towel.</h3>

<form action="Log_In.php" method="post">
    <p>
        <input type="text" placeholder="Enter Username" name="username" id="username" required>
    </p>
    <p>
        <input type="password" placeholder="Enter Password" size = 45 name="password" id="password" required>
    </p>
    <input type="submit" value="Log In">
</form>

</head>
<body>
<?php session_start();

function LookUpLogin($username,$password)
{
	$link = mysqli_connect("localhost", "root", "");
	 
	// Check connection
	if($link === false){
		die("ERROR: Could not connect. " . mysqli_connect_error());
	}
 
	$db_selected = mysqli_select_db($link, 'hikers_guide_to_the_galaxy');
       
    $username = $username;
    $pwdmd = md5($password);
    $sql = "Select username from users ".
        " where username='$username' and password='$pwdmd';";
	$result = mysqli_query($link, $sql);
    
	$userSql = "Select * FROM users;";
	$userResult = mysqli_query($link, $userSql);
	
    if(!$result || mysqli_num_rows($result) <= 0)
    {
        echo "Error logging in. The username or password does not match";
        return false;
    }
    return true;
}

if(isset($_POST['username'])){
echo "Logging In. <br>";
		$username = trim($_POST['username']);
		$password = trim($_POST['password']);
		
		if(LookUpLogin($username,$password))
		{
			$_SESSION['username'] = $username;
			header("Location: http://localhost/hikers_guide/Hikers_Guide.php");
		}
		
		
		
    

}
?>
</body>
<button onclick="window.location.href='../Hikers_Guide.php'">Home Page</button>
</html>