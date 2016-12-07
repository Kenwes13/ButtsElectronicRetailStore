<?php
include "connectdb.php";

$data = json_decode(file_get_contents("php://input"));

$product_id = mysqli_real_escape_string($conn,$data->product_id);

//testing
//file_put_contents("testProductId.txt", $product_id);


$query= "SELECT ProductName FROM Product WHERE Productid =".$product_id." LIMIT 1";
$result = mysqli_query($conn, $query);

$row=mysqli_fetch_array($result);

echo json_encode($row);



?>