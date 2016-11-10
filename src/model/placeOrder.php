<?php
include "connectdb.php";

$data = json_decode(file_get_contents("php://input"));

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

//get customer id
$query= "SELECT * FROM Customer WHERE CustomerName = '".$cName."'";
$result = mysqli_query($conn, $query);
$row = mysqli_fetch_array($result ,MYSQLI_ASSOC);
$cID = $row["Customerid"];

mysqli_query($conn,"INSERT INTO Orders(Storeid,Country, FirstName, LastName, Address,City,State,ZipCode,PhoneNumber,Email,TotalCost,Customerid) VALUES (1,'".$country."','".$firstName."','".$lastName."','".$address."','".$city."','".$state."','".$zipCode."','".$phoneNumber."','".$email."','".$totalCost."',".$cID.")");

if(!empty(mysqli_error($conn))){
			file_put_contents("errors.txt",mysqli_error($conn));
		}

?>
