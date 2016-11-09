<?php
include "connectdb.php";
$email = $_POST['email'];
$username = $_POST['username'];
$password = $_POST['password'];


$query = "INSERT INTO Customer(CustomerName,Email, Password) VALUES ('".$username."','".$email."', '".$password."');";
$result = mysqli_query($conn, $query);
echo ($result);
?>
