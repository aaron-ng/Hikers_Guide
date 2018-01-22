
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Add User Form</title>
</head>
<body>
<form action="./pages/insert_user.php" method="post">
    <p>
        <label for="firstName">Name:</label>
        <input type="text" name="name" id="name" required>
    </p>
    <p>
        <label for="password">Password:</label>
        <input type="password" size=45 name="password" id="password" required>
    </p>
    <p>
        <label for="emailAddress">Email Address:</label>
        <input type="text" name="email" id="emailAddress" required>
    </p>
    <input type="submit" value="Submit">
</form>
</br>
<button onclick="window.location.href='../Hikers_Guide.php'">Home Page</button>
</body>
</html>
