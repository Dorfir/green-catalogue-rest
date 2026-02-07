<?php
    header('Access-Control-Allow-Origin: *');
    header('Access-Control-Allow-Headers: Content-Type, X-Requested-With');
    header('Access-Control-Allow-Methods: POST, GET, OPTIONS, DELETE, PUT');
    header('Access-Control-Max-Age: 600');
    header("Content-Type:application/json");
    include_once "crud.php";

    $familles = (array)getPrestaFamilles($pdo);
    
    if (count($familles) > 0) {
        $json = array("status" => 200, "message" => "Success", "familles" => $familles);
    } else {
        $json = array("status" => 300, "message" => "Error");
    }

    echo json_encode($json);
    $pdo = null; // fermeture de la connexion pdo

?>