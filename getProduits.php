<?php
    header('Access-Control-Allow-Origin: *');
    header('Access-Control-Allow-Headers: Content-Type, X-Requested-With');
    header('Access-Control-Allow-Methods: POST, GET, OPTIONS, DELETE, PUT');
    header('Access-Control-Max-Age: 600');
    header("Content-Type:application/json");
    include_once "crud.php";

    $produits = getAllProduits($pdo);
    $arr_prod = [];
    foreach ($produits as $key => $produit) {
        $arr_prod[] = (array)$produit;
    }

    if (count($arr_prod) > 0) {
        $json = array("status" => 200, "message" => "Success", "produits" => $arr_prod);
    } else {
        $json = array("status" => 300, "message" => "Error");
    }

    echo json_encode($json);
    $pdo = null; // fermeture de la connexion pdo

?>