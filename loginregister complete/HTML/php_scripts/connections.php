<?phP
$servername ="localhost";
$username = "root";
$password = "";
$dbname = "projekt";
$conn=new mysqli($servername, $username, $password, $dbname);

if($conn->connect_error){
      die("connection failed: " . $conn->connection_error);
}
//echo "connection successful </br>";

/*
$sql ="SELECT id, username, email, password FROM projekt;" ;
$result = mysqli_query($conn, $sql);
//print_r(mysqli_num_rows($result) );

if (mysqli_num_rows($result) > 0) {
while($row = mysqli_fetch_assoc($result)){
      echo "id: " . $row["id"].  " - Name: " . $row["username"].  " - email: " . $row["email"].  " " . "<br>";
}
}else{
      echo "0 results";
}

?>
*/