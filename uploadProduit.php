<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Headers: Content-Type, X-Requested-With');
header('Access-Control-Allow-Methods: POST, GET, OPTIONS, DELETE, PUT');
header('Access-Control-Max-Age: 600');
header("Content-Type:application/json");
include_once "crud.php";

$produit = new Produit();




$produit->id_famille = intval($_POST['id_famille']);
$produit->id_categorie = intval($_POST['id_categorie']);
$produit->marque = $_POST['marque'];
$produit->nom = $_POST['nom'];
$produit->prix = "";
$produit->thumb = "./img/produits/portesDouche_concertoAlterna_thumb.jpg";

$i = 0;
while (isset($_POST["desc_".$i])) {
    $produit->descriptifs[$i] = $_POST["desc_".$i];
    $i++;
}

$uploadDir = __DIR__ . '/uploads/';
if (!is_dir($uploadDir)) {
    mkdir($uploadDir, 0777, true);
}

$i = 0;
while (isset($_FILES["file_image_".$i])) {
    $fileTmpPath = $_FILES["file_image_".$i]['tmp_name'];
    $fileExt = pathinfo($_FILES["file_image_".$i]['name'], PATHINFO_EXTENSION);
    $uniqueName = uniqid('img_', true) . '.' . $fileExt;
    $destPath = $uploadDir . $uniqueName;

    //todo test success move_uploaded_file
    move_uploaded_file($fileTmpPath, $destPath);

    $produit->images[$i] = $uniqueName;
    $i++;
}

$produit->id_produit = createProduct($pdo, $produit);

echo json_encode((array)$produit);

$pdo = null; // fermeture de la connexion pdo


// $produit->descriptifs = [
//     "<u>Version 2 vantaux :</u><br>1 panneau fixe et un panneau coulissant<br>Verre transparent 6mm<br>Profilé en aluminium<br>Hauteur 195cm<br>Dimensions disponibles :<br><ul><li>120 cm</li><li>140 cm</li></ul>",
//     "<u>Version 3 vantaux :</u><br>1 panneau fixe et 2 panneaux coulissants<br>Verre transparent 6mm<br>Profilé en aluminium<br>Hauteur 195cm<br>Dimensions disponibles :<br><ul><li>90 cm</li></ul>"
// ];
// $produit->images = [
//     "img/produits/portesDouche_concertoAlterna_01.jpg",
//     "img/produits/portesDouche_concertoAlterna_02.jpg"
// ];

// $id = createProduct($pdo, $produit);
// echo json_encode((array)$prod);
// $pdo = null; // fermeture de la connexion pdo

?>