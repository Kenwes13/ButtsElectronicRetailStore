<?php
include "connectdb.php";
$data = json_decode(file_get_contents("php://input"));


if(isset($_POST['productName'])){

	$query= "SELECT * FROM Product WHERE ProductName ='".$_POST['productName']."'";
	$result = mysqli_query($conn, $query);

	$row=mysqli_fetch_array($result);
	if(!empty($row)){

		echo "false";
	}else{
		echo "true";
	}





}
else {
	


	$productName = mysqli_real_escape_string($conn,$data->pName);
	$price = mysqli_real_escape_string($conn,$data->price);
	$category = mysqli_real_escape_string($conn,$data->cate);
	$description = mysqli_real_escape_string($conn,$data->desc);
	$imageDirectory =mysqli_real_escape_string($conn,$data->imgdir);

	$storeid=mysqli_real_escape_string($conn,$data->storeid);
	$address=mysqli_real_escape_string($conn,$data->address);
	$city=mysqli_real_escape_string($conn,$data->city);
	$state=mysqli_real_escape_string($conn,$data->state);
	$quantity=mysqli_real_escape_string($conn,$data->quantity);

	if(isset($data->pName)&&isset($data->price)&&isset($data->cate)&&isset($data->desc)&&isset($data->imgdir)&&isset($data->storeid)&&isset($data->quantity)){

		$query = "INSERT INTO Product(ProductName,Price,Description, Category, ImageDirectory, CreatedAt) VALUES ('".$productName."',".$price." , '".$description."', '".$category."','".$imageDirectory."',NOW())";
		$result = mysqli_query($conn, $query);




		$query= "SELECT Productid FROM Product WHERE  ProductName ='".$productName."' LIMIT 1";
		$productResult = mysqli_query($conn, $query);

		$productRow=mysqli_fetch_array($productResult);


		


		$query= "SELECT * FROM Store_Product WHERE Storeid =".$storeid." AND Productid = ".$productRow["Productid"]."";
		$result = mysqli_query($conn, $query);

		$row=mysqli_fetch_array($result);
		if(!empty($row)){

			$query2 = "UPDATE Store_Product SET UnitsinStock = UnitsinStock + ".(int)$quantity." WHERE Storeid = ".$storeid." AND Productid = ".$productRow["Productid"];
			$result = mysqli_query($conn, $query2);
		}else{
			$query = "INSERT IGNORE INTO Store_Product(Storeid,Productid,UnitsinStock) VALUES(".$storeid.",".$productRow["Productid"].",".intval($quantity).")";
			$result = mysqli_query($conn, $query);
			file_put_contents("addProductErrors.txt",$query);
		}

		//file_put_contents("addProductErrors.txt",mysqli_error($conn));

		

		if(!empty(mysqli_error($conn))){
			//file_put_contents("addProductErrors.txt",mysqli_error($conn));
			echo mysqli_error($conn);
		}
		else{echo $quantity." ".$productName."(s) successfully addded to the ".$address.", ".$city.", ".$state." location";
	}
}
}
?>
