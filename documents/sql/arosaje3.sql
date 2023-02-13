-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : dim. 05 fév. 2023 à 19:30
-- Version du serveur : 5.7.36
-- Version de PHP : 7.4.26

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
-- Structure de la table `bibliotheque_plante`
--

DROP TABLE IF EXISTS `bibliotheque_plante`;
CREATE TABLE IF NOT EXISTS `bibliotheque_plante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `guide_plante` int(11) NOT NULL,
  `type_plante` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKeqjf3teghbvw6u7yqnqj7ntwu` (`guide_plante`),
  KEY `FK5me4i5xnxe7js6m5cnlnmx1ko` (`type_plante`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `bibliotheque_plante`
--

INSERT INTO `bibliotheque_plante` (`id`, `nom`, `guide_plante`, `type_plante`) VALUES
(1, 'Tulipe', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

DROP TABLE IF EXISTS `commentaire`;
CREATE TABLE IF NOT EXISTS `commentaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `titre` varchar(255) NOT NULL,
  `auteur` int(11) NOT NULL,
  `plante` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKnff0yvgs0rj9tcx4vrwlg2din` (`auteur`),
  KEY `FK8ek8479yoeg9u3youvxw2tj3s` (`plante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `garde_plante`
--

DROP TABLE IF EXISTS `garde_plante`;
CREATE TABLE IF NOT EXISTS `garde_plante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `gardien` int(11) NOT NULL,
  `plante` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5yg6mvwnhihkswkx2d374x3xh` (`gardien`),
  KEY `FKmodog76yh8ujlnqj7bx1bpiev` (`plante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `guide_plante`
--

DROP TABLE IF EXISTS `guide_plante`;
CREATE TABLE IF NOT EXISTS `guide_plante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `titre` varchar(255) NOT NULL,
  `type_guide` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9mt98orxhggr93rqykvsfdlq4` (`type_guide`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `guide_plante`
--

INSERT INTO `guide_plante` (`id`, `description`, `titre`, `type_guide`) VALUES
(1, 'Arrosage le matin', 'Arrosage x3', 2);

-- --------------------------------------------------------

--
-- Structure de la table `personne`
--

DROP TABLE IF EXISTS `personne`;
CREATE TABLE IF NOT EXISTS `personne` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adresse` varchar(255) DEFAULT NULL,
  `cp` int(11) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `mdp` varchar(100) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `ville` varchar(255) DEFAULT NULL,
  `role` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKn8dsrqe6t72xqm0sw1xycdjtx` (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `personne`
--

INSERT INTO `personne` (`id`, `adresse`, `cp`, `email`, `mdp`, `nom`, `prenom`, `ville`, `role`) VALUES
(1, 'EPSI', 69009, 'erine@epsi.fr', '123', 'BERARD', 'Erine', 'Lyon', 1),
(2, 'EPSI', 69008, 'jade@epsi.de', '123', 'DOMAS-VASSEROT', 'Jade', 'Lyon', 2);

-- --------------------------------------------------------

--
-- Structure de la table `photoplante`
--

DROP TABLE IF EXISTS `photoplante`;
CREATE TABLE IF NOT EXISTS `photoplante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photo` varchar(255) DEFAULT NULL,
  `plante` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKnigwg2t73jrcaecpmxpshuupe` (`plante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `photo_bibliotheque_plante`
--

DROP TABLE IF EXISTS `photo_bibliotheque_plante`;
CREATE TABLE IF NOT EXISTS `photo_bibliotheque_plante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photo` varchar(255) DEFAULT NULL,
  `bibliotheque_plante` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKi4451ksv2hwv8sjyobsra9oel` (`bibliotheque_plante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `plante`
--

DROP TABLE IF EXISTS `plante`;
CREATE TABLE IF NOT EXISTS `plante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `localisation` varchar(255) DEFAULT NULL,
  `nom` varchar(255) NOT NULL,
  `bibliotheque_plante` int(11) NOT NULL,
  `proprietaire` int(11) NOT NULL,
  `statut` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK507hphahoiwqvc6kpmw6155xh` (`bibliotheque_plante`),
  KEY `FK32q2m43wjfrl6j88cjgt9b57a` (`proprietaire`),
  KEY `FKsyt3v7gjrd4vv70iowkhr62k3` (`statut`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `plante`
--

INSERT INTO `plante` (`id`, `localisation`, `nom`, `bibliotheque_plante`, `proprietaire`, `statut`) VALUES
(1, 'Salon', 'Tulipe Rouge', 1, 1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`id`, `nom`) VALUES
(1, 'Utilisateur'),
(2, 'Botaniste'),
(3, 'Administrateur'),
(4, 'Modérateur'),
(5, 'Visiteur');

-- --------------------------------------------------------

--
-- Structure de la table `statut_plante`
--

DROP TABLE IF EXISTS `statut_plante`;
CREATE TABLE IF NOT EXISTS `statut_plante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `statut_plante`
--

INSERT INTO `statut_plante` (`id`, `nom`) VALUES
(1, 'Gardée'),
(2, 'A Gardée'),
(3, 'En attente de Garde');

-- --------------------------------------------------------

--
-- Structure de la table `type_guide`
--

DROP TABLE IF EXISTS `type_guide`;
CREATE TABLE IF NOT EXISTS `type_guide` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `type_guide`
--

INSERT INTO `type_guide` (`id`, `nom`) VALUES
(1, 'Lumière'),
(2, 'Arrosage'),
(3, 'Fertilité');

-- --------------------------------------------------------

--
-- Structure de la table `type_plante`
--

DROP TABLE IF EXISTS `type_plante`;
CREATE TABLE IF NOT EXISTS `type_plante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `nom` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `type_plante`
--

INSERT INTO `type_plante` (`id`, `description`, `nom`) VALUES
(1, 'La fleur est la structure reproductrice caractéristique des plantes qui produisent des graines. Elle contient les organes reproducteurs des plantes à fleurs, les pistils femelles et les étamines mâles.', 'Fleur'),
(2, 'Un arbre est une plante pérenne qui possède un tronc ou une tige allongée et qui est composé de branches et de feuilles pour la plupart des espèces', 'Arbre'),
(3, 'Il s\'agit des très nombreuses plantes à mi-chemin entre les plantes herbacées et les arbres. Les arbustes forment du bois ', 'Arbustes'),
(4, 'Elles forment des tiges fines par rapport à leur longueur. Une grosse clématite ne dépasse jamais 1 cm de diamètre, et une vénérable bignone atteindra 10 cm de diamètre.', 'Lianes ou Plantes Grimpantes'),
(5, 'Elles comportent des réserves souterraines charnues, comme l\'oignon et la tulipe. La forme de la réserve est très variée sur le plan botanique et selon les cas, on parlera de corme, de griffe, de rhizome ou de tubercule. ', 'Plantes à bulbe');

-- --------------------------------------------------------

--
-- Structure de la table `visite_plante`
--

DROP TABLE IF EXISTS `visite_plante`;
CREATE TABLE IF NOT EXISTS `visite_plante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_visite` date NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `garde_plante` int(11) NOT NULL,
  `gardien` int(11) NOT NULL,
  `plante` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKalm3d5jency8n3ioetwdydktg` (`garde_plante`),
  KEY `FKaff692s6uqd17jbt5i7k4731x` (`gardien`),
  KEY `FKhwbo8fve138wmexo38qny1tfr` (`plante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `bibliotheque_plante`
--
ALTER TABLE `bibliotheque_plante`
  ADD CONSTRAINT `FK5me4i5xnxe7js6m5cnlnmx1ko` FOREIGN KEY (`type_plante`) REFERENCES `type_plante` (`id`),
  ADD CONSTRAINT `FKeqjf3teghbvw6u7yqnqj7ntwu` FOREIGN KEY (`guide_plante`) REFERENCES `guide_plante` (`id`);

--
-- Contraintes pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD CONSTRAINT `FK8ek8479yoeg9u3youvxw2tj3s` FOREIGN KEY (`plante`) REFERENCES `plante` (`id`),
  ADD CONSTRAINT `FKnff0yvgs0rj9tcx4vrwlg2din` FOREIGN KEY (`auteur`) REFERENCES `personne` (`id`);

--
-- Contraintes pour la table `garde_plante`
--
ALTER TABLE `garde_plante`
  ADD CONSTRAINT `FK5yg6mvwnhihkswkx2d374x3xh` FOREIGN KEY (`gardien`) REFERENCES `personne` (`id`),
  ADD CONSTRAINT `FKmodog76yh8ujlnqj7bx1bpiev` FOREIGN KEY (`plante`) REFERENCES `plante` (`id`);

--
-- Contraintes pour la table `guide_plante`
--
ALTER TABLE `guide_plante`
  ADD CONSTRAINT `FK9mt98orxhggr93rqykvsfdlq4` FOREIGN KEY (`type_guide`) REFERENCES `type_guide` (`id`);

--
-- Contraintes pour la table `personne`
--
ALTER TABLE `personne`
  ADD CONSTRAINT `FKn8dsrqe6t72xqm0sw1xycdjtx` FOREIGN KEY (`role`) REFERENCES `role` (`id`);

--
-- Contraintes pour la table `photoplante`
--
ALTER TABLE `photoplante`
  ADD CONSTRAINT `FKnigwg2t73jrcaecpmxpshuupe` FOREIGN KEY (`plante`) REFERENCES `plante` (`id`);

--
-- Contraintes pour la table `photo_bibliotheque_plante`
--
ALTER TABLE `photo_bibliotheque_plante`
  ADD CONSTRAINT `FKi4451ksv2hwv8sjyobsra9oel` FOREIGN KEY (`bibliotheque_plante`) REFERENCES `bibliotheque_plante` (`id`);

--
-- Contraintes pour la table `plante`
--
ALTER TABLE `plante`
  ADD CONSTRAINT `FK32q2m43wjfrl6j88cjgt9b57a` FOREIGN KEY (`proprietaire`) REFERENCES `personne` (`id`),
  ADD CONSTRAINT `FK507hphahoiwqvc6kpmw6155xh` FOREIGN KEY (`bibliotheque_plante`) REFERENCES `bibliotheque_plante` (`id`),
  ADD CONSTRAINT `FKsyt3v7gjrd4vv70iowkhr62k3` FOREIGN KEY (`statut`) REFERENCES `statut_plante` (`id`);

--
-- Contraintes pour la table `visite_plante`
--
ALTER TABLE `visite_plante`
  ADD CONSTRAINT `FKaff692s6uqd17jbt5i7k4731x` FOREIGN KEY (`gardien`) REFERENCES `personne` (`id`),
  ADD CONSTRAINT `FKalm3d5jency8n3ioetwdydktg` FOREIGN KEY (`garde_plante`) REFERENCES `garde_plante` (`id`),
  ADD CONSTRAINT `FKhwbo8fve138wmexo38qny1tfr` FOREIGN KEY (`plante`) REFERENCES `plante` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
