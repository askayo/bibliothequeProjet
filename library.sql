-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  sam. 16 nov. 2019 à 15:38
-- Version du serveur :  5.7.26
-- Version de PHP :  7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `library`
--

-- --------------------------------------------------------

--
-- Structure de la table `abonnes`
--

DROP TABLE IF EXISTS `abonnes`;
CREATE TABLE IF NOT EXISTS `abonnes` (
  `abo_id` int(11) NOT NULL AUTO_INCREMENT,
  `abo_genre` char(1) NOT NULL,
  `abo_prenom` varchar(40) NOT NULL,
  `abo_nom` varchar(40) NOT NULL,
  `abo_adresse` varchar(200) NOT NULL,
  `abo_tel` varchar(20) NOT NULL,
  `abo_role` varchar(6) NOT NULL,
  `abo_login` varchar(30) NOT NULL,
  `abo_mdp` varchar(255) NOT NULL,
  PRIMARY KEY (`abo_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `abonnes`
--

INSERT INTO `abonnes` (`abo_id`, `abo_genre`, `abo_prenom`, `abo_nom`, `abo_adresse`, `abo_tel`, `abo_role`, `abo_login`, `abo_mdp`) VALUES
(1, 'm', 'Jérôme', 'Landre', '10 rue Quebec', '0303030393', 'admin', 'jlandre', '123456'),
(2, 'm', 'jesus', 'noir', '3 rue de potiers', '0231039493', 'admin', 'jesusn', '123456');

-- --------------------------------------------------------

--
-- Structure de la table `emprunter`
--

DROP TABLE IF EXISTS `emprunter`;
CREATE TABLE IF NOT EXISTS `emprunter` (
  `emprunter_id` int(11) NOT NULL AUTO_INCREMENT,
  `_livre_id` int(11) NOT NULL,
  `_abo_id` int(11) NOT NULL,
  `date_emprunt` date NOT NULL,
  `date_retour` date NOT NULL,
  PRIMARY KEY (`emprunter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `livres`
--

DROP TABLE IF EXISTS `livres`;
CREATE TABLE IF NOT EXISTS `livres` (
  `livre_id` int(11) NOT NULL AUTO_INCREMENT,
  `livre_titre` varchar(50) NOT NULL,
  `livre_auteur` varchar(50) NOT NULL,
  `livre_editeur` varchar(50) NOT NULL,
  `livre_nbpage` int(11) NOT NULL,
  `livre_resume` varchar(255) NOT NULL,
  PRIMARY KEY (`livre_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `livres`
--

INSERT INTO `livres` (`livre_id`, `livre_titre`, `livre_auteur`, `livre_editeur`, `livre_nbpage`, `livre_resume`) VALUES
(1, 'Livre de la jungle', 'mowgli', 'Sony', 50, 'yes livre of the jungle'),
(2, 'Los miserables', 'Victoro Hugo', 'Editoro', 200, 'Juan Val Juan come el pollo con chocolate');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
