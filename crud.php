<?php
    // header('Access-Control-Allow-Origin: *');
    // header('Access-Control-Allow-Headers: Content-Type, X-Requested-With');
    // header('Access-Control-Allow-Methods: POST, GET, OPTIONS, DELETE, PUT');
    // header('Access-Control-Max-Age: 600');
    // header("Content-Type:application/json");

    include_once "connect/db_connect.php";
    
    try {
        $pdo = new PDO($dsn, $username, $password);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    } catch (PDOException $e) {
        echo 'Connexion échouée : ' . $e->getMessage();
    }

    /* Data model */
    class Produit {
        public $id_produit = 0;
        public $id_famille = 0;
        public $nom_famille = "";
        public $id_categorie = 0;
        public $nom_categorie = "";
        public $nom = "";
        public $marque = "";
        public $descriptifs = [];
        public $images = [];
        public $prix = null;
        public $thumb = "";
        public $mise_en_page = 0;
    }
    class FamilleProduit {
        public $id_famille = 0;
        public $nom_famille = "";
    }
    class CategorieProduit {
        public $id_categorie = 0;
        public $id_famille = 0;
        public $nom_categorie = "";
    }
    class DescriptifProduit {
        public $id_produit_descriptif = 0;
        public $html = "";
        public $titre = "";
        public $id_produit = 0;
        public $index_descriptif = 0;
    }
    class ImageDescriptifProduit {
        public $image_url = "";
        public $display_size = "";
        public $index_descriptif = 0;
    }


    /* Create functions */
    function createProduct($pdo, $produit) {

        // INSERT INTO `produit_categorie` (`id_categorie`, `nom_categorie`) VALUES (NULL, 'Portes de douche');
        $request = "INSERT INTO `produit` ";
        $request .= "(`id_produit`, `id_famille`, `id_categorie`, `marque`, `nom`, `prix`, `thumb`, `mise_en_page`)";
        $request .= " VALUES (NULL, :id_famille, :id_categorie, :marque, :nom, :prix, :thumb, :mise_en_page)";
        $stmt = $pdo->prepare($request);
        $stmt->execute(array(
            ':id_famille'=>$produit->id_famille,
            ':id_categorie'=>$produit->id_categorie,
            ':marque'=>$produit->marque,
            ':nom'=>$produit->nom,
            ':prix'=>$produit->prix,
            ':thumb'=>$produit->thumb,
            ':mise_en_page'=>$produit->mise_en_page
        ));
        $produit->id_produit = $pdo->lastInsertId();

        createDescriptifsObject($pdo, $produit);
        createImages($pdo, $produit);

        return $produit;
    }
    function createFamille($pdo, $nom_famille) {
        $request = "INSERT INTO `produit_famille` (`id_famille`, `nom_famille`) VALUES (NULL, :nom_famille)";
        $stmt = $pdo->prepare($request);
        $stmt->execute(array(':nom_famille'=>$nom_famille));
        return $pdo->lastInsertId();
    }
    function createCategorie($pdo, $nom_categorie, $id_famille) {
        $request = "INSERT INTO `produit_categorie` (`id_categorie`, `id_famille`, `nom_categorie`) VALUES (NULL, :id_famille, :nom_categorie)";
        $stmt = $pdo->prepare($request);
        $stmt->execute(array(':id_famille'=>$id_famille, ':nom_categorie'=>$nom_categorie));
        return $pdo->lastInsertId();
    }
    function createDescriptifs($pdo, $produit) {
        foreach ($produit->descriptifs as $key => $descriptif) {
            $request = "INSERT INTO `produit_descriptif` (`id_produit_descriptif`, `html`, `id_produit`, `index_descriptif`)";
            $request .= " VALUES (NULL, :html, :id_produit, :index_descriptif)";
            $stmt = $pdo->prepare($request);
            $stmt->execute(array(':html'=>$descriptif, ':id_produit'=>$produit->id_produit, ':index_descriptif'=>(intval($key)+1)));    
        }
    }
    function createDescriptifsObject($pdo, $produitObject) {
        foreach ($produitObject->descriptifs as $key => $descriptif) {
            $request = "INSERT INTO `produit_descriptif` (`id_produit_descriptif`, `html`, `titre`, `id_produit`, `index_descriptif`)";
            $request .= " VALUES (NULL, :html, :titre, :id_produit, :index_descriptif)";
            $stmt = $pdo->prepare($request);
            $stmt->execute(array(':html'=>$descriptif->html, ':titre'=>$descriptif->titre, ':id_produit'=>$produitObject->id_produit, ':index_descriptif'=>(intval($key)+1)));    
        }
    }
    function createImages($pdo, $produit) {
        foreach ($produit->images as $key => $image) {
            $request = "INSERT INTO `produit_image` (`id_image`, `image_url`, `display_size`, `id_produit`, `index_image`)";
            $request .= " VALUES (NULL, :image_url, :display_size, :id_produit, :index_image)";
            $stmt = $pdo->prepare($request);
            $stmt->execute(array(':image_url'=>$image->image_url, ':display_size'=>$image->display_size, ':id_produit'=>$produit->id_produit, ':index_image'=>(intval($key)+1)));    
        }
    }

    /* Update functions */
    function updateProduct($pdo, $produit) {

        // INSERT INTO `produit_categorie` (`id_categorie`, `nom_categorie`) VALUES (NULL, 'Portes de douche');
        $request = "UPDATE `produit` ";
        $request .= "SET id_famille=:id_famille, id_categorie=:id_categorie, marque=:marque, nom=:marque, ";
        $request .= "prix=:prix, thumb=:thumb, mise_en_page=:mise_en_page ";
        $request .= "WHERE id_produit=:id_produit";
        $stmt = $pdo->prepare($request);
        $stmt->execute(array(
            ':id_produit'=>$produit->id_produit,
            ':id_famille'=>$produit->id_famille,
            ':id_categorie'=>$produit->id_categorie,
            ':marque'=>$produit->marque,
            ':nom'=>$produit->nom,
            ':prix'=>$produit->prix,
            ':thumb'=>$produit->thumb,
            ':mise_en_page'=>$produit->mise_en_page
        ));

        updateDescriptifsObject($pdo, $produit);
        updateImages($pdo, $produit);

        return $produit;
    }
    function updateDescriptifsObject($pdo, $produitObject) {
        // foreach ($produitObject->descriptifs as $key => $descriptif) {
        //     $request = "INSERT INTO `produit_descriptif` (`id_produit_descriptif`, `html`, `titre`, `id_produit`, `index_descriptif`)";
        //     $request .= " VALUES (NULL, :html, :titre, :id_produit, :index_descriptif)";
        //     $stmt = $pdo->prepare($request);
        //     $stmt->execute(array(':html'=>$descriptif->html, ':titre'=>$descriptif->titre, ':id_produit'=>$produitObject->id_produit, ':index_descriptif'=>(intval($key)+1)));    
        // }
    }
    function updateImages($pdo, $produit) {
        // foreach ($produit->images as $key => $image) {
        //     $request = "INSERT INTO `produit_image` (`id_image`, `image_url`, `display_size`, `id_produit`, `index_image`)";
        //     $request .= " VALUES (NULL, :image_url, :display_size, :id_produit, :index_image)";
        //     $stmt = $pdo->prepare($request);
        //     $stmt->execute(array(':image_url'=>$image->image_url, ':display_size'=>$image->display_size, ':id_produit'=>$produit->id_produit, ':index_image'=>(intval($key)+1)));    
        // }
    }

    /* Read functions */
    function getAllProduits($pdo) {
        $liste_ids = [];
        $request = "SELECT produit.id_produit FROM produit";
        $stmt = $pdo->prepare($request);
        $stmt->execute(array());
        $result = $stmt->fetchAll();
        $produits = [];
        foreach ($result as $key => $value) {
            $produits[] = getProduitObject($pdo, $value['id_produit']);
        }
        return $produits;
    }

    function getFamillesAndCategories($pdo) {
        $liste_familles = [];
        $request = "SELECT * FROM produit_famille";
        $stmt = $pdo->prepare($request);
        $stmt->execute(array());
        $result = $stmt->fetchAll();
        foreach ($result as $key => $value) {
            $famille = [];
            $famille['id_famille'] = $value['id_famille'];
            $famille['nom_famille'] = $value['nom_famille'];
            $famille['liste_categories'] = [];
            $liste_familles[] = $famille;
        }
        $request = "SELECT * FROM produit_categorie ORDER BY id_famille, nom_categorie";
        $stmt = $pdo->prepare($request);
        $stmt->execute(array());
        $result = $stmt->fetchAll();
        foreach ($result as $key => $value) {
            $categorie = [];
            $categorie['id_categorie'] = $value['id_categorie'];
            $categorie['nom_categorie'] = $value['nom_categorie'];
            foreach ($liste_familles as $key_famille => $famille) {
                if ($famille['id_famille'] == $value['id_famille']) {
                    $liste_familles[$key_famille]['liste_categories'][] = $categorie;
                }
            }         
        }
        return $liste_familles;
    }
    
    function getProduitObject($pdo, $id_produit) {

        $produit = new Produit();
        
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
            
            $produit->id_produit = $result[0]['id_produit'];
            $produit->marque = $result[0]['marque'];
            $produit->nom = $result[0]['nom'];
            $produit->prix = $result[0]['prix'];
            $produit->thumb = $result[0]['thumb'];
            $produit->id_categorie = $result[0]['id_categorie'];
            $produit->nom_categorie = $result[0]['nom_categorie'];
            $produit->id_famille = $result[0]['id_famille'];
            $produit->nom_famille = $result[0]['nom_famille'];

        } else { /*throw error*/ }

        $produit->descriptifs = getProduitDescriptifs($pdo, $id_produit);
        $produit->images = getProduitImages($pdo, $id_produit);

        return $produit;

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
        $request .= "SELECT *";
        $request .= "FROM `produit_descriptif` ";
        $request .= "WHERE produit_descriptif.id_produit=:id ";
        $request .= "ORDER BY produit_descriptif.index_descriptif";

        $stmt = $pdo->prepare($request);
        $stmt->execute(array(':id'=>$id_produit));
        $count = $stmt->rowCount();
        $result = $stmt->fetchAll();

        $descriptifs = [];
        foreach ($result as $key => $value) {
            $descriptif = new DescriptifProduit();
            $descriptif->id_produit_descriptif = $value['id_produit_descriptif'];
            $descriptif->html = $value['html'];
            $descriptif->titre = $value['titre'];
            $descriptif->id_produit = $value['id_produit'];
            $descriptif->index_descriptif = $value['index_descriptif'];

            $descriptifs[] = $descriptif;
        }
        return $descriptifs;
    }

    function getProduitImages($pdo, $id_produit) {
        $request = "";
        $request .= "SELECT produit_image.image_url, produit_image.display_size ";
        $request .= "FROM `produit_image` ";
        $request .= "WHERE produit_image.id_produit=:id ";
        $request .= "ORDER BY produit_image.index_image";

        $stmt = $pdo->prepare($request);
        $stmt->execute(array(':id'=>$id_produit));
        $count = $stmt->rowCount();
        $result = $stmt->fetchAll();

        $images = [];
        foreach ($result as $key => $value) {
            $image_obj = new ImageDescriptifProduit();
            $image_obj->image_url = $value['image_url'];
            $image_obj->display_size = $value['display_size'];
            $images[] = $image_obj;
        }
        return $images;
    }





?>