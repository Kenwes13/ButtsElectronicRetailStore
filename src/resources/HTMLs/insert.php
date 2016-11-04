<?php
$data = json_decode(file_get_contents("php://input"));
$conn=mysqli_connect("localhost","root","!@)59380","membership");
$username = mysqli_real_escape_string($conn,$data->username);
$password = mysqli_real_escape_string($conn,$data->password);


mysqli_query($conn,"INSERT INTO members (firstName, lastName, email, username, password) VALUES ('test','test','testds1124','".$username."', '".$password."')");
file_put_contents("test.txt",$username);
?>