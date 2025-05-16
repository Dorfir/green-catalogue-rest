<?php
    header('Access-Control-Allow-Origin: *');
    header('Access-Control-Allow-Headers: Content-Type, X-Requested-With');
    header('Access-Control-Allow-Methods: POST, GET, OPTIONS, DELETE, PUT');
    header('Access-Control-Max-Age: 600');
    header("Content-Type:application/json");
    include_once "crud.php";



    $nom_categorie = $_POST['nom_categorie'];
    $id_famille = intval($_POST['id_famille']);

    try {
        $id_categorie = createCategorie($pdo, $nom_categorie, $id_famille);
        $json = array("status" => 200, "message" => "Success", "id_categorie" => $id_categorie);
    } catch (Exception $e) {
        $json = array("status" => 300, "message" => "Error");
    }
    
    echo json_encode($json);
    $pdo = null; // fermeture de la connexion pdo

?>