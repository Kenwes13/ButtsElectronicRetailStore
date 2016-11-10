<?php
include "connectdb.php";
$data = json_decode(file_get_contents("php://input"));


if(isset($_POST['productName'])){

	$query= "SELECT * FROM Product WHERE ProductName ='".$_POST['productName']."'";
	$result = mysqli_query($conn, $query);

	$row=mysqli_fetch_array($result);
	if(!empty($row)){

		echo json_encode("Product name already taken, please choose another name.");
	}





}
else{
	


$productName = mysqli_real_escape_string($conn,$data->pName);
$price = mysqli_real_escape_string($conn,$data->price);
$category = mysqli_real_escape_string($conn,$data->cate);
$description = mysqli_real_escape_string($conn,$data->desc);
$imageDirectory =mysqli_real_escape_string($conn,$data->imgdir);


$query = "INSERT INTO Product(ProductName,Price,Description, Category, ImageDirectory, CreatedAt) VALUES ('".$productName."',".$price." , '".$description."', '".$category."','".$imageDirectory."',NOW())";
$result = mysqli_query($conn, $query);
echo ($result);
}

?>
