<?php
include "connectdb.php";
$data = json_decode(file_get_contents("php://input"));
$storeid  = mysqli_real_escape_string($conn,$data->storeid);
$pName = mysqli_real_escape_string($conn,$data->pName);



$query= "SELECT UnitsinStock FROM Store_Product NATURAL JOIN Product WHERE Storeid=".$storeid." AND ProductName = '".$pName."'";
$result = mysqli_query($conn, $query);
while($row=mysqli_fetch_array($result,MYSQLI_ASSOC)){
	$dataResult[] = $row;
}
if(empty($data)){
	$dataResult["fail"] = true;
echo json_encode($dataResult);
}
else{

echo json_encode($dataResult);
}
//testing purposes
if(!empty(mysqli_error($conn))){
			//file_put_contents("getStoresErrors.txt",mysqli_error($conn));
		}
?>
