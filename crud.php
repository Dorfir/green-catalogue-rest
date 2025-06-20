<?php
    // header('Access-Control-Allow-Origin: *');
    // header('Access-Control-Allow-Headers: Content-Type, X-Requested-With');
    // header('Access-Control-Allow-Methods: POST, GET, OPTIONS, DELETE, PUT');
    // header('Access-Control-Max-Age: 600');
    // header("Content-Type:application/json");

    /* Database connection */
    $dsn = 'mysql:host=localhost;dbname=green_rest';
    // $dsn = 'mysql:host=myshowronaurbis3.mysql.db;dbname=myshowronaurbis3';
    $username = 'root';
    $password = '';
    // $username = 'technique';
    // $password = 'M@joclub31';
    // $username = 'myshowronaurbis3';
    // $password = 'Az8tYuv45lMp';
    
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
        public $descriptifs = [];
        public $marque = "";
        public $nom = "";
        public $prix = null;
        public $thumb = "";
        public $images = [];
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

    /* Execution */
    // getAllProduits($pdo);

    // const produits_portesDouche = [
    //     {   
    //         famille: "Sanitaires",
    //         categorie: "Portes de douche",
    //         marque: "Concerto ALTERNA",
    //         nom : "Porte de douche coulissante",
    //         descriptifs : [
    //             `
    //             <u>Version 2 vantaux :</u><br>
    //             1 panneau fixe et un panneau coulissant<br>
    //             Verre transparent 6mm<br>
    //             Profilé en aluminium<br>
    //             Hauteur 195cm<br>
    //             Dimensions disponibles :<br>
    //             <ul>
    //                 <li>120 cm</li>
    //                 <li>140 cm</li>
    //             </ul>
    //             `,
    //             `
    //             <u>Version 3 vantaux :</u><br>
    //             1 panneau fixe et 2 panneaux coulissants<br>
    //             Verre transparent 6mm<br>
    //             Profilé en aluminium<br>
    //             Hauteur 195cm<br>
    //             Dimensions disponibles :<br>
    //             <ul>
    //                 <li>90 cm</li>
    //             </ul>
    //             `  
    //         ],
    //         prix : null,
    //         images : ["img/produits/portesDouche_concertoAlterna_01.jpg", "img/produits/portesDouche_concertoAlterna_02.jpg"],
    //         thumb : "./img/produits/portesDouche_concertoAlterna_thumb.jpg",
    //     },
    //     {   
    //         famille: "sanitaires",
    //         categorie: "Portes de douche",
    //         marque: "Domino ALTERNA",
    //         nom : "Porte de douche pivotante",
    //         descriptifs : [
    //             `
    //             Verre transparent securit 8mm<br>
    //             Profilé en argent brillant, en aluminium anodisé résistant aux rayures<br>
    //             Traité anti calcaire<br>
    //             Pivot total intérieur et extérieur<br>
    //             Fermeture par joint magnétique<br>
    //             Hauteur 195 cm<br>
    //             Dimensions disponibles :<br>
    //             <ul>
    //                 <li>90 cm</li>
    //                 <li>120 cm (fixe 55 cm + pivot)</li>
    //             </ul>
    //             `,
    //         ],
    //         prix : null,
    //         images : ["img/produits/portesDouche_dominoAlterna_01.jpg", "img/produits/portesDouche_dominoAlterna_02.jpg"],
    //         thumb : "./img/produits/portesDouche_dominoAlterna_thumb.jpg",
    //     },
    //     {   
    //         famille: "sanitaires",
    //         categorie: "Portes de douche",
    //         marque: "Concerto ALTERNA",
    //         nom : "Porte de douche d'angle - retour fixe",
    //         descriptifs : [
    //             `
    //             Verre transparent securit 8mm<br>
    //             Porte à ouverture coulissante<br>
    //             <br>
    //             Profilé en argent brillant, en aluminium anodisé résistant aux rayures<br>
    //             Traité anti calcaire<br>
    //             Hauteur 195 cm<br>
    //             <br>
    //             Dimensions disponibles :<br>
    //             <ul>
    //                 <li>70 cm</li>
    //                 <li>80 cm</li>
    //                 <li>90 cm</li>
    //                 <li>100 cm</li>
    //             </ul>
    //             `,
    //         ],
    //         prix : null,
    //         images : ["img/produits/portesDouche_concertoAlternaAngle.jpg"],
    //         thumb : "./img/produits/portesDouche_concertoAlternaAngle_thumb.jpg",
    //     },
    // ]
 
/*
    // $produit = new Produit();
    // $produit->id_famille = 1;
    // $produit->id_categorie = 4;
    // $produit->marque = "Concerto ALTERNA";
    // $produit->nom = "Porte de douche coulissante";
    // $produit->prix = "";
    // $produit->thumb = "./img/produits/portesDouche_concertoAlterna_thumb.jpg";
    // $produit->descriptifs = [
    //     "<u>Version 2 vantaux :</u><br>1 panneau fixe et un panneau coulissant<br>Verre transparent 6mm<br>Profilé en aluminium<br>Hauteur 195cm<br>Dimensions disponibles :<br><ul><li>120 cm</li><li>140 cm</li></ul>",
    //     "<u>Version 3 vantaux :</u><br>1 panneau fixe et 2 panneaux coulissants<br>Verre transparent 6mm<br>Profilé en aluminium<br>Hauteur 195cm<br>Dimensions disponibles :<br><ul><li>90 cm</li></ul>"
    // ];
    // $produit->images = [
    //     "img/produits/portesDouche_concertoAlterna_01.jpg",
    //     "img/produits/portesDouche_concertoAlterna_02.jpg"
    // ];
    // $produit = createProduct($pdo, $produit);

    // $prod = getProduit($pdo, 2);
    // echo json_encode((array)$produit);
    // $pdo = null; // fermeture de la connexion pdo
*/

    /* Create functions */
    function createProduct($pdo, $produit) {

        // INSERT INTO `produit_categorie` (`id_categorie`, `nom_categorie`) VALUES (NULL, 'Portes de douche');
        $request = "INSERT INTO `produit` ";
        $request .= "(`id_produit`, `id_famille`, `id_categorie`, `marque`, `nom`, `prix`, `thumb`)";
        $request .= " VALUES (NULL, :id_famille, :id_categorie, :marque, :nom, :prix, :thumb)";
        $stmt = $pdo->prepare($request);
        $stmt->execute(array(
            ':id_famille'=>$produit->id_famille,
            ':id_categorie'=>$produit->id_categorie,
            ':marque'=>$produit->marque,
            ':nom'=>$produit->nom,
            ':prix'=>$produit->prix,
            ':thumb'=>$produit->thumb
        ));
        $produit->id_produit = $pdo->lastInsertId();

        createDescriptifs($pdo, $produit);
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
    function createImages($pdo, $produit) {
        foreach ($produit->images as $key => $image) {
            $request = "INSERT INTO `produit_image` (`id_image`, `image_url`, `id_produit`, `index_image`)";
            $request .= " VALUES (NULL, :image_url, :id_produit, :index_image)";
            $stmt = $pdo->prepare($request);
            $stmt->execute(array(':image_url'=>$image, ':id_produit'=>$produit->id_produit, ':index_image'=>(intval($key)+1)));    
        }
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