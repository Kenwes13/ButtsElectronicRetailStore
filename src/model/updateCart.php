<?php
include "connectdb.php";
$data = json_decode(file_get_contents("php://input"));

$passedQuery = mysqli_real_escape_string($conn,$data->query);
$item = mysqli_real_escape_string($conn,$data->item);
$query = $passedQuery ."'" .$item. "'";
$result = mysqli_query($conn, $query);
echo json_encode($result);

?>