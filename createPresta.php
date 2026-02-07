<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Headers: Content-Type, X-Requested-With');
header('Access-Control-Allow-Methods: POST, GET, OPTIONS, DELETE, PUT');
header('Access-Control-Max-Age: 600');
header("Content-Type:application/json");
include_once "crud.php";

$presta = new Produit();
$presta->id_famille = 1;
$presta->id_categorie = 4;
$presta->marque = "Concerto ALTERNA";
$presta->nom = "Porte de douche coulissante";
$presta->prix = "";
$presta->thumb = "./img/produits/portesDouche_concertoAlterna_thumb.jpg";
$presta->descriptifs = [
    "<u>Version 2 vantaux :</u><br>1 panneau fixe et un panneau coulissant<br>Verre transparent 6mm<br>Profilé en aluminium<br>Hauteur 195cm<br>Dimensions disponibles :<br><ul><li>120 cm</li><li>140 cm</li></ul>",
    "<u>Version 3 vantaux :</u><br>1 panneau fixe et 2 panneaux coulissants<br>Verre transparent 6mm<br>Profilé en aluminium<br>Hauteur 195cm<br>Dimensions disponibles :<br><ul><li>90 cm</li></ul>"
];
$presta->images = [
    "img/produits/portesDouche_concertoAlterna_01.jpg",
    "img/produits/portesDouche_concertoAlterna_02.jpg"
];

$id = createProduct($pdo, $presta);
// echo json_encode((array)$prod);
$pdo = null; // fermeture de la connexion pdo

?>