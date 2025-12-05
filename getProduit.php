<?php
    header('Access-Control-Allow-Origin: *');
    header('Access-Control-Allow-Headers: Content-Type, X-Requested-With');
    header('Access-Control-Allow-Methods: POST, GET, OPTIONS, DELETE, PUT');
    header('Access-Control-Max-Age: 600');
    header("Content-Type:application/json");
    include_once "crud.php";

    $id_produit = $_POST['id_produit'];

    try {
        $prod = getProduit($pdo, intval($id_produit));
        $json = array("status" => 200, "message" => "Success", "produit" => (array)$prod);
    } catch (Exception $e) {
        $json = array("status" => 300, "message" => "Error");
    }
    
    echo json_encode($json);
    $pdo = null; // fermeture de la connexion pdo


?>