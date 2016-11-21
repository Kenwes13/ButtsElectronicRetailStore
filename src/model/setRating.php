<?php
include "connectdb.php";
$data = json_decode(file_get_contents("php://input"));

$pname = mysqli_real_escape_string($conn,$data->name);
$prating= mysqli_real_escape_string($conn,$data->rate);
$currentRatedTimes = 0;
$currentRating = 0.0;
$result = mysqli_query($conn,"SELECT Rating FROM Product WHERE ProductName ='".$pname."' ");
if (mysqli_num_rows($result) > 0) {
    // output data of each row
    while($row = mysqli_fetch_assoc($result)) {
        $currentRating = $row["Rating"];
        echo $currentRating;
    }
} else {
    echo "0 results";
}

$result= mysqli_query($conn,"SELECT Ratedtimes FROM Product WHERE ProductName ='".$pname."' ");
if (mysqli_num_rows($result) > 0) {
    // output data of each row
    while($row = mysqli_fetch_assoc($result)) {
        $currentRatedTimes = $row["Ratedtimes"];
        echo $currentRatedTimes;
    }
} else {
    echo "0 results";
}
$newRating = ($currentRating * $currentRatedTimes + $prating)/($currentRatedTimes+1);
echo $newRating;

$query = "UPDATE Product SET Rating ='".$newRating."', Ratedtimes = Ratedtimes+1 WHERE ProductName ='".$pname."' ";

mysqli_query($conn, $query);

?>
