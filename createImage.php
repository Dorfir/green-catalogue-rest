<?php
    header('Access-Control-Allow-Origin: *');
    header('Access-Control-Allow-Headers: Content-Type, X-Requested-With');
    header('Access-Control-Allow-Methods: POST, GET, OPTIONS, DELETE, PUT');
    header('Access-Control-Max-Age: 600');
    header("Content-Type:application/json");
    include_once "crud.php";

    $message = [];
    $error_message = [];

    $target_dir = "uploads/";
    $target_file = $target_dir . basename($_FILES["image"]["name"]);
    $uploadOk = true;
    $imageFileType = strtolower( pathinfo($target_file, PATHINFO_EXTENSION) );
    // Check if image file is a actual image or fake image
    $check = getimagesize($_FILES["image"]["tmp_name"]);
    if ($check !== false) {
        $message[] = "File is an image - " . $check["mime"] . ".";
        $uploadOk = true;
    } else {
        $error_message[] = "File is not an image.";
        $uploadOk = false;
    }

    // Check if file already exists
    if (file_exists($target_file)) {
        $error_message[] = "Sorry, file already exists.";
        $uploadOk = false;
    }
    
    // Check file size
    if ($_FILES["image"]["size"] > 500000) {
        $error_message[] = "Sorry, your file is too large.";
        $uploadOk = false;
    }
    
    // Allow certain file formats
    if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
    && $imageFileType != "gif" ) {
        $error_message[] = "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
        $uploadOk = false;
    }
    
    // Check if $uploadOk is set to 0 by an error
    if (!$uploadOk) {
        $error_message[] = "Sorry, your file was not uploaded.";
        $json = array("status" => 300, "message" => $error_message);
    // if everything is ok, try to upload file
    } else {
        if (move_uploaded_file($_FILES["image"]["tmp_name"], $target_file)) {
            $message[] = "The file ". htmlspecialchars( basename( $_FILES["image"]["name"])). " has been uploaded.";
            $json = array("status" => 200, "message" => $message, "image_URL" => $target_file);
        } else {
            $error_message[] = "Sorry, there was an error uploading your file.";
            $json = array("status" => 300, "message" => $error_message);
        }
    }

    echo json_encode($json);
    $pdo = null; // fermeture de la connexion pdo

?>