<?php
include "connectdb.php";
$data = json_decode(file_get_contents("php://input"));

$pid = mysqli_real_escape_string($conn,$data->pid);
$cName = mysqli_real_escape_string($conn,$data->cName);
$quantity = mysqli_real_escape_string($conn,$data->quantity);
//$query = $_POST['query'];


$queryProductName= "SELECT ProductName FROM Product WHERE Productid =".$pid." LIMIT 1";
$resultProductName = mysqli_query($conn, $queryProductName);

$rowProductName=mysqli_fetch_array($resultProductName);
file_put_contents("testProductId.txt", $rowProductName['ProductName']);
//echo json_encode($row);

$query= "SELECT * FROM Cart NATURAL JOIN Customer WHERE CustomerName = '".$cName."' AND ProductName ='".$rowProductName['ProductName']."'";
$result = mysqli_query($conn, $query);

$row=mysqli_fetch_array($result ,MYSQLI_ASSOC);
if(!empty($row)){
$cID = $row["Customerid"];
$query = "UPDATE Cart SET Quantity = Quantity+".$quantity." WHERE ProductName = '".$rowProductName['ProductName']."' AND Customerid = ".$cID."";
$result = mysqli_query($conn, $query);

}
else{
$query= "SELECT * FROM Customer WHERE CustomerName = '".$cName."'";
$result = mysqli_query($conn, $query);
$row=mysqli_fetch_array($result ,MYSQLI_ASSOC);


$query = "INSERT INTO Cart(ProductName, Customerid , Quantity) VALUES ('".$rowProductName['ProductName']."',".$row["Customerid"]." ,".$quantity.")";
$result = mysqli_query($conn, $query);
}

//file_put_contents("errors.txt", "test ".$row["Customerid"].mysqli_error($conn));


echo($result);

?>