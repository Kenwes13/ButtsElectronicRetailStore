<?php
include "connectdb.php";
$data = json_decode(file_get_contents("php://input"));

$cName = mysqli_real_escape_string($conn,$data->cName);

$query= "SELECT * FROM Customer WHERE CustomerName = '".$cName."'";
$result = mysqli_query($conn, $query);
$row = mysqli_fetch_array($result ,MYSQLI_ASSOC);
$Customerid = $row["Customerid"];

$query = "SELECT * FROM Cart, Product WHERE Cart.ProductName = Product.ProductName AND Cart.Customerid = ".$Customerid."";
$result = mysqli_query($conn, $query);

while($row=mysqli_fetch_array($result)){
	$dataResult[] = $row;
}

echo json_encode($dataResult);
?>