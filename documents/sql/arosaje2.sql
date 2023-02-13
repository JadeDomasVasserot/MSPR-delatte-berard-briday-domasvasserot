-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 02 fév. 2023 à 16:04
-- Version du serveur :  5.7.31
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `arosaje`
--

-- --------------------------------------------------------

--
-- Structure de la table `bibliothequeplante`
--

DROP TABLE IF EXISTS `bibliothequeplante`;
CREATE TABLE IF NOT EXISTS `bibliothequeplante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) NOT NULL,
  `typePlante` int(11) NOT NULL,
  `guidePlante` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `typePlante_fk` (`typePlante`),
  KEY `guidePlante_fk` (`guidePlante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

DROP TABLE IF EXISTS `commentaire`;
CREATE TABLE IF NOT EXISTS `commentaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(30) NOT NULL,
  `description` varchar(300) NOT NULL,
  `auteur` int(11) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `plante` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `auteur_fk` (`auteur`),
  KEY `plante_fk` (`plante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `gardeplante`
--

DROP TABLE IF EXISTS `gardeplante`;
CREATE TABLE IF NOT EXISTS `gardeplante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proprietaire` int(11) NOT NULL,
  `plante` int(11) NOT NULL,
  `dateDebut` datetime NOT NULL,
  `dateFin` datetime NOT NULL,
  `statutGarde` int(11) NOT NULL,
  `gardien` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `proprietaire_fk` (`proprietaire`),
  KEY `statutGarde_fk` (`statutGarde`),
  KEY `gardien_fk` (`gardien`),
  KEY `plante_gardePlante_fk` (`plante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `guideplante`
--

DROP TABLE IF EXISTS `guideplante`;
CREATE TABLE IF NOT EXISTS `guideplante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(30) NOT NULL,
  `description` varchar(300) NOT NULL,
  `typeGuide` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type_guide` (`typeGuide`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `personne`
--

DROP TABLE IF EXISTS `personne`;
CREATE TABLE IF NOT EXISTS `personne` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `adresse` varchar(100) NOT NULL,
  `cp` int(5) NOT NULL,
  `ville` varchar(50) NOT NULL,
  `estBotaniste` tinyint(1) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mdp` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `photobibliplante`
--

DROP TABLE IF EXISTS `photobibliplante`;
CREATE TABLE IF NOT EXISTS `photobibliplante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photo` varchar(200) NOT NULL,
  `biblioPlante` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `biblioPlante_fk` (`biblioPlante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `photoplante`
--

DROP TABLE IF EXISTS `photoplante`;
CREATE TABLE IF NOT EXISTS `photoplante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photo` varchar(200) NOT NULL,
  `plante` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `photoPlante_plante_fk` (`plante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `plante`
--

DROP TABLE IF EXISTS `plante`;
CREATE TABLE IF NOT EXISTS `plante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) NOT NULL,
  `typePlante` int(11) NOT NULL,
  `localisation` varchar(100) NOT NULL,
  `statut` int(11) NOT NULL,
  `proprietaire` int(11) NOT NULL,
  `bibliothequePlante` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type_plante_fk` (`typePlante`),
  KEY `status_plante_fk` (`statut`),
  KEY `proprietaire_plante_fk` (`proprietaire`),
  KEY `bibliotheque_plante_fk` (`bibliothequePlante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `statutgarde`
--

DROP TABLE IF EXISTS `statutgarde`;
CREATE TABLE IF NOT EXISTS `statutgarde` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `statutplante`
--

DROP TABLE IF EXISTS `statutplante`;
CREATE TABLE IF NOT EXISTS `statutplante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `typeguide`
--

DROP TABLE IF EXISTS `typeguide`;
CREATE TABLE IF NOT EXISTS `typeguide` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `typeplante`
--

DROP TABLE IF EXISTS `typeplante`;
CREATE TABLE IF NOT EXISTS `typeplante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) NOT NULL,
  `description` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `visiteplante`
--

DROP TABLE IF EXISTS `visiteplante`;
CREATE TABLE IF NOT EXISTS `visiteplante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photo` varchar(200) NOT NULL,
  `gardien` int(11) NOT NULL,
  `dateVisite` datetime NOT NULL,
  `plante` int(11) NOT NULL,
  `gardePlante` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gardien_visite_fk` (`gardien`),
  KEY `plante_visite_fk` (`plante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `bibliothequeplante`
--
ALTER TABLE `bibliothequeplante`
  ADD CONSTRAINT `guidePlante_fk` FOREIGN KEY (`guidePlante`) REFERENCES `guideplante` (`id`),
  ADD CONSTRAINT `typePlante_fk` FOREIGN KEY (`typePlante`) REFERENCES `typeplante` (`id`);

--
-- Contraintes pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD CONSTRAINT `auteur_fk` FOREIGN KEY (`auteur`) REFERENCES `personne` (`id`),
  ADD CONSTRAINT `plante_fk` FOREIGN KEY (`plante`) REFERENCES `plante` (`id`);

--
-- Contraintes pour la table `gardeplante`
--
ALTER TABLE `gardeplante`
  ADD CONSTRAINT `gardien_fk` FOREIGN KEY (`gardien`) REFERENCES `personne` (`id`),
  ADD CONSTRAINT `plante_gardePlante_fk` FOREIGN KEY (`plante`) REFERENCES `plante` (`id`),
  ADD CONSTRAINT `proprietaire_fk` FOREIGN KEY (`proprietaire`) REFERENCES `personne` (`id`),
  ADD CONSTRAINT `statutGarde_fk` FOREIGN KEY (`statutGarde`) REFERENCES `statutgarde` (`id`);

--
-- Contraintes pour la table `guideplante`
--
ALTER TABLE `guideplante`
  ADD CONSTRAINT `type_guide` FOREIGN KEY (`typeGuide`) REFERENCES `typeguide` (`id`);

--
-- Contraintes pour la table `photobibliplante`
--
ALTER TABLE `photobibliplante`
  ADD CONSTRAINT `biblioPlante_fk` FOREIGN KEY (`biblioPlante`) REFERENCES `bibliothequeplante` (`id`);

--
-- Contraintes pour la table `photoplante`
--
ALTER TABLE `photoplante`
  ADD CONSTRAINT `photoPlante_plante_fk` FOREIGN KEY (`plante`) REFERENCES `plante` (`id`);

--
-- Contraintes pour la table `plante`
--
ALTER TABLE `plante`
  ADD CONSTRAINT `bibliotheque_plante_fk` FOREIGN KEY (`bibliothequePlante`) REFERENCES `bibliothequeplante` (`id`),
  ADD CONSTRAINT `proprietaire_plante_fk` FOREIGN KEY (`proprietaire`) REFERENCES `personne` (`id`),
  ADD CONSTRAINT `status_plante_fk` FOREIGN KEY (`statut`) REFERENCES `statutplante` (`id`),
  ADD CONSTRAINT `type_plante_fk` FOREIGN KEY (`typePlante`) REFERENCES `typeplante` (`id`);

--
-- Contraintes pour la table `visiteplante`
--
ALTER TABLE `visiteplante`
  ADD CONSTRAINT `gardien_visite_fk` FOREIGN KEY (`gardien`) REFERENCES `personne` (`id`),
  ADD CONSTRAINT `plante_visite_fk` FOREIGN KEY (`plante`) REFERENCES `plante` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
