<?php
include "connectdb.php";

$data = json_decode(file_get_contents("php://input"));

$username = mysqli_real_escape_string($conn,$data->uName);




$query= "SELECT * FROM Customer WHERE  CustomerName ='".$username."' LIMIT 1";
$result = mysqli_query($conn, $query);

$row=mysqli_fetch_array($result);
echo json_encode($row);



?>