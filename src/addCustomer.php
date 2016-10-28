<?php
include "connectdb.php";

$data = json_decode(file_get_contents("php://input"));

$email = mysqli_real_escape_string($conn,$data->email);
$address = mysqli_real_escape_string($conn,$data->address);
$username = mysqli_real_escape_string($conn,$data->username);
$password = mysqli_real_escape_string($conn,$data->password);
$reenterpassword = mysqli_real_escape_string($conn,$data->reenterpassword);



$query= "SELECT * FROM Customer WHERE CustomerName ='".$username."'";
$result = mysqli_query($conn, $query);

$row=mysqli_fetch_array($result);
if(!empty($row)){

echo "username already taken";
}
else if(){
	
}
else{
	echo "success";
}

mysqli_query($conn,"INSERT INTO Customer(CustomerName, Address, Email, Password) VALUES ('".$username."','".$address."','".$email."','".$password."')");


?>