<?php
include "connectdb.php";
$data = json_decode(file_get_contents("php://input"));

$pName = mysqli_real_escape_string($conn,$data->pName);
$quantity = mysqli_real_escape_string($conn,$data->quantity);

$query = "INSERT INTO Cart(ProductName, Quantity) VALUES ('".$pName."', '".$quantity."')";
$result = mysqli_query($conn, $query);

echo($result);
?>