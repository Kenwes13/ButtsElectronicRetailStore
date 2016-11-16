<?php
include "connectdb.php";
$data = json_decode(file_get_contents("php://input"));

$cName = mysqli_real_escape_string($conn,$data->cName);

/*$query= "SELECT * FROM Customer WHERE CustomerName = '".$cName."'";
$result = mysqli_query($conn, $query);
$row = mysqli_fetch_array($result ,MYSQLI_ASSOC);*/
$cID = 1;//$row["Customerid"];

$query = "SELECT * FROM orderhistory, Product WHERE orderhistory.ProductName = Product.ProductName AND orderhistory.Customerid = ".$cID."";
//$query = "SELECT * FROM orderhistory";
$result = mysqli_query($conn, $query);
while($row=mysqli_fetch_array($result)){
	$dataResult[] = $row;
}
echo json_encode($dataResult);	
?>