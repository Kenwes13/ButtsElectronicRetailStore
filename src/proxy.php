<?php
// Set your return content type
header('Content-type: application/json');
$custAddress = $_POST['custAddress'];
$storeAddress = $_POST['storeAddress'];


// Website url to open
$url = 'https://maps.googleapis.com/maps/api/directions/json?origin='.$custAddress.'&destination='.$storeAddress.'&departure_time=now&key=AIzaSyBFH2S9Cc2jAlala-UA6YXVEt50cEz1TTc';

// Get that website's content
$handle = fopen($url, "r");

// If there is something, read and return
if ($handle) {
    while (!feof($handle)) {
        $buffer = fgets($handle, 4096);
        echo $buffer;
    }
    fclose($handle);
}
?>