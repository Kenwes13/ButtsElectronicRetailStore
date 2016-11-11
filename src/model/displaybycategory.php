<?php
include "connectdb.php";
$input = json_decode(file_get_contents("php://input"));

if(isset($input->category)){
$category = mysqli_real_escape_string($conn,$input->category);
}

$query= "SELECT * FROM Product WHERE Category='".$category."' LIMIT 20";
$result = mysqli_query($conn, $query);

while($row=mysqli_fetch_array($result)){
	$data[] = $row;
}


if(empty($data)){
	$data["fail"] = true;
echo json_encode($data);
}
else{

echo json_encode($data);
}
?>
