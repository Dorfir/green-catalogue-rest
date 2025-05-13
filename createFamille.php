<?php
    header('Access-Control-Allow-Origin: *');
    header('Access-Control-Allow-Headers: Content-Type, X-Requested-With');
    header('Access-Control-Allow-Methods: POST, GET, OPTIONS, DELETE, PUT');
    header('Access-Control-Max-Age: 600');
    header("Content-Type:application/json");
    include_once "crud.php";



    $nom_famille = $_POST['nom_famille'];

    try {
        $id_famille = createFamille($pdo, $nom_famille);
        $json = array("status" => 200, "message" => "Success", "id_famille" => $id_famille);
    } catch (Exception $e) {
        $json = array("status" => 300, "message" => "Error");
    }
    
    echo json_encode($json);
    $pdo = null; // fermeture de la connexion pdo

?>