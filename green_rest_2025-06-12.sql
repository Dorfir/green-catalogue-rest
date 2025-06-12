-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 12 juin 2025 à 08:32
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `green_rest`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `nom`, `email`, `password`) VALUES
(1, 'Dorfir', 'greendorfir@gmail.com', 'coco'),
(2, 'Karlath', 'karlath@gmail.com', 'coco');

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `id_produit` int(11) NOT NULL,
  `id_famille` int(11) NOT NULL,
  `id_categorie` int(11) NOT NULL,
  `marque` varchar(500) NOT NULL,
  `nom` varchar(500) NOT NULL,
  `prix` varchar(100) NOT NULL,
  `thumb` varchar(1000) NOT NULL,
  `mise_en_page` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id_produit`, `id_famille`, `id_categorie`, `marque`, `nom`, `prix`, `thumb`, `mise_en_page`) VALUES
(1, 1, 1, 'Aurora NOVELLI', 'Pare-bain droit', '', './img/produits/pareBain_aurora_thumb.jpg', 0),
(2, 1, 2, 'Stepin SANINDUSA', 'Receveur de douche céramique antidérapant', '', './img/produits/receveurs_stepinSanindusa_thumb.jpg', 0),
(3, 1, 2, 'Flight JACOB DELAFON', 'Receveur de douche acrylique', '', './img/produits/receveurs_flightJacobDelafon_thumb.jpg', 0),
(4, 1, 3, 'Concerto Walk ALTERNA', 'Paroi de douche fixe', '', './img/produits/paroisDouche_concertoWalkAlterna_thumb.jpg', 0),
(5, 1, 3, 'Zephyros NOVELLINI', 'Paroi de douche fixe', '', './img/produits/paroisDouche_zephyrosNovellini_thumb.jpg', 0),
(6, 1, 4, 'Concerto ALTERNA', 'Porte de douche coulissante', '', './img/produits/portesDouche_concertoAlterna_thumb.jpg', 0),
(7, 1, 4, 'Domino ALTERNA', 'Porte de douche pivotante', '', './img/produits/portesDouche_dominoAlterna_thumb.jpg', 0),
(8, 1, 4, 'Concerto ALTERNA', 'Porte de douche d\'angle - retour fixe', '', './img/produits/portesDouche_concertoAlternaAngle_thumb.jpg', 0),
(9, 1, 4, 'Zephyros NOVELLI', 'Porte de douche coulissante avec 1 fixe', '', './img/produits/portesDouche_zephyrosNovellini_thumb.jpg', 0),
(10, 1, 5, 'Concerto 4 ALTERNA', 'Colonne de douche', '', './img/produits/colonneDouche_concerto4Alterna_thumb.jpg', 0),
(11, 1, 5, 'Domino ALTERNA', 'Colonne de douche', '', './img/produits/colonneDouche_dominoAlterna_thumb.jpg', 0),
(12, 1, 5, 'Strayt JACOB DELAFON', 'Colonne de douche', '', './img/produits/colonneDouche_straytJacobDelafon_thumb.jpg', 0),
(13, 1, 6, 'Urby SANINDUSA', 'WC suspendu sur bati support', '', './img/produits/wc_urbySanindusa_thumb.jpg', 0),
(14, 1, 7, 'Piccolo ALTERNA', '', '', './img/produits/laveMain_piccoloAlterna_thumb.jpg', 0),
(15, 2, 8, 'Basis BFG 611-97 FRANKE', '', '', './img/produits/evier_basisBFGFranke_thumb.jpg', 0),
(16, 3, 10, 'Porte Coulissante', 'Porte coullisante en applique', '', './img/produits/porteCoulissante_ba_thumb.jpg', 0),
(17, 3, 11, 'Porte SRIGNO', 'Porte à galandage de type SRIGNO', '', './img/produits/porteGalandage_ba_thumb.jpg', 0),
(18, 3, 12, 'Placard Miroir', 'Façades de placard miroir (portes coulissantes)', '', './img/produits/facadePlacard_ba_thumb.jpg', 0),
(19, 3, 13, 'Etagères en chêne', 'Etagères en chêne avec fixations invisibles', '', './img/produits/etageres_chene_thumb.jpg', 0),
(20, 3, 13, 'Etagères en malaminé', 'Etagères en mélaminé blanc posées sur taquets', '', './img/produits/etageres_melamine_thumb.jpg', 0);

-- --------------------------------------------------------

--
-- Structure de la table `produit_categorie`
--

CREATE TABLE `produit_categorie` (
  `id_categorie` int(11) NOT NULL,
  `id_famille` int(11) NOT NULL,
  `nom_categorie` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `produit_categorie`
--

INSERT INTO `produit_categorie` (`id_categorie`, `id_famille`, `nom_categorie`) VALUES
(1, 1, 'Pare-bain'),
(2, 1, 'Receveurs'),
(3, 1, 'Parois de douche'),
(4, 1, 'Portes de douche'),
(5, 1, 'Colonnes de douche'),
(6, 1, 'WC suspendu'),
(7, 1, 'Lave main'),
(8, 2, 'Eviers'),
(9, 2, 'Plan de travail'),
(10, 3, 'Porte coulissante'),
(11, 3, 'Porte à galandage'),
(12, 3, 'Facades Placard Miroir'),
(13, 3, 'Etagères');

-- --------------------------------------------------------

--
-- Structure de la table `produit_descriptif`
--

CREATE TABLE `produit_descriptif` (
  `id_produit_descriptif` int(11) NOT NULL,
  `html` varchar(3000) NOT NULL,
  `id_produit` int(11) NOT NULL,
  `index_descriptif` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `produit_descriptif`
--

INSERT INTO `produit_descriptif` (`id_produit_descriptif`, `html`, `id_produit`, `index_descriptif`) VALUES
(1, 'Verre traité anticalcaire,<br>Epaisseur 6mm.<br><br>Pivotant à 180°.<br>', 1, 1),
(2, 'Dimensions disponibles:<br><ul><li>70x120/140 cm</li><li>80x80/100/120/140 cm</li><li>90x90/120/140 cm</li></ul>', 2, 1),
(4, 'Dimensions disponibles:<br><ul><li>70x170 cm</li><li>76x170 cm</li><li>90x170 cm</li></ul>', 3, 1),
(5, 'Verre de sécurité transparent 6mm<br>Traitement anticalcaire<br>Profilé en aluminium anosidé résistant aux rayures<br>Bras de fixation<br>Hauteur 200cm.<br><br>Dimensions disponibles :<ul><li>70 cm</li><li>80 cm</li><li>90 cm</li><li>100 cm</li><li>120 cm</li><li>140 cm</li></ul>', 4, 1),
(6, 'Verre de sécurité transparent 6mm<br>Traitement anticalcaire<br>Profilé en aluminium anosidé résistant aux rayures<br>Bras de fixation<br>Hauteur 200cm.<br><br>Dimensions disponibles :<ul><li>70 cm</li><li>80 cm</li><li>90 cm</li><li>100 cm</li><li>120 cm</li><li>140 cm</li></ul>', 5, 1),
(7, 'Verre de sécurité transparent 6mm<br>Traitement anticalcaire<br>Profilé en aluminium anosidé résistant aux rayures<br>Bras de fixation<br>Hauteur 200cm.<br><br>Dimensions disponibles :<ul><li>70 cm</li><li>80 cm</li><li>90 cm</li><li>100 cm</li><li>120 cm</li><li>140 cm</li></ul>', 5, 1),
(9, '<u>Version 2 vantaux :</u><br>1 panneau fixe et un panneau coulissant<br>Verre transparent 6mm<br>Profilé en aluminium<br>Hauteur 195cm<br>Dimensions disponibles :<br><ul><li>120 cm</li><li>140 cm</li></ul>', 6, 1),
(10, '<u>Version 3 vantaux :</u><br>1 panneau fixe et 2 panneaux coulissants<br>Verre transparent 6mm<br>Profilé en aluminium<br>Hauteur 195cm<br>Dimensions disponibles :<br><ul><li>90 cm</li></ul>', 6, 2),
(11, 'Verre transparent securit 8mm<br>Profilé en argent brillant, en aluminium anodisé résistant aux rayures<br>Traité anti calcaire<br>Pivot total intérieur et extérieur<br>Fermeture par joint magnétique<br>Hauteur 195cm<br>Dimensions disponibles :<br><ul><li>90 cm</li><li>120 cm (fixe 55cm + pivot)</li></ul>', 7, 1),
(13, 'Verre transparent securit 8mm<br>Porte à ouverture coulissante<br>Profilé en argent brillant, en aluminium anodisé résistant aux rayures<br>Traité anti calcaire<br>Hauteur 195cm<br>Dimensions disponibles :<br><ul><li>70 cm</li><li>80 cm</li><li>90 cm</li><li>100 cm</li></ul>', 8, 1),
(15, 'Verre trempé transparent securit 6mm<br>Porte à ouverture coulissante<br><br>Profilé noir mat<br>Poignée métal<br>Anti-calcaire<br>Coulissant sur roulettes à billes<br><br>Dimensions disponibles<br><ul><li>120 cm</li><li>140 cm</li><li>170 cm</li></ul><br>Les deux modèles peuvent être associés à la <b>paroi fixe ZEPHYROS</b>', 9, 1),
(16, '<b>Porte de douche pivotante</b><br><br>Verre trempé transparent securit 6mm<br>Porte à ouverture pivotante<br><br>Profilé noir mat<br>Poignée métal noir<br>Anti-calcaire<br>Réversible<br>Silencieux<br><br>Dimensions disponibles<br><ul><li>80 cm</li><li>90 cm</li></ul>', 9, 2),
(17, 'Mitigeur thermostatique chromé<br>Butée de sécurité anti brûlure 38°C<br>Colonne réglable en hauteur<br>Flexible PVC 150cm<br>Douchette à main 5 jets, diamètre 10cm<br>Douche de tête diamètre 25cm', 10, 1),
(18, 'Mitigeur thermostatique avec plage de pose<br>Sécurité anti brûlure réglée à 38°C<br>Fixation réglable en hauteur<br>Douche de tête en inox 30x30cm, épaisseur 4mm, picots anticalcaires<br>Douchette à main carrée 1 jet, picots anticalcaire<br>Flexible de douche PVC renforcé argent brillant 150cm', 11, 1),
(19, 'Douche de tête carrée L.250mm, en métal, sur rotule<br>Mitigeur thermostatique avec butée de sécurité à 38°C et blocage température maxi à 50°C<br>Inverseur sur poignée de débit<br>Coulisseau-support de douchette à main, en métal, orientable<br>Flexible lisse anti-torsion L 1.60M<br>Douchette à main cubique 2 jets<br>Poignées ergonomiques en métal', 12, 1),
(20, 'Cuvette suspendue en céramique<br>Abattant avec frein chute<br>Plaque blanche<br>Fixations invisibles', 13, 1),
(21, '<ul><li>Lave-mains en céramique, blanc</li><li>Percée 1 trou de robinetterie</li><li>Robinetterie à gauche, non réversible</li><li>Meuble une porte en mélaminé 16mm finition laquée</li><li>Profondeur de la cuve : 23.5cm</li></ul>', 14, 1),
(22, 'Evier Fragranit (résistant et hygiénique)<br>1 cuve avec égouttoir<br>Résiste jusqu\'à 280°C<br><br>Coloris disponibles: <br>Onyx, blanc polaire, platinium, stone<br><br>Y compris mitigeur Brive JACOB DELAFON', 15, 1),
(23, 'Dimension disponible :<br><ul><li>80cm</li></ul>', 16, 1),
(24, 'Dimension disponible :<br><ul><li>80cm</li><li>90cm</li></ul>', 17, 1),
(25, '', 18, 1),
(26, 'Largeur entre 30 et 50cm, profondeur 50cm maximum<br><br>A l\'unité', 19, 1),
(27, 'Largeur entre 30 et 50cm<br><br>A l\'unité', 20, 1);

-- --------------------------------------------------------

--
-- Structure de la table `produit_famille`
--

CREATE TABLE `produit_famille` (
  `id_famille` int(11) NOT NULL,
  `nom_famille` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `produit_famille`
--

INSERT INTO `produit_famille` (`id_famille`, `nom_famille`) VALUES
(1, 'Salle de bain / WC'),
(2, 'Cuisine'),
(3, 'Menuiseries');

-- --------------------------------------------------------

--
-- Structure de la table `produit_image`
--

CREATE TABLE `produit_image` (
  `id_image` int(11) NOT NULL,
  `image_url` varchar(400) NOT NULL,
  `id_produit` int(11) NOT NULL,
  `index_image` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `produit_image`
--

INSERT INTO `produit_image` (`id_image`, `image_url`, `id_produit`, `index_image`) VALUES
(1, 'img/produits/pareBain_aurora.jpg', 1, 1),
(2, 'img/produits/receveurs_stepinSanindusa.jpg', 2, 1),
(3, 'img/produits/receveurs_stepinSanindusa.jpg', 2, 2),
(4, 'img/produits/receveurs_flightJacobDelafon.jpg', 3, 1),
(5, 'img/produits/paroisDouche_concertoWalkAlterna.jpg', 4, 1),
(6, 'img/produits/paroisDouche_zephyrosNovellini_01.jpg', 5, 1),
(7, 'img/produits/paroisDouche_zephyrosNovellini_02.jpg', 5, 2),
(8, 'img/produits/portesDouche_concertoAlterna_01.jpg', 6, 1),
(9, 'img/produits/portesDouche_concertoAlterna_02.jpg', 6, 2),
(10, 'img/produits/portesDouche_dominoAlterna_01.jpg', 7, 1),
(11, 'img/produits/portesDouche_dominoAlterna_02.jpg', 7, 2),
(12, 'img/produits/portesDouche_concertoAlternaAngle.jpg', 8, 1),
(14, 'img/produits/portesDouche_zephyrosNovellini_01.jpg', 9, 1),
(15, 'img/produits/portesDouche_zephyrosNovellini_02.jpg', 9, 2),
(16, 'img/produits/colonneDouche_concerto4Alterna.jpg', 10, 1),
(17, 'img/produits/colonneDouche_dominoAlterna.jpg', 11, 1),
(18, 'img/produits/colonneDouche_straytJacobDelafon.jpg', 12, 1),
(19, 'img/produits/wc_urbySanindusa.jpg', 13, 1),
(20, 'img/produits/laveMain_piccoloAlterna_01.jpg', 14, 1),
(21, 'img/produits/laveMain_piccoloAlterna_02.jpg', 14, 2),
(22, 'img/produits/evier_basisBFGFranke_01.jpg', 15, 1),
(23, 'img/produits/evier_basisBFGFranke_02.jpg', 15, 2),
(24, 'img/produits/evier_basisBFGFranke_03.jpg', 15, 3),
(20, 'img/produits/porteCoulissante_ba.jpg', 16, 1),
(20, 'img/produits/porteGalandage_ba.jpg', 17, 1),
(20, 'img/produits/facadePlacard_ba.jpg', 18, 1),
(20, 'img/produits/etageres_chene.jpg', 19, 1),
(20, 'img/produits/etageres_melamine.jpg', 20, 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id_produit`),
  ADD KEY `fk_produit_famille` (`id_famille`),
  ADD KEY `fk_produit_categorie` (`id_categorie`);

--
-- Index pour la table `produit_categorie`
--
ALTER TABLE `produit_categorie`
  ADD PRIMARY KEY (`id_categorie`);

--
-- Index pour la table `produit_descriptif`
--
ALTER TABLE `produit_descriptif`
  ADD PRIMARY KEY (`id_produit_descriptif`);

--
-- Index pour la table `produit_famille`
--
ALTER TABLE `produit_famille`
  ADD PRIMARY KEY (`id_famille`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
