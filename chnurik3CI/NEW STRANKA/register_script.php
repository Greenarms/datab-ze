<?php
require_once('connection.php');
$isEmpty = false;
$hasPasswordCertainLength = true;
$hasPasswordAtLeastOneNumber = true;
$passwordAreSame = true;
$usernameOrEmailAlreadyExists = false;


$username = mysqli_real_escape_string($conn, $_POST['username']);
$email = mysqli_real_escape_string($conn, $_POST['email']);
$surname = mysqli_real_escape_string($conn, $_POST['surname']);
$password = mysqli_real_escape_string($conn, $_POST['psw']);

if(empty($_POST["email"])){
    $isEmpty = true;
}
if(empty($_POST["username"])){
    $isEmpty = true;
}
if(empty($_POST["surname"])){
    $isEmpty = true;
}
if(empty($_POST["psw"])){
    $isEmpty = true;
}
if(empty($_POST["psw-repeat"])){
    $isEmpty = true;
}
if($isEmpty == true){
    echo "Nieco si nezadal" . "<br>";
}

if (!preg_match("/[0-9]/", $password)) {
    $hasPasswordAtLeastOneNumber = false;
    header('Location: register.php?messages=Heslo musi obsahovat aspon jeden ciselny znak');
}

if($_POST["psw"] == $_POST["psw-repeat"]){
    $passwordAreSame = true;
}
else{
    $passwordAreSame = false;
    header('Location: register.php?message=Hesla sa nezhoduju');
}

if(strlen($password) < 6){
    $hasPasswordCertainLength = false;
    echo "Heslo musi mat minimalne 6 znakov" . "<br>";
} 
else{
    $hasPasswordCertainLength = true;
}
$sql_u = "SELECT * FROM users WHERE username='$username'";
$sql_e = "SELECT * FROM users WHERE email='$email'";
$res_u = mysqli_query($conn, $sql_u);
$res_e = mysqli_query($conn, $sql_e);

if (mysqli_num_rows($res_u) > 0) {
    $usernameOrEmailAlreadyExists = true;
    echo "Uzivatelske meno uz existuje" . "<br>";
}	
if(mysqli_num_rows($res_e) > 0){
    $usernameOrEmailAlreadyExists = true;
    echo "Email uz bol pouzity" . "<br>"; 
}

if($isEmpty == false && $hasPasswordCertainLength && $hasPasswordAtLeastOneNumber == true && $passwordAreSame == true && $usernameOrEmailAlreadyExists == false){
    $hash = md5($_POST["psw"]);
    $sql = "INSERT INTO users (username, surname, password, email) 
    VALUES('$username', '$surname', '$hash', '$email')";
    if ($conn->query($sql) == true){       
        echo "Registracia bola uspesna";
    }
    else{
        echo "Error" . $sql . "<br>" . $conn->error;
    }
    $conn->close();
}
?>