<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
</head>
<body>
<a href="index.php">Home</a>

<form action="../php_scripts/RegisterScripts.php" method="POST">

<label for="username">Meno:</label>
<input type="text" name="username" id="username">
<br>
<label for="email">Email:</label>
<input type="mail" name="email" id="email">
<br>
<label for="password">Heslo:</label>
<input type="password" name="password" id="password">
<br>
<label for="password_check">Zopakuj heslo:</label>
<input type="password" name="password_check" id="password_check">
<br>
<input type="submit" value="Registruj">

</form>
</body>
</html>