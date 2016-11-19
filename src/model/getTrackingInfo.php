<?php
include "connectdb.php";
$data = json_decode(file_get_contents("php://input"));

$cName = mysqli_real_escape_string($conn,$data->cName);

$query= "SELECT * FROM Customer WHERE CustomerName = '".$cName."'";
$result = mysqli_query($conn, $query);
$row = mysqli_fetch_array($result ,MYSQLI_ASSOC);
$cID = $row["Customerid"];

$query = "SELECT * FROM Orders, Stores, Customer WHERE Orders.Storeid = Stores.Storeid AND Customer.Customerid =" .$cID."";
//$query = "SELECT * FROM orderhistory";
$result = mysqli_query($conn, $query);
while($row=mysqli_fetch_array($result)){
	$dataResult = $row;
}
echo json_encode($dataResult);	
?>