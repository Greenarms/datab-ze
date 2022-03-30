<?php
require_once('connection.php');
$isEmpty = false;

$username = mysqli_real_escape_string($conn, $_POST['username']);
$password = mysqli_real_escape_string($conn, $_POST['psw']);
$hash = md5($_POST["psw"]);

if (empty($username)) {
    $isEmpty = true;
}
if (empty($password)) {
    $isEmpty = true;
}

if ($isEmpty == true) {
    echo "Nieco si nezadal" . "<br>";
}

$query = "SELECT * FROM users WHERE username='$username' AND password='$hash'";
    $results = mysqli_query($conn, $query);

if ($results->num_rows == 1) {
    
    session_start();
    $_SESSION["username"] = $user;
    header("Location: index.php");
    echo "Uspesne si sa prihlasil" . "<br>";


    }else {
        header("Location: /login.php?massage=Zadal si zlé meno alebo heslo");
    }

?>