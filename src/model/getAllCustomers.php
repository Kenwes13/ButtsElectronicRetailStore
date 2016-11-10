<?php
include "connectdb.php";


$query= "SELECT * FROM Customer ORDER BY Customerid  ";
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
