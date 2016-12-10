<?php
include "connectdb.php";
$data = json_decode(file_get_contents("php://input"));

$cname= mysqli_real_escape_string($conn,$data->cname);
$pid = mysqli_real_escape_string($conn,$data->pid);
$prating= mysqli_real_escape_string($conn,$data->rate);
$currentRatedTimes = 0;
$currentRating = 0.0;

$result = mysqli_query($conn,"SELECT Rating FROM Product WHERE Productid =".$pid." ");
if (mysqli_num_rows($result) > 0) {
    // output data of each row
    while($row = mysqli_fetch_assoc($result)) {
        $currentRating = $row["Rating"];
        //echo $currentRating;
    }
} else {
    echo "0 results";
}

$result= mysqli_query($conn,"SELECT Ratedtimes FROM Product WHERE Productid =".$pid." ");
if (mysqli_num_rows($result) > 0) {
    // output data of each row
    while($row = mysqli_fetch_assoc($result)) {
        $currentRatedTimes = $row["Ratedtimes"];
        //echo $currentRatedTimes;
    }
} else {
    echo "0 results";
}
$newRating = ($currentRating * $currentRatedTimes + $prating)/($currentRatedTimes+1);
//echo $newRating;

$query = "UPDATE Product SET Rating ='".$newRating."', Ratedtimes = Ratedtimes+1 WHERE Productid =".$pid." ";


mysqli_query($conn, $query);

$result = mysqli_query($conn,"INSERT INTO Customer_Rate(Customername , Ratedproductid ) VALUES ('".$cname."', ".$pid.") ");
echo $result;

?>
