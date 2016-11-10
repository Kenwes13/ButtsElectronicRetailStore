<?php

if(isset($_FILES['file'])){
    //The error validation could be done on the javascript client side.
    $errors= array();
    $file_name = $_FILES['file']['name'];
    $file_size =$_FILES['file']['size'];
    $file_tmp =$_FILES['file']['tmp_name'];
    $file_type=$_FILES['file']['type'];
    $file_ext = strtolower(pathinfo($file_name, PATHINFO_EXTENSION));
    $extensions = array("jpeg","jpg","png");
    if(in_array($file_ext,$extensions )=== false){
     $errors[]="image extension not allowed, please choose a JPEG or PNG file.";
    }
    if($file_size > 2097152){
    $errors[]='File size cannot exceed 2 MB';
    }
    if(empty($errors)==true){
        move_uploaded_file($file_tmp,"../resources/images/".$file_name);
        echo "resources/images/" . $file_name;
    }else{
        print_r($errors);
    }
}

?>
