<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Headers: Content-Type, X-Requested-With');
header('Access-Control-Allow-Methods: POST, GET, OPTIONS, DELETE, PUT');
header('Access-Control-Max-Age: 600');
header("Content-Type:application/json");
include_once "crud.php";



$produit = new Produit();
$produit->id_famille = 1;
$produit->id_categorie = 4;
$produit->marque = "Concerto ALTERNA";
$produit->nom = "Porte de douche coulissante";
$produit->prix = "";
$produit->thumb = "./img/produits/portesDouche_concertoAlterna_thumb.jpg";
$produit->descriptifs = [
    "<u>Version 2 vantaux :</u><br>1 panneau fixe et un panneau coulissant<br>Verre transparent 6mm<br>Profilé en aluminium<br>Hauteur 195cm<br>Dimensions disponibles :<br><ul><li>120 cm</li><li>140 cm</li></ul>",
    "<u>Version 3 vantaux :</u><br>1 panneau fixe et 2 panneaux coulissants<br>Verre transparent 6mm<br>Profilé en aluminium<br>Hauteur 195cm<br>Dimensions disponibles :<br><ul><li>90 cm</li></ul>"
];
$produit->images = [
    "img/produits/portesDouche_concertoAlterna_01.jpg",
    "img/produits/portesDouche_concertoAlterna_02.jpg"
];

$id = createProduct($pdo, $produit);
// echo json_encode((array)$prod);
$pdo = null; // fermeture de la connexion pdo

?>