-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 02 mars 2023 à 20:08
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
-- Structure de la table `bibliotheque_plante`
--

DROP TABLE IF EXISTS `bibliotheque_plante`;
CREATE TABLE IF NOT EXISTS `bibliotheque_plante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `type_plante` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5me4i5xnxe7js6m5cnlnmx1ko` (`type_plante`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `bibliotheque_plante`
--

INSERT INTO `bibliotheque_plante` (`id`, `nom`, `description`, `type_plante`) VALUES
(1, 'Tulipe', 'La tulipe (Tulipa spp.) est une vivace à bulbe qui pousse, à l\'origine, dans les lieux chauds et secs en Europe, au Moyen-Orient et en Asie centrale d\'où sont issues beaucoup d\'espèces. Aujourd\'hui, très souvent les tulipes viennent de Hollande, pays qui a fait de cette fleur un atout marketing.', 1),
(2, 'Hortensia ', 'L\'hortensia est un arbuste à feuilles caduques ou persistantes qui produit des inflorescences en forme de boule de fleurs roses', 1),
(3, 'Iris', 'L\'iris est une plante vivace à rhizome qui produit de grandes fleurs en forme d\'étoile dans une variété de couleurs', 1),
(4, 'Hibiscus', 'L\'hibiscus est un arbuste à feuilles caduques ou persistantes qui produit de grandes fleurs en forme de trompette dans une variété de couleurs', 1),
(5, 'Lys', 'Le lys est une plante vivace qui produit de grandes fleurs en forme de trompette dans une variété de couleurs, y compris le blanc, le rose et le jaune. Les lys sont souvent utilisés comme fleurs coupées pour les arrangements floraux et sont associés à la pureté, l\'innocence et la sophistication.', 1),
(6, 'Thym', 'Le thym est une petite plante aromatique à feuilles persistantes qui produit des fleurs roses ou violettes. Le thym est souvent utilisé comme épice dans la cuisine et est également connu pour ses propriétés médicinales, notamment pour soulager les maux de gorge et la congestion.', 1),
(7, 'Tournesol', 'Le tournesol est une plante annuelle qui produit de grandes fleurs jaunes avec un centre brun. Les tournesols sont cultivés pour leurs graines comestibles riches en nutriments et leur beauté ornementale.', 1),
(8, 'Verveine', 'La verveine est une petite plante herbacée qui produit des grappes de fleurs roses, violettes ou blanches. La verveine est souvent utilisée en médecine traditionnelle pour traiter l\'anxiété, l\'insomnie et la douleur.', 1),
(9, 'Chicorée', 'La chicorée est une plante vivace qui produit des fleurs bleues ou violettes. La chicorée est souvent utilisée comme substitut de café et est également cultivée comme légume-feuille.', 1),
(10, 'Pissenlit', 'Le pissenlit est une plante herbacée qui produit des fleurs jaunes en forme de pissenlit et des feuilles vertes lobées. Le pissenlit est souvent considéré comme une mauvaise herbe, mais il est également utilisé pour ses propriétés médicinales, notamment pour traiter les problèmes digestifs et rénaux.', 1),
(11, 'Orchidée Calypso', 'L\'orchidée Calypso est une petite orchidée terrestre qui produit de petites fleurs roses ou mauves avec des taches violettes foncées. L\'orchidée Calypso est souvent considérée comme une plante sauvage rare et est donc protégée dans certaines régions.', 1),
(12, 'Orchidée Ophrys', 'Orchidée Ophrys - L\'orchidée Ophrys est une petite orchidée terrestre qui produit des fleurs en forme d\'abeille dans une variété de couleurs, y compris le brun, le jaune et le rose. Les orchidées Ophrys sont souvent associées à la pollinisation des insectes et sont donc populaires auprès des apiculteurs.', 1),
(13, 'Acanthe', 'L\'acanthe est une plante vivace qui produit des fleurs en forme d\'épi dans une variété de couleurs, y compris le blanc, le rose et le violet. Les feuilles d\'acanthe sont souvent utilisées comme motif décoratif dans l\'art et l\'architecture.', 1),
(14, 'Arnica', 'L\'arnica est une petite plante vivace qui produit des fleurs jaunes vives. L\'arnica est souvent utilisée pour traiter les douleurs musculaires et articulaires, ainsi que pour réduire l\'inflammation.', 1),
(15, 'Ancolie', 'L\'ancolie est une plante vivace qui produit des fleurs en forme de cloche dans une variété de couleurs, y compris le bleu, le violet et le rose. Les ancolies sont souvent utilisées comme plantes ornementales dans les jardins et les parcs.', 1),
(16, 'Dauphinelles', 'Les dauphinelles sont des plantes vivaces qui produisent des fleurs en forme de cloche dans une variété de couleurs, y compris le blanc, le rose et le violet. Les dauphinelles sont souvent utilisées comme plantes ornementales dans les jardins et les parcs.', 1),
(17, 'Fraisier', 'Le fraisier est une petite plante vivace qui produit des fleurs blanches et des fruits rouges comestibles. Les fraisiers sont populaires pour leur goût sucré et sont souvent utilisés dans les desserts et les boissons. Les fraisiers sont également cultivés comme plantes ornementales.', 1),
(18, 'Laser', NULL, 1),
(19, 'Liatris', NULL, 1),
(20, 'Lin', NULL, 1),
(21, 'Lupin', NULL, 1),
(22, 'Magnolia', NULL, 1),
(23, 'Marguerite', NULL, 1),
(24, 'Mimosa', NULL, 1),
(25, 'Passiflore', NULL, 1),
(26, 'Pivoine', NULL, 1),
(27, 'Rose', NULL, 1),
(28, 'Baobab', NULL, 2),
(29, 'Eucalyptus', NULL, 2),
(30, 'Pin', NULL, 2),
(31, 'Sapin', NULL, 2),
(32, 'Charme', NULL, 2),
(33, 'Erable', NULL, 2),
(34, 'Litchi', NULL, 2),
(35, 'Macadamia', NULL, 2),
(36, 'Bouleau', NULL, 2),
(37, 'Chêne', NULL, 2),
(38, 'Albiza', NULL, 2),
(39, 'Mimosa', NULL, 2),
(40, 'Pivoine', NULL, 3),
(41, 'Jasmin', NULL, 3),
(42, 'Romarin', NULL, 3),
(43, 'Lavande', NULL, 3),
(44, 'Azalée', NULL, 3),
(45, 'Sureau', NULL, 3),
(46, 'Sumac', NULL, 3),
(47, 'Citrus', NULL, 3),
(48, 'Myrtillier', NULL, 3),
(49, 'Grenadier', NULL, 3),
(50, 'Ronce', NULL, 3),
(51, 'Myrte', NULL, 3),
(52, 'Yucca', NULL, 3),
(53, 'Lierre', NULL, 4),
(54, 'Glycine', NULL, 4),
(55, 'Gelsemium', NULL, 4),
(56, 'Bignone', NULL, 4),
(57, 'Jasmin étoilé', NULL, 4),
(58, 'Thunbergia', NULL, 4);

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

DROP TABLE IF EXISTS `commentaire`;
CREATE TABLE IF NOT EXISTS `commentaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `titre` varchar(255) NOT NULL,
  `auteur` int(11) NOT NULL,
  `garde_plante` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKnff0yvgs0rj9tcx4vrwlg2din` (`auteur`),
  KEY `FK8ek8479yoeg9u3youvxw2tj3s` (`garde_plante`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `commentaire`
--

INSERT INTO `commentaire` (`id`, `description`, `titre`, `auteur`, `garde_plante`) VALUES
(1, 'Très belle', 'Visite', 2, 1),
(2, 'Arrosé et Coupé', 'Passage le matin', 6, 2),
(3, 'Arrosage et coupage', 'Passage Soir', 6, 2),
(4, '2x dans la journée', 'Arrosage', 6, 2),
(5, 'Mis au soleil', 'lumière', 6, 2);

-- --------------------------------------------------------

--
-- Structure de la table `garde_plante`
--

DROP TABLE IF EXISTS `garde_plante`;
CREATE TABLE IF NOT EXISTS `garde_plante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `gardien` int(11) DEFAULT NULL,
  `plante` int(11) NOT NULL,
  `statut` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5yg6mvwnhihkswkx2d374x3xh` (`gardien`),
  KEY `FKmodog76yh8ujlnqj7bx1bpiev` (`plante`),
  KEY `statutGardePlante_fk` (`statut`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `garde_plante`
--

INSERT INTO `garde_plante` (`id`, `date_debut`, `date_fin`, `gardien`, `plante`, `statut`) VALUES
(1, '2023-02-01', '2023-02-02', 6, 1, 1),
(2, '2023-02-05', '2023-02-07', 6, 2, 1),
(3, '2023-02-19', '2023-02-21', NULL, 3, 3),
(4, '2023-02-08', '2023-02-22', NULL, 4, 2),
(5, '2023-02-20', '2023-02-28', NULL, 5, 3),
(6, '2023-02-08', '2023-02-21', 6, 8, 1),
(10, '2023-02-09', '2023-02-21', NULL, 7, 2),
(11, '2023-03-01', '2023-03-09', NULL, 10, 2),
(12, '2023-03-09', '2023-03-10', NULL, 10, 2);

-- --------------------------------------------------------

--
-- Structure de la table `guide_plante`
--

DROP TABLE IF EXISTS `guide_plante`;
CREATE TABLE IF NOT EXISTS `guide_plante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `titre` varchar(255) NOT NULL,
  `bibliotheque_plante` int(11) DEFAULT NULL,
  `type_guide` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9mt98orxhggr93rqykvsfdlq4` (`type_guide`),
  KEY `bibliotheque_plante_guide_fk` (`bibliotheque_plante`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `guide_plante`
--

INSERT INTO `guide_plante` (`id`, `description`, `titre`, `bibliotheque_plante`, `type_guide`) VALUES
(1, 'Besoin moyen en eau, arroser régulièrement mais pas d\'accumulation', 'Toutes les 3 semaines', 1, 2),
(2, 'Aime pousser en plein soleil, apporte force et tonus (6h par jour)', 'Plein soleil', 1, 1),
(3, 'Engrais Liquide', 'Toutes les 2 semaines', 1, 3),
(4, 'Engrais à libération lente', 'Tous les 2 mois', 1, 3);

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `personne`
--

INSERT INTO `personne` (`id`, `adresse`, `cp`, `email`, `mdp`, `nom`, `prenom`, `ville`, `role`) VALUES
(1, '8 rue jean-marie Leclair', 69009, 'erine@epsi.fr', '$2y$10$6tJlAT5fxA4p0zFLV9E8gOVfSgIzjVhuOozkLRjTicjqyTn2e80b6', 'BERARD', 'Erine', 'Lyon', 1),
(2, '30 rue du docteur bonhomme', 69008, 'jade@epsi.de', '$2y$10$CnFp56JiHCKbFGnLrGCuaONrv.itCx4exZZ6xTJcenUcA7M5Iij4O', 'DOMAS-VASSEROT', 'Jade', 'Lyon', 2),
(3, '40 rue francisque jomard', 69600, 'pacome.guillermin@epsi.fr', '$2y$10$CnFp56JiHCKbFGnLrGCuaONrv.itCx4exZZ6xTJcenUcA7M5Iij4O', 'GUILLERMIN', 'Pacôme', 'Oullins', 3),
(4, 'Charpennes, Cours Emile Zola', 69100, 'hugo.briday@epsi.fr', '$2y$10$CnFp56JiHCKbFGnLrGCuaONrv.itCx4exZZ6xTJcenUcA7M5Iij4O', 'BRIDAY', 'Hugo', 'Villeurbanne', 4),
(5, 'Route de l\'écluse Brotteau', 73310, 'ducan.delatte@epsi.fr', '$2y$10$CnFp56JiHCKbFGnLrGCuaONrv.itCx4exZZ6xTJcenUcA7M5Iij4O', 'DELATTE', 'Duncan', 'Vions', 5),
(6, 'Avenue de la république', 75000, '123@gmail.com', '$2a$10$MVqNYvKM7I55dyY9yA2r.Ox4Q9wyHpscUjy3lu7M5Sn2nllbe.7JC', 'DOMAS', 'Jade', 'Paris', 2);

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `photoplante`
--

INSERT INTO `photoplante` (`id`, `photo`, `plante`) VALUES
(1, 'tulipe.jpg', 1),
(2, 'tulipe2.jpg', 1),
(3, 'tulipe3.jpg', 1),
(5, 'hortensia.jpg', 2),
(6, 'hortensia2.Jpg', 2),
(7, 'iris.jpg', 3),
(8, 'thym.jpg', 6),
(9, 'tournesol.jpg', 7);

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
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `photo_bibliotheque_plante`
--

INSERT INTO `photo_bibliotheque_plante` (`id`, `photo`, `bibliotheque_plante`) VALUES
(1, 'tulipe.jpg', 1),
(2, 'hortensia.jpg', 2),
(3, 'iris.jpg', 3),
(4, 'hibiscus.jpg', 4),
(5, 'lys.jpg', 5),
(6, 'thym.jpg', 6),
(7, 'tournesol.jpg', 7),
(8, 'verveine.jpg', 8),
(9, 'chicorée.jpg', 9),
(10, 'pissenlit.jpg', 10),
(11, 'orchidée_calypso.jpg', 11),
(12, 'orchidée_ophrys.jpg', 12),
(13, 'acanthe.jpg', 13),
(14, 'arnica.jpg', 14),
(15, 'ancolie.jpg', 15),
(16, 'dauphinelle.jpg', 16),
(17, 'fraisier.jpg', 17),
(18, 'laser.jpg', 18),
(19, 'liatris.jpg', 19),
(20, 'lin.jpg', 20),
(21, 'lupin.jpg', 21),
(22, 'magnolia.jpg', 22),
(23, 'marguerite.jpg', 23),
(24, 'mimosa.jpg', 24),
(25, 'passiflore.jpg', 25),
(26, 'pivoine.jpg', 26),
(27, 'rose.jpg', 27),
(28, 'baobab.jpg', 28),
(29, 'eucalyptus.jpg', 29),
(30, 'pin.jpg', 30),
(31, 'sapin.jpg', 31),
(32, 'charme.jpg', 32),
(33, 'erable.jpg', 33),
(34, 'litchi.jpg', 34),
(35, 'macadamia.jpg', 35),
(36, 'bouleau.jpg', 36),
(37, 'chene.jpg', 37),
(38, 'albiza.jpg', 38),
(39, 'mimosa_arbre.jpg', 39),
(40, 'pivoine_arbuste.jpg', 40),
(41, 'jasmin-arbuste.jpg', 41),
(42, 'romarin.jpg', 42),
(43, 'lavande.jpg', 43),
(44, 'azalée.jpg', 44),
(45, 'sureau.jpg', 45),
(46, 'sumac.jpg', 46),
(47, 'citrus.jpg', 47),
(48, 'myrtillier.jpg', 48),
(49, 'grenadier.jpg', 49),
(50, 'ronce.jpg', 50),
(51, 'myrte.jpg', 51),
(52, 'yucca.jpg', 52),
(53, 'lierre.jpg', 53),
(54, 'glycine.jpg', 54),
(55, 'gelsemium.jpg', 55),
(56, 'bignone.jpg', 56),
(57, 'jasmin_etoile.jpg', 57),
(58, 'thunbergia.jpg', 58),
(59, 'tulipe2.jpg', 1);

-- --------------------------------------------------------

--
-- Structure de la table `plante`
--

DROP TABLE IF EXISTS `plante`;
CREATE TABLE IF NOT EXISTS `plante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `localisation` varchar(255) DEFAULT NULL,
  `bibliotheque_plante` int(11) NOT NULL,
  `proprietaire` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK507hphahoiwqvc6kpmw6155xh` (`bibliotheque_plante`),
  KEY `FK32q2m43wjfrl6j88cjgt9b57a` (`proprietaire`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `plante`
--

INSERT INTO `plante` (`id`, `localisation`, `bibliotheque_plante`, `proprietaire`) VALUES
(1, 'Salon', 1, 1),
(2, 'Cuisine', 2, 2),
(3, 'Terrasse', 3, 3),
(4, 'Cuisine', 4, 4),
(5, 'Jardin', 5, 5),
(6, 'Chambre', 6, 6),
(7, 'Salle de bain', 7, 2),
(8, 'Cave', 8, 3),
(10, 'Jardin Annexe', 1, 6);

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
(3, 'Terminée');

-- --------------------------------------------------------

--
-- Structure de la table `type_guide`
--

DROP TABLE IF EXISTS `type_guide`;
CREATE TABLE IF NOT EXISTS `type_guide` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `type_guide`
--

INSERT INTO `type_guide` (`id`, `nom`) VALUES
(1, 'Lumière'),
(2, 'Arrosage'),
(3, 'Fertilité'),
(10, 'Saison'),
(11, 'Lieu'),
(12, 'Localisation'),
(13, 'Maladie'),
(14, 'Taille');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `type_plante`
--

INSERT INTO `type_plante` (`id`, `description`, `nom`) VALUES
(1, 'La fleur est la structure reproductrice caractéristique des plantes qui produisent des graines. Elle contient les organes reproducteurs des plantes à fleurs, les pistils femelles et les étamines mâles.', 'Fleur'),
(2, 'Un arbre est une plante pérenne qui possède un tronc ou une tige allongée et qui est composé de branches et de feuilles pour la plupart des espèces', 'Arbre'),
(3, 'Il s\'agit des très nombreuses plantes à mi-chemin entre les plantes herbacées et les arbres. Les arbustes forment du bois ', 'Arbustes'),
(4, 'Elles forment des tiges fines par rapport à leur longueur. Une grosse clématite ne dépasse jamais 1 cm de diamètre, et une vénérable bignone atteindra 10 cm de diamètre.', 'Lianes ou Plantes Grimpantes');

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
  `commentaire` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKalm3d5jency8n3ioetwdydktg` (`garde_plante`),
  KEY `FKaff692s6uqd17jbt5i7k4731x` (`gardien`),
  KEY `FKhwbo8fve138wmexo38qny1tfr` (`plante`),
  KEY `visite_plante_commentaire_null_fk` (`commentaire`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `visite_plante`
--

INSERT INTO `visite_plante` (`id`, `date_visite`, `photo`, `garde_plante`, `gardien`, `plante`, `commentaire`) VALUES
(1, '2023-03-01', 'tulipe.jpg', 1, 6, 1, 1),
(2, '2023-03-01', NULL, 2, 6, 2, 3),
(3, '2023-03-01', NULL, 2, 6, 2, 4),
(4, '2023-02-15', NULL, 2, 6, 2, 5);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `bibliotheque_plante`
--
ALTER TABLE `bibliotheque_plante`
  ADD CONSTRAINT `FK5me4i5xnxe7js6m5cnlnmx1ko` FOREIGN KEY (`type_plante`) REFERENCES `type_plante` (`id`);

--
-- Contraintes pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD CONSTRAINT `FKnff0yvgs0rj9tcx4vrwlg2din` FOREIGN KEY (`auteur`) REFERENCES `personne` (`id`),
  ADD CONSTRAINT `commentaire_garde_plante_null_fk` FOREIGN KEY (`garde_plante`) REFERENCES `garde_plante` (`id`);

--
-- Contraintes pour la table `garde_plante`
--
ALTER TABLE `garde_plante`
  ADD CONSTRAINT `FK5yg6mvwnhihkswkx2d374x3xh` FOREIGN KEY (`gardien`) REFERENCES `personne` (`id`),
  ADD CONSTRAINT `FKmodog76yh8ujlnqj7bx1bpiev` FOREIGN KEY (`plante`) REFERENCES `plante` (`id`),
  ADD CONSTRAINT `statutGardePlante_fk` FOREIGN KEY (`statut`) REFERENCES `statut_plante` (`id`);

--
-- Contraintes pour la table `guide_plante`
--
ALTER TABLE `guide_plante`
  ADD CONSTRAINT `FK9mt98orxhggr93rqykvsfdlq4` FOREIGN KEY (`type_guide`) REFERENCES `type_guide` (`id`),
  ADD CONSTRAINT `bibliotheque_plante_guide_fk` FOREIGN KEY (`bibliotheque_plante`) REFERENCES `bibliotheque_plante` (`id`);

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
  ADD CONSTRAINT `FK507hphahoiwqvc6kpmw6155xh` FOREIGN KEY (`bibliotheque_plante`) REFERENCES `bibliotheque_plante` (`id`);

--
-- Contraintes pour la table `visite_plante`
--
ALTER TABLE `visite_plante`
  ADD CONSTRAINT `FKaff692s6uqd17jbt5i7k4731x` FOREIGN KEY (`gardien`) REFERENCES `personne` (`id`),
  ADD CONSTRAINT `FKalm3d5jency8n3ioetwdydktg` FOREIGN KEY (`garde_plante`) REFERENCES `garde_plante` (`id`),
  ADD CONSTRAINT `FKhwbo8fve138wmexo38qny1tfr` FOREIGN KEY (`plante`) REFERENCES `plante` (`id`),
  ADD CONSTRAINT `visite_plante_commentaire_null_fk` FOREIGN KEY (`commentaire`) REFERENCES `commentaire` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
