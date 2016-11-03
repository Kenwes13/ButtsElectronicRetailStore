<?php
include "connectdb.php";

$data = json_decode(file_get_contents("php://input"));

$username = mysqli_real_escape_string($conn,$data->uName);
$password = mysqli_real_escape_string($conn,$data->pWord);



$query= "SELECT * FROM Customer WHERE Password = '".$password."' and CustomerName ='".$username."'";
$result = mysqli_query($conn, $query);

$row=mysqli_fetch_array($result);
if(empty($row)){

echo "Username or password incorrect";
}
else{
	echo "success";
	session_start();
	echo $_SESSION['currentCustomer'] = $username;
}



?>