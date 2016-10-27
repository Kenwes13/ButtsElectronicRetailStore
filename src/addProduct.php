<?php
include "connectdb.php";
$data = json_decode(file_get_contents("php://input"));

$productName = mysqli_real_escape_string($conn,$data->pName);
$price = mysqli_real_escape_string($conn,$data->price);
$category = mysqli_real_escape_string($conn,$data->cate);
$imageDirectory ="test";
/*
$productName = $_POST['productName'];
$price = $_POST['price'];
$category = $_POST['category'];
$imageDirectory "Testing";

	$uploadCheck = 1;
	$imageFileType = pathinfo($fileDirectory,PATHINFO_EXTENSION);
	//checks if image

	$check = getimagesize($_FILES["image"]["tmp_name"]);
		if($check !== false){
		
		$uploadCheck = 1; 
		}
		else{
		return "File is not an image.";
		$uploadCheck = 0;
		}
		//check if image already exisits
		if(file_exists($fileDirectory)){
		return "Sorry, file already exists.";
		$uploadCheck = 0;
		}

	//check
	if($uploadCheck ==0){
		return "There was a problem uploading your file.";
	}
	else {
    	if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $fileDirectory)) {
    	$imageDirectory = "/resources/images/".basename($_FILES["fileToUpload"]["name"]);
        return "The file ". basename( $_FILES["fileToUpload"]["name"]). " has been uploaded.";
    	} 
    	else {
        return "Sorry, there was an error uploading your file.";
    	}
	}
		
*/

$query = "INSERT INTO Product(ProductName,Price, Category, ImageDirectory, CreatedAt) VALUES ('".$productName."',".$price.", '".$category."','".$imageDirectory."',NOW())";
$result = mysqli_query($conn, $query);
echo ($result);
file_put_contents("test.txt",$category);
?>
