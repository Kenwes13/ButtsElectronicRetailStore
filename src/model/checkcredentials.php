<?php
include "connectdb.php";
if (isset($_POST["email"]))
{

	$query = "SELECT * FROM Customer where Email = '".$_POST["email"]."'";
	$result = mysqli_query($conn, $query);
	$numemails = mysqli_num_rows($result);
	if($numemails != 0) {
		echo "false";
	}
	else{
		echo "true";
	}
}
else if(isset($_POST["userid"]))
{

	$query = "SELECT * FROM Customer where CustomerName = '".$_POST["userid"]."'";
	$result = mysqli_query($conn, $query);
	$numemails = mysqli_num_rows($result);
	if($numemails != 0) {
		echo "false";
	}
	else{
		echo "true";

	}
}


?>
