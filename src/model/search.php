<?php
include "connectdb.php";
$input = json_decode(file_get_contents("php://input"));

$name = mysqli_real_escape_string($conn,$input->name);

if(isset($input->category)){
$category = mysqli_real_escape_string($conn,$input->category);
$query= "SELECT * FROM Product WHERE Category='".$category."' AND ProductName LIKE '%".$name."%' LIMIT 20";
}
else{
$query= "SELECT * FROM Product WHERE ProductName LIKE '%".$name."%' LIMIT 20";
}


$result = mysqli_query($conn, $query);

while($row=mysqli_fetch_array($result)){
	$data[] = $row;
}
echo json_encode($data);
?>
