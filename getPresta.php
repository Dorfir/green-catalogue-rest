<?php
    header('Access-Control-Allow-Origin: *');
    header('Access-Control-Allow-Headers: Content-Type, X-Requested-With');
    header('Access-Control-Allow-Methods: POST, GET, OPTIONS, DELETE, PUT');
    header('Access-Control-Max-Age: 600');
    header("Content-Type:application/json");
    include_once "crud.php";

    $id_presta = $_POST['id_presta'];
    // $id_presta = 1;

    try {
        $presta = getPrestaObject($pdo, intval($id_presta));
        $json = array("status" => 200, "message" => "Success", "presta" => (array)$presta);
    } catch (Exception $e) {
        $json = array("status" => 300, "message" => "Error");
    }
    
    echo json_encode($json);
    $pdo = null; // fermeture de la connexion pdo


?>