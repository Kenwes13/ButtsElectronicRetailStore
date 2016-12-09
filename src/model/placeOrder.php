<?php
include "connectdb.php";

$data = json_decode(file_get_contents("php://input"));

if(isset($data->country)&&isset($data->firstName)&&isset($data->lastName)&&isset($data->address)&&isset($data->city)&&isset($data->state)&&isset($data->zipCode)&&isset($data->phoneNumber)&&isset($data->email)&&isset($data->totalCost)&&isset($data->cName)&&isset($data->storeid)){

	$country = mysqli_real_escape_string($conn,$data->country);
	$firstName = mysqli_real_escape_string($conn,$data->firstName);
	$lastName = mysqli_real_escape_string($conn,$data->lastName);
	$address = mysqli_real_escape_string($conn,$data->address);
	$city = mysqli_real_escape_string($conn,$data->city);
	$state = mysqli_real_escape_string($conn,$data->state);
	$zipCode = mysqli_real_escape_string($conn,$data->zipCode);
	$phoneNumber = mysqli_real_escape_string($conn,$data->phoneNumber);
	$email = mysqli_real_escape_string($conn,$data->email);
	$totalCost = mysqli_real_escape_string($conn,$data->totalCost);
	$cName = mysqli_real_escape_string($conn,$data->cName);
	$storeid = mysqli_real_escape_string($conn,$data->storeid);

//get customer id
	$query= "SELECT * FROM Customer WHERE CustomerName = '".$cName."'";
	$result = mysqli_query($conn, $query);
	echo json_encode($result);
	$row = mysqli_fetch_array($result ,MYSQLI_ASSOC);
	$cID = $row["Customerid"];



	mysqli_query($conn,"INSERT INTO Orders(Storeid,Country, FirstName, LastName, CustAddress, State,ZipCode,PhoneNumber,Email,TotalCost,Customerid) VALUES (".$storeid.",'".$country."','".$firstName."','".$lastName."','".$address. ' ' .$city."','".$state."','".$zipCode."','".$phoneNumber."','".$email."','".$totalCost."',".$cID.")");



	if(!empty(mysqli_error($conn))){
		file_put_contents("errors.txt",mysqli_error($conn));
	}


$query = "SELECT * FROM Cart, Product WHERE Cart.ProductName = Product.ProductName AND Cart.Customerid = ".$cID."";
$result = mysqli_query($conn, $query);

while($row=mysqli_fetch_array($result)){
	$data = $row;
	$ProductName = $row["ProductName"];
	$Customerid = $row["Customerid"];
	$Quantity = $row["Quantity"];
	$Storeid = $row["Storeid"];
	$ProductName = str_replace("'", "\'", $ProductName);

		//file_put_contents("placeOrdersErrors.txt", $ProductName);

	$insert_query = "INSERT INTO orderhistory VALUES ('".$ProductName."', '".$Customerid."', '".$Quantity."')";
	$insert_result = mysqli_query($conn, $insert_query);
}

//DELETE FROM PRODUCTS FROM Store_Product BASED ON CART CONTENT
$query = "SELECT * FROM Cart NATURAL JOIN Product WHERE Customerid = ".$cID."";
$result = mysqli_query($conn, $query);
while($row=mysqli_fetch_array($result)){
	$data = $row;
	$Productid = $row["Productid"];
	$Quantity = $row["Quantity"];
	$update_query = "UPDATE Store_Product SET UnitsinStock = UnitsinStock - ".$Quantity." WHERE Productid = ".$Productid." AND Storeid = ".$storeid;
	$insert_result = mysqli_query($conn, $update_query);
	//file_put_contents("placeOrdersErrors.txt", $update_query, FILE_APPEND);
}



$query = "DELETE FROM Cart WHERE Customerid = ".$cID."";
$result = mysqli_query($conn, $query);
echo json_encode($result);
if(!empty(mysqli_error($conn))){
	file_put_contents("placeOrdersErrors.txt",mysqli_error($conn));
}
}
else{
	$result["fail"] = true;
echo json_encode($result);
}
?>
