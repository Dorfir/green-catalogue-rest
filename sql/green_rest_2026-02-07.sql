-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 07 fév. 2026 à 15:45
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
-- Structure de la table `presta`
--

CREATE TABLE `presta` (
  `id_presta` int(11) NOT NULL,
  `id_famille` int(11) NOT NULL,
  `nom_presta` varchar(500) NOT NULL,
  `index_presta` int(11) NOT NULL,
  `article` varchar(5000) NOT NULL,
  `contractuel` varchar(500) NOT NULL,
  `mise_en_page` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `presta`
--

INSERT INTO `presta` (`id_presta`, `id_famille`, `nom_presta`, `index_presta`, `article`, `contractuel`, `mise_en_page`) VALUES
(1, 1, 'Salle de bains T2 & T4', 1, 'LES PRESTATIONS INCLUSES *<br><br>\r\n      Meubles avec tiroirs recouvert d\'une vasque en résine intégrée<br>\r\n      Robinetterie mitigeuse équipée de double butée<br>\r\n      Grand miroir rétroclairé par LED<br>\r\n      Emplacement machine à laver le linge (jusqu\'au T3 inclus)<br>\r\n      Lave-linge fourni (jusqu\'au T3 inclus)<br>\r\n      Baignoire en acier émaillé avec douchette, flexible, barre de douche et robinet mitigeur<br>\r\n      Radiateur sèche serviette<br>\r\n      WC avec cuvette céramique et abattant double avec frein de chute, réservoir avec chasse 3/6 l\'économiseur d\'eau (inclus dans les SDB pour les T2)<br>\r\n      WC séparé à partir des T3<br>', '* Photos non contractuelles - Équipements de série ou équivalent', 1),
(2, 1, 'Baignoire', 2, '', '* Photos non contractuelles - Équipements de série ou équivalent', 1),
(3, 1, 'Meuble vasque', 3, '', '* Photos non contractuelles - Équipements de série ou équivalent', 1),
(4, 1, 'Lave linge', 4, '', '* Photos non contractuelles - Équipements de série ou équivalent', 1),
(5, 1, 'Robinetterie', 5, '', '* Photos non contractuelles - Équipements de série ou équivalent', 1),
(6, 1, 'Sèche-serviette', 6, '', '* Photos non contractuelles - Équipements de série ou équivalent', 1),
(7, 1, 'WC', 7, '', '* Photos non contractuelles - Équipements de série ou équivalent', 1),
(8, 2, 'Cuisine T2 & T3', 1, 'LES PRESTATIONS INCLUSES *<br><br>\r\n      Meubles bas avec étagères<br>\r\n      Plan de travail hydrofuge de couleur bois<br>\r\n      Plaque de cuisson vitrocéramique encastrée : 2 feux pour les T1-T2, 3 feux pour les T3<br>\r\n      Hotte aspirante intégrée<br>\r\n      Évier avec égouttoir (inox) encastré<br>\r\n      Robinet mitigeur avec double butée économique<br>\r\n      Meubles hauts avec étagères<br>\r\n      Emplacement pour four et micro-ondes<br>\r\n      Emplacement pour réfrigérateur<br>\r\n      Réfrigérateur fourni : Tabel Top pour les T1-T2, Réfrigérateur-Congélateur pour les T3<br>\r\n      Arrivées et évacuations pour lave-vaisselle<br><br>', '* Photos non contractuelles - Équipements de série ou équivalent', 1),
(9, 2, 'Cuisine T2', 2, '', '* Photos non contractuelles - Équipements de série ou équivalent', 1),
(10, 2, 'Cuisine T3', 3, '', '* Photos non contractuelles - Équipements de série ou équivalent', 1),
(11, 2, 'Electroménager', 4, '', '* Photos non contractuelles - Équipements de série ou équivalent', 1),
(12, 2, 'Robinetterie', 5, '', '* Photos non contractuelles - Équipements de série ou équivalent', 1),
(13, 3, 'Prestations intérieures', 1, 'Tous nos logements sont équipés de la solution GreenCity Connect et profitent d\'une box connectées intégrée au tableau éléectrique<br>\r\n      Depuis votre smartphone, votre tablette ou votre ordinateur, grâce à une application simple et intuitive, vous commandez à distance et\r\n      programmez les équipements connectés inclus de votre logement : le chauffage, l\'alarme anti-intrusion et les volets roulants\r\n      électriques dans les T4 et T5.<br>\r\n      <br>\r\n      (sous réserve d\'abonnement internet à la charge du client)\r\n      <br>', '* Photos non contractuelles - Équipements de série ou équivalent', 1),
(14, 3, 'Prestations intérieures', 2, '', '* Photos non contractuelles - Équipements de série ou équivalent', 1),
(15, 3, 'Fenêtres', 3, '', '* Photos non contractuelles - Équipements de série ou équivalent', 1),
(16, 3, 'Portes', 4, '', '* Photos non contractuelles - Équipements de série ou équivalent', 1),
(17, 3, 'Placards', 5, '', '* Photos non contractuelles - Équipements de série ou équivalent', 1),
(18, 4, 'Aération', 1, '', '* Photos non contractuelles - Équipements de série ou équivalent', 1),
(19, 4, 'Alarme', 2, '', '* Photos non contractuelles - Équipements de série ou équivalent', 1),
(20, 4, 'Arrivées d\'eau', 3, '', '* Photos non contractuelles - Équipements de série ou équivalent', 1),
(21, 4, 'Ballon thermodynamique', 4, '', '* Photos non contractuelles - Équipements de série ou équivalent', 1),
(22, 4, 'Bouche VMC', 5, '', '* Photos non contractuelles - Équipements de série ou équivalent', 1),
(23, 4, 'Chaudière', 6, '', '* Photos non contractuelles - Équipements de série ou équivalent', 1),
(24, 4, 'Climatisation', 7, '', '* Photos non contractuelles - Équipements de série ou équivalent', 1),
(25, 4, 'Compteur d\'eau', 8, '', '* Photos non contractuelles - Équipements de série ou équivalent', 1),
(26, 4, 'Évacuations', 9, '', '* Photos non contractuelles - Équipements de série ou équivalent', 1),
(27, 4, 'Green connect', 10, '', '* Photos non contractuelles - Équipements de série ou équivalent', 1),
(28, 4, 'Interrupteurs', 11, '', '* Photos non contractuelles - Équipements de série ou équivalent', 1),
(29, 4, 'Nourrices', 12, '', '* Photos non contractuelles - Équipements de série ou équivalent', 1),
(30, 4, 'Points lumineux', 13, '', '* Photos non contractuelles - Équipements de série ou équivalent', 1),
(31, 4, 'Prises', 14, '', '* Photos non contractuelles - Équipements de série ou équivalent', 1),
(32, 4, 'Radiateurs', 15, '', '* Photos non contractuelles - Équipements de série ou équivalent', 1),
(33, 4, 'Robinet extérieur', 16, '', '* Photos non contractuelles - Équipements de série ou équivalent', 1),
(34, 4, 'Tableau électrique', 17, '', '* Photos non contractuelles - Équipements de série ou équivalent', 1),
(35, 4, 'Terrasse bois', 18, '', '* Photos non contractuelles - Équipements de série ou équivalent', 1),
(36, 4, 'Thermostat', 19, '', '* Photos non contractuelles - Équipements de série ou équivalent', 1),
(37, 4, 'Volets roulants', 20, '', '* Photos non contractuelles - Équipements de série ou équivalent', 1),
(38, 5, 'Compteur gaz', 1, '', '* Photos non contractuelles - Équipements de série ou équivalent', 1),
(39, 5, 'Hapiix', 2, '', '* Photos non contractuelles - Équipements de série ou équivalent', 1);

-- --------------------------------------------------------

--
-- Structure de la table `presta_descriptif`
--

CREATE TABLE `presta_descriptif` (
  `id_presta_descriptif` int(11) NOT NULL,
  `id_presta` int(11) NOT NULL,
  `html` varchar(5000) NOT NULL,
  `image_url` varchar(1000) NOT NULL,
  `image_display` varchar(100) NOT NULL,
  `index_descriptif` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `presta_descriptif`
--

INSERT INTO `presta_descriptif` (`id_presta_descriptif`, `id_presta`, `html`, `image_url`, `image_display`, `index_descriptif`) VALUES
(1, 1, 'Salle de bains type T4', 'presta/sdb/_generic/sdb_01.jpg', 'medium', 1),
(2, 1, 'Salle de bains type T2', 'presta/sdb/_generic/sdb_02.jpg', 'medium', 2),
(3, 2, '', 'presta/sdb/baignoire/baignoire_1.jpg', 'medium', 1),
(4, 2, '', 'presta/sdb/baignoire/baignoire_2.jpg', 'medium', 2),
(5, 3, '', 'presta/sdb/meuble_vasque/meuble_vasque.jpg', 'medium', 1),
(6, 4, '', 'presta/sdb/lave_linge/lave_linge.jpg', 'medium', 1),
(7, 5, '', 'presta/sdb/robinetterie/robinetterie_sdb.jpg', 'medium', 1),
(8, 6, '', 'presta/sdb/seche_serviette/seche_serviette.jpg', 'medium', 1),
(9, 6, '', 'presta/sdb/seche_serviette/seche_serviette_elec.jpg', 'medium', 2),
(10, 7, '', 'presta/sdb/wc/wc.jpg', 'medium', 1),
(11, 8, 'Cuisine type T3', 'presta/cuisine/_generic/cuisine_01.jpg', 'medium', 1),
(12, 8, 'Cuisine type T2', 'presta/cuisine/_generic/cuisine_02.jpg', 'medium', 2),
(13, 9, '', 'presta/cuisine/cuisine_T2/cuisine_T2_face.jpg', 'medium', 1),
(14, 9, '', 'presta/cuisine/cuisine_T2/cuisine_T2_zoom.jpg', 'medium', 2),
(15, 10, '', 'presta/cuisine/cuisine_T3/cuisine_T3.jpg', 'medium', 1),
(16, 10, '', 'presta/cuisine/cuisine_T3/cuisine_T3_face.jpg', 'medium', 2),
(17, 11, '', 'presta/cuisine/electromenager/frigo.jpg', 'medium', 1),
(18, 11, '', 'presta/cuisine/electromenager/hotte.jpg', 'medium', 2),
(19, 11, '', 'presta/cuisine/electromenager/plaque_1.jpg', 'medium', 3),
(20, 11, '', 'presta/cuisine/electromenager/plaque_2.jpg', 'medium', 4),
(21, 12, '', 'presta/cuisine/robinetterie/robinetterie.jpg\'', 'medium', 1),
(22, 13, 'Placards de rangement aménagés', 'presta/menuiseries/_generic1/presta1_interieures_01.jpg', 'medium', 1),
(23, 13, 'Portes rainurées et laquées', 'presta/menuiseries/_generic1/presta1_interieures_02.jpg', 'medium', 2),
(24, 13, '', 'presta/menuiseries/_generic1/presta1_interieures_03.jpg', 'medium', 3),
(25, 14, '', 'presta/menuiseries/_generic2/presta2_interieures_01.jpg', 'medium', 1),
(26, 15, '', 'presta/menuiseries/fenetres/porte_fenetre.jpg', 'medium', 1),
(27, 16, '', 'presta/menuiseries/portes/porte_entree.jpg', 'medium', 1),
(28, 16, '', 'presta/menuiseries/portes/porte_de_circulation.jpg', 'medium', 2),
(29, 16, '', 'presta/menuiseries/portes/poignees_interieur.jpg', 'medium', 3),
(30, 17, '', 'presta/menuiseries/placards/placards.jpg', 'medium', 1),
(31, 18, '', 'presta/equipements/aeration/aeration.jpg', 'medium', 1),
(32, 19, '', 'presta/equipements/alarme/alarme_clavier.jpg', 'medium', 1),
(33, 19, '', 'presta/equipements/alarme/alarme_hurleur.jpg', 'medium', 2),
(34, 20, '', 'presta/equipements/arrivee_eau/arrivee_evac_LL.jpg', 'medium', 1),
(35, 21, '', 'presta/equipements/ballon/ballon_thermodynamique.jpg', 'medium', 1),
(36, 22, '', 'presta/equipements/bouche_vmc/bouche_vmc.jpg', 'medium', 1),
(37, 23, '', 'presta/equipements/chaudiere/chaudiere.jpg', 'medium', 1),
(38, 24, '', 'presta/equipements/climatisation/climatisation.jpg', 'medium', 1),
(39, 24, '', 'presta/equipements/climatisation/climatisation_telecommande.jpg', 'medium', 2),
(40, 25, '', 'presta/equipements/compteur_eau/compteur_eau.jpg', 'medium', 1),
(41, 26, '', 'presta/equipements/evacuation/arrivee_evac_LL.jpg', 'medium', 1),
(42, 27, '', 'presta/equipements/green_connect/green_connect.jpg', 'medium', 1),
(43, 27, '', 'presta/equipements/green_connect/tydom.jpg', 'medium', 2),
(44, 28, '', 'presta/equipements/interrupteurs/interrupteurs.jpg', 'medium', 1),
(45, 29, '', 'presta/equipements/nourrices/nourrices.jpg', 'medium', 1),
(46, 30, '', 'presta/equipements/points_lumineux/douille_dcl.jpg', 'medium', 1),
(47, 31, '', 'presta/equipements/prises/prises_rj45_tele.jpg', 'medium', 1),
(48, 31, '', 'presta/equipements/prises/prise_etanche.jpg', 'medium', 2),
(49, 32, '', 'presta/equipements/radiateurs/radiateur.jpg', 'medium', 1),
(50, 32, '', 'presta/equipements/radiateurs/radiateur_elec.jpg', 'medium', 2),
(51, 33, '', '', 'medium', 1),
(52, 34, '', 'presta/equipements/tableau_electrique/tableau_electrique.jpg', 'medium', 1),
(53, 34, '', 'presta/equipements/tableau_electrique/tableau_electrique_ferme.jpg', 'medium', 2),
(54, 35, '', 'presta/equipements/terrasse_bois/terrasse_bois.jpg', 'medium', 1),
(55, 36, '', 'presta/equipements/thermostat/thermostat.jpg', 'medium', 1),
(56, 36, '', 'presta/equipements/thermostat/thermostatique_radiateur.jpg', 'medium', 2),
(57, 37, '', 'presta/equipements/volet_roulant/volet_roulant.jpg', 'medium', 1);

-- --------------------------------------------------------

--
-- Structure de la table `presta_famille`
--

CREATE TABLE `presta_famille` (
  `id_famille` int(11) NOT NULL,
  `nom_famille` varchar(500) NOT NULL,
  `index_famille` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `presta_famille`
--

INSERT INTO `presta_famille` (`id_famille`, `nom_famille`, `index_famille`) VALUES
(1, 'Salle de bain / WC', 1),
(2, 'Cuisine', 2),
(3, 'Menuiseries', 3),
(4, 'Équipements', 4),
(5, 'Divers', 5);

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
(1, 1, 1, 'NOVELLI', 'Aurora', '', './img/produits/pareBain_aurora_thumb.jpg', 0),
(2, 1, 2, 'SANINDUSA', 'Stepin', '', './img/produits/receveurs_stepinSanindusa_thumb.jpg', 0),
(3, 1, 2, 'JACOB DELAFON', 'Flight', '', './img/produits/receveurs_flightJacobDelafon_thumb.jpg', 0),
(4, 1, 3, 'ALTERNA', 'Concerto Walk', '', './img/produits/paroisDouche_concertoWalkAlterna_thumb.jpg', 0),
(5, 1, 3, 'NOVELLINI', 'Zephyros', '', './img/produits/paroisDouche_zephyrosNovellini_thumb.jpg', 0),
(6, 1, 4, 'ALTERNA', 'Concerto ', '', './img/produits/portesDouche_concertoAlterna_thumb.jpg', 0),
(7, 1, 4, 'ALTERNA', 'Domino', '', './img/produits/portesDouche_dominoAlterna_thumb.jpg', 0),
(8, 1, 4, 'ALTERNA', 'Concerto ', '', './img/produits/portesDouche_concertoAlternaAngle_thumb.jpg', 0),
(9, 1, 4, 'NOVELLI', 'Zephyros ', '', './img/produits/portesDouche_zephyrosNovellini_thumb.jpg', 0),
(10, 1, 5, 'ALTERNA', 'Concerto 4', '', './img/produits/colonneDouche_concerto4Alterna_thumb.jpg', 0),
(11, 1, 5, 'ALTERNA', 'Domino', '', './img/produits/colonneDouche_dominoAlterna_thumb.jpg', 0),
(12, 1, 5, 'JACOB DELAFON', 'Strayt', '', './img/produits/colonneDouche_straytJacobDelafon_thumb.jpg', 0),
(13, 1, 6, 'SANINDUSA', 'Urby', '', './img/produits/wc_urbySanindusa_thumb.jpg', 0),
(14, 1, 7, 'ALTERNA', '', '', './img/produits/laveMain_piccoloAlterna_thumb.jpg', 0),
(15, 2, 8, 'FRANKE', '', '', './img/produits/evier_basisBFGFranke_thumb.jpg', 0),
(16, 3, 10, 'Ba', '', '', './img/produits/porteCoulissante_ba_thumb.jpg', 0),
(17, 3, 11, 'Ba', '', '', './img/produits/porteGalandage_ba_thumb.jpg', 0),
(18, 3, 12, 'Ba', '', '', './img/produits/facadePlacard_ba_thumb.jpg', 0),
(19, 3, 13, 'Etagères en chêne', '', '', './img/produits/etageres_chene_thumb.jpg', 0),
(20, 3, 13, 'Etagères en malaminé', '', '', './img/produits/etageres_melamine_thumb.jpg', 0);

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
  `titre` varchar(500) NOT NULL,
  `id_produit` int(11) NOT NULL,
  `index_descriptif` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `produit_descriptif`
--

INSERT INTO `produit_descriptif` (`id_produit_descriptif`, `html`, `titre`, `id_produit`, `index_descriptif`) VALUES
(1, 'Verre traité anticalcaire,<br>Epaisseur 6mm.<br><br>Pivotant à 180°.<br>', 'Pare-bain droit', 1, 1),
(2, 'Dimensions disponibles:<br><ul><li>70x120/140 cm</li><li>80x80/100/120/140 cm</li><li>90x90/120/140 cm</li></ul>', 'Receveur de douche céramique antidérapant', 2, 1),
(4, 'Dimensions disponibles:<br><ul><li>70x170 cm</li><li>76x170 cm</li><li>90x170 cm</li></ul>', 'Receveur de douche acrylique', 3, 1),
(5, 'Verre de sécurité transparent 6mm<br>Traitement anticalcaire<br>Profilé en aluminium anosidé résistant aux rayures<br>Bras de fixation<br>Hauteur 200cm.<br><br>Dimensions disponibles :<ul><li>70 cm</li><li>80 cm</li><li>90 cm</li><li>100 cm</li><li>120 cm</li><li>140 cm</li></ul>', 'Paroi de douche fixe', 4, 1),
(6, 'Verre de sécurité transparent 6mm<br>Traitement anticalcaire<br>Profilé en aluminium anosidé résistant aux rayures<br>Bras de fixation<br>Hauteur 200cm.<br><br>Dimensions disponibles :<ul><li>70 cm</li><li>80 cm</li><li>90 cm</li><li>100 cm</li><li>120 cm</li><li>140 cm</li></ul>', 'Paroi de douche fixe', 5, 1),
(7, 'Verre de sécurité transparent 6mm<br>Traitement anticalcaire<br>Profilé en aluminium anosidé résistant aux rayures<br>Bras de fixation<br>Hauteur 200cm.<br><br>Dimensions disponibles :<ul><li>70 cm</li><li>80 cm</li><li>90 cm</li><li>100 cm</li><li>120 cm</li><li>140 cm</li></ul>', '', 5, 1),
(9, '<u>Version 2 vantaux :</u><br>1 panneau fixe et un panneau coulissant<br>Verre transparent 6mm<br>Profilé en aluminium<br>Hauteur 195cm<br>Dimensions disponibles :<br><ul><li>120 cm</li><li>140 cm</li></ul>', 'Porte de douche coulissante', 6, 1),
(10, '<u>Version 3 vantaux :</u><br>1 panneau fixe et 2 panneaux coulissants<br>Verre transparent 6mm<br>Profilé en aluminium<br>Hauteur 195cm<br>Dimensions disponibles :<br><ul><li>90 cm</li></ul>', '', 6, 2),
(11, 'Verre transparent securit 8mm<br>Profilé en argent brillant, en aluminium anodisé résistant aux rayures<br>Traité anti calcaire<br>Pivot total intérieur et extérieur<br>Fermeture par joint magnétique<br>Hauteur 195cm<br>Dimensions disponibles :<br><ul><li>90 cm</li><li>120 cm (fixe 55cm + pivot)</li></ul>', 'Porte de douche pivotante', 7, 1),
(13, 'Verre transparent securit 8mm<br>Porte à ouverture coulissante<br>Profilé en argent brillant, en aluminium anodisé résistant aux rayures<br>Traité anti calcaire<br>Hauteur 195cm<br>Dimensions disponibles :<br><ul><li>70 cm</li><li>80 cm</li><li>90 cm</li><li>100 cm</li></ul>', 'Porte de douche d\'angle - retour fixe', 8, 1),
(15, 'Verre trempé transparent securit 6mm<br>Porte à ouverture coulissante<br><br>Profilé noir mat<br>Poignée métal<br>Anti-calcaire<br>Coulissant sur roulettes à billes<br><br>Dimensions disponibles<br><ul><li>120 cm</li><li>140 cm</li><li>170 cm</li></ul><br>Les deux modèles peuvent être associés à la <b>paroi fixe ZEPHYROS</b>', 'Porte de douche coulissante avec 1 fixe', 9, 1),
(16, '<b>Porte de douche pivotante</b><br><br>Verre trempé transparent securit 6mm<br>Porte à ouverture pivotante<br><br>Profilé noir mat<br>Poignée métal noir<br>Anti-calcaire<br>Réversible<br>Silencieux<br><br>Dimensions disponibles<br><ul><li>80 cm</li><li>90 cm</li></ul>', '', 9, 2),
(17, 'Mitigeur thermostatique chromé<br>Butée de sécurité anti brûlure 38°C<br>Colonne réglable en hauteur<br>Flexible PVC 150cm<br>Douchette à main 5 jets, diamètre 10cm<br>Douche de tête diamètre 25cm', 'Colonne de douche', 10, 1),
(18, 'Mitigeur thermostatique avec plage de pose<br>Sécurité anti brûlure réglée à 38°C<br>Fixation réglable en hauteur<br>Douche de tête en inox 30x30cm, épaisseur 4mm, picots anticalcaires<br>Douchette à main carrée 1 jet, picots anticalcaire<br>Flexible de douche PVC renforcé argent brillant 150cm', 'Colonne de douche', 11, 1),
(19, 'Douche de tête carrée L.250mm, en métal, sur rotule<br>Mitigeur thermostatique avec butée de sécurité à 38°C et blocage température maxi à 50°C<br>Inverseur sur poignée de débit<br>Coulisseau-support de douchette à main, en métal, orientable<br>Flexible lisse anti-torsion L 1.60M<br>Douchette à main cubique 2 jets<br>Poignées ergonomiques en métal', 'Colonne de douche', 12, 1),
(20, 'Cuvette suspendue en céramique<br>Abattant avec frein chute<br>Plaque blanche<br>Fixations invisibles', 'WC suspendu sur bati support', 13, 1),
(21, '<ul><li>Lave-mains en céramique, blanc</li><li>Percée 1 trou de robinetterie</li><li>Robinetterie à gauche, non réversible</li><li>Meuble une porte en mélaminé 16mm finition laquée</li><li>Profondeur de la cuve : 23.5cm</li></ul>', '', 14, 1),
(22, 'Evier Fragranit (résistant et hygiénique)<br>1 cuve avec égouttoir<br>Résiste jusqu\'à 280°C<br><br>Coloris disponibles: <br>Onyx, blanc polaire, platinium, stone<br><br>Y compris mitigeur Brive JACOB DELAFON', '', 15, 1),
(23, 'Dimension disponible :<br><ul><li>80cm</li></ul>', 'Porte coullisante en applique', 16, 1),
(24, 'Dimension disponible :<br><ul><li>80cm</li><li>90cm</li></ul>', 'Porte à galandage de type SRIGNO', 17, 1),
(25, '', 'Façades de placard miroir (portes coulissantes)', 18, 1),
(26, 'Largeur entre 30 et 50cm, profondeur 50cm maximum<br><br>A l\'unité', 'Etagères en chêne avec fixations invisibles', 19, 1),
(27, 'Largeur entre 30 et 50cm<br><br>A l\'unité', 'Etagères en mélaminé blanc posées sur taquets', 20, 1);

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
(3, 'Menuiseries'),
(4, 'Équipements'),
(5, 'Divers');

-- --------------------------------------------------------

--
-- Structure de la table `produit_image`
--

CREATE TABLE `produit_image` (
  `id_image` int(11) NOT NULL,
  `image_url` varchar(400) NOT NULL,
  `display_size` varchar(30) NOT NULL,
  `id_produit` int(11) NOT NULL,
  `index_image` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `produit_image`
--

INSERT INTO `produit_image` (`id_image`, `image_url`, `display_size`, `id_produit`, `index_image`) VALUES
(1, 'img/produits/pareBain_aurora.jpg', 'medium', 1, 1),
(2, 'img/produits/receveurs_stepinSanindusa.jpg', 'medium', 2, 1),
(4, 'img/produits/receveurs_flightJacobDelafon.jpg', 'medium', 3, 1),
(5, 'img/produits/paroisDouche_concertoWalkAlterna.jpg', 'medium', 4, 1),
(6, 'img/produits/paroisDouche_zephyrosNovellini_01.jpg', 'medium', 5, 1),
(7, 'img/produits/paroisDouche_zephyrosNovellini_02.jpg', 'medium', 5, 2),
(8, 'img/produits/portesDouche_concertoAlterna_01.jpg', 'medium', 6, 1),
(9, 'img/produits/portesDouche_concertoAlterna_02.jpg', 'medium', 6, 2),
(10, 'img/produits/portesDouche_dominoAlterna_01.jpg', 'medium', 7, 1),
(11, 'img/produits/portesDouche_dominoAlterna_02.jpg', 'medium', 7, 2),
(12, 'img/produits/portesDouche_concertoAlternaAngle.jpg', 'medium', 8, 1),
(14, 'img/produits/portesDouche_zephyrosNovellini_01.jpg', 'medium', 9, 1),
(15, 'img/produits/portesDouche_zephyrosNovellini_02.jpg', 'medium', 9, 2),
(16, 'img/produits/colonneDouche_concerto4Alterna.jpg', 'medium', 10, 1),
(17, 'img/produits/colonneDouche_dominoAlterna.jpg', 'medium', 11, 1),
(18, 'img/produits/colonneDouche_straytJacobDelafon.jpg', 'medium', 12, 1),
(19, 'img/produits/wc_urbySanindusa.jpg', 'medium', 13, 1),
(20, 'img/produits/laveMain_piccoloAlterna_01.jpg', 'medium', 14, 1),
(21, 'img/produits/laveMain_piccoloAlterna_02.jpg', 'medium', 14, 2),
(22, 'img/produits/evier_basisBFGFranke_01.jpg', 'medium', 15, 1),
(23, 'img/produits/evier_basisBFGFranke_02.jpg', 'medium', 15, 2),
(24, 'img/produits/evier_basisBFGFranke_03.jpg', 'medium', 15, 3),
(25, 'img/produits/porteCoulissante_ba.jpg', 'medium', 16, 1),
(26, 'img/produits/porteGalandage_ba.jpg', 'medium', 17, 1),
(27, 'img/produits/facadePlacard_ba.jpg', 'medium', 18, 1),
(28, 'img/produits/etageres_chene.jpg', 'medium', 19, 1),
(29, 'img/produits/etageres_melamine.jpg', 'medium', 20, 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `presta`
--
ALTER TABLE `presta`
  ADD PRIMARY KEY (`id_presta`);

--
-- Index pour la table `presta_descriptif`
--
ALTER TABLE `presta_descriptif`
  ADD PRIMARY KEY (`id_presta_descriptif`);

--
-- Index pour la table `presta_famille`
--
ALTER TABLE `presta_famille`
  ADD PRIMARY KEY (`id_famille`);

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

--
-- Index pour la table `produit_image`
--
ALTER TABLE `produit_image`
  ADD PRIMARY KEY (`id_image`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `presta`
--
ALTER TABLE `presta`
  MODIFY `id_presta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT pour la table `presta_descriptif`
--
ALTER TABLE `presta_descriptif`
  MODIFY `id_presta_descriptif` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT pour la table `presta_famille`
--
ALTER TABLE `presta_famille`
  MODIFY `id_famille` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `id_produit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT pour la table `produit_categorie`
--
ALTER TABLE `produit_categorie`
  MODIFY `id_categorie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `produit_descriptif`
--
ALTER TABLE `produit_descriptif`
  MODIFY `id_produit_descriptif` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT pour la table `produit_famille`
--
ALTER TABLE `produit_famille`
  MODIFY `id_famille` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT pour la table `produit_image`
--
ALTER TABLE `produit_image`
  MODIFY `id_image` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `fk_produit_categorie` FOREIGN KEY (`id_categorie`) REFERENCES `produit_categorie` (`id_categorie`),
  ADD CONSTRAINT `fk_produit_famille` FOREIGN KEY (`id_famille`) REFERENCES `produit_famille` (`id_famille`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
