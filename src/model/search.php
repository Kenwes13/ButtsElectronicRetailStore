<?php
include "connectdb.php";
$input = json_decode(file_get_contents("php://input"));

if(isset($input->name)){
$name = mysqli_real_escape_string($conn,$input->name);
}
if(isset($input->category)){
$category = mysqli_real_escape_string($conn,$input->category);
}
if(!empty($name) && empty($category)){
$query= "SELECT * FROM Product WHERE ProductName LIKE '%".$name."%' LIMIT 20";
}
else if(empty($name) && !empty($category)){
$query= "SELECT * FROM Product WHERE Category='".$category."' LIMIT 20";
}
else if(empty($name) && empty($category)){
$query= "SELECT * FROM Product ORDER BY CreatedAt LIMIT 20 ";
}
else{
$query= "SELECT * FROM Product WHERE Category='".$category."' AND ProductName LIKE '%".$name."%' LIMIT 20";
}
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
