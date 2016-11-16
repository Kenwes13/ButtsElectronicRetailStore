<?php
include "connectdb.php";
$data = json_decode(file_get_contents("php://input"));


//GET CART FROM CURRENT USER

$cName = mysqli_real_escape_string($conn,$data->cName);

$query= "SELECT * FROM Customer WHERE CustomerName = '".$cName."'";
$result = mysqli_query($conn, $query);
$row = mysqli_fetch_array($result ,MYSQLI_ASSOC);
$Customerid = $row["Customerid"];

$query = "SELECT * FROM Cart, Product WHERE Cart.ProductName = Product.ProductName AND Cart.Customerid = ".$Customerid."";
$result = mysqli_query($conn, $query);

$count = 0;
while($row=mysqli_fetch_array($result,MYSQLI_ASSOC)){
	$dataResult[] = $row;
	$count++;
}


// GET STORES WITH PRODUCTS IN STOCK THAT ARE IN CART
$query= "SELECT Storeid,Address, Zipcode, City, State, Productid, Quantity,UnitsinStock,count(*) as Count from (SELECT * FROM Cart WHERE Customerid = ".$Customerid.") AS CustomerCart NATURAL JOIN Product NATURAL JOIN Stores NATURAL JOIN Store_Product WHERE Quantity<=UnitsinStock group by Storeid HAVING Count=".$count;
$result = mysqli_query($conn, $query);

while($row=mysqli_fetch_array($result,MYSQLI_ASSOC)){
	$dataStoresResult[] = $row;
}
if(empty($data)){
	$dataStoresResult["fail"] = true;
echo json_encode($dataStoresResult);
}
else{

echo json_encode($dataStoresResult);
}

if(!empty(mysqli_error($conn))){
			file_put_contents("getStoresProductsErrors.txt",mysqli_error($conn));
		}
?>
