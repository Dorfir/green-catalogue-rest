<?php
    header('Access-Control-Allow-Origin: *');
    header('Access-Control-Allow-Headers: Content-Type, X-Requested-With');
    header('Access-Control-Allow-Methods: POST, GET, OPTIONS, DELETE, PUT');
    header('Access-Control-Max-Age: 600');
    header("Content-Type:application/json");
    include_once "crud.php";

    $liste_familles = getFamillesAndCategories($pdo);
    
    if (count($liste_familles) > 0) {
        $json = array("status" => 200, "message" => "Success", "familles" => $liste_familles);
    } else {
        $json = array("status" => 300, "message" => "Error");
    }

    echo json_encode($json);
    $pdo = null; // fermeture de la connexion pdo

?>