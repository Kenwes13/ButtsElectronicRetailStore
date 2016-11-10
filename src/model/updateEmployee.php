<?php
include "connectdb.php";

$data = json_decode(file_get_contents("php://input"));



$username = mysqli_real_escape_string($conn,$data->username);



$query= "SELECT * FROM Customer WHERE CustomerName ='".$username."'";
$result = mysqli_query($conn, $query);
$row = mysqli_fetch_array($result ,MYSQLI_ASSOC);
$isEmployee = $row["IsEmployee"];


if($isEmployee==0){

mysqli_query($conn,"UPDATE Customer SET IsEmployee = 1");

}
else{
mysqli_query($conn,"UPDATE Customer SET IsEmployee = 0");
mysqli_query($conn,"UPDATE Customer SET IsManager = 0");

}
	


?>
