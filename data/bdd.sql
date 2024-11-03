-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 03 nov. 2024 à 20:49
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
-- Base de données : `omeka_s`
--

-- --------------------------------------------------------

--
-- Structure de la table `api_key`
--

CREATE TABLE `api_key` (
  `id` varchar(32) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `label` varchar(255) NOT NULL,
  `credential_hash` varchar(60) NOT NULL,
  `last_ip` varbinary(16) DEFAULT NULL COMMENT '(DC2Type:ip_address)',
  `last_accessed` datetime DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `asset`
--

CREATE TABLE `asset` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `media_type` varchar(255) NOT NULL,
  `storage_id` varchar(190) NOT NULL,
  `extension` varchar(255) DEFAULT NULL,
  `alt_text` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `asset`
--

INSERT INTO `asset` (`id`, `owner_id`, `name`, `media_type`, `storage_id`, `extension`, `alt_text`) VALUES
(1, 1, '1f97e02d-39fc-467d-8bd9-993f23d93a44.jpeg', 'image/jpeg', '2a1680e3d5eec47513226193ba2ba7c362a33bd1', 'jpeg', '');

-- --------------------------------------------------------

--
-- Structure de la table `csvimport_entity`
--

CREATE TABLE `csvimport_entity` (
  `id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `entity_id` int(11) NOT NULL,
  `resource_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `csvimport_import`
--

CREATE TABLE `csvimport_import` (
  `id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `undo_job_id` int(11) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `resource_type` varchar(255) NOT NULL,
  `has_err` tinyint(1) NOT NULL,
  `stats` longtext NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `fulltext_search`
--

CREATE TABLE `fulltext_search` (
  `id` int(11) NOT NULL,
  `resource` varchar(190) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `title` longtext DEFAULT NULL,
  `text` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `fulltext_search`
--

INSERT INTO `fulltext_search` (`id`, `resource`, `owner_id`, `is_public`, `title`, `text`) VALUES
(2, 'items', 1, 1, 'Développeur - Team member', 'Développeur - Team member\nMathieu\nCette personne est un développeur\nJava, PHP\nOui\nRéseau IoT d\'une ville intelligente : Mathieu a contribué au développement d\'une application qui collecte et analyse les données des capteurs de pollution et de circulation dans la ville.'),
(3, 'items', 1, 1, 'Administrateur Réseau - Team member', 'Administrateur Réseau - Team member\nNour\nCette personne est un admin. réseau\nLAN, IoT, WAN\nWireshark, Nagios, PRTG Network Monitor\nIPsec (Internet Protocol Security), SSL/TLS (Secure Sockets Layer / Transport Layer Security)\nLes serveurs et dispositifs de réseau de l\'entreprise.\nLes capteurs IoT et les applications utilisées par les employés.\nLa sécurité du réseau et des données.\nLa maintenance et le dépannage des systèmes réseau.'),
(4, 'items', 1, 1, 'Utilisateur final', 'Utilisateur final\nOumaïma\nCette personne est un utilisateur\nTraqueurs Bluetooth, Montres ou bracelets de fitness basiques\nSécurité Intermédiaire'),
(5, 'items', 1, 1, 'Utilisateur final 2', 'Utilisateur final 2\nHamza\nCette personne est un utilisateur\nMoniteurs de fréquence cardiaque, Tensiomètres, Capteurs de glycémie\nSécurité particulièrement élevée'),
(6, 'items', 1, 1, 'Utilisateur final 3', 'Utilisateur final 3\nImane\nCette personne est un utilisateur\nEclairages, Détecteurs de mouvement\nSécurité modérée'),
(7, 'items', 1, 1, 'Administrateur Réseau - Team member 2', 'Administrateur Réseau - Team member 2\nImad\nCette personne est un admin. réseau\nSAN (Storage Area Network)\nManageEngine OpManager\nRADIUS (Remote Authentication Dial-In User Service)\nLes dispositifs de stockage et les serveurs de sauvegarde.\nLes réseaux de communication entre les systèmes de stockage.\nLa gestion des performances de stockage.\nLa protection des données et la conformité aux politiques de sécurité.'),
(8, 'items', 1, 1, 'Administrateur Réseau - Team member 3', 'Administrateur Réseau - Team member 3\nAlae\nCette personne est un admin. réseau\nVPN (Virtual Private Network)\nSolarWinds Network Performance Monitor\nSSH (Secure Shell)\nLes serveurs d\'applications de l\'entreprise.\nLes routeurs et commutateurs du réseau.\nLa sécurité des données lors des connexions distantes.\nLa maintenance du réseau, assurant sa disponibilité et sa performance.'),
(9, 'items', 1, 1, 'Développeur - Team member 2', 'Développeur - Team member 2\nClara\nCette personne est une développeuse spécialisée dans le développement d\'applications web et mobiles.\nJavaScript, Python\nOui ; Accès aux bases de données pour l\'extraction et l\'analyse des données de l\'application.\nRéseau IoT de gestion de l\'énergie : Clara a développé une application permettant de suivre la consommation d\'énergie des appareils dans les foyers.'),
(10, 'items', 1, 1, 'Développeur - Team member 3', 'Développeur - Team member 3\nLucas\nCette personne est un développeur spécialisé dans les systèmes embarqués et le développement logiciel.\nC/C++, Ruby\nOui ; Accès aux flux de données des capteurs pour les intégrer dans les applications.\nRéseau IoT de surveillance environnementale : Lucas a développé le logiciel embarqué pour des capteurs de qualité de l\'air.'),
(11, 'items', 1, 1, 'Anomalie détectée', 'Anomalie détectée\nAnomalie de température anormale détectée\nLa température enregistrée par l\'appareil dépasse les limites acceptables.\n2024-11-03T16:00:00Z\nAnomalie de température\nCapteur de température DEF\nAlerte de température envoyée et évaluation des capteurs.'),
(12, 'items', 1, 1, 'Anomalie détectée 2', 'Anomalie détectée 2\nDéconnexion d\'un appareil connecté\nL\'appareil connecté a perdu la connexion au réseau.\n2024-11-02T09:15:00Z\nDéconnexion\nThermostat intelligent ABC\nRedémarrage automatique de l\'appareil et vérification du réseau.'),
(13, 'items', 1, 1, 'Anomalie détectée 3', 'Anomalie détectée 3\nIntrusion détectée dans le réseau\nUne intrusion a été détectée dans le réseau de l\'appareil de surveillance.\n2024-11-01T14:30:00Z\nIntrusion\nCaméra de sécurité d\'entrée\nBlocage de l\'accès et alerte envoyée à l\'administrateur.'),
(14, 'items', 1, 1, 'Appareil connecté', 'Appareil connecté \nCaméra de Sécurité\nCaméra de sécurité IP avec détection de mouvement et notifications en temps réel.\nCaméra IP\nUtilisateur IoT 001\nN/A'),
(15, 'items', 1, 1, 'Appareil connecté 2', 'Appareil connecté 2\nThermostat intelligent\nThermostat programmable avec contrôle à distance via une application mobile.\nThermostat\nUtilisateur IoT 002\nAucun'),
(16, 'items', 1, 1, 'Appareil connecté 3', 'Appareil connecté 3\nAmpoule connectée\nAmpoule LED avec contrôle de la luminosité et changement de couleur via application.\nAmpoule intelligente\nUtilisateur IoT 003\nAucun'),
(17, 'items', 1, 1, 'Réseau utilisé', 'Réseau utilisé \nRéseau Wi-Fi Maison\nRéseau Wi-Fi sécurisé utilisé pour les appareils domestiques IoT.\nWi-Fi\nÉlevé\nDéveloppeur 001'),
(18, 'items', 1, 1, 'Réseau utilisé 2', 'Réseau utilisé 2\nRéseau IoT Public Communautaire\nRéseau IoT accessible au public pour le suivi de la qualité de l\'air.\nIoT\nMoyen\nDéveloppeur 002'),
(19, 'items', 1, 1, 'Réseau utilisé 3', 'Réseau utilisé 3\nRéseau Privé de l\'Entreprise\n Réseau sécurisé utilisé par les employés pour accéder aux ressources de l\'entreprise.\nLAN\nTrès Élevé\nDéveloppeur 003');

-- --------------------------------------------------------

--
-- Structure de la table `item`
--

CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `primary_media_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `item`
--

INSERT INTO `item` (`id`, `primary_media_id`) VALUES
(2, NULL),
(3, NULL),
(4, NULL),
(5, NULL),
(6, NULL),
(7, NULL),
(8, NULL),
(9, NULL),
(10, NULL),
(11, NULL),
(12, NULL),
(13, NULL),
(14, NULL),
(15, NULL),
(16, NULL),
(17, NULL),
(18, NULL),
(19, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `item_item_set`
--

CREATE TABLE `item_item_set` (
  `item_id` int(11) NOT NULL,
  `item_set_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `item_set`
--

CREATE TABLE `item_set` (
  `id` int(11) NOT NULL,
  `is_open` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `item_site`
--

CREATE TABLE `item_site` (
  `item_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `job`
--

CREATE TABLE `job` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `class` varchar(255) NOT NULL,
  `args` longtext DEFAULT NULL COMMENT '(DC2Type:json_array)',
  `log` longtext DEFAULT NULL,
  `started` datetime NOT NULL,
  `ended` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `media`
--

CREATE TABLE `media` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `ingester` varchar(255) NOT NULL,
  `renderer` varchar(255) NOT NULL,
  `data` longtext DEFAULT NULL COMMENT '(DC2Type:json_array)',
  `source` longtext DEFAULT NULL,
  `media_type` varchar(255) DEFAULT NULL,
  `storage_id` varchar(190) DEFAULT NULL,
  `extension` varchar(255) DEFAULT NULL,
  `sha256` char(64) DEFAULT NULL,
  `size` bigint(20) DEFAULT NULL,
  `has_original` tinyint(1) NOT NULL,
  `has_thumbnails` tinyint(1) NOT NULL,
  `position` int(11) DEFAULT NULL,
  `lang` varchar(190) DEFAULT NULL,
  `alt_text` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migration`
--

INSERT INTO `migration` (`version`) VALUES
('20171128053327'),
('20180412035023'),
('20180919072656'),
('20180924033501'),
('20181002015551'),
('20181004043735'),
('20181106060421'),
('20190307043537'),
('20190319020708'),
('20190412090532'),
('20190423040354'),
('20190423071228'),
('20190514061351'),
('20190515055359'),
('20190729023728'),
('20190809092609'),
('20190815062003'),
('20200224022356'),
('20200226064602'),
('20200325091157'),
('20200326091310'),
('20200803000000'),
('20200831000000'),
('20210205101827'),
('20210225095734'),
('20210810083804'),
('20220718090449'),
('20220824103916'),
('20230124033031'),
('20230410074846'),
('20230523085358'),
('20230601060113'),
('20230713101012'),
('20231016000000'),
('20240103030617');

-- --------------------------------------------------------

--
-- Structure de la table `module`
--

CREATE TABLE `module` (
  `id` varchar(190) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `version` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `module`
--

INSERT INTO `module` (`id`, `is_active`, `version`) VALUES
('CSVImport', 1, '2.6.1');

-- --------------------------------------------------------

--
-- Structure de la table `password_creation`
--

CREATE TABLE `password_creation` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `activate` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `property`
--

CREATE TABLE `property` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `vocabulary_id` int(11) NOT NULL,
  `local_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) NOT NULL,
  `comment` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `property`
--

INSERT INTO `property` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(1, NULL, 1, 'title', 'Title', 'A name given to the resource.'),
(2, NULL, 1, 'creator', 'Creator', 'An entity primarily responsible for making the resource.'),
(3, NULL, 1, 'subject', 'Subject', 'The topic of the resource.'),
(4, NULL, 1, 'description', 'Description', 'An account of the resource.'),
(5, NULL, 1, 'publisher', 'Publisher', 'An entity responsible for making the resource available.'),
(6, NULL, 1, 'contributor', 'Contributor', 'An entity responsible for making contributions to the resource.'),
(7, NULL, 1, 'date', 'Date', 'A point or period of time associated with an event in the lifecycle of the resource.'),
(8, NULL, 1, 'type', 'Type', 'The nature or genre of the resource.'),
(9, NULL, 1, 'format', 'Format', 'The file format, physical medium, or dimensions of the resource.'),
(10, NULL, 1, 'identifier', 'Identifier', 'An unambiguous reference to the resource within a given context.'),
(11, NULL, 1, 'source', 'Source', 'A related resource from which the described resource is derived.'),
(12, NULL, 1, 'language', 'Language', 'A language of the resource.'),
(13, NULL, 1, 'relation', 'Relation', 'A related resource.'),
(14, NULL, 1, 'coverage', 'Coverage', 'The spatial or temporal topic of the resource, the spatial applicability of the resource, or the jurisdiction under which the resource is relevant.'),
(15, NULL, 1, 'rights', 'Rights', 'Information about rights held in and over the resource.'),
(16, NULL, 1, 'audience', 'Audience', 'A class of entity for whom the resource is intended or useful.'),
(17, NULL, 1, 'alternative', 'Alternative Title', 'An alternative name for the resource.'),
(18, NULL, 1, 'tableOfContents', 'Table Of Contents', 'A list of subunits of the resource.'),
(19, NULL, 1, 'abstract', 'Abstract', 'A summary of the resource.'),
(20, NULL, 1, 'created', 'Date Created', 'Date of creation of the resource.'),
(21, NULL, 1, 'valid', 'Date Valid', 'Date (often a range) of validity of a resource.'),
(22, NULL, 1, 'available', 'Date Available', 'Date (often a range) that the resource became or will become available.'),
(23, NULL, 1, 'issued', 'Date Issued', 'Date of formal issuance (e.g., publication) of the resource.'),
(24, NULL, 1, 'modified', 'Date Modified', 'Date on which the resource was changed.'),
(25, NULL, 1, 'extent', 'Extent', 'The size or duration of the resource.'),
(26, NULL, 1, 'medium', 'Medium', 'The material or physical carrier of the resource.'),
(27, NULL, 1, 'isVersionOf', 'Is Version Of', 'A related resource of which the described resource is a version, edition, or adaptation.'),
(28, NULL, 1, 'hasVersion', 'Has Version', 'A related resource that is a version, edition, or adaptation of the described resource.'),
(29, NULL, 1, 'isReplacedBy', 'Is Replaced By', 'A related resource that supplants, displaces, or supersedes the described resource.'),
(30, NULL, 1, 'replaces', 'Replaces', 'A related resource that is supplanted, displaced, or superseded by the described resource.'),
(31, NULL, 1, 'isRequiredBy', 'Is Required By', 'A related resource that requires the described resource to support its function, delivery, or coherence.'),
(32, NULL, 1, 'requires', 'Requires', 'A related resource that is required by the described resource to support its function, delivery, or coherence.'),
(33, NULL, 1, 'isPartOf', 'Is Part Of', 'A related resource in which the described resource is physically or logically included.'),
(34, NULL, 1, 'hasPart', 'Has Part', 'A related resource that is included either physically or logically in the described resource.'),
(35, NULL, 1, 'isReferencedBy', 'Is Referenced By', 'A related resource that references, cites, or otherwise points to the described resource.'),
(36, NULL, 1, 'references', 'References', 'A related resource that is referenced, cited, or otherwise pointed to by the described resource.'),
(37, NULL, 1, 'isFormatOf', 'Is Format Of', 'A related resource that is substantially the same as the described resource, but in another format.'),
(38, NULL, 1, 'hasFormat', 'Has Format', 'A related resource that is substantially the same as the pre-existing described resource, but in another format.'),
(39, NULL, 1, 'conformsTo', 'Conforms To', 'An established standard to which the described resource conforms.'),
(40, NULL, 1, 'spatial', 'Spatial Coverage', 'Spatial characteristics of the resource.'),
(41, NULL, 1, 'temporal', 'Temporal Coverage', 'Temporal characteristics of the resource.'),
(42, NULL, 1, 'mediator', 'Mediator', 'An entity that mediates access to the resource and for whom the resource is intended or useful.'),
(43, NULL, 1, 'dateAccepted', 'Date Accepted', 'Date of acceptance of the resource.'),
(44, NULL, 1, 'dateCopyrighted', 'Date Copyrighted', 'Date of copyright.'),
(45, NULL, 1, 'dateSubmitted', 'Date Submitted', 'Date of submission of the resource.'),
(46, NULL, 1, 'educationLevel', 'Audience Education Level', 'A class of entity, defined in terms of progression through an educational or training context, for which the described resource is intended.'),
(47, NULL, 1, 'accessRights', 'Access Rights', 'Information about who can access the resource or an indication of its security status.'),
(48, NULL, 1, 'bibliographicCitation', 'Bibliographic Citation', 'A bibliographic reference for the resource.'),
(49, NULL, 1, 'license', 'License', 'A legal document giving official permission to do something with the resource.'),
(50, NULL, 1, 'rightsHolder', 'Rights Holder', 'A person or organization owning or managing rights over the resource.'),
(51, NULL, 1, 'provenance', 'Provenance', 'A statement of any changes in ownership and custody of the resource since its creation that are significant for its authenticity, integrity, and interpretation.'),
(52, NULL, 1, 'instructionalMethod', 'Instructional Method', 'A process, used to engender knowledge, attitudes and skills, that the described resource is designed to support.'),
(53, NULL, 1, 'accrualMethod', 'Accrual Method', 'The method by which items are added to a collection.'),
(54, NULL, 1, 'accrualPeriodicity', 'Accrual Periodicity', 'The frequency with which items are added to a collection.'),
(55, NULL, 1, 'accrualPolicy', 'Accrual Policy', 'The policy governing the addition of items to a collection.'),
(56, NULL, 3, 'affirmedBy', 'affirmedBy', 'A legal decision that affirms a ruling.'),
(57, NULL, 3, 'annotates', 'annotates', 'Critical or explanatory note for a Document.'),
(58, NULL, 3, 'authorList', 'list of authors', 'An ordered list of authors. Normally, this list is seen as a priority list that order authors by importance.'),
(59, NULL, 3, 'citedBy', 'cited by', 'Relates a document to another document that cites the\nfirst document.'),
(60, NULL, 3, 'cites', 'cites', 'Relates a document to another document that is cited\nby the first document as reference, comment, review, quotation or for\nanother purpose.'),
(61, NULL, 3, 'contributorList', 'list of contributors', 'An ordered list of contributors. Normally, this list is seen as a priority list that order contributors by importance.'),
(62, NULL, 3, 'court', 'court', 'A court associated with a legal document; for example, that which issues a decision.'),
(63, NULL, 3, 'degree', 'degree', 'The thesis degree.'),
(64, NULL, 3, 'director', 'director', 'A Film director.'),
(65, NULL, 3, 'distributor', 'distributor', 'Distributor of a document or a collection of documents.'),
(66, NULL, 3, 'editor', 'editor', 'A person having managerial and sometimes policy-making responsibility for the editorial part of a publishing firm or of a newspaper, magazine, or other publication.'),
(67, NULL, 3, 'editorList', 'list of editors', 'An ordered list of editors. Normally, this list is seen as a priority list that order editors by importance.'),
(68, NULL, 3, 'interviewee', 'interviewee', 'An agent that is interviewed by another agent.'),
(69, NULL, 3, 'interviewer', 'interviewer', 'An agent that interview another agent.'),
(70, NULL, 3, 'issuer', 'issuer', 'An entity responsible for issuing often informally published documents such as press releases, reports, etc.'),
(71, NULL, 3, 'organizer', 'organizer', 'The organizer of an event; includes conference organizers, but also government agencies or other bodies that are responsible for conducting hearings.'),
(72, NULL, 3, 'owner', 'owner', 'Owner of a document or a collection of documents.'),
(73, NULL, 3, 'performer', 'performer', NULL),
(74, NULL, 3, 'presentedAt', 'presented at', 'Relates a document to an event; for example, a paper to a conference.'),
(75, NULL, 3, 'presents', 'presents', 'Relates an event to associated documents; for example, conference to a paper.'),
(76, NULL, 3, 'producer', 'producer', 'Producer of a document or a collection of documents.'),
(77, NULL, 3, 'recipient', 'recipient', 'An agent that receives a communication document.'),
(78, NULL, 3, 'reproducedIn', 'reproducedIn', 'The resource in which another resource is reproduced.'),
(79, NULL, 3, 'reversedBy', 'reversedBy', 'A legal decision that reverses a ruling.'),
(80, NULL, 3, 'reviewOf', 'review of', 'Relates a review document to a reviewed thing (resource, item, etc.).'),
(81, NULL, 3, 'status', 'status', 'The publication status of (typically academic) content.'),
(82, NULL, 3, 'subsequentLegalDecision', 'subsequentLegalDecision', 'A legal decision on appeal that takes action on a case (affirming it, reversing it, etc.).'),
(83, NULL, 3, 'transcriptOf', 'transcript of', 'Relates a document to some transcribed original.'),
(84, NULL, 3, 'translationOf', 'translation of', 'Relates a translated document to the original document.'),
(85, NULL, 3, 'translator', 'translator', 'A person who translates written document from one language to another.'),
(86, NULL, 3, 'abstract', 'abstract', 'A summary of the resource.'),
(87, NULL, 3, 'argued', 'date argued', 'The date on which a legal case is argued before a court. Date is of format xsd:date'),
(88, NULL, 3, 'asin', 'asin', NULL),
(89, NULL, 3, 'chapter', 'chapter', 'An chapter number'),
(90, NULL, 3, 'coden', 'coden', NULL),
(91, NULL, 3, 'content', 'content', 'This property is for a plain-text rendering of the content of a Document. While the plain-text content of an entire document could be described by this property.'),
(92, NULL, 3, 'doi', 'doi', NULL),
(93, NULL, 3, 'eanucc13', 'eanucc13', NULL),
(94, NULL, 3, 'edition', 'edition', 'The name defining a special edition of a document. Normally its a literal value composed of a version number and words.'),
(95, NULL, 3, 'eissn', 'eissn', NULL),
(96, NULL, 3, 'gtin14', 'gtin14', NULL),
(97, NULL, 3, 'handle', 'handle', NULL),
(98, NULL, 3, 'identifier', 'identifier', NULL),
(99, NULL, 3, 'isbn', 'isbn', NULL),
(100, NULL, 3, 'isbn10', 'isbn10', NULL),
(101, NULL, 3, 'isbn13', 'isbn13', NULL),
(102, NULL, 3, 'issn', 'issn', NULL),
(103, NULL, 3, 'issue', 'issue', 'An issue number'),
(104, NULL, 3, 'lccn', 'lccn', NULL),
(105, NULL, 3, 'locator', 'locator', 'A description (often numeric) that locates an item within a containing document or collection.'),
(106, NULL, 3, 'numPages', 'number of pages', 'The number of pages contained in a document'),
(107, NULL, 3, 'numVolumes', 'number of volumes', 'The number of volumes contained in a collection of documents (usually a series, periodical, etc.).'),
(108, NULL, 3, 'number', 'number', 'A generic item or document number. Not to be confused with issue number.'),
(109, NULL, 3, 'oclcnum', 'oclcnum', NULL),
(110, NULL, 3, 'pageEnd', 'page end', 'Ending page number within a continuous page range.'),
(111, NULL, 3, 'pageStart', 'page start', 'Starting page number within a continuous page range.'),
(112, NULL, 3, 'pages', 'pages', 'A string of non-contiguous page spans that locate a Document within a Collection. Example: 23-25, 34, 54-56. For continuous page ranges, use the pageStart and pageEnd properties.'),
(113, NULL, 3, 'pmid', 'pmid', NULL),
(114, NULL, 3, 'prefixName', 'prefix name', 'The prefix of a name'),
(115, NULL, 3, 'section', 'section', 'A section number'),
(116, NULL, 3, 'shortDescription', 'shortDescription', NULL),
(117, NULL, 3, 'shortTitle', 'short title', 'The abbreviation of a title.'),
(118, NULL, 3, 'sici', 'sici', NULL),
(119, NULL, 3, 'suffixName', 'suffix name', 'The suffix of a name'),
(120, NULL, 3, 'upc', 'upc', NULL),
(121, NULL, 3, 'uri', 'uri', 'Universal Resource Identifier of a document'),
(122, NULL, 3, 'volume', 'volume', 'A volume number'),
(123, NULL, 4, 'mbox', 'personal mailbox', 'A  personal mailbox, ie. an Internet mailbox associated with exactly one owner, the first owner of this mailbox. This is a \'static inverse functional property\', in that  there is (across time and change) at most one individual that ever has any particular value for foaf:mbox.'),
(124, NULL, 4, 'mbox_sha1sum', 'sha1sum of a personal mailbox URI name', 'The sha1sum of the URI of an Internet mailbox associated with exactly one owner, the  first owner of the mailbox.'),
(125, NULL, 4, 'gender', 'gender', 'The gender of this Agent (typically but not necessarily \'male\' or \'female\').'),
(126, NULL, 4, 'geekcode', 'geekcode', 'A textual geekcode for this person, see http://www.geekcode.com/geek.html'),
(127, NULL, 4, 'dnaChecksum', 'DNA checksum', 'A checksum for the DNA of some thing. Joke.'),
(128, NULL, 4, 'sha1', 'sha1sum (hex)', 'A sha1sum hash, in hex.'),
(129, NULL, 4, 'based_near', 'based near', 'A location that something is based near, for some broadly human notion of near.'),
(130, NULL, 4, 'title', 'title', 'Title (Mr, Mrs, Ms, Dr. etc)'),
(131, NULL, 4, 'nick', 'nickname', 'A short informal nickname characterising an agent (includes login identifiers, IRC and other chat nicknames).'),
(132, NULL, 4, 'jabberID', 'jabber ID', 'A jabber ID for something.'),
(133, NULL, 4, 'aimChatID', 'AIM chat ID', 'An AIM chat ID'),
(134, NULL, 4, 'skypeID', 'Skype ID', 'A Skype ID'),
(135, NULL, 4, 'icqChatID', 'ICQ chat ID', 'An ICQ chat ID'),
(136, NULL, 4, 'yahooChatID', 'Yahoo chat ID', 'A Yahoo chat ID'),
(137, NULL, 4, 'msnChatID', 'MSN chat ID', 'An MSN chat ID'),
(138, NULL, 4, 'name', 'name', 'A name for some thing.'),
(139, NULL, 4, 'firstName', 'firstName', 'The first name of a person.'),
(140, NULL, 4, 'lastName', 'lastName', 'The last name of a person.'),
(141, NULL, 4, 'givenName', 'Given name', 'The given name of some person.'),
(142, NULL, 4, 'givenname', 'Given name', 'The given name of some person.'),
(143, NULL, 4, 'surname', 'Surname', 'The surname of some person.'),
(144, NULL, 4, 'family_name', 'family_name', 'The family name of some person.'),
(145, NULL, 4, 'familyName', 'familyName', 'The family name of some person.'),
(146, NULL, 4, 'phone', 'phone', 'A phone,  specified using fully qualified tel: URI scheme (refs: http://www.w3.org/Addressing/schemes.html#tel).'),
(147, NULL, 4, 'homepage', 'homepage', 'A homepage for some thing.'),
(148, NULL, 4, 'weblog', 'weblog', 'A weblog of some thing (whether person, group, company etc.).'),
(149, NULL, 4, 'openid', 'openid', 'An OpenID for an Agent.'),
(150, NULL, 4, 'tipjar', 'tipjar', 'A tipjar document for this agent, describing means for payment and reward.'),
(151, NULL, 4, 'plan', 'plan', 'A .plan comment, in the tradition of finger and \'.plan\' files.'),
(152, NULL, 4, 'made', 'made', 'Something that was made by this agent.'),
(153, NULL, 4, 'maker', 'maker', 'An agent that  made this thing.'),
(154, NULL, 4, 'img', 'image', 'An image that can be used to represent some thing (ie. those depictions which are particularly representative of something, eg. one\'s photo on a homepage).'),
(155, NULL, 4, 'depiction', 'depiction', 'A depiction of some thing.'),
(156, NULL, 4, 'depicts', 'depicts', 'A thing depicted in this representation.'),
(157, NULL, 4, 'thumbnail', 'thumbnail', 'A derived thumbnail image.'),
(158, NULL, 4, 'myersBriggs', 'myersBriggs', 'A Myers Briggs (MBTI) personality classification.'),
(159, NULL, 4, 'workplaceHomepage', 'workplace homepage', 'A workplace homepage of some person; the homepage of an organization they work for.'),
(160, NULL, 4, 'workInfoHomepage', 'work info homepage', 'A work info homepage of some person; a page about their work for some organization.'),
(161, NULL, 4, 'schoolHomepage', 'schoolHomepage', 'A homepage of a school attended by the person.'),
(162, NULL, 4, 'knows', 'knows', 'A person known by this person (indicating some level of reciprocated interaction between the parties).'),
(163, NULL, 4, 'interest', 'interest', 'A page about a topic of interest to this person.'),
(164, NULL, 4, 'topic_interest', 'topic_interest', 'A thing of interest to this person.'),
(165, NULL, 4, 'publications', 'publications', 'A link to the publications of this person.'),
(166, NULL, 4, 'currentProject', 'current project', 'A current project this person works on.'),
(167, NULL, 4, 'pastProject', 'past project', 'A project this person has previously worked on.'),
(168, NULL, 4, 'fundedBy', 'funded by', 'An organization funding a project or person.'),
(169, NULL, 4, 'logo', 'logo', 'A logo representing some thing.'),
(170, NULL, 4, 'topic', 'topic', 'A topic of some page or document.'),
(171, NULL, 4, 'primaryTopic', 'primary topic', 'The primary topic of some page or document.'),
(172, NULL, 4, 'focus', 'focus', 'The underlying or \'focal\' entity associated with some SKOS-described concept.'),
(173, NULL, 4, 'isPrimaryTopicOf', 'is primary topic of', 'A document that this thing is the primary topic of.'),
(174, NULL, 4, 'page', 'page', 'A page or document about this thing.'),
(175, NULL, 4, 'theme', 'theme', 'A theme.'),
(176, NULL, 4, 'account', 'account', 'Indicates an account held by this agent.'),
(177, NULL, 4, 'holdsAccount', 'account', 'Indicates an account held by this agent.'),
(178, NULL, 4, 'accountServiceHomepage', 'account service homepage', 'Indicates a homepage of the service provide for this online account.'),
(179, NULL, 4, 'accountName', 'account name', 'Indicates the name (identifier) associated with this online account.'),
(180, NULL, 4, 'member', 'member', 'Indicates a member of a Group'),
(181, NULL, 4, 'membershipClass', 'membershipClass', 'Indicates the class of individuals that are a member of a Group'),
(182, NULL, 4, 'birthday', 'birthday', 'The birthday of this Agent, represented in mm-dd string form, eg. \'12-31\'.'),
(183, NULL, 4, 'age', 'age', 'The age in years of some agent.'),
(184, NULL, 4, 'status', 'status', 'A string expressing what the user is happy for the general public (normally) to know about their current activity.'),
(223, 1, 8, 'aResponsabiliteSur', 'A Responsabilité Sur', 'Indique le rôle ou métier assigné à l\'administrateur réseau.'),
(224, 1, 8, 'accesDonnees', 'Accès aux Données', 'Indique si le développeur a accès aux données (Oui/Non).'),
(225, 1, 8, 'competencesTechniques', 'Compétences Techniques', 'Compétences techniques du développeur.'),
(226, 1, 8, 'developpe', 'Développe', 'Indique le système IoT développé par le développeur.'),
(227, 1, 8, 'niveauSecuriteRequis', 'Niveau de Sécurité Requis', 'Niveau de sécurité requis pour les objets connectés utilisés par l\'utilisateur.'),
(228, 1, 8, 'outilsSurveillance', 'Outils de Surveillance Utilisés', 'Outils de surveillance utilisés par l\'administrateur réseau.'),
(229, 1, 8, 'protocolesSecurite', 'Protocoles de Sécurité Utilisés', 'Protocoles de sécurité appliqués par l\'administrateur réseau.'),
(230, 1, 8, 'surveille', 'Surveille', 'Indique quel appareil ou réseau est surveillé par l\'administrateur réseau.'),
(231, 1, 8, 'typeObjetConnecte', 'Type d\'Objet Connecté', 'Type d\'objet connecté utilisé par l\'utilisateur IoT.'),
(232, 1, 8, 'typeReseauGere', 'Type de Réseau Géré', 'Type de réseau supervisé par l\'administrateur.'),
(233, 1, 8, 'utilisePar', 'Utilisé Par', 'Indique quel utilisateur IoT utilise l\'appareil connecté.'),
(234, NULL, 8, 'dateDetection', 'Date et Heure de Détection', 'La date et l\'heure à laquelle l\'anomalie a été détectée.'),
(235, NULL, 8, 'typeAnomalie', 'Type d\'Anomalie', 'Le type d\'anomalie détectée, par exemple : intrusion, déconnexion.'),
(236, NULL, 8, 'appareilConcerne', 'Appareil Concerné', 'L\'appareil IoT spécifique qui est affecté par l\'anomalie détectée.'),
(237, NULL, 8, 'mesuresPrises', 'Mesures Prises', 'Les actions ou interventions effectuées en réponse à l\'anomalie.'),
(238, NULL, 8, 'aContribueAuReseau', 'A Contribué au Réseau', 'Indique le réseau IoT auquel le développeur a contribué.'),
(239, NULL, 8, 'assureSurveillanceDe', 'Assure la Surveillance de', 'Indique quel appareil ou réseau est sous la surveillance de l\'administrateur réseau.');

-- --------------------------------------------------------

--
-- Structure de la table `resource`
--

CREATE TABLE `resource` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `resource_class_id` int(11) DEFAULT NULL,
  `resource_template_id` int(11) DEFAULT NULL,
  `thumbnail_id` int(11) DEFAULT NULL,
  `title` longtext DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `resource_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource`
--

INSERT INTO `resource` (`id`, `owner_id`, `resource_class_id`, `resource_template_id`, `thumbnail_id`, `title`, `is_public`, `created`, `modified`, `resource_type`) VALUES
(2, 1, 122, 7, NULL, 'Développeur - Team member', 1, '2024-10-27 19:58:40', '2024-11-03 19:47:18', 'Omeka\\Entity\\Item'),
(3, 1, 121, 6, NULL, 'Administrateur Réseau - Team member', 1, '2024-10-27 20:03:08', '2024-11-03 18:38:47', 'Omeka\\Entity\\Item'),
(4, 1, 126, 5, NULL, 'Utilisateur final', 1, '2024-10-27 20:03:49', '2024-10-30 19:53:22', 'Omeka\\Entity\\Item'),
(5, 1, 126, 5, NULL, 'Utilisateur final 2', 1, '2024-11-03 18:21:14', '2024-11-03 18:21:14', 'Omeka\\Entity\\Item'),
(6, 1, 126, 5, NULL, 'Utilisateur final 3', 1, '2024-11-03 18:21:19', '2024-11-03 18:21:19', 'Omeka\\Entity\\Item'),
(7, 1, 121, 6, NULL, 'Administrateur Réseau - Team member 2', 1, '2024-11-03 18:37:11', '2024-11-03 18:37:11', 'Omeka\\Entity\\Item'),
(8, 1, 121, 6, NULL, 'Administrateur Réseau - Team member 3', 1, '2024-11-03 18:37:13', '2024-11-03 18:37:13', 'Omeka\\Entity\\Item'),
(9, 1, 122, 7, NULL, 'Développeur - Team member 2', 1, '2024-11-03 18:44:12', '2024-11-03 18:44:12', 'Omeka\\Entity\\Item'),
(10, 1, 122, 7, NULL, 'Développeur - Team member 3', 1, '2024-11-03 18:45:22', '2024-11-03 18:45:22', 'Omeka\\Entity\\Item'),
(11, 1, 128, 8, NULL, 'Anomalie détectée', 1, '2024-11-03 19:09:49', '2024-11-03 19:09:49', 'Omeka\\Entity\\Item'),
(12, 1, 128, 8, NULL, 'Anomalie détectée 2', 1, '2024-11-03 19:11:21', '2024-11-03 19:11:21', 'Omeka\\Entity\\Item'),
(13, 1, 128, 8, NULL, 'Anomalie détectée 3', 1, '2024-11-03 19:13:32', '2024-11-03 19:13:32', 'Omeka\\Entity\\Item'),
(14, 1, 123, 9, NULL, 'Appareil connecté', 1, '2024-11-03 19:18:04', '2024-11-03 19:18:04', 'Omeka\\Entity\\Item'),
(15, 1, 123, 9, NULL, 'Appareil connecté 2', 1, '2024-11-03 19:20:12', '2024-11-03 19:20:12', 'Omeka\\Entity\\Item'),
(16, 1, 123, 9, NULL, 'Appareil connecté 3', 1, '2024-11-03 19:21:11', '2024-11-03 19:21:11', 'Omeka\\Entity\\Item'),
(17, 1, 127, 10, NULL, 'Réseau utilisé', 1, '2024-11-03 19:23:00', '2024-11-03 19:23:00', 'Omeka\\Entity\\Item'),
(18, 1, 127, 10, NULL, 'Réseau utilisé 2', 1, '2024-11-03 19:24:36', '2024-11-03 19:24:36', 'Omeka\\Entity\\Item'),
(19, 1, 127, 10, NULL, 'Réseau utilisé 3', 1, '2024-11-03 19:25:46', '2024-11-03 19:25:46', 'Omeka\\Entity\\Item');

-- --------------------------------------------------------

--
-- Structure de la table `resource_class`
--

CREATE TABLE `resource_class` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `vocabulary_id` int(11) NOT NULL,
  `local_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) NOT NULL,
  `comment` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource_class`
--

INSERT INTO `resource_class` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(1, NULL, 1, 'Agent', 'Agent', 'A resource that acts or has the power to act.'),
(2, NULL, 1, 'AgentClass', 'Agent Class', 'A group of agents.'),
(3, NULL, 1, 'BibliographicResource', 'Bibliographic Resource', 'A book, article, or other documentary resource.'),
(4, NULL, 1, 'FileFormat', 'File Format', 'A digital resource format.'),
(5, NULL, 1, 'Frequency', 'Frequency', 'A rate at which something recurs.'),
(6, NULL, 1, 'Jurisdiction', 'Jurisdiction', 'The extent or range of judicial, law enforcement, or other authority.'),
(7, NULL, 1, 'LicenseDocument', 'License Document', 'A legal document giving official permission to do something with a Resource.'),
(8, NULL, 1, 'LinguisticSystem', 'Linguistic System', 'A system of signs, symbols, sounds, gestures, or rules used in communication.'),
(9, NULL, 1, 'Location', 'Location', 'A spatial region or named place.'),
(10, NULL, 1, 'LocationPeriodOrJurisdiction', 'Location, Period, or Jurisdiction', 'A location, period of time, or jurisdiction.'),
(11, NULL, 1, 'MediaType', 'Media Type', 'A file format or physical medium.'),
(12, NULL, 1, 'MediaTypeOrExtent', 'Media Type or Extent', 'A media type or extent.'),
(13, NULL, 1, 'MethodOfInstruction', 'Method of Instruction', 'A process that is used to engender knowledge, attitudes, and skills.'),
(14, NULL, 1, 'MethodOfAccrual', 'Method of Accrual', 'A method by which resources are added to a collection.'),
(15, NULL, 1, 'PeriodOfTime', 'Period of Time', 'An interval of time that is named or defined by its start and end dates.'),
(16, NULL, 1, 'PhysicalMedium', 'Physical Medium', 'A physical material or carrier.'),
(17, NULL, 1, 'PhysicalResource', 'Physical Resource', 'A material thing.'),
(18, NULL, 1, 'Policy', 'Policy', 'A plan or course of action by an authority, intended to influence and determine decisions, actions, and other matters.'),
(19, NULL, 1, 'ProvenanceStatement', 'Provenance Statement', 'A statement of any changes in ownership and custody of a resource since its creation that are significant for its authenticity, integrity, and interpretation.'),
(20, NULL, 1, 'RightsStatement', 'Rights Statement', 'A statement about the intellectual property rights (IPR) held in or over a Resource, a legal document giving official permission to do something with a resource, or a statement about access rights.'),
(21, NULL, 1, 'SizeOrDuration', 'Size or Duration', 'A dimension or extent, or a time taken to play or execute.'),
(22, NULL, 1, 'Standard', 'Standard', 'A basis for comparison; a reference point against which other things can be evaluated.'),
(23, NULL, 2, 'Collection', 'Collection', 'An aggregation of resources.'),
(24, NULL, 2, 'Dataset', 'Dataset', 'Data encoded in a defined structure.'),
(25, NULL, 2, 'Event', 'Event', 'A non-persistent, time-based occurrence.'),
(26, NULL, 2, 'Image', 'Image', 'A visual representation other than text.'),
(27, NULL, 2, 'InteractiveResource', 'Interactive Resource', 'A resource requiring interaction from the user to be understood, executed, or experienced.'),
(28, NULL, 2, 'Service', 'Service', 'A system that provides one or more functions.'),
(29, NULL, 2, 'Software', 'Software', 'A computer program in source or compiled form.'),
(30, NULL, 2, 'Sound', 'Sound', 'A resource primarily intended to be heard.'),
(31, NULL, 2, 'Text', 'Text', 'A resource consisting primarily of words for reading.'),
(32, NULL, 2, 'PhysicalObject', 'Physical Object', 'An inanimate, three-dimensional object or substance.'),
(33, NULL, 2, 'StillImage', 'Still Image', 'A static visual representation.'),
(34, NULL, 2, 'MovingImage', 'Moving Image', 'A series of visual representations imparting an impression of motion when shown in succession.'),
(35, NULL, 3, 'AcademicArticle', 'Academic Article', 'A scholarly academic article, typically published in a journal.'),
(36, NULL, 3, 'Article', 'Article', 'A written composition in prose, usually nonfiction, on a specific topic, forming an independent part of a book or other publication, as a newspaper or magazine.'),
(37, NULL, 3, 'AudioDocument', 'audio document', 'An audio document; aka record.'),
(38, NULL, 3, 'AudioVisualDocument', 'audio-visual document', 'An audio-visual document; film, video, and so forth.'),
(39, NULL, 3, 'Bill', 'Bill', 'Draft legislation presented for discussion to a legal body.'),
(40, NULL, 3, 'Book', 'Book', 'A written or printed work of fiction or nonfiction, usually on sheets of paper fastened or bound together within covers.'),
(41, NULL, 3, 'BookSection', 'Book Section', 'A section of a book.'),
(42, NULL, 3, 'Brief', 'Brief', 'A written argument submitted to a court.'),
(43, NULL, 3, 'Chapter', 'Chapter', 'A chapter of a book.'),
(44, NULL, 3, 'Code', 'Code', 'A collection of statutes.'),
(45, NULL, 3, 'CollectedDocument', 'Collected Document', 'A document that simultaneously contains other documents.'),
(46, NULL, 3, 'Collection', 'Collection', 'A collection of Documents or Collections'),
(47, NULL, 3, 'Conference', 'Conference', 'A meeting for consultation or discussion.'),
(48, NULL, 3, 'CourtReporter', 'Court Reporter', 'A collection of legal cases.'),
(49, NULL, 3, 'Document', 'Document', 'A document (noun) is a bounded physical representation of body of information designed with the capacity (and usually intent) to communicate. A document may manifest symbolic, diagrammatic or sensory-representational information.'),
(50, NULL, 3, 'DocumentPart', 'document part', 'a distinct part of a larger document or collected document.'),
(51, NULL, 3, 'DocumentStatus', 'Document Status', 'The status of the publication of a document.'),
(52, NULL, 3, 'EditedBook', 'Edited Book', 'An edited book.'),
(53, NULL, 3, 'Email', 'EMail', 'A written communication addressed to a person or organization and transmitted electronically.'),
(54, NULL, 3, 'Event', 'Event', NULL),
(55, NULL, 3, 'Excerpt', 'Excerpt', 'A passage selected from a larger work.'),
(56, NULL, 3, 'Film', 'Film', 'aka movie.'),
(57, NULL, 3, 'Hearing', 'Hearing', 'An instance or a session in which testimony and arguments are presented, esp. before an official, as a judge in a lawsuit.'),
(58, NULL, 3, 'Image', 'Image', 'A document that presents visual or diagrammatic information.'),
(59, NULL, 3, 'Interview', 'Interview', 'A formalized discussion between two or more people.'),
(60, NULL, 3, 'Issue', 'Issue', 'something that is printed or published and distributed, esp. a given number of a periodical'),
(61, NULL, 3, 'Journal', 'Journal', 'A periodical of scholarly journal Articles.'),
(62, NULL, 3, 'LegalCaseDocument', 'Legal Case Document', 'A document accompanying a legal case.'),
(63, NULL, 3, 'LegalDecision', 'Decision', 'A document containing an authoritative determination (as a decree or judgment) made after consideration of facts or law.'),
(64, NULL, 3, 'LegalDocument', 'Legal Document', 'A legal document; for example, a court decision, a brief, and so forth.'),
(65, NULL, 3, 'Legislation', 'Legislation', 'A legal document proposing or enacting a law or a group of laws.'),
(66, NULL, 3, 'Letter', 'Letter', 'A written or printed communication addressed to a person or organization and usually transmitted by mail.'),
(67, NULL, 3, 'Magazine', 'Magazine', 'A periodical of magazine Articles. A magazine is a publication that is issued periodically, usually bound in a paper cover, and typically contains essays, stories, poems, etc., by many writers, and often photographs and drawings, frequently specializing in a particular subject or area, as hobbies, news, or sports.'),
(68, NULL, 3, 'Manual', 'Manual', 'A small reference book, especially one giving instructions.'),
(69, NULL, 3, 'Manuscript', 'Manuscript', 'An unpublished Document, which may also be submitted to a publisher for publication.'),
(70, NULL, 3, 'Map', 'Map', 'A graphical depiction of geographic features.'),
(71, NULL, 3, 'MultiVolumeBook', 'Multivolume Book', 'A loose, thematic, collection of Documents, often Books.'),
(72, NULL, 3, 'Newspaper', 'Newspaper', 'A periodical of documents, usually issued daily or weekly, containing current news, editorials, feature articles, and usually advertising.'),
(73, NULL, 3, 'Note', 'Note', 'Notes or annotations about a resource.'),
(74, NULL, 3, 'Patent', 'Patent', 'A document describing the exclusive right granted by a government to an inventor to manufacture, use, or sell an invention for a certain number of years.'),
(75, NULL, 3, 'Performance', 'Performance', 'A public performance.'),
(76, NULL, 3, 'Periodical', 'Periodical', 'A group of related documents issued at regular intervals.'),
(77, NULL, 3, 'PersonalCommunication', 'Personal Communication', 'A communication between an agent and one or more specific recipients.'),
(78, NULL, 3, 'PersonalCommunicationDocument', 'Personal Communication Document', 'A personal communication manifested in some document.'),
(79, NULL, 3, 'Proceedings', 'Proceedings', 'A compilation of documents published from an event, such as a conference.'),
(80, NULL, 3, 'Quote', 'Quote', 'An excerpted collection of words.'),
(81, NULL, 3, 'ReferenceSource', 'Reference Source', 'A document that presents authoritative reference information, such as a dictionary or encylopedia .'),
(82, NULL, 3, 'Report', 'Report', 'A document describing an account or statement describing in detail an event, situation, or the like, usually as the result of observation, inquiry, etc..'),
(83, NULL, 3, 'Series', 'Series', 'A loose, thematic, collection of Documents, often Books.'),
(84, NULL, 3, 'Slide', 'Slide', 'A slide in a slideshow'),
(85, NULL, 3, 'Slideshow', 'Slideshow', 'A presentation of a series of slides, usually presented in front of an audience with written text and images.'),
(86, NULL, 3, 'Standard', 'Standard', 'A document describing a standard'),
(87, NULL, 3, 'Statute', 'Statute', 'A bill enacted into law.'),
(88, NULL, 3, 'Thesis', 'Thesis', 'A document created to summarize research findings associated with the completion of an academic degree.'),
(89, NULL, 3, 'ThesisDegree', 'Thesis degree', 'The academic degree of a Thesis'),
(90, NULL, 3, 'Webpage', 'Webpage', 'A web page is an online document available (at least initially) on the world wide web. A web page is written first and foremost to appear on the web, as distinct from other online resources such as books, manuscripts or audio documents which use the web primarily as a distribution mechanism alongside other more traditional methods such as print.'),
(91, NULL, 3, 'Website', 'Website', 'A group of Webpages accessible on the Web.'),
(92, NULL, 3, 'Workshop', 'Workshop', 'A seminar, discussion group, or the like, that emphasizes zxchange of ideas and the demonstration and application of techniques, skills, etc.'),
(93, NULL, 4, 'LabelProperty', 'Label Property', 'A foaf:LabelProperty is any RDF property with texual values that serve as labels.'),
(94, NULL, 4, 'Person', 'Person', 'A person.'),
(95, NULL, 4, 'Document', 'Document', 'A document.'),
(96, NULL, 4, 'Organization', 'Organization', 'An organization.'),
(97, NULL, 4, 'Group', 'Group', 'A class of Agents.'),
(98, NULL, 4, 'Agent', 'Agent', 'An agent (eg. person, group, software or physical artifact).'),
(99, NULL, 4, 'Project', 'Project', 'A project (a collective endeavour of some kind).'),
(100, NULL, 4, 'Image', 'Image', 'An image.'),
(101, NULL, 4, 'PersonalProfileDocument', 'PersonalProfileDocument', 'A personal profile RDF document.'),
(102, NULL, 4, 'OnlineAccount', 'Online Account', 'An online account.'),
(103, NULL, 4, 'OnlineGamingAccount', 'Online Gaming Account', 'An online gaming account.'),
(104, NULL, 4, 'OnlineEcommerceAccount', 'Online E-commerce Account', 'An online e-commerce account.'),
(105, NULL, 4, 'OnlineChatAccount', 'Online Chat Account', 'An online chat account.'),
(121, 1, 8, 'Admin_Reseau', 'Administrateur Réseau', 'Représente un administrateur de réseau IoT, responsable de la gestion et de la sécurité des appareils connectés.'),
(122, 1, 8, 'Developpeur', 'Développeur', 'Représente un développeur travaillant sur le système IoT.'),
(123, 1, 8, 'Device', 'Appareil Connecté', 'Représente un objet connecté ou un dispositif dans un réseau IoT.'),
(124, 1, 8, 'JobRole', 'Rôle/Métier', 'Représente les fonctions ou métiers assignés aux acteurs du réseau IoT.'),
(125, 1, 8, 'System', 'Système', 'Représente le système ou l\'infrastructure de réseau IoT global.'),
(126, 1, 8, 'User_IoT', 'Utilisateur IoT', 'Représente un utilisateur d\'objets connectés dans un environnement IoT.'),
(127, NULL, 8, 'Network', 'Réseau utilisé', 'Représente le système ou l\'infrastructure de réseau IoT global.'),
(128, NULL, 8, 'AnomalieDetectee', 'Anomalie Détectée', 'Représente une anomalie ou un incident détecté dans le réseau IoT.');

-- --------------------------------------------------------

--
-- Structure de la table `resource_template`
--

CREATE TABLE `resource_template` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `resource_class_id` int(11) DEFAULT NULL,
  `title_property_id` int(11) DEFAULT NULL,
  `description_property_id` int(11) DEFAULT NULL,
  `label` varchar(190) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource_template`
--

INSERT INTO `resource_template` (`id`, `owner_id`, `resource_class_id`, `title_property_id`, `description_property_id`, `label`) VALUES
(1, NULL, NULL, NULL, NULL, 'Base Resource'),
(5, 1, 126, NULL, NULL, 'user_IoT'),
(6, 1, 121, NULL, NULL, 'network_admin'),
(7, 1, 122, NULL, NULL, 'developper'),
(8, 1, 128, NULL, NULL, 'anomaly_detected'),
(9, 1, 123, NULL, NULL, 'device_connected'),
(10, 1, 127, NULL, NULL, 'network_used');

-- --------------------------------------------------------

--
-- Structure de la table `resource_template_property`
--

CREATE TABLE `resource_template_property` (
  `id` int(11) NOT NULL,
  `resource_template_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `alternate_label` varchar(255) DEFAULT NULL,
  `alternate_comment` longtext DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `data_type` longtext DEFAULT NULL COMMENT '(DC2Type:json_array)',
  `is_required` tinyint(1) NOT NULL,
  `is_private` tinyint(1) NOT NULL,
  `default_lang` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource_template_property`
--

INSERT INTO `resource_template_property` (`id`, `resource_template_id`, `property_id`, `alternate_label`, `alternate_comment`, `position`, `data_type`, `is_required`, `is_private`, `default_lang`) VALUES
(1, 1, 1, NULL, NULL, 1, NULL, 0, 0, NULL),
(2, 1, 15, NULL, NULL, 2, NULL, 0, 0, NULL),
(3, 1, 8, NULL, NULL, 3, NULL, 0, 0, NULL),
(4, 1, 2, NULL, NULL, 4, NULL, 0, 0, NULL),
(5, 1, 7, NULL, NULL, 5, NULL, 0, 0, NULL),
(6, 1, 4, NULL, NULL, 6, NULL, 0, 0, NULL),
(7, 1, 9, NULL, NULL, 7, NULL, 0, 0, NULL),
(8, 1, 12, NULL, NULL, 8, NULL, 0, 0, NULL),
(9, 1, 40, 'Place', NULL, 9, NULL, 0, 0, NULL),
(10, 1, 5, NULL, NULL, 10, NULL, 0, 0, NULL),
(11, 1, 17, NULL, NULL, 11, NULL, 0, 0, NULL),
(12, 1, 6, NULL, NULL, 12, NULL, 0, 0, NULL),
(13, 1, 25, NULL, NULL, 13, NULL, 0, 0, NULL),
(14, 1, 10, NULL, NULL, 14, NULL, 0, 0, NULL),
(15, 1, 13, NULL, NULL, 15, NULL, 0, 0, NULL),
(16, 1, 29, NULL, NULL, 16, NULL, 0, 0, NULL),
(17, 1, 30, NULL, NULL, 17, NULL, 0, 0, NULL),
(18, 1, 50, NULL, NULL, 18, NULL, 0, 0, NULL),
(19, 1, 3, NULL, NULL, 19, NULL, 0, 0, NULL),
(20, 1, 41, NULL, NULL, 20, NULL, 0, 0, NULL),
(36, 5, 1, NULL, NULL, 1, NULL, 0, 0, NULL),
(37, 5, 4, NULL, NULL, 3, NULL, 0, 0, NULL),
(40, 5, 138, NULL, NULL, 2, NULL, 0, 0, NULL),
(41, 6, 1, NULL, NULL, 1, NULL, 0, 0, NULL),
(42, 6, 138, NULL, NULL, 2, NULL, 0, 0, NULL),
(43, 6, 4, NULL, NULL, 3, NULL, 0, 0, NULL),
(47, 7, 1, NULL, NULL, 1, NULL, 0, 0, NULL),
(48, 7, 4, NULL, NULL, 3, NULL, 0, 0, NULL),
(49, 7, 138, NULL, NULL, 2, NULL, 0, 0, NULL),
(52, 5, 231, NULL, NULL, 4, NULL, 0, 0, NULL),
(53, 5, 227, NULL, NULL, 5, NULL, 0, 0, NULL),
(54, 6, 232, NULL, NULL, 4, NULL, 0, 0, NULL),
(55, 6, 228, NULL, NULL, 5, NULL, 0, 0, NULL),
(56, 6, 229, NULL, NULL, 6, NULL, 0, 0, NULL),
(57, 7, 225, NULL, NULL, 4, NULL, 0, 0, NULL),
(58, 7, 224, NULL, NULL, 5, NULL, 0, 0, NULL),
(60, 8, 1, NULL, NULL, 1, NULL, 0, 0, NULL),
(61, 8, 4, NULL, NULL, 3, NULL, 0, 0, NULL),
(62, 8, 234, NULL, NULL, 4, NULL, 0, 0, NULL),
(63, 8, 235, NULL, NULL, 5, NULL, 0, 0, NULL),
(64, 8, 236, NULL, NULL, 6, NULL, 0, 0, NULL),
(65, 8, 237, NULL, NULL, 7, NULL, 0, 0, NULL),
(66, 9, 1, NULL, NULL, 1, NULL, 0, 0, NULL),
(67, 9, 4, NULL, NULL, 3, NULL, 0, 0, NULL),
(68, 9, 231, NULL, NULL, 4, NULL, 0, 0, NULL),
(69, 9, 233, NULL, NULL, 5, NULL, 0, 0, NULL),
(71, 7, 238, NULL, NULL, 6, NULL, 0, 0, NULL),
(72, 6, 239, NULL, NULL, 7, NULL, 0, 0, NULL),
(73, 6, 223, NULL, NULL, 8, NULL, 0, 0, NULL),
(74, 10, 1, NULL, NULL, 1, NULL, 0, 0, NULL),
(75, 10, 4, NULL, NULL, 3, NULL, 0, 0, NULL),
(76, 10, 232, NULL, NULL, 4, NULL, 0, 0, NULL),
(77, 10, 227, NULL, NULL, 5, NULL, 0, 0, NULL),
(78, 10, 238, NULL, NULL, 6, NULL, 0, 0, NULL),
(79, 9, 138, NULL, NULL, 2, NULL, 0, 0, NULL),
(80, 9, 236, NULL, NULL, 6, NULL, 0, 0, NULL),
(81, 8, 138, NULL, NULL, 2, NULL, 0, 0, NULL),
(82, 10, 138, NULL, NULL, 2, NULL, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `session`
--

CREATE TABLE `session` (
  `id` varchar(190) NOT NULL,
  `data` longblob NOT NULL,
  `modified` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `session`
--

INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('6le4gnrm966eb9kn08oltoop73', 0x5f5f4c616d696e61737c613a363a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313732393039383939372e3131343135373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c38316e6763357174626f61676b336c35657265356b6a71306e223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313732393134303538363b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313732393134323133383b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313732393134313836353b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279757064617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313732393134323139373b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223834373863346337626164646562366632616438393330363334383433343439223b733a33323a223536623735623363666235383138393965313333323230356262643330303937223b7d733a343a2268617368223b733a36353a2235366237356233636662353831383939653133333232303562626433303039372d3834373863346337626164646562366632616438393330363334383433343439223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a383a7b733a33323a226564353933313263356430386464666630366637666639323233353430613334223b733a33323a223632366662353466336262623961626335633963633532333361633932323138223b733a33323a223464343638306162646531333162656633643839363637376663656435306535223b733a33323a223537356232363039393764376366393533383363663133386537613139386265223b733a33323a223939613466656530333236653665613766643730373837373662323763643634223b733a33323a223039303039366237613035613263346438343461313731656334303530393165223b733a33323a223030613163396139393536613938616362666662336162313433656439356234223b733a33323a223461646435356530323133313936303166343335666534313632616238316662223b733a33323a223931666330306238616266366632373233303533353465616332363833643137223b733a33323a223965373761383365646566636132373662366132386238363935396232383531223b733a33323a226531363838656433626234383730316630666537393933336132363437666137223b733a33323a226438623836643063663562623534396365336139356634633763313631643961223b733a33323a226161333330316162353230623965356339383033336335333762653663316165223b733a33323a223339613338323263323763303033343839653165646364646663323963666562223b733a33323a226566306535343933623730323134313437633663353037633030643532353032223b733a33323a223837653239306263653132376539316433323836363938636631623735383435223b7d733a343a2268617368223b733a36353a2238376532393062636531323765393164333238363639386366316237353834352d6566306535343933623730323134313437633663353037633030643532353032223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a363a7b733a33323a226266636139636539316536353533323034363532376235613266306134316530223b733a33323a223433333561383364303962353336333032656535353365636533633131386235223b733a33323a223864633861663437323436653865363161356161653936323532336130663439223b733a33323a226139393964313536333861303636303635303263643465613038343461366463223b733a33323a223639646463376430333835653535656664323334323839633863663739623766223b733a33323a226130346437663936323836646261653537373632623632643761653430303164223b733a33323a226132346339373165356339643139613136306166633461356365373139666466223b733a33323a223931636464666231643266383331343962333333633466326236386437306232223b733a33323a226331373962323539313833306664653162643133373563366135393830613232223b733a33323a223561366432333861666637653039623262303630663166396665336333643236223b733a33323a223536363838666133653465393934333365383633663365643235343433316565223b733a33323a223038336637636232363764626661366363656432336237616534386532613066223b7d733a343a2268617368223b733a36353a2230383366376362323637646266613663636564323362376165343865326130662d3536363838666133653465393934333365383633663365643235343433316565223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279757064617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226234663331613737363138643539663938363934373930316564393861643365223b733a33323a226561323965336163363065643165653533616161376563303665626431323537223b7d733a343a2268617368223b733a36353a2265613239653361633630656431656535336161613765633036656264313235372d6234663331613737363138643539663938363934373930316564393861643365223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1729098997),
('a8ofe8sbdg79qqppls68lfl51d', 0x5f5f4c616d696e61737c613a363a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313732383930353638312e3336373230323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22653767626567656b6f35656e62373064356f7075323573676772223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313732383933383034373b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313732383934313339353b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313732383934313339353b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313732383934383838313b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a343a7b733a33323a223436383530333037663534396536343237636432653436633934393466623730223b733a33323a223132623234653333623633363862663033623239376565336132653062356630223b733a33323a223331386235633135336132653739313638326662323636343562333135313865223b733a33323a223735346166636136323039396538313430326163613864663933626564323565223b733a33323a223931336565343231626531333166363938336665386630616333663939336131223b733a33323a223433353832303931656436623931376662636539313237356365336230626230223b733a33323a226332633137636534386438633539363335643364326535343434326565656537223b733a33323a223631393533343330653130636531346335623131363561383930313730383435223b7d733a343a2268617368223b733a36353a2236313935333433306531306365313463356231313635613839303137303834352d6332633137636534386438633539363335643364326535343434326565656537223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a393a7b733a33323a223936326239613933313261353636386566313436363762393362656435626539223b733a33323a223266616265636661643530363839303233623061356666376131303062653063223b733a33323a226138643539313365373264376661666565303936653234336439643239313534223b733a33323a223734326565636632376564363631306665656564393630326561653636323031223b733a33323a226133616261666264663434663339373733643831653366636264316366323739223b733a33323a226365636431623164646162343938383530633762353830356130316134636239223b733a33323a223464396561373266353235383265303338323565656665333334363233336232223b733a33323a223965646636613962656435666664653864633735643035666266316532343336223b733a33323a223733373734383762666465336335343634386631313436306366613434313863223b733a33323a226536376332616336633130346530653766316461363433643663346637633334223b733a33323a223434666134613138306637353736366635643537633533363861633166363964223b733a33323a226462303364333937386338326233633239336264323132333065663335356566223b733a33323a226664646363643763343965303036663737666230363462653135643461376334223b733a33323a223865323633666663626134613234383533653462343864623163386162653063223b733a33323a223137333965376563323736346162303431326566336137383337613962366230223b733a33323a223434333330376534333831363166386133613836366336346232616661343534223b733a33323a223135303130356265643866643761303233616437643763656334356164386665223b733a33323a226365323164386564653833303262323932613833326237383261616466656236223b7d733a343a2268617368223b733a36353a2263653231643865646538333032623239326138333262373832616164666562362d3135303130356265643866643761303233616437643763656334356164386665223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a353a7b733a33323a223732376634383033313664303966653838386362643065356366306639353564223b733a33323a223638316235626636663664646337623163653363663835633436333631646534223b733a33323a226265343665373930656431653036383538643362623263333637306339346236223b733a33323a226662393830386637396435363131653838303066326163333032373232616163223b733a33323a226265386337336437313334303766366337636637306564616130363236353638223b733a33323a223263373766643438356235633865613735353230383561326533353666306133223b733a33323a223766643038303265666462326632336661336530343561346632653066396235223b733a33323a223138376361626161363631323261393139316332326164363037646664626262223b733a33323a223438373039663334643961653736363664323034366334646332613031346438223b733a33323a223763633461313338636164643334306163623935373731323735366366323064223b7d733a343a2268617368223b733a36353a2237636334613133386361646433343061636239353737313237353663663230642d3438373039663334643961653736363664323034366334646332613031346438223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a393a7b733a33323a223339366265363932323136626537633731643762373662373932316366653465223b733a33323a223566303632303661363534363733323032336636363463376430613732383438223b733a33323a226633646664386562653636626233613062666633343431313030353338316632223b733a33323a223037373839386430343330306661323936306337623338643730346235363566223b733a33323a223738613637616232313866356366363632623031376438353263356566373130223b733a33323a223463306138346632633866366232306431623335613235303233323831653761223b733a33323a226161333836646537623534323233633733353561333037376632386262376430223b733a33323a223065343339326462343934623865333831343966343834623738376235376565223b733a33323a223732376637333435646361353466643165363036306131376430353461353533223b733a33323a223538653266333933366433646530666430613839353232306139303761343563223b733a33323a226632313030643731663034323132323336363966646337636431653661346262223b733a33323a226466373830353234613232386665663130613561346335303436396663646336223b733a33323a223337393133333862616131393536656133313734363066333635333737633834223b733a33323a226633336633326163353865393336366463633231613633353762373539316137223b733a33323a223632386536393262666162643330333336326164346539323233386538343430223b733a33323a226466316232306435356264333534333036373432323931623033303136666636223b733a33323a223136343934353135623766363339306566653661616230643362356165663464223b733a33323a226236333233353535373065626233643233323862653038666639356333636131223b7d733a343a2268617368223b733a36353a2262363332333535353730656262336432333238626530386666393563336361312d3136343934353135623766363339306566653661616230643362356165663464223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1728905681),
('arji3gtj5u4l80qhrplbisns9d', 0x5f5f4c616d696e61737c613a373a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313733303636333331382e3232303838363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22357468656a68636b756f7636646664743676747665313975626c223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733303030363039323b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313733303730363433303b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733303730363436393b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733303639333935343b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279757064617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733303630353830373b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223264663561643862303637393565363632363963643735653461336635386639223b733a33323a223631633036363964306333333565663964646431643537306434386661306363223b7d733a343a2268617368223b733a36353a2236316330363639643063333335656639646464316435373064343866613063632d3264663561643862303637393565363632363963643735653461336635386639223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a32343a7b733a33323a226332386565396563306439333532313539333462316233623161376263343238223b733a33323a223931633033663835323063623363326562343938396537656630656131386437223b733a33323a223234373234383932346236306133636636633662323933626666373165663935223b733a33323a223861333736646662306363363237633565336334323333646662643738666634223b733a33323a223163623933613438336366306263303034643137303033393666353236343336223b733a33323a223036373564646665373037663965633933613933386232366565653135376334223b733a33323a226431346661616435396136313838336431383830353964386130653730363435223b733a33323a226532653938636462633636353134363565626237626432366665643836663631223b733a33323a223035306233353764333431613733386234623564623134303366366432313234223b733a33323a223561396161396335616563613332306666316533303534333439366139313433223b733a33323a226132333338643664373762306533353038653336326537373763393734366238223b733a33323a223434356332373038636563353539323064613061316334383636343434316266223b733a33323a226364393133633563363466383138656631666439383361613266323237633233223b733a33323a226435346663636337323530663839643734386331333063353633616362356339223b733a33323a226630376233343034366164646464613834636635396433383933333862666261223b733a33323a223833653835666666633932623962373431393164336436373835393334323638223b733a33323a223662366631386331616436666666623164626337393836646264356539663163223b733a33323a226565616333323538306438353234643038376231393533336362323335303235223b733a33323a223236656464313533656166336138616631383436636134343839336164383863223b733a33323a223366333263323038653336373035386666386535303334623439393136323732223b733a33323a223531633632643131663832343266626662656539366262653964356633356231223b733a33323a226163613062346362353038343737643339383235656630313561616432306366223b733a33323a223039656365653766643263326338653638303533373738313866333432653233223b733a33323a223630663163386162663630623933643831393330363231346631376234363936223b733a33323a223666386664626564336562333935643236373033303437333437323636373463223b733a33323a223731383835386332383432313137636364386662306663613732333233326163223b733a33323a226463616663346532643166356636313564333864396330323965653764353230223b733a33323a223635316262323961653633393833383338363164303664643163333464643561223b733a33323a223837633561383334646132656461373530363837613230343634336265663537223b733a33323a223938643433663436613035646534643832366233316263363135626235623136223b733a33323a223261303230613835663333336134643535636564306165623631363461616264223b733a33323a223534313834616530353966373866323739656534653461363961653862303039223b733a33323a226632363865353264396438323432626464313135356630343337326138333064223b733a33323a226134383464363062613561373031633732633830383139393637393631366638223b733a33323a223230393235383635613230643464323765633838353564616338333639303630223b733a33323a223834366566316530323435353638393538306562313765313364666461633031223b733a33323a223161616266386432616439363062323865316262323635323065393438663766223b733a33323a223637393261633965356662363665383635613365653639636161653566396362223b733a33323a223964666536393034653237336336633634646665643739336535343562666334223b733a33323a226338326634326133343135316164386462316438363461643430626463363831223b733a33323a226263376335313063393762326138373466326335643837333662643537626531223b733a33323a226336353037383339656431373565393538316265373630373965396164616266223b733a33323a223162653734613939393232653235336161353062356130633935613335333631223b733a33323a223531353830363164393030336632343830323063653261646333643161393965223b733a33323a223761316434383636306234306465616464633861366137383331316532396361223b733a33323a226138336237303735623162366339336637336361383538653266383738303066223b733a33323a226633373730373633376465346632653334633930376633323361326265643663223b733a33323a226531363934383438316535383262376165663135346237333535363061646438223b7d733a343a2268617368223b733a36353a2265313639343834383165353832623761656631353462373335353630616464382d6633373730373633376465346632653334633930376633323361326265643663223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a36393a7b733a33323a226365306232326130303630363762633333366532393061623163636334646462223b733a33323a226338333866633966323464333964623138346635326436636338303136323063223b733a33323a226464343133616436663735303863666232633630363734643137346238646634223b733a33323a223161636537383564393261613539616165323038613061346665363137653632223b733a33323a223437616232323534613033363639316235326436663037363431323736303136223b733a33323a226366636430343565613738336134643436333063626536323366613866333966223b733a33323a223632353061386137333162376337633735643035313732323435353939343032223b733a33323a226563346163356561306334373837393932386435393834653764393164663139223b733a33323a223931666164633465313236366131613030366138326338343761393962626333223b733a33323a223835313866633765393963343161306363366362656334386534353265623366223b733a33323a223633356339656166323431636231303134643333353434623566316136323436223b733a33323a223738316264363361643331653266643365303864336333373034323232316163223b733a33323a223361643239363030343064326566383730303537366138383135616365653337223b733a33323a226364613736616134636166336162313966653164653763316431333332646133223b733a33323a226538366438303866646163323961363739353561653435356232643030356661223b733a33323a223762336664386232353361383633623062383638313032383161313265663264223b733a33323a226137656334393866366463333937363237376339663236663066336633633866223b733a33323a223939373237663731613165383735623161353937623136656665343332623264223b733a33323a223035373633353339393930303466316137373038326666396133636638353162223b733a33323a223164393663623062653863316536336134346638646638393261333837623764223b733a33323a223435393765386436343935353630376232643633373961356563346530643366223b733a33323a223834616436666262343936633232353730376264363162653732623964646335223b733a33323a226236613061343265303138373331613762613931343764376639646135653937223b733a33323a226362323335343435353833363039386139633164663535333430663739303034223b733a33323a226434376234633264383930323032663435303430356362653864376266623561223b733a33323a223139646266636230376638306230616437336462306438626337363065666264223b733a33323a226532656634383336396630366639666231363739653636613934656431303930223b733a33323a223562653637363066376436323736303434393635643132663263623730313731223b733a33323a226330636166613537623539366664373062653631373362303139366666323831223b733a33323a223534616366613961626333303732646166386437653236363334356135633735223b733a33323a223137346263396466376462653665636263653461386431653366306166373330223b733a33323a226535626237343335343337636333333233623262383037353438303366376538223b733a33323a223031373535323038383135643937386664646430636439386264376461336130223b733a33323a223261663338326639663264646234613366373238383232393938333630316361223b733a33323a223961313165326333343339663363643566343336393361666231623434653434223b733a33323a223833393337303539343531643131393930343631646332613334663961353734223b733a33323a226462396166383238656362613839663566643133653830353536356263316661223b733a33323a223466383363353563386135313037613061343064323134363865613634353930223b733a33323a223236366430633664343532623561653435353662373164343061643130346434223b733a33323a223634376665636139383963616662386432623862363533643233333332323630223b733a33323a223062613432613562336330666435333335316161653933376634643431626663223b733a33323a223533346661353131623461636466376537346162613835373239636138393065223b733a33323a226435386533306230363637666237396232343162353738316562363965326333223b733a33323a226566303465303331363139303333666265336131343961363134363438616537223b733a33323a223432653863663630346338616538303838316435356162343331363734663835223b733a33323a223230663465363134633163386566323461343764626566666234373064376133223b733a33323a223562336139373437346433353864366234643033373634393237626531303862223b733a33323a226134326132396430313565316464393462613261616561373931316362313362223b733a33323a223864336435383236626262633261373731343635613037366536303261336564223b733a33323a223866656264323936383164346639613436366131616131616133336330343361223b733a33323a223732313836623534626130643166313137653435346462643364623565303063223b733a33323a226538306339633063386661663334643130326435636566303631363934303332223b733a33323a226537333832616562336137393261386463393565653666383932613735626362223b733a33323a223634386163346430306561353465326365346335663438656161636231373537223b733a33323a223132363466393663376533366230663436346562626463323665626531343737223b733a33323a226231363263363833336566643339306366353538616261393831333831383232223b733a33323a226534643739633263353865636531333034366434636364633163663634346265223b733a33323a223332336165393730326637393961633834336162396335633266663763353532223b733a33323a226361626666303833316431373966373564313639386338323966663134636238223b733a33323a223166326164623666313239343264353339646163333266306637343035326130223b733a33323a223038386330393161306430396635326361343137343531396266653738643561223b733a33323a223734343035663730336262393433303736393666663136393337356161316361223b733a33323a223935356635363632643338616261636536386165323039636632663935636166223b733a33323a223166373432306439303965633434646533333530386464313766663437623439223b733a33323a226637666631386638356463656630386232383863626533373366643462353861223b733a33323a226666333635373738383765636635303366653861396164373034303163363361223b733a33323a226333313062313539376237643665643032306363663561326237333237323231223b733a33323a223434643230636635666633306537326339633737653634396666656131396666223b733a33323a223262326536623334363837356561393831353231353232663066613065333430223b733a33323a223765623936303664306633373236383566636665326265346531623739626635223b733a33323a223961353033393736626632333361363362313833663963386638613536656461223b733a33323a223838623731353133636631303262363365323738396466663965633531303533223b733a33323a226363346432626536303238393831663861323866333962343934633138376433223b733a33323a223837353666613437396262303431383936623564623166393464376231396630223b733a33323a223139393130313032363631356662653237333137363766383233663839343234223b733a33323a223535303363646562333239383533613164353938656531303733613434316564223b733a33323a226535323932663838346539393938613738316336656366363937343534333534223b733a33323a226361376365636464626637613531373363666161356132636462323632633533223b733a33323a226262306439323236393233316137313864393264373266346635643165643666223b733a33323a223261646234343762643638353139333933346431363030623965343938653134223b733a33323a226263633961346232396361623961663862386538356333313862396135353033223b733a33323a226465373335306332366561323037623637336262313932396632386134363739223b733a33323a226230303563356263363661303338353861636139393631353638353561653934223b733a33323a226563346437623532656634386433333065623539313465313238643837353963223b733a33323a223532653161613364633963323466663733643932346331316264306537353333223b733a33323a223735663463626662353566626130376531646137343630623563323532373538223b733a33323a223539323063383434366530323238346362336330333039383038343135363332223b733a33323a226432333039393433326666373532613335663434613338303537386639333233223b733a33323a223139363533613531616164353737643733666634303466616161626636616639223b733a33323a223634313864663565306362313333386262346465656464626537373364313730223b733a33323a226363353834373865306466636634643261663064336165666436613937346363223b733a33323a226461373363343539643962653265663634663430653531646539366437386265223b733a33323a223533663638616363313932303761656331363131366563633964313834366562223b733a33323a226466616130383531613566303938346166353934656464373764353932303964223b733a33323a223961353034643961353437383330326163663233663533366665316661343861223b733a33323a223734333564323661613934386138353661303238633136323462383766386131223b733a33323a226365643039323230383634623534663935386662303465663635396366396434223b733a33323a226361333261663832306431313932383466626164383566393234646533363663223b733a33323a223563643734363438663633396365353464663063373039636439336265666231223b733a33323a226162363366376462613865636138616263613538303536316234383661663432223b733a33323a226636633433613038333265373533333231393566643065386331356264383763223b733a33323a226138333562336431396333643432656465386230333434313433333130663966223b733a33323a223531663066386230646465666332633531613563336133646261366163666139223b733a33323a226565656361326135633936653966336335303565666433613437633336643736223b733a33323a223665353464383166646331386462653361663336333363653264666464663563223b733a33323a223834386463373233373531386436646465633164353962623834363662333362223b733a33323a226531373665373233353732343061366162663434343038343634663165356163223b733a33323a223538303865306463303533663538623665373366386262323536663032356365223b733a33323a223934323339666232633862643166663139346366323164323939653134333232223b733a33323a223936303431616336373136313661303964643330306163646234623564353866223b733a33323a226135623332306138363664356139333065313132626435326666363033363131223b733a33323a223636383631363565356537343537623937383362666364303538316436313764223b733a33323a223161326263323935373261663564313032653864626361343165363131323432223b733a33323a223565623264666636383233373961386631353037616235333662333731373133223b733a33323a223835303136346130353738646436643836323632653430656164323630323366223b733a33323a223164656136386339333435353264663632393333383937666563386631643565223b733a33323a223661333131663632303838363935663930663436663037653633336266613738223b733a33323a226663316166663037306332346430326136663932623034376538646130353832223b733a33323a226436323733376164323963343439386566386430336134616662616263613637223b733a33323a226431623932663334396132346364633639613035636466336538313539306131223b733a33323a223031316133336531623062303032366664386438383730366562616666306565223b733a33323a223966363739663561643835303834666462386639336339636239313863633839223b733a33323a223762653065336136306533613033383065376638326431313936366637393431223b733a33323a223862396565393064643165353939346238626631313234613239303766303331223b733a33323a226632666366653261366232666263323832656334616638616536636263363234223b733a33323a223437636362346465363064373233333064646334653133663166623965666365223b733a33323a226666336165313835396433343432663332666365353435666532306466633433223b733a33323a226634343462326564643466383938326466626461333138383765626263393332223b733a33323a223736313438663333643533323361393831356164366232373661633863323565223b733a33323a223336353337316332323738663639646532353564613239386564346130353738223b733a33323a223732313736613664666230663466333262383265366665366434363331306232223b733a33323a223062396239343431616261623034313563346538623265353964306436306630223b733a33323a226164646330306632636237653537356564616137656332356133613730393762223b733a33323a226564663965323666303535363137343265376265376130353232646262643965223b733a33323a223531343438373237613464613038653135326430616231376365383564643437223b733a33323a223035343763653933663864316432653632346139303161383665373838666463223b733a33323a223930633634333531376632326631643336313839313565373831383433326262223b733a33323a223936303563326338306335373064313565393330643162646432356334393037223b7d733a343a2268617368223b733a36353a2239363035633263383063353730643135653933306431626464323563343930372d3930633634333531376632326631643336313839313565373831383433326262223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31303a7b733a33323a223930366239306634303736396162346665333163363330346531353562623531223b733a33323a226336616562356539633336346362663138393235366638316334323339663937223b733a33323a226337366433346366386566623439626439303636323230323634626135303565223b733a33323a226162353034316336373536643762326333313139336266333738346335383863223b733a33323a226230363731353264353164633836353061383263393062306137663462666234223b733a33323a226330393365346334353531313939643461356464613166303663343266373031223b733a33323a226239313661373238316632373038376130633133376538353262373339613261223b733a33323a223032633563616235373463336133363930323039353339656338636164323563223b733a33323a226365353063396339653630363232383339396664333435626631343231313061223b733a33323a223061343666383333316166663861366561383966626561636465386633666666223b733a33323a223637323239646431373032643939633462323839633061356333323666396336223b733a33323a226339336637666166356133663834396563326233376138373061313730363662223b733a33323a226364336131626337346665353866643030326439373339353038396262626262223b733a33323a223035643338343032326238396266666539333966333934396561643535326564223b733a33323a223761376136316532353138393230313432393636663262376638636635313262223b733a33323a223162653365626365346539663533343933353535373639333839326633323935223b733a33323a223435663635613462393665656435323464653362383266636161313932383030223b733a33323a223638643433353461306136616166363236396663323463393330633434306165223b733a33323a223532666235616665326330383562663633383436623065633662396539306637223b733a33323a223437313637386635306562303664663637636165363434383664373230653435223b7d733a343a2268617368223b733a36353a2234373136373866353065623036646636376361653634343836643732306534352d3532666235616665326330383562663633383436623065633662396539306637223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279757064617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a343a7b733a33323a223063663162393539393232353232626566396465616639343064363566323861223b733a33323a226562303663346165353765373766373038313230383162373135616137663034223b733a33323a223466386632646664323938623035626562653561616136666535666130646330223b733a33323a223238306136613631646137616534363266343865363563366632303738663934223b733a33323a223634306135653262366531323539366365396262383264353833396531646335223b733a33323a226534373265326265613432613132313361366161343539366432366137373839223b733a33323a223837373233393938343065363931616466356636653636343366353932323136223b733a33323a223765376537393230383664366263663661363737613335653532663335383164223b7d733a343a2268617368223b733a36353a2237653765373932303836643662636636613637376133356535326633353831642d3837373233393938343065363931616466356636653636343366353932323136223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1730663318),
('kirvjl9rck53v6oiqv5hq60ivj', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313732383934343230322e3236393733333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226b6972766a6c3972636b353376366f697176356871363069766a223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313732383938373430323b7d7d72656469726563745f75726c7c733a33393a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e2f6974656d2f616464223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226338323638663334643861363734366166353862363336346236373735323434223b733a33323a226365633462316439376231333337303030323236386130666132303532366631223b7d733a343a2268617368223b733a36353a2263656334623164393762313333373030303232363861306661323035323666312d6338323638663334643861363734366166353862363336346236373735323434223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1728944202);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('vh74l3bct281dl4e9lppkkj7qi', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313732393936323839322e3534313233363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2270336534366a346c3863676539737669366b74356164696d336e223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733303030343434313b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313733303030363038393b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733303030343532323b7d7d72656469726563745f75726c7c733a34383a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e2f766f636162756c6172792f352f65646974223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223932646439333433336565643963363233643538663632653063616564366131223b733a33323a226539353739353538313534623265306432343430313361366136666232396438223b7d733a343a2268617368223b733a36353a2265393537393535383135346232653064323434303133613661366662323964382d3932646439333433336565643963363233643538663632653063616564366131223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a32393a7b733a33323a223866643562663830343963313734653538616135356430623766303533323930223b733a33323a223738626235333035613866396464393232626136376565653639333831376639223b733a33323a226435663061616634356631666463633337383761306634346230643962323364223b733a33323a223061376264376537373861626238343963333539613134333730613963663464223b733a33323a223463646236323635343236643038303332343938643164363137323863653365223b733a33323a226464616261613035313066323062666236623132316139373866303962343234223b733a33323a223233653534646539613138366230646138363137326138313766663838323663223b733a33323a226462393566646637656639356436326462643639396636613636383739623939223b733a33323a223936303964663866663866666666653137333862373165386530396539636461223b733a33323a223865393564333961373662363430623730343662316162666334366234633831223b733a33323a226335393939626363633739303261343161336464373631343866643632643866223b733a33323a226664616163626132353138316265346338383936613862303265313862383630223b733a33323a226338373031666662643065376439313163386339393661636165333365373939223b733a33323a223364343534626133316534386134393230303165623361613531323336636165223b733a33323a223161316662333335336632643838633566386262393332333439623930356366223b733a33323a226537336339326433316361386564346564346265646338356538393234303965223b733a33323a223234653739323636303932303731316530383563373436346665626336663733223b733a33323a223836346136653764393836363639396635313739636665613530303336633031223b733a33323a223937396630643637316132353135613930626164613330373763346137643964223b733a33323a223832346662663932636135666332656239366638316366306165663235336631223b733a33323a223138646633396532623333386338343363633632643762363263306461316431223b733a33323a226233346366626338386234656163336635363835626339323432323864633235223b733a33323a223332656664666330653933646334333666343661316238363834313062343566223b733a33323a223734383262366364633832626636663966373962663261656231303335326564223b733a33323a226261353138656638386336643237666639323833393361346364343963643664223b733a33323a223231303330303064343535376636383434623263326438666634633539633164223b733a33323a226237303338633464346532383662656664663431643937656361626265616237223b733a33323a226235313861303666616533353230386137646334383337313934316331316362223b733a33323a223235386362316438383962326638663737316562323835613464353366353539223b733a33323a226266346664303033303138396638366566666662373532316436343637316463223b733a33323a223539666439343463383339383162363135323932643764636161623534396435223b733a33323a226132396638346533623035316337666363353131366330616631656237663264223b733a33323a223737383161636637653932326464636464323135346538396561643266336166223b733a33323a223839376631623931616265663464386131613063333037313139326130323437223b733a33323a223837353666613635353766393866663234643635613435663132643761616630223b733a33323a226430346166656462313630343134386463313030303837333465303536323231223b733a33323a226635316364353234663665373339366138376432386261326333373365656339223b733a33323a223361656539306639306466373330633838666632663739313536386637333036223b733a33323a223036336263643539353536326530316434326331393165326335623338376231223b733a33323a226434353436616136626465623537386661376432366135613731383737396664223b733a33323a223933346330616439316134323235343366333135363064383965613664393664223b733a33323a223261303037646431363761363864653338663466393462623466616563383735223b733a33323a223166623464353432323465316439373863356335386435326361396637346630223b733a33323a226662623732666132363339386363616136326465313562646436373833353938223b733a33323a223336396336386139323631633465383935343665306566376165373562643263223b733a33323a223436646264653535303065383161306564383366393361363634623430643661223b733a33323a226134356437356538633332313165663263643933663539333462363332333931223b733a33323a223564393836343065313131616532653037393361376565333364643838303737223b733a33323a223431396365633664313162393963336663383738626138356536626137633364223b733a33323a223838663763333366626632323063616532626461363065363766383436306561223b733a33323a223032646337393832396435376335313833666239326365323338666461393965223b733a33323a223432616464303236373761656131343466636136353638356161323839383966223b733a33323a223666643164366237643964613062653038313936343432613233326562373263223b733a33323a223063336262326662336162633064633436353431356133623938366364656637223b733a33323a223037656133373230623539346333623734373432373731303932613837353531223b733a33323a223565336133643236353539653536613966643866303231356435333465633663223b733a33323a223466313463626161393735373935376139323631623261386264396539656430223b733a33323a223666623166323231373061613563663830623230343535373131316535663238223b7d733a343a2268617368223b733a36353a2236666231663232313730616135636638306232303435353731313165356632382d3466313463626161393735373935376139323631623261386264396539656430223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223165616239666432663464366131306138643435643839386266383465353531223b733a33323a223065633864363536396366333866313834646462363461646234373634626666223b7d733a343a2268617368223b733a36353a2230656338643635363963663338663138346464623634616462343736346266662d3165616239666432663464366131306138643435643839386266383465353531223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1729962892);

-- --------------------------------------------------------

--
-- Structure de la table `setting`
--

CREATE TABLE `setting` (
  `id` varchar(190) NOT NULL,
  `value` longtext NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `setting`
--

INSERT INTO `setting` (`id`, `value`) VALUES
('administrator_email', '\"oumaimaelfazazi01@gmail.com\"'),
('extension_whitelist', '[\"aac\",\"aif\",\"aiff\",\"asf\",\"asx\",\"avi\",\"bmp\",\"c\",\"cc\",\"class\",\"css\",\"divx\",\"doc\",\"docx\",\"exe\",\"gif\",\"gz\",\"gzip\",\"h\",\"ico\",\"j2k\",\"jp2\",\"jpe\",\"jpeg\",\"jpg\",\"m4a\",\"m4v\",\"mdb\",\"mid\",\"midi\",\"mov\",\"mp2\",\"mp3\",\"mp4\",\"mpa\",\"mpe\",\"mpeg\",\"mpg\",\"mpp\",\"odb\",\"odc\",\"odf\",\"odg\",\"odp\",\"ods\",\"odt\",\"ogg\",\"opus\",\"pdf\",\"png\",\"pot\",\"pps\",\"ppt\",\"pptx\",\"qt\",\"ra\",\"ram\",\"rtf\",\"rtx\",\"swf\",\"tar\",\"tif\",\"tiff\",\"txt\",\"wav\",\"wax\",\"webm\",\"webp\",\"wma\",\"wmv\",\"wmx\",\"wri\",\"xla\",\"xls\",\"xlsx\",\"xlt\",\"xlw\",\"zip\"]'),
('installation_title', '\"omeka-s\"'),
('locale', '\"\"'),
('media_type_whitelist', '[\"application\\/msword\",\"application\\/ogg\",\"application\\/pdf\",\"application\\/rtf\",\"application\\/vnd.ms-access\",\"application\\/vnd.ms-excel\",\"application\\/vnd.ms-powerpoint\",\"application\\/vnd.ms-project\",\"application\\/vnd.ms-write\",\"application\\/vnd.oasis.opendocument.chart\",\"application\\/vnd.oasis.opendocument.database\",\"application\\/vnd.oasis.opendocument.formula\",\"application\\/vnd.oasis.opendocument.graphics\",\"application\\/vnd.oasis.opendocument.presentation\",\"application\\/vnd.oasis.opendocument.spreadsheet\",\"application\\/vnd.oasis.opendocument.text\",\"application\\/vnd.openxmlformats-officedocument.wordprocessingml.document\",\"application\\/vnd.openxmlformats-officedocument.presentationml.presentation\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"application\\/x-gzip\",\"application\\/x-ms-wmp\",\"application\\/x-msdownload\",\"application\\/x-shockwave-flash\",\"application\\/x-tar\",\"application\\/zip\",\"audio\\/midi\",\"audio\\/mp4\",\"audio\\/mpeg\",\"audio\\/ogg\",\"audio\\/x-aac\",\"audio\\/x-aiff\",\"audio\\/x-ms-wma\",\"audio\\/x-ms-wax\",\"audio\\/x-realaudio\",\"audio\\/x-wav\",\"image\\/bmp\",\"image\\/gif\",\"image\\/jp2\",\"image\\/jpeg\",\"image\\/pjpeg\",\"image\\/png\",\"image\\/tiff\",\"image\\/webp\",\"image\\/x-icon\",\"text\\/css\",\"text\\/plain\",\"text\\/richtext\",\"video\\/divx\",\"video\\/mp4\",\"video\\/mpeg\",\"video\\/ogg\",\"video\\/quicktime\",\"video\\/webm\",\"video\\/x-ms-asf,\",\"video\\/x-msvideo\",\"video\\/x-ms-wmv\"]'),
('pagination_per_page', '25'),
('time_zone', '\"Europe\\/Berlin\"'),
('use_htmlpurifier', '\"1\"'),
('version', '\"4.1.1\"'),
('version_notifications', '\"1\"');

-- --------------------------------------------------------

--
-- Structure de la table `site`
--

CREATE TABLE `site` (
  `id` int(11) NOT NULL,
  `thumbnail_id` int(11) DEFAULT NULL,
  `homepage_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `slug` varchar(190) NOT NULL,
  `theme` varchar(190) NOT NULL,
  `title` varchar(190) NOT NULL,
  `summary` longtext DEFAULT NULL,
  `navigation` longtext NOT NULL COMMENT '(DC2Type:json_array)',
  `item_pool` longtext NOT NULL COMMENT '(DC2Type:json_array)',
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `assign_new_items` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_block_attachment`
--

CREATE TABLE `site_block_attachment` (
  `id` int(11) NOT NULL,
  `block_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `media_id` int(11) DEFAULT NULL,
  `caption` longtext NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_item_set`
--

CREATE TABLE `site_item_set` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `item_set_id` int(11) NOT NULL,
  `position` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_page`
--

CREATE TABLE `site_page` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `slug` varchar(190) NOT NULL,
  `title` varchar(190) NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  `layout` varchar(255) DEFAULT NULL,
  `layout_data` longtext DEFAULT NULL COMMENT '(DC2Type:json)',
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_page_block`
--

CREATE TABLE `site_page_block` (
  `id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `layout` varchar(80) NOT NULL,
  `data` longtext NOT NULL COMMENT '(DC2Type:json_array)',
  `layout_data` longtext DEFAULT NULL COMMENT '(DC2Type:json)',
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_permission`
--

CREATE TABLE `site_permission` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_setting`
--

CREATE TABLE `site_setting` (
  `id` varchar(190) NOT NULL,
  `site_id` int(11) NOT NULL,
  `value` longtext NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(190) NOT NULL,
  `name` varchar(190) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `password_hash` varchar(60) DEFAULT NULL,
  `role` varchar(190) NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `name`, `created`, `modified`, `password_hash`, `role`, `is_active`) VALUES
(1, 'oumaimaelfazazi01@gmail.com', 'omk_thyp', '2024-10-14 08:33:37', '2024-10-14 08:33:37', '$2y$10$5HMMTtZ.b5xqeLsc2omf7e53nqwTOMIw8EGUX9nGRRiQXSRebhTeq', 'global_admin', 1);

-- --------------------------------------------------------

--
-- Structure de la table `user_setting`
--

CREATE TABLE `user_setting` (
  `id` varchar(190) NOT NULL,
  `user_id` int(11) NOT NULL,
  `value` longtext NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `value`
--

CREATE TABLE `value` (
  `id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `value_resource_id` int(11) DEFAULT NULL,
  `value_annotation_id` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `lang` varchar(255) DEFAULT NULL,
  `value` longtext DEFAULT NULL,
  `uri` longtext DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `value`
--

INSERT INTO `value` (`id`, `resource_id`, `property_id`, `value_resource_id`, `value_annotation_id`, `type`, `lang`, `value`, `uri`, `is_public`) VALUES
(5, 2, 1, NULL, NULL, 'literal', '', 'Développeur - Team member', NULL, 1),
(7, 2, 138, NULL, NULL, 'literal', '', 'Mathieu', NULL, 1),
(8, 2, 4, NULL, NULL, 'literal', '', 'Cette personne est un développeur', NULL, 1),
(9, 3, 1, NULL, NULL, 'literal', '', 'Administrateur Réseau - Team member', NULL, 1),
(13, 3, 138, NULL, NULL, 'literal', '', 'Nour', NULL, 1),
(14, 4, 1, NULL, NULL, 'literal', '', 'Utilisateur final', NULL, 1),
(18, 4, 138, NULL, NULL, 'literal', '', 'Oumaïma', NULL, 1),
(19, 2, 225, NULL, NULL, 'literal', '', 'Java, PHP', NULL, 1),
(20, 2, 224, NULL, NULL, 'literal', '', 'Oui', NULL, 1),
(21, 3, 4, NULL, NULL, 'literal', '', 'Cette personne est un admin. réseau', NULL, 1),
(22, 3, 232, NULL, NULL, 'literal', '', 'LAN, IoT, WAN', NULL, 1),
(23, 3, 228, NULL, NULL, 'literal', '', 'Wireshark, Nagios, PRTG Network Monitor', NULL, 1),
(24, 3, 229, NULL, NULL, 'literal', '', 'IPsec (Internet Protocol Security), SSL/TLS (Secure Sockets Layer / Transport Layer Security)', NULL, 1),
(25, 4, 4, NULL, NULL, 'literal', '', 'Cette personne est un utilisateur', NULL, 1),
(26, 4, 231, NULL, NULL, 'literal', '', 'Traqueurs Bluetooth, Montres ou bracelets de fitness basiques', NULL, 1),
(27, 4, 227, NULL, NULL, 'literal', '', 'Sécurité Intermédiaire', NULL, 1),
(28, 5, 1, NULL, NULL, 'literal', '', 'Utilisateur final 2', NULL, 1),
(29, 5, 138, NULL, NULL, 'literal', '', 'Hamza', NULL, 1),
(30, 5, 4, NULL, NULL, 'literal', '', 'Cette personne est un utilisateur', NULL, 1),
(31, 5, 231, NULL, NULL, 'literal', '', 'Moniteurs de fréquence cardiaque, Tensiomètres, Capteurs de glycémie', NULL, 1),
(32, 5, 227, NULL, NULL, 'literal', '', 'Sécurité particulièrement élevée', NULL, 1),
(33, 6, 1, NULL, NULL, 'literal', '', 'Utilisateur final 3', NULL, 1),
(34, 6, 138, NULL, NULL, 'literal', '', 'Imane', NULL, 1),
(35, 6, 4, NULL, NULL, 'literal', '', 'Cette personne est un utilisateur', NULL, 1),
(36, 6, 231, NULL, NULL, 'literal', '', 'Eclairages, Détecteurs de mouvement', NULL, 1),
(37, 6, 227, NULL, NULL, 'literal', '', 'Sécurité modérée', NULL, 1),
(38, 7, 1, NULL, NULL, 'literal', '', 'Administrateur Réseau - Team member 2', NULL, 1),
(39, 7, 138, NULL, NULL, 'literal', '', 'Imad', NULL, 1),
(40, 7, 4, NULL, NULL, 'literal', '', 'Cette personne est un admin. réseau', NULL, 1),
(41, 7, 232, NULL, NULL, 'literal', '', 'SAN (Storage Area Network)', NULL, 1),
(42, 7, 228, NULL, NULL, 'literal', '', 'ManageEngine OpManager', NULL, 1),
(43, 7, 229, NULL, NULL, 'literal', '', 'RADIUS (Remote Authentication Dial-In User Service)', NULL, 1),
(44, 7, 239, NULL, NULL, 'literal', '', 'Les dispositifs de stockage et les serveurs de sauvegarde.\nLes réseaux de communication entre les systèmes de stockage.', NULL, 1),
(45, 7, 223, NULL, NULL, 'literal', '', 'La gestion des performances de stockage.\nLa protection des données et la conformité aux politiques de sécurité.', NULL, 1),
(46, 8, 1, NULL, NULL, 'literal', '', 'Administrateur Réseau - Team member 3', NULL, 1),
(47, 8, 138, NULL, NULL, 'literal', '', 'Alae', NULL, 1),
(48, 8, 4, NULL, NULL, 'literal', '', 'Cette personne est un admin. réseau', NULL, 1),
(49, 8, 232, NULL, NULL, 'literal', '', 'VPN (Virtual Private Network)', NULL, 1),
(50, 8, 228, NULL, NULL, 'literal', '', 'SolarWinds Network Performance Monitor', NULL, 1),
(51, 8, 229, NULL, NULL, 'literal', '', 'SSH (Secure Shell)', NULL, 1),
(52, 8, 239, NULL, NULL, 'literal', '', 'Les serveurs d\'applications de l\'entreprise.\nLes routeurs et commutateurs du réseau.', NULL, 1),
(53, 8, 223, NULL, NULL, 'literal', '', 'La sécurité des données lors des connexions distantes.\nLa maintenance du réseau, assurant sa disponibilité et sa performance.', NULL, 1),
(54, 3, 239, NULL, NULL, 'literal', '', 'Les serveurs et dispositifs de réseau de l\'entreprise.\nLes capteurs IoT et les applications utilisées par les employés.', NULL, 1),
(55, 3, 223, NULL, NULL, 'literal', '', 'La sécurité du réseau et des données.\nLa maintenance et le dépannage des systèmes réseau.', NULL, 1),
(56, 9, 1, NULL, NULL, 'literal', '', 'Développeur - Team member 2', NULL, 1),
(57, 9, 138, NULL, NULL, 'literal', '', 'Clara', NULL, 1),
(58, 9, 4, NULL, NULL, 'literal', '', 'Cette personne est une développeuse spécialisée dans le développement d\'applications web et mobiles.', NULL, 1),
(59, 9, 225, NULL, NULL, 'literal', '', 'JavaScript, Python', NULL, 1),
(60, 9, 224, NULL, NULL, 'literal', '', 'Oui ; Accès aux bases de données pour l\'extraction et l\'analyse des données de l\'application.', NULL, 1),
(61, 9, 238, NULL, NULL, 'literal', '', 'Réseau IoT de gestion de l\'énergie : Clara a développé une application permettant de suivre la consommation d\'énergie des appareils dans les foyers.', NULL, 1),
(62, 10, 1, NULL, NULL, 'literal', '', 'Développeur - Team member 3', NULL, 1),
(63, 10, 138, NULL, NULL, 'literal', '', 'Lucas', NULL, 1),
(64, 10, 4, NULL, NULL, 'literal', '', 'Cette personne est un développeur spécialisé dans les systèmes embarqués et le développement logiciel.', NULL, 1),
(65, 10, 225, NULL, NULL, 'literal', '', 'C/C++, Ruby', NULL, 1),
(66, 10, 224, NULL, NULL, 'literal', '', 'Oui ; Accès aux flux de données des capteurs pour les intégrer dans les applications.', NULL, 1),
(67, 10, 238, NULL, NULL, 'literal', '', 'Réseau IoT de surveillance environnementale : Lucas a développé le logiciel embarqué pour des capteurs de qualité de l\'air.', NULL, 1),
(68, 2, 238, NULL, NULL, 'literal', '', 'Réseau IoT d\'une ville intelligente : Mathieu a contribué au développement d\'une application qui collecte et analyse les données des capteurs de pollution et de circulation dans la ville.', NULL, 1),
(69, 11, 1, NULL, NULL, 'literal', '', 'Anomalie détectée', NULL, 1),
(70, 11, 138, NULL, NULL, 'literal', '', 'Anomalie de température anormale détectée', NULL, 1),
(71, 11, 4, NULL, NULL, 'literal', '', 'La température enregistrée par l\'appareil dépasse les limites acceptables.', NULL, 1),
(72, 11, 234, NULL, NULL, 'literal', '', '2024-11-03T16:00:00Z', NULL, 1),
(73, 11, 235, NULL, NULL, 'literal', '', 'Anomalie de température', NULL, 1),
(74, 11, 236, NULL, NULL, 'literal', '', 'Capteur de température DEF', NULL, 1),
(75, 11, 237, NULL, NULL, 'literal', '', 'Alerte de température envoyée et évaluation des capteurs.', NULL, 1),
(76, 12, 1, NULL, NULL, 'literal', '', 'Anomalie détectée 2', NULL, 1),
(77, 12, 138, NULL, NULL, 'literal', '', 'Déconnexion d\'un appareil connecté', NULL, 1),
(78, 12, 4, NULL, NULL, 'literal', '', 'L\'appareil connecté a perdu la connexion au réseau.', NULL, 1),
(79, 12, 234, NULL, NULL, 'literal', '', '2024-11-02T09:15:00Z', NULL, 1),
(80, 12, 235, NULL, NULL, 'literal', '', 'Déconnexion', NULL, 1),
(81, 12, 236, NULL, NULL, 'literal', '', 'Thermostat intelligent ABC', NULL, 1),
(82, 12, 237, NULL, NULL, 'literal', '', 'Redémarrage automatique de l\'appareil et vérification du réseau.', NULL, 1),
(83, 13, 1, NULL, NULL, 'literal', '', 'Anomalie détectée 3', NULL, 1),
(84, 13, 138, NULL, NULL, 'literal', '', 'Intrusion détectée dans le réseau', NULL, 1),
(85, 13, 4, NULL, NULL, 'literal', '', 'Une intrusion a été détectée dans le réseau de l\'appareil de surveillance.', NULL, 1),
(86, 13, 234, NULL, NULL, 'literal', '', '2024-11-01T14:30:00Z', NULL, 1),
(87, 13, 235, NULL, NULL, 'literal', '', 'Intrusion', NULL, 1),
(88, 13, 236, NULL, NULL, 'literal', '', 'Caméra de sécurité d\'entrée', NULL, 1),
(89, 13, 237, NULL, NULL, 'literal', '', 'Blocage de l\'accès et alerte envoyée à l\'administrateur.', NULL, 1),
(90, 14, 1, NULL, NULL, 'literal', '', 'Appareil connecté ', NULL, 1),
(91, 14, 138, NULL, NULL, 'literal', '', 'Caméra de Sécurité', NULL, 1),
(92, 14, 4, NULL, NULL, 'literal', '', 'Caméra de sécurité IP avec détection de mouvement et notifications en temps réel.', NULL, 1),
(93, 14, 231, NULL, NULL, 'literal', '', 'Caméra IP', NULL, 1),
(94, 14, 233, NULL, NULL, 'literal', '', 'Utilisateur IoT 001', NULL, 1),
(95, 14, 236, NULL, NULL, 'literal', '', 'N/A', NULL, 1),
(96, 15, 1, NULL, NULL, 'literal', '', 'Appareil connecté 2', NULL, 1),
(97, 15, 138, NULL, NULL, 'literal', '', 'Thermostat intelligent', NULL, 1),
(98, 15, 4, NULL, NULL, 'literal', '', 'Thermostat programmable avec contrôle à distance via une application mobile.', NULL, 1),
(99, 15, 231, NULL, NULL, 'literal', '', 'Thermostat', NULL, 1),
(100, 15, 233, NULL, NULL, 'literal', '', 'Utilisateur IoT 002', NULL, 1),
(101, 15, 236, NULL, NULL, 'literal', '', 'Aucun', NULL, 1),
(102, 16, 1, NULL, NULL, 'literal', '', 'Appareil connecté 3', NULL, 1),
(103, 16, 138, NULL, NULL, 'literal', '', 'Ampoule connectée', NULL, 1),
(104, 16, 4, NULL, NULL, 'literal', '', 'Ampoule LED avec contrôle de la luminosité et changement de couleur via application.', NULL, 1),
(105, 16, 231, NULL, NULL, 'literal', '', 'Ampoule intelligente', NULL, 1),
(106, 16, 233, NULL, NULL, 'literal', '', 'Utilisateur IoT 003', NULL, 1),
(107, 16, 236, NULL, NULL, 'literal', '', 'Aucun', NULL, 1),
(108, 17, 1, NULL, NULL, 'literal', '', 'Réseau utilisé ', NULL, 1),
(109, 17, 138, NULL, NULL, 'literal', '', 'Réseau Wi-Fi Maison', NULL, 1),
(110, 17, 4, NULL, NULL, 'literal', '', 'Réseau Wi-Fi sécurisé utilisé pour les appareils domestiques IoT.', NULL, 1),
(111, 17, 232, NULL, NULL, 'literal', '', 'Wi-Fi', NULL, 1),
(112, 17, 227, NULL, NULL, 'literal', '', 'Élevé', NULL, 1),
(113, 17, 238, NULL, NULL, 'literal', '', 'Développeur 001', NULL, 1),
(114, 18, 1, NULL, NULL, 'literal', '', 'Réseau utilisé 2', NULL, 1),
(115, 18, 138, NULL, NULL, 'literal', '', 'Réseau IoT Public Communautaire', NULL, 1),
(116, 18, 4, NULL, NULL, 'literal', '', 'Réseau IoT accessible au public pour le suivi de la qualité de l\'air.', NULL, 1),
(117, 18, 232, NULL, NULL, 'literal', '', 'IoT', NULL, 1),
(118, 18, 227, NULL, NULL, 'literal', '', 'Moyen', NULL, 1),
(119, 18, 238, NULL, NULL, 'literal', '', 'Développeur 002', NULL, 1),
(120, 19, 1, NULL, NULL, 'literal', '', 'Réseau utilisé 3', NULL, 1),
(121, 19, 138, NULL, NULL, 'literal', '', 'Réseau Privé de l\'Entreprise', NULL, 1),
(122, 19, 4, NULL, NULL, 'literal', '', ' Réseau sécurisé utilisé par les employés pour accéder aux ressources de l\'entreprise.', NULL, 1),
(123, 19, 232, NULL, NULL, 'literal', '', 'LAN', NULL, 1),
(124, 19, 227, NULL, NULL, 'literal', '', 'Très Élevé', NULL, 1),
(125, 19, 238, NULL, NULL, 'literal', '', 'Développeur 003', NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `value_annotation`
--

CREATE TABLE `value_annotation` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `vocabulary`
--

CREATE TABLE `vocabulary` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `namespace_uri` varchar(190) NOT NULL,
  `prefix` varchar(190) NOT NULL,
  `label` varchar(255) NOT NULL,
  `comment` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `vocabulary`
--

INSERT INTO `vocabulary` (`id`, `owner_id`, `namespace_uri`, `prefix`, `label`, `comment`) VALUES
(1, NULL, 'http://purl.org/dc/terms/', 'dcterms', 'Dublin Core', 'Basic resource metadata (DCMI Metadata Terms)'),
(2, NULL, 'http://purl.org/dc/dcmitype/', 'dctype', 'Dublin Core Type', 'Basic resource types (DCMI Type Vocabulary)'),
(3, NULL, 'http://purl.org/ontology/bibo/', 'bibo', 'Bibliographic Ontology', 'Bibliographic metadata (BIBO)'),
(4, NULL, 'http://xmlns.com/foaf/0.1/', 'foaf', 'Friend of a Friend', 'Relationships between people and organizations (FOAF)'),
(8, 1, 'http://iot.org/vocab#', 'iot', 'Vocab Détection d’Anomalie et Sécurité IoT', 'Ce vocabulaire vise à faciliter la gestion et la surveillance des réseaux IoT en permettant une description structurée des composants connectés, des anomalies détectées, et des actions entreprises pour résoudre les incidents. Il fournit des classes et des propriétés spécifiques pour représenter les appareils IoT, les configurations réseau, et les incidents de sécurité, contribuant ainsi à améliorer la sécurité et l’efficacité opérationnelle dans les environnements de réseau intelligents.');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `api_key`
--
ALTER TABLE `api_key`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C912ED9D7E3C61F9` (`owner_id`);

--
-- Index pour la table `asset`
--
ALTER TABLE `asset`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_2AF5A5C5CC5DB90` (`storage_id`),
  ADD KEY `IDX_2AF5A5C7E3C61F9` (`owner_id`);

--
-- Index pour la table `csvimport_entity`
--
ALTER TABLE `csvimport_entity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_84D382F4BE04EA9` (`job_id`);

--
-- Index pour la table `csvimport_import`
--
ALTER TABLE `csvimport_import`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_17B50881BE04EA9` (`job_id`),
  ADD UNIQUE KEY `UNIQ_17B508814C276F75` (`undo_job_id`);

--
-- Index pour la table `fulltext_search`
--
ALTER TABLE `fulltext_search`
  ADD PRIMARY KEY (`id`,`resource`),
  ADD KEY `IDX_AA31FE4A7E3C61F9` (`owner_id`);
ALTER TABLE `fulltext_search` ADD FULLTEXT KEY `IDX_AA31FE4A2B36786B3B8BA7C7` (`title`,`text`);

--
-- Index pour la table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_1F1B251ECBE0B084` (`primary_media_id`);

--
-- Index pour la table `item_item_set`
--
ALTER TABLE `item_item_set`
  ADD PRIMARY KEY (`item_id`,`item_set_id`),
  ADD KEY `IDX_6D0C9625126F525E` (`item_id`),
  ADD KEY `IDX_6D0C9625960278D7` (`item_set_id`);

--
-- Index pour la table `item_set`
--
ALTER TABLE `item_set`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `item_site`
--
ALTER TABLE `item_site`
  ADD PRIMARY KEY (`item_id`,`site_id`),
  ADD KEY `IDX_A1734D1F126F525E` (`item_id`),
  ADD KEY `IDX_A1734D1FF6BD1646` (`site_id`);

--
-- Index pour la table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_FBD8E0F87E3C61F9` (`owner_id`);

--
-- Index pour la table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_6A2CA10C5CC5DB90` (`storage_id`),
  ADD KEY `IDX_6A2CA10C126F525E` (`item_id`),
  ADD KEY `item_position` (`item_id`,`position`);

--
-- Index pour la table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `password_creation`
--
ALTER TABLE `password_creation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C77917B4A76ED395` (`user_id`);

--
-- Index pour la table `property`
--
ALTER TABLE `property`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8BF21CDEAD0E05F6623C14D5` (`vocabulary_id`,`local_name`),
  ADD KEY `IDX_8BF21CDE7E3C61F9` (`owner_id`),
  ADD KEY `IDX_8BF21CDEAD0E05F6` (`vocabulary_id`);

--
-- Index pour la table `resource`
--
ALTER TABLE `resource`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_BC91F4167E3C61F9` (`owner_id`),
  ADD KEY `IDX_BC91F416448CC1BD` (`resource_class_id`),
  ADD KEY `IDX_BC91F41616131EA` (`resource_template_id`),
  ADD KEY `IDX_BC91F416FDFF2E92` (`thumbnail_id`),
  ADD KEY `title` (`title`(190)),
  ADD KEY `is_public` (`is_public`);

--
-- Index pour la table `resource_class`
--
ALTER TABLE `resource_class`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C6F063ADAD0E05F6623C14D5` (`vocabulary_id`,`local_name`),
  ADD KEY `IDX_C6F063AD7E3C61F9` (`owner_id`),
  ADD KEY `IDX_C6F063ADAD0E05F6` (`vocabulary_id`);

--
-- Index pour la table `resource_template`
--
ALTER TABLE `resource_template`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_39ECD52EEA750E8` (`label`),
  ADD KEY `IDX_39ECD52E7E3C61F9` (`owner_id`),
  ADD KEY `IDX_39ECD52E448CC1BD` (`resource_class_id`),
  ADD KEY `IDX_39ECD52E724734A3` (`title_property_id`),
  ADD KEY `IDX_39ECD52EB84E0D1D` (`description_property_id`);

--
-- Index pour la table `resource_template_property`
--
ALTER TABLE `resource_template_property`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_4689E2F116131EA549213EC` (`resource_template_id`,`property_id`),
  ADD KEY `IDX_4689E2F116131EA` (`resource_template_id`),
  ADD KEY `IDX_4689E2F1549213EC` (`property_id`);

--
-- Index pour la table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `site`
--
ALTER TABLE `site`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_694309E4989D9B62` (`slug`),
  ADD UNIQUE KEY `UNIQ_694309E4571EDDA` (`homepage_id`),
  ADD KEY `IDX_694309E4FDFF2E92` (`thumbnail_id`),
  ADD KEY `IDX_694309E47E3C61F9` (`owner_id`);

--
-- Index pour la table `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_236473FEE9ED820C` (`block_id`),
  ADD KEY `IDX_236473FE126F525E` (`item_id`),
  ADD KEY `IDX_236473FEEA9FDD75` (`media_id`),
  ADD KEY `block_position` (`block_id`,`position`);

--
-- Index pour la table `site_item_set`
--
ALTER TABLE `site_item_set`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_D4CE134F6BD1646960278D7` (`site_id`,`item_set_id`),
  ADD KEY `IDX_D4CE134F6BD1646` (`site_id`),
  ADD KEY `IDX_D4CE134960278D7` (`item_set_id`),
  ADD KEY `position` (`position`);

--
-- Index pour la table `site_page`
--
ALTER TABLE `site_page`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_2F900BD9F6BD1646989D9B62` (`site_id`,`slug`),
  ADD KEY `is_public` (`is_public`),
  ADD KEY `IDX_2F900BD9F6BD1646` (`site_id`);

--
-- Index pour la table `site_page_block`
--
ALTER TABLE `site_page_block`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C593E731C4663E4` (`page_id`),
  ADD KEY `page_position` (`page_id`,`position`);

--
-- Index pour la table `site_permission`
--
ALTER TABLE `site_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C0401D6FF6BD1646A76ED395` (`site_id`,`user_id`),
  ADD KEY `IDX_C0401D6FF6BD1646` (`site_id`),
  ADD KEY `IDX_C0401D6FA76ED395` (`user_id`);

--
-- Index pour la table `site_setting`
--
ALTER TABLE `site_setting`
  ADD PRIMARY KEY (`id`,`site_id`),
  ADD KEY `IDX_64D05A53F6BD1646` (`site_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- Index pour la table `user_setting`
--
ALTER TABLE `user_setting`
  ADD PRIMARY KEY (`id`,`user_id`),
  ADD KEY `IDX_C779A692A76ED395` (`user_id`);

--
-- Index pour la table `value`
--
ALTER TABLE `value`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_1D7758349B66727E` (`value_annotation_id`),
  ADD KEY `IDX_1D77583489329D25` (`resource_id`),
  ADD KEY `IDX_1D775834549213EC` (`property_id`),
  ADD KEY `IDX_1D7758344BC72506` (`value_resource_id`),
  ADD KEY `value` (`value`(190)),
  ADD KEY `uri` (`uri`(190)),
  ADD KEY `is_public` (`is_public`);

--
-- Index pour la table `value_annotation`
--
ALTER TABLE `value_annotation`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `vocabulary`
--
ALTER TABLE `vocabulary`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_9099C97B9B267FDF` (`namespace_uri`),
  ADD UNIQUE KEY `UNIQ_9099C97B93B1868E` (`prefix`),
  ADD KEY `IDX_9099C97B7E3C61F9` (`owner_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `asset`
--
ALTER TABLE `asset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `csvimport_entity`
--
ALTER TABLE `csvimport_entity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `csvimport_import`
--
ALTER TABLE `csvimport_import`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `job`
--
ALTER TABLE `job`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `property`
--
ALTER TABLE `property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;

--
-- AUTO_INCREMENT pour la table `resource`
--
ALTER TABLE `resource`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `resource_class`
--
ALTER TABLE `resource_class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT pour la table `resource_template`
--
ALTER TABLE `resource_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `resource_template_property`
--
ALTER TABLE `resource_template_property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT pour la table `site`
--
ALTER TABLE `site`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `site_item_set`
--
ALTER TABLE `site_item_set`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `site_page`
--
ALTER TABLE `site_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `site_page_block`
--
ALTER TABLE `site_page_block`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `site_permission`
--
ALTER TABLE `site_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `value`
--
ALTER TABLE `value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT pour la table `vocabulary`
--
ALTER TABLE `vocabulary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `api_key`
--
ALTER TABLE `api_key`
  ADD CONSTRAINT `FK_C912ED9D7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `asset`
--
ALTER TABLE `asset`
  ADD CONSTRAINT `FK_2AF5A5C7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `csvimport_entity`
--
ALTER TABLE `csvimport_entity`
  ADD CONSTRAINT `FK_84D382F4BE04EA9` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`);

--
-- Contraintes pour la table `csvimport_import`
--
ALTER TABLE `csvimport_import`
  ADD CONSTRAINT `FK_17B508814C276F75` FOREIGN KEY (`undo_job_id`) REFERENCES `job` (`id`),
  ADD CONSTRAINT `FK_17B50881BE04EA9` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`);

--
-- Contraintes pour la table `fulltext_search`
--
ALTER TABLE `fulltext_search`
  ADD CONSTRAINT `FK_AA31FE4A7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `FK_1F1B251EBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1F1B251ECBE0B084` FOREIGN KEY (`primary_media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `item_item_set`
--
ALTER TABLE `item_item_set`
  ADD CONSTRAINT `FK_6D0C9625126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_6D0C9625960278D7` FOREIGN KEY (`item_set_id`) REFERENCES `item_set` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `item_set`
--
ALTER TABLE `item_set`
  ADD CONSTRAINT `FK_1015EEEBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `item_site`
--
ALTER TABLE `item_site`
  ADD CONSTRAINT `FK_A1734D1F126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_A1734D1FF6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `job`
--
ALTER TABLE `job`
  ADD CONSTRAINT `FK_FBD8E0F87E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `FK_6A2CA10C126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `FK_6A2CA10CBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `password_creation`
--
ALTER TABLE `password_creation`
  ADD CONSTRAINT `FK_C77917B4A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `property`
--
ALTER TABLE `property`
  ADD CONSTRAINT `FK_8BF21CDE7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_8BF21CDEAD0E05F6` FOREIGN KEY (`vocabulary_id`) REFERENCES `vocabulary` (`id`);

--
-- Contraintes pour la table `resource`
--
ALTER TABLE `resource`
  ADD CONSTRAINT `FK_BC91F41616131EA` FOREIGN KEY (`resource_template_id`) REFERENCES `resource_template` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F416448CC1BD` FOREIGN KEY (`resource_class_id`) REFERENCES `resource_class` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F4167E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F416FDFF2E92` FOREIGN KEY (`thumbnail_id`) REFERENCES `asset` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `resource_class`
--
ALTER TABLE `resource_class`
  ADD CONSTRAINT `FK_C6F063AD7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_C6F063ADAD0E05F6` FOREIGN KEY (`vocabulary_id`) REFERENCES `vocabulary` (`id`);

--
-- Contraintes pour la table `resource_template`
--
ALTER TABLE `resource_template`
  ADD CONSTRAINT `FK_39ECD52E448CC1BD` FOREIGN KEY (`resource_class_id`) REFERENCES `resource_class` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52E724734A3` FOREIGN KEY (`title_property_id`) REFERENCES `property` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52E7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52EB84E0D1D` FOREIGN KEY (`description_property_id`) REFERENCES `property` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `resource_template_property`
--
ALTER TABLE `resource_template_property`
  ADD CONSTRAINT `FK_4689E2F116131EA` FOREIGN KEY (`resource_template_id`) REFERENCES `resource_template` (`id`),
  ADD CONSTRAINT `FK_4689E2F1549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `site`
--
ALTER TABLE `site`
  ADD CONSTRAINT `FK_694309E4571EDDA` FOREIGN KEY (`homepage_id`) REFERENCES `site_page` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_694309E47E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_694309E4FDFF2E92` FOREIGN KEY (`thumbnail_id`) REFERENCES `asset` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  ADD CONSTRAINT `FK_236473FE126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_236473FEE9ED820C` FOREIGN KEY (`block_id`) REFERENCES `site_page_block` (`id`),
  ADD CONSTRAINT `FK_236473FEEA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `site_item_set`
--
ALTER TABLE `site_item_set`
  ADD CONSTRAINT `FK_D4CE134960278D7` FOREIGN KEY (`item_set_id`) REFERENCES `item_set` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_D4CE134F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `site_page`
--
ALTER TABLE `site_page`
  ADD CONSTRAINT `FK_2F900BD9F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`);

--
-- Contraintes pour la table `site_page_block`
--
ALTER TABLE `site_page_block`
  ADD CONSTRAINT `FK_C593E731C4663E4` FOREIGN KEY (`page_id`) REFERENCES `site_page` (`id`);

--
-- Contraintes pour la table `site_permission`
--
ALTER TABLE `site_permission`
  ADD CONSTRAINT `FK_C0401D6FA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_C0401D6FF6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `site_setting`
--
ALTER TABLE `site_setting`
  ADD CONSTRAINT `FK_64D05A53F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `user_setting`
--
ALTER TABLE `user_setting`
  ADD CONSTRAINT `FK_C779A692A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `value`
--
ALTER TABLE `value`
  ADD CONSTRAINT `FK_1D7758344BC72506` FOREIGN KEY (`value_resource_id`) REFERENCES `resource` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1D775834549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1D77583489329D25` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`),
  ADD CONSTRAINT `FK_1D7758349B66727E` FOREIGN KEY (`value_annotation_id`) REFERENCES `value_annotation` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `value_annotation`
--
ALTER TABLE `value_annotation`
  ADD CONSTRAINT `FK_C03BA4EBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `vocabulary`
--
ALTER TABLE `vocabulary`
  ADD CONSTRAINT `FK_9099C97B7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
