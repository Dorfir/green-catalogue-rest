<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Headers: Content-Type, X-Requested-With');
header('Access-Control-Allow-Methods: POST, GET, OPTIONS, DELETE, PUT');
header('Access-Control-Max-Age: 600');
header("Content-Type:application/json");
include_once "crud.php";

$presta = new Produit();

$presta->nom_presta = $_POST['nom_presta'];
$presta->index_presta = intval($_POST['index_presta']);
$presta->id_famille = intval($_POST['id_famille']);
$presta->article = $_POST['article'];

$uploadDir = __DIR__ . '/uploads/';
if (!is_dir($uploadDir)) { mkdir($uploadDir, 0777, true); }

$i = 0;
while (isset($_POST["desc_id_presta_descriptif_".$i])) {
    $descriptif = new PrestaDescriptif();
    $descriptif->html = $_POST["desc_html_".$i];
    $descriptif->index_descriptif = $i + 1;

    // TODO cas ou pas d'image_data ni image_url
    if ($_POST["desc_image_modified_".$i] == "true") {
        if (isset($_FILES['file_image_'.$i])) {
            $fileTmpPath = $_FILES["file_image_".$i]['tmp_name'];
            $fileExt = pathinfo($_FILES["file_image_".$i]['name'], PATHINFO_EXTENSION);
            $uniqueName = 'presta/' .  uniqid('img_', true) . '.' . $fileExt;
            $destPath = $uploadDir . $uniqueName;
            //TODO test success move_uploaded_file
            move_uploaded_file($fileTmpPath, $destPath);
            $descriptif->image_url = $uniqueName;
        } else {
            $descriptif->image_url = "erreur no isset FILES";
        }
    } else {
        $descriptif->image_url = $_POST["desc_image_url_".$i];
    }
    $descriptif->image_display = $_POST["desc_image_display_".$i];

    $presta->descriptifs[$i] = $descriptif;
    $i++;
}

// $presta->id_presta = createPresta($pdo, $presta);
$updated_presta = $presta;

    

$json = [];
// $json['id_presta'] = $updated_presta->id_presta;
$json['id_famille'] = $updated_presta->id_famille;
$json['nom_famille'] = $updated_presta->nom_famille;
$json['nom_presta'] = $updated_presta->nom_presta;
$json['article'] = $updated_presta->article;
$json['index_presta'] = $updated_presta->index_presta;
$json['mise_en_page'] = $updated_presta->mise_en_page;

$json['descriptifs'] = [];
foreach ($updated_presta->descriptifs as $desc) {
    $json['descriptifs'][] = (array)$desc;
}


echo json_encode($json);


$pdo = null; // fermeture de la connexion pdo


// $id = createProduct($pdo, $presta);
// // echo json_encode((array)$prod);
// $pdo = null; // fermeture de la connexion pdo

?>