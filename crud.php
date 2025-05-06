<?php
    header('Access-Control-Allow-Origin: *');
    header('Access-Control-Allow-Headers: Content-Type, X-Requested-With');
    header('Access-Control-Allow-Methods: POST, GET, OPTIONS, DELETE, PUT');
    header('Access-Control-Max-Age: 600');
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

    getAllProduits($pdo);
    
    $pdo = null; // fermeture de la connexion pdo




    function getAllProduits($pdo) {
        $liste_ids = [];
        $request = "SELECT produit.id_produit FROM produit";
        $stmt = $pdo->prepare($request);
        $stmt->execute(array());
        $result = $stmt->fetchAll();
        $produits = [];
        foreach ($result as $key => $value) {
            $produits[] = getProduit($pdo, $value['id_produit']);
        }

        if (count($produits) > 0) {
            $json = array("status" => 200, "message" => "Success", "produits" => $produits);
        } else {
            $json = array("status" => 300, "message" => "Error");
        }

        echo json_encode($json);

    }
    
    function getProduit($pdo, $id_produit) {

        $produit = array();
        $produits = array();

        $request = "";
        $request .= "SELECT produit.id_produit, produit.marque, produit.nom, produit.prix, produit.thumb, ";
        $request .= "produit.id_categorie, produit_categorie.nom_categorie, ";
        $request .= "produit.id_famille, produit_famille.nom_famille ";
        $request .= "FROM `produit` ";
        $request .= "INNER JOIN produit_categorie ";
        $request .= "ON produit.id_categorie = produit_categorie.id_categorie ";
        $request .= "AND produit.id_produit = :id_1 ";
        $request .= "INNER JOIN produit_famille ";
        $request .= "ON produit.id_famille = produit_famille.id_famille ";
        $request .= "AND produit.id_produit = :id_2 ";

        $stmt = $pdo->prepare($request);
        $stmt->execute(array(':id_1'=>$id_produit, ':id_2'=>$id_produit));
        $count = $stmt->rowCount();
        $result = $stmt->fetchAll();

        if ($count > 0) {
            
            $produit['id_produit'] = $result[0]['id_produit'];
            $produit['marque'] = $result[0]['marque'];
            $produit['nom'] = $result[0]['nom'];
            $produit['prix'] = $result[0]['prix'];
            $produit['thumb'] = $result[0]['thumb'];
            $produit['id_categorie'] = $result[0]['id_categorie'];
            $produit['nom_categorie'] = $result[0]['nom_categorie'];
            $produit['id_famille'] = $result[0]['id_famille'];
            $produit['nom_famille'] = $result[0]['nom_famille'];

        } else { /*throw error*/ }

        $produit['descriptifs'] = getProduitDescriptifs($pdo, $id_produit);
        $produit['images'] = getProduitImages($pdo, $id_produit);

        return $produit;

    }

    function getProduitDescriptifs($pdo, $id_produit) {
        $request = "";
        $request .= "SELECT produit_descriptif.html ";
        $request .= "FROM `produit_descriptif` ";
        $request .= "WHERE produit_descriptif.id_produit=:id ";
        $request .= "ORDER BY produit_descriptif.index_descriptif";

        $stmt = $pdo->prepare($request);
        $stmt->execute(array(':id'=>$id_produit));
        $count = $stmt->rowCount();
        $result = $stmt->fetchAll();

        $descriptifs = [];
        foreach ($result as $key => $value) {
            $descriptifs[] = $value['html'];
        }
        return $descriptifs;
    }

    function getProduitImages($pdo, $id_produit) {
        $request = "";
        $request .= "SELECT produit_image.image_url ";
        $request .= "FROM `produit_image` ";
        $request .= "WHERE produit_image.id_produit=:id ";
        $request .= "ORDER BY produit_image.index_image";

        $stmt = $pdo->prepare($request);
        $stmt->execute(array(':id'=>$id_produit));
        $count = $stmt->rowCount();
        $result = $stmt->fetchAll();

        $images = [];
        foreach ($result as $key => $value) {
            $images[] = $value['image_url'];
        }
        return $images;
    }





    // SELECT produit.id_produit, produit.marque, produit.nom, produit.prix, produit.thumb, 
    // produit.id_categorie, produit_categorie.nom_categorie, 
    // produit.id_famille, produit_famille.nom_famille 
    // FROM `produit` 
    // INNER JOIN produit_categorie 
    // ON produit.id_categorie=produit_categorie.id_categorie 
    // AND produit.id_produit=1
    // INNER JOIN produit_famille 
    // ON produit.id_famille=produit_famille.id_famille 
    // AND produit.id_produit=1;

?>