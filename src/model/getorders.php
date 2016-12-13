<?php
include "connectdb.php";
$data = json_decode(file_get_contents("php://input"));

$orderid = mysqli_real_escape_string($conn,$data->orderid);

//$query= "SELECT * FROM Customer WHERE CustomerName = '".$cName."'";
//$result = mysqli_query($conn, $query);
//$row = mysqli_fetch_array($result ,MYSQLI_ASSOC);
//$cID = $row["Customerid"];
//
//$query = "SELECT * FROM orderhistory, Product WHERE orderhistory.ProductName = Product.ProductName AND orderhistory.Customerid = ".$cID."";
//$query = "SELECT * FROM orderhistory";

$query = "SELECT * FROM Order_Product, Product WHERE Order_Product.Order_id = ".$orderid." AND Product.Productid = Order_Product.Product_id";
$result = mysqli_query($conn, $query);
while($row=mysqli_fetch_array($result)){
	$dataResult[] = $row;
}
echo json_encode($dataResult);
?>
