<?php
include "connectdb.php";
$data = json_decode(file_get_contents("php://input"));

if(isset($data->quantity)){
	$item = mysqli_real_escape_string($conn,$data->item);
	$username = mysqli_real_escape_string($conn,$data->username);
	$quantity = mysqli_real_escape_string($conn,$data->quantity);

	$query= "SELECT * FROM Customer WHERE CustomerName = '".$username."'";
	$result = mysqli_query($conn, $query);
	$row = mysqli_fetch_array($result ,MYSQLI_ASSOC);
	$Customerid = $row["Customerid"];

	mysqli_query($conn,"UPDATE Cart SET Quantity = ".$quantity." WHERE ProductName = '".$item."' AND Customerid = ".$Customerid."");
file_put_contents("cartErrors.txt","UPDATE Cart SET Quantity = ".$quantity." WHERE ProductName = '".$item."' AND Customerid = ".$Customerid."");
}
else{
	$item = mysqli_real_escape_string($conn,$data->item);
	$username = mysqli_real_escape_string($conn,$data->username);

	$query= "SELECT * FROM Customer WHERE CustomerName = '".$username."'";
	$result = mysqli_query($conn, $query);
	$row = mysqli_fetch_array($result ,MYSQLI_ASSOC);
	$Customerid = $row["Customerid"];


	mysqli_query($conn,"DELETE FROM Cart WHERE ProductName = '".$item."' AND Customerid = ".$Customerid."");

}

if(!empty(mysqli_error($conn))){
			file_put_contents("cartErrors.txt",mysqli_error($conn));
		}


?>