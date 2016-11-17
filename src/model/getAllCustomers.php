<?php
include "connectdb.php";
$data = json_decode(file_get_contents("php://input"));

$query= "SELECT * FROM Customer  ORDER BY Customerid  ";
$result = mysqli_query($conn, $query);

while($row=mysqli_fetch_array($result,MYSQLI_ASSOC)){
	$data[] = $row;
}
if(empty($data)){
	$data["fail"] = true;
echo json_encode($data);
}
else{

echo json_encode($data);
}
//testing purposes
if(!empty(mysqli_error($conn))){
			//file_put_contents("getCustErrors.txt",mysqli_error($conn));
		}
?>
