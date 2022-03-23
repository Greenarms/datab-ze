<?php

$validated = true;
$password_match = true;

if(!empty($_POST["username"]))
{
    echo "zadal si meno <br>";
}else{
    echo "nezadali ste meno <br>";
    $validated = false;
}

if (!empty($_POST["email"]))
{
    echo "zadal si email <br>";
}else{
    echo "nezadali ste email <br>";
    $validated = false;
}


if (!empty($_POST["password"]))
{
    echo "zadal si heslo  <br>";
}else{
    echo "nezadali ste heslo <br>";
    $validated = false;
}

if (!empty($_POST["password_check"]))
{
    echo "zadal si kontrolne heslo <br>";
}else{
    echo "nezadali ste kontrolne heslo <br>";
    $validated = false;
}

if ($_POST["password"] == $_POST["password_check"])
{
echo "hesla sa zhoduju <br>";
}else{
    echo "hesla sa nezhoduju <br>";
    $password_match = false;
}

$hashed_password = password_hash($_POST["password"], PASSWORD_BCRYPT);  
echo "Unhasher password = " . $_POST["password"] . "<br>";
echo $hashed_password;

require_once("connections.php");

if($password_match && $validated)
{
    $sqli = 'INSERT INTO projekt(password,email,username) VALUES("'. $_POST["password"] .'","'.$_POST["email"] .'","'.$_POST["username"].'");';
   
    if ($conn->query($sqli) === TRUE){
        echo "new record created";
    }else{
        echo "error: " . $sqli . "br" . $conn->error;
    }
}

