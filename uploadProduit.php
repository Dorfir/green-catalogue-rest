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
$produit->prix = $_POST['prix'];
$produit->thumb = "./img/produits/portesDouche_concertoAlterna_thumb.jpg";


$i = 0;
while (isset($_POST["desc_".$i])) {
    $descriptif = new DescriptifProduit();
    $descriptif->html = $_POST["desc_".$i];
    $descriptif->titre = $_POST["desc_titre_".$i];
    $produit->descriptifs[$i] = $descriptif;
    $i++;
}

$uploadDir = __DIR__ . '/uploads/';
if (!is_dir($uploadDir)) { mkdir($uploadDir, 0777, true); }

$i = 0;
while (isset($_FILES["file_image_".$i])) {
    $fileTmpPath = $_FILES["file_image_".$i]['tmp_name'];
    $fileExt = pathinfo($_FILES["file_image_".$i]['name'], PATHINFO_EXTENSION);
    $uniqueName = uniqid('img_', true) . '.' . $fileExt;
    $destPath = $uploadDir . $uniqueName;
    //todo test success move_uploaded_file
    move_uploaded_file($fileTmpPath, $destPath);
    // $produit->images[$i] = $uniqueName;
    $image_obj = new ImageDescriptifProduit();
    $image_obj->image_url = $uniqueName;
    if (isset($_POST['image_display_size_'.$i]))  $image_obj->display_size = $_POST['image_display_size_'.$i];
    $produit->images[$i] = $image_obj;
    $i++;
}

if (isset($_FILES["file_thumb"])) {
    $fileTmpPath = $_FILES["file_thumb"]['tmp_name'];
    $fileExt = pathinfo($_FILES["file_thumb"]['name'], PATHINFO_EXTENSION);
    $uniqueName = uniqid('thumb_', true) . '.' . $fileExt;
    $destPath = $uploadDir . $uniqueName;
    //todo test success move_uploaded_file
    move_uploaded_file($fileTmpPath, $destPath);
    $produit->thumb = $uniqueName;
}

$produit = createProduct($pdo, $produit);

    

$json = [];
// $json['id_produit'] = 12;
$json['id_produit'] = $produit->id_produit;
$json['id_famille'] = $produit->id_famille;
$json['nom_famille'] = $produit->nom_famille;
$json['nom'] = $produit->nom;
$json['marque'] = $produit->marque;
$json['prix'] = $produit->prix;
$json['thumb'] = $produit->thumb;
$json['mise_en_page'] = $produit->mise_en_page;

$json['descriptifs'] = [];
foreach ($produit->descriptifs as $desc) {
    $json['descriptifs'][] = (array)$desc;
}
$json['images'] = $produit->images;


// echo json_encode((array)$produit);
echo json_encode($json);

// $result = [];
// $result['status'] = "ok";
// echo json_encode($result);

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