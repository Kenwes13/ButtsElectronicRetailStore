<?php
include "connectdb.php";
$data = json_decode(file_get_contents("php://input"));

$pid = mysqli_real_escape_string($conn,$data->pid);

$query= "SELECT * FROM Product WHERE Productid = ".$pid."";
$result = mysqli_query($conn, $query);

while($row=mysqli_fetch_array($result)){
	$dataResult = $row;
}
echo json_encode($dataResult);
?>
