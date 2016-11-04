<?php
include "connectdb.php";
if (isset($_POST["email"]))
{
  $user = $_POST["email"];
  echo $user;
  echo " is your username";
}
else
{
  $user = null;
  echo "no email supplied";
}

$emailtaken = "Email Taken";
$query = "SELECT * FROM customer where `E-Mail` = '$email'";
$result = mysqli_query($conn, $query);
$numemails = mysqli_num_rows($result);
if($numemails == 0) {
  echo json_encode ($emailtaken);
}
?>
