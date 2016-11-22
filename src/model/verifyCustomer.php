<?php
include "connectdb.php";

$data = json_decode(file_get_contents("php://input"));

if(isset($data->uName)&&isset($data->pWord)){

$username = mysqli_real_escape_string($conn,$data->uName);
$password = mysqli_real_escape_string($conn,$data->pWord);



//$query= "SELECT * FROM Customer WHERE Password = '".$password."' AND CustomerName ='".$username."'";
$query = "SELECT * FROM Customer WHERE CustomerName= '".$username."' ";
$result = mysqli_query($conn, $query);

$row=mysqli_fetch_array($result);

if(empty($row)){

echo "Username or password incorrect";
}
else if(password_verify($password, $row['Password'])){
	if($row["IsManager"]==1){
	echo "manager";

}
else if($row["IsEmployee"]==1){
	echo "employee";

}
else if($row["IsEmployee"]==0){
	echo "customer";
}


}
else{
	echo "Username or password incorrect";

}

}
?>
