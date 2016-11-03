<?php
include "connectdb.php";
$data = json_decode(file_get_contents("php://input"));

$search = mysqli_real_escape_string($conn,$data->search);
$category = mysqli_real_escape_string($conn,$data->category);


$query= "SELECT * FROM Product WHERE Category=".$category." AND Name LIKE '%".$search."%' LIMIT 20";
$result = mysqli_query($conn, $query);

while($row=mysqli_fetch_array($result)){
	$data[] = $row;
}
echo json_encode($data);
?>
