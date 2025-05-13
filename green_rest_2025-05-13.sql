-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 13 mai 2025 à 15:59
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
  `thumb` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id_produit`, `id_famille`, `id_categorie`, `marque`, `nom`, `prix`, `thumb`) VALUES
(1, 1, 1, 'Aurora NOVELLI', 'Pare-bain droit', '', './img/produits/pareBain_aurora_thumb.jpg'),
(2, 1, 2, 'Stepin SANINDUSA', 'Receveur de douche céramique antidérapant', '', './img/produits/receveurs_stepinSanindusa_thumb.jpg'),
(3, 1, 2, 'Flight JACOB DELAFON', 'Receveur de douche acrylique', '', './img/produits/receveurs_flightJacobDelafon_thumb.jpg'),
(4, 1, 3, 'Concerto Walk ALTERNA', 'Paroi de douche fixe', '', './img/produits/paroisDouche_concertoWalkAlterna_thumb.jpg'),
(5, 1, 3, 'Zephyros NOVELLINI', 'Paroi de douche fixe', '', './img/produits/paroisDouche_zephyrosNovellini_thumb.jpg'),
(6, 1, 4, 'Concerto ALTERNA', 'Porte de douche coulissante', '', './img/produits/portesDouche_concertoAlterna_thumb.jpg');

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
(4, 1, 'Portes de douche');

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
(3, 'Dimensions disponibles <b>2</b>:<br><ul><li>70x120/140 cm</li><li>80x80/100/120/140 cm</li><li>90x90/120/140 cm</li></ul>', 2, 2),
(4, 'Dimensions disponibles:<br><ul><li>70x170 cm</li><li>76x170 cm</li><li>90x170 cm</li></ul>', 3, 1),
(5, 'Verre de sécurité transparent 6mm<br>Traitement anticalcaire<br>Profilé en aluminium anosidé résistant aux rayures<br>Bras de fixation<br>Hauteur 200cm.<br><br>Dimensions disponibles :<ul><li>70 cm</li><li>80 cm</li><li>90 cm</li><li>100 cm</li><li>120 cm</li><li>140 cm</li></ul>', 4, 1),
(6, 'Verre de sécurité transparent 6mm<br>Traitement anticalcaire<br>Profilé en aluminium anosidé résistant aux rayures<br>Bras de fixation<br>Hauteur 200cm.<br><br>Dimensions disponibles :<ul><li>70 cm</li><li>80 cm</li><li>90 cm</li><li>100 cm</li><li>120 cm</li><li>140 cm</li></ul>', 5, 1),
(7, 'Verre de sécurité transparent 6mm<br>Traitement anticalcaire<br>Profilé en aluminium anosidé résistant aux rayures<br>Bras de fixation<br>Hauteur 200cm.<br><br>Dimensions disponibles :<ul><li>70 cm</li><li>80 cm</li><li>90 cm</li><li>100 cm</li><li>120 cm</li><li>140 cm</li></ul>', 5, 1),
(9, '<u>Version 2 vantaux :</u><br>1 panneau fixe et un panneau coulissant<br>Verre transparent 6mm<br>Profilé en aluminium<br>Hauteur 195cm<br>Dimensions disponibles :<br><ul><li>120 cm</li><li>140 cm</li></ul>', 6, 1),
(10, '<u>Version 3 vantaux :</u><br>1 panneau fixe et 2 panneaux coulissants<br>Verre transparent 6mm<br>Profilé en aluminium<br>Hauteur 195cm<br>Dimensions disponibles :<br><ul><li>90 cm</li></ul>', 6, 2),
(11, '<u>Version 2 vantaux :</u><br>1 panneau fixe et un panneau coulissant<br>Verre transparent 6mm<br>Profilé en aluminium<br>Hauteur 195cm<br>Dimensions disponibles :<br><ul><li>120 cm</li><li>140 cm</li></ul>', 7, 1),
(12, '<u>Version 3 vantaux :</u><br>1 panneau fixe et 2 panneaux coulissants<br>Verre transparent 6mm<br>Profilé en aluminium<br>Hauteur 195cm<br>Dimensions disponibles :<br><ul><li>90 cm</li></ul>', 7, 2),
(13, '<u>Version 2 vantaux :</u><br>1 panneau fixe et un panneau coulissant<br>Verre transparent 6mm<br>Profilé en aluminium<br>Hauteur 195cm<br>Dimensions disponibles :<br><ul><li>120 cm</li><li>140 cm</li></ul>', 8, 1),
(14, '<u>Version 3 vantaux :</u><br>1 panneau fixe et 2 panneaux coulissants<br>Verre transparent 6mm<br>Profilé en aluminium<br>Hauteur 195cm<br>Dimensions disponibles :<br><ul><li>90 cm</li></ul>', 8, 2),
(15, '<u>Version 2 vantaux :</u><br>1 panneau fixe et un panneau coulissant<br>Verre transparent 6mm<br>Profilé en aluminium<br>Hauteur 195cm<br>Dimensions disponibles :<br><ul><li>120 cm</li><li>140 cm</li></ul>', 9, 1),
(16, '<u>Version 3 vantaux :</u><br>1 panneau fixe et 2 panneaux coulissants<br>Verre transparent 6mm<br>Profilé en aluminium<br>Hauteur 195cm<br>Dimensions disponibles :<br><ul><li>90 cm</li></ul>', 9, 2),
(17, '<u>Version 2 vantaux :</u><br>1 panneau fixe et un panneau coulissant<br>Verre transparent 6mm<br>Profilé en aluminium<br>Hauteur 195cm<br>Dimensions disponibles :<br><ul><li>120 cm</li><li>140 cm</li></ul>', 10, 1),
(18, '<u>Version 3 vantaux :</u><br>1 panneau fixe et 2 panneaux coulissants<br>Verre transparent 6mm<br>Profilé en aluminium<br>Hauteur 195cm<br>Dimensions disponibles :<br><ul><li>90 cm</li></ul>', 10, 2);

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
(1, 'Sanitaires'),
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
(10, 'img/produits/portesDouche_concertoAlterna_01.jpg', 7, 1),
(11, 'img/produits/portesDouche_concertoAlterna_02.jpg', 7, 2),
(12, 'img/produits/portesDouche_concertoAlterna_01.jpg', 8, 1),
(13, 'img/produits/portesDouche_concertoAlterna_02.jpg', 8, 2),
(14, 'img/produits/portesDouche_concertoAlterna_01.jpg', 9, 1),
(15, 'img/produits/portesDouche_concertoAlterna_02.jpg', 9, 2),
(16, 'img/produits/portesDouche_concertoAlterna_01.jpg', 10, 1),
(17, 'img/produits/portesDouche_concertoAlterna_02.jpg', 10, 2);

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
  ADD KEY `fk_produit_famille` (`id_famille`);

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
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `id_produit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `produit_categorie`
--
ALTER TABLE `produit_categorie`
  MODIFY `id_categorie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `produit_descriptif`
--
ALTER TABLE `produit_descriptif`
  MODIFY `id_produit_descriptif` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `produit_famille`
--
ALTER TABLE `produit_famille`
  MODIFY `id_famille` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `produit_image`
--
ALTER TABLE `produit_image`
  MODIFY `id_image` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `fk_produit_famille` FOREIGN KEY (`id_famille`) REFERENCES `produit_famille` (`id_famille`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
