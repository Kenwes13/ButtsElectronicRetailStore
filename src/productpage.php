<?php
include "connectdb.php";
$data = json_decode(file_get_contents("php://input"));
$productName = mysqli_real_escape_string($conn,$data->name);
error_log($productName);
$query= "SELECT * FROM Product WHERE ProductName = '".$productName."'";
$result = mysqli_query($conn, $query);
while($row=mysqli_fetch_array($result)){
	$data = $row;
}
echo json_encode($data);
?>