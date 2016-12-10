<?php

include "connectdb.php";
$data = json_decode(file_get_contents("php://input"));

$cname= mysqli_real_escape_string($conn,$data->cName);
$pid= mysqli_real_escape_string($conn,$data->pid);

$query = "SELECT * FROM Customer_Rate WHERE Customername = '".$cname."' AND Ratedproductid = ".$pid." ";
$result = mysqli_query($conn, $query);
$numprod = mysqli_num_rows($result);
if($numprod != 0) {
	echo "false";
}
else{
	echo "true";
}

?>
