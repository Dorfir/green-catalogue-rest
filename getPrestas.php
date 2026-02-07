<?php
    header('Access-Control-Allow-Origin: *');
    header('Access-Control-Allow-Headers: Content-Type, X-Requested-With');
    header('Access-Control-Allow-Methods: POST, GET, OPTIONS, DELETE, PUT');
    header('Access-Control-Max-Age: 600');
    header("Content-Type:application/json");
    include_once "crud.php";

    $prestas = getAllPrestas($pdo);
    $arr_presta = [];
    foreach ($prestas as $key => $presta) {
        $arr_presta[] = (array)$presta;
    }

    if (count($arr_presta) > 0) {
        $json = array("status" => 200, "message" => "Success", "prestas" => $arr_presta);
    } else {
        $json = array("status" => 300, "message" => "Error");
    }

    echo json_encode($json);
    $pdo = null; // fermeture de la connexion pdo

?>