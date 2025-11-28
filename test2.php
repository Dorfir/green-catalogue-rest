<?php

class User {
    public $nom = "";
    public $prenom = "";
    public $fiche = null;
}

class Fiche {
    public $id_fiche = 0;
    public $titre_fiche = "";
}

$user1 = new User();
$user1->nom = "toto";
$user1->prenom = "bouya";

$fiche1 = new Fiche();
$fiche1->id_fiche = 1;
$fiche1->titre_fiche = "premiere fiche";

$user1->fiche = $fiche1;

echo "<pre>";
var_dump($user1);

echo "</pre>";

?>