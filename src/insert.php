<?php
include "connectdb.php";
$data = json_decode(file_get_contents("php://input"));

$username = mysqli_real_escape_string($conn,$data->uName);
$password = mysqli_real_escape_string($conn,$data->pWord);

echo "username already taken";

mysqli_query($conn,"INSERT INTO members (firstName, lastName, email, username, password) VALUES ('test','test','t311ds4','".$username."', '".$password."')");
file_put_contents("test.txt",$username);
?>