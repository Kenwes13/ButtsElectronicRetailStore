<?php
include "connectdb.php";


$query= "SELECT * FROM Product ORDER BY Rating DESC  ";
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
?>
