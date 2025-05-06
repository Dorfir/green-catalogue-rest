<?php
    header("Content-Type:application/json");

    $dsn = 'mysql:host=localhost;dbname=green_rest';
    $username = 'root';
    $password = '';

    try {
        $pdo = new PDO($dsn, $username, $password);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    } catch (PDOException $e) {
        echo 'Connexion échouée : ' . $e->getMessage();
    }

    $email = "greendorfir@gmail.com";
    $password = 'coco';

    $stmt = $pdo->prepare("SELECT * FROM client WHERE email=:mail AND password=:pwd");
    $stmt->execute(array(':mail' => $email, ':pwd' => $password));
    $count = $stmt->rowCount();
    $result = $stmt->fetchAll();

    // print_r($result);  

    if ($count > 0) {
        $json = array("status" => 200, "message" => "Success", "nom" => $result[0]['nom'], "email" => $result[0]['email']);
    } else {
        $json = array("status" => 300, "message" => "Error");
    }

    echo json_encode($json);
    $pdo = null; // fermeture de la connexion pdo


?>