-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 11 mars 2023 à 18:26
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.26

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `sortie`
--

-- --------------------------------------------------------

--
-- Structure de la table `campus`
--

DROP TABLE IF EXISTS `campus`;
CREATE TABLE IF NOT EXISTS `campus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `campus`
--

INSERT INTO `campus` (`id`, `nom`) VALUES
(1, 'Saint-Herblain'),
(2, 'Niort'),
(3, 'Quimper'),
(4, 'Chartres-de-Bretagne');

-- --------------------------------------------------------

--
-- Structure de la table `etat`
--

DROP TABLE IF EXISTS `etat`;
CREATE TABLE IF NOT EXISTS `etat` (
  `id` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `etat`
--

INSERT INTO `etat` (`id`, `libelle`) VALUES
(1, 'Créee'),
(2, 'Ouverte'),
(3, 'Clôturée'),
(4, 'Activité en cours'),
(5, 'Annulée'),
(6, 'Passée');

-- --------------------------------------------------------

--
-- Structure de la table `lieu`
--

DROP TABLE IF EXISTS `lieu`;
CREATE TABLE IF NOT EXISTS `lieu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ville_id` int NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2F577D59A73F0036` (`ville_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `lieu`
--

INSERT INTO `lieu` (`id`, `ville_id`, `nom`, `rue`, `latitude`, `longitude`) VALUES
(1, 12, 'East Ebba', '9401 Sid Loop\nPort Carterfort, CA 99054-1449', -67.438096, -119.845414),
(2, 18, 'Tatefort', '1041 Hollie Cliffs Suite 303\nDonnaburgh, KS 26066-4825', -16.874254, -88.177648),
(3, 41, 'Gunnarmouth', '8384 Stracke Mills\nEast Clemens, PA 81643-1265', 80.156058, 79.912202),
(4, 8, 'South Maciebury', '71291 Leonardo Trafficway\nBeahanfurt, TN 33434', -8.664545, 28.243463),
(5, 23, 'South Calista', '03283 Alford Fields Suite 345\nLelaport, VT 96280', 63.854599, -120.336963),
(6, 46, 'Rainamouth', '6123 Lulu Camp\nBriceborough, MT 68314-1501', -16.914704, -137.492517),
(7, 5, 'Chaunceyport', '1539 Kozey Gateway\nNew Dessie, NM 93255', -23.168535, -167.90143),
(8, 28, 'Connellychester', '0870 Deshawn Ridge\nColeshire, IN 46231-8966', 0.50936900000001, -27.248129),
(9, 5, 'Leoraburgh', '2985 Schulist Lane Suite 101\nKutchport, SD 80901', 58.83074, -138.234173),
(10, 13, 'Kaciefurt', '978 Jakubowski Corner\nWest Amelia, MA 56028-1135', -56.152267, -127.979135),
(11, 47, 'Rasheedhaven', '7646 Hillard Plains\nKuhicmouth, KS 95692-6825', -68.675905, 134.193933),
(12, 20, 'Lexiburgh', '81219 Kub Common Apt. 148\nWest Adriel, PA 78575-4939', -86.399978, 100.764674),
(13, 24, 'Spinkachester', '75453 Simonis Lane Apt. 126\nEast Rahsaanshire, ME 66263', -28.090398, -166.514692),
(14, 11, 'Octaviafort', '8342 Kshlerin Freeway\nWest Elenorland, OR 65411-1107', 86.809818, 81.625381),
(15, 21, 'Brennonfort', '15460 Wyman Hills Apt. 768\nNorth Oliverhaven, MO 32265', 89.718865, -23.944399),
(16, 45, 'Millermouth', '70820 Russel Highway\nEast Jonberg, MD 05533', -14.427682, -137.083499),
(17, 35, 'Schulistberg', '66298 Eveline Cape\nDeclanville, NE 76857', -50.249486, -115.460822),
(18, 39, 'Port Miguelmouth', '389 Schoen Wall Apt. 013\nLake Cartertown, NY 54313-6029', -53.403507, -110.064658),
(19, 23, 'South Bertha', '458 Coby Mall Apt. 009\nSouth Brent, AL 76709-8619', -13.011416, -112.385787),
(20, 15, 'Parkerview', '5155 Jay Corners Apt. 845\nSouth Winfield, ME 91107-1470', 68.594175, 41.907336),
(21, 13, 'Stromanland', '643 Letha Vista Suite 230\nCorastad, NE 13868-3893', -16.802948, -18.388329),
(22, 7, 'North Cleora', '691 Block Stream Suite 557\nKoelpinbury, VT 78350-8194', 66.176606, -11.644649),
(23, 37, 'Brainbury', '068 Clovis Wells Suite 261\nWest Lisa, KY 91748', 27.646672, 163.411363),
(24, 6, 'East Charleneland', '262 Adams Cove Apt. 487\nLake Zelma, AZ 12459', 40.692096, 15.719804),
(25, 42, 'North Chesley', '354 Hilpert Locks\nPort Irma, WA 85742', -18.247218, 69.018496),
(26, 31, 'Runolfsdottirland', '6702 Dietrich Rapid Apt. 540\nWest Xzavierside, SD 48346', -54.845261, 71.717696),
(27, 1, 'West Tiafort', '2785 Koelpin Tunnel\nPort Rahsaanchester, OH 68376-8214', -27.136242, -144.972689),
(28, 46, 'Altashire', '7665 Harber Radial\nWest Viviane, DC 65110-3006', -47.884291, -130.792107),
(29, 41, 'Port Omari', '49676 Watsica Plaza Apt. 495\nNew Wallace, TN 23671', -18.148276, 96.735705),
(30, 31, 'Willmsland', '697 Heidenreich Point Apt. 774\nEast Meggieview, HI 07309-8685', -66.040883, 70.999523),
(31, 9, 'Danafort', '07227 Camden Stream Apt. 117\nLake Sigurdland, ND 43262-2595', -61.372862, 12.665744),
(32, 38, 'Elroyshire', '347 Tristin Locks\nSouth Dante, PA 44357', -30.938788, 42.051731),
(33, 48, 'New Carissa', '73437 Rohan Inlet Apt. 437\nBotsfordchester, WA 52564-8211', -73.438785, 100.17658),
(34, 19, 'North Abdulport', '324 Dixie Cliff\nSouth Oliverfort, ID 05070-8351', -63.35376, -129.542135),
(35, 27, 'Stokesport', '992 Schmidt Mountain\nNew Margiechester, WI 86774', 34.023205, -140.963068),
(36, 6, 'East Savannaton', '68249 Georgianna Circle Apt. 311\nNew Bertrandtown, VT 59578', 29.381345, 62.938288),
(37, 12, 'Mohammedmouth', '150 Von Center\nLake Bud, MO 42204-4031', -16.757159, -154.966112),
(38, 32, 'Lake Kelsi', '5819 Kemmer Springs\nLake Carolynstad, UT 13194', -79.068708, 156.022675),
(39, 24, 'Larkinbury', '75101 Kale Road\nPort Annabellstad, IN 82681', 56.02403, 86.752754),
(40, 48, 'North Evangeline', '8319 Renee Forges\nNew Shannamouth, CT 42981-4583', -41.105729, -161.074659),
(41, 2, 'Rosinaton', '1282 Dicki Rue\nLake Bennie, IN 82518-4646', -27.450625, 120.16621),
(42, 29, 'Joesphshire', '063 Hessel Passage Suite 772\nRobertsfurt, FL 16458-7855', -68.923937, 35.379973),
(43, 45, 'Hodkiewiczborough', '2521 Jayde Port Suite 059\nRatkemouth, NH 05121', 24.626185, 120.323021),
(44, 17, 'Floydmouth', '8958 Lindgren Crossroad\nFritschborough, MS 12531', 25.094259, -146.169938),
(45, 37, 'East Easter', '05677 Ross Court\nHettieburgh, FL 33790', -52.82001, -104.270764),
(46, 30, 'Axelville', '21888 Dibbert Key Suite 631\nBlockfort, MS 48623', -37.714764, -69.808226),
(47, 25, 'East Eastonland', '55864 Kane Forest\nPort Vaughnborough, UT 36793', 21.883436, -68.042172),
(48, 49, 'Ruthburgh', '74483 Stefanie Underpass\nFeestshire, MD 00206-2456', 88.985612, -95.85258),
(49, 38, 'Alexandroton', '765 Gleason Viaduct\nEast Noblestad, CA 12725-1566', -40.837251, 121.700753),
(50, 36, 'Dannyshire', '035 Sylvan Streets Apt. 451\nSouth Felipa, NV 79964', -38.718415, 94.672314);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `participant`
--

DROP TABLE IF EXISTS `participant`;
CREATE TABLE IF NOT EXISTS `participant` (
  `id` int NOT NULL AUTO_INCREMENT,
  `campus_id` int NOT NULL,
  `pseudo` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `actif` tinyint(1) DEFAULT NULL,
  `photo_profil` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_D79F6B1186CC499D` (`pseudo`),
  UNIQUE KEY `UNIQ_D79F6B115126AC48` (`mail`),
  KEY `IDX_D79F6B11AF5D55E1` (`campus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `participant`
--

INSERT INTO `participant` (`id`, `campus_id`, `pseudo`, `roles`, `password`, `nom`, `prenom`, `telephone`, `mail`, `actif`, `photo_profil`) VALUES
(1, 4, 'Admin', '[\"ROLE_ADMIN\"]', '$2y$13$V230os1G7PhtbfiT7ZtkvONbPhJ0GtSFL1dW5ncvt2Ih/uNfgVLue', 'Admin', 'Admin', '0', 'admin@gmail.com', 1, 'Admin.jpg'),
(2, 1, 'SandraL2', '[\"ROLE_USER\"]', '$2y$13$XP5xR8jIoIrqAR/BWW1uwu.DZldXsxpjC/tBuwtSje9NLqzxeoECy', 'Lamiré', 'Sandra', '10066329678945', 'sandra@eni.com', 1, 'SandraL2.jpg'),
(3, 2, 'nquitzon', '[\"ROLE_USER\"]', '=5*)\'C/6Ka]u\'VZ', 'Shawn Johns', 'Angela Smith', '403.365.0070', 'wellington93@smitham.com', 0, NULL),
(4, 3, 'whitney23', '[\"ROLE_USER\"]', 'h~9wlIxrsU2h9H>T', 'Prof. Ewald Lesch I', 'Miss Brooklyn Kassulke', '1-480-042-4463', 'abeatty@welch.org', 0, NULL),
(5, 3, 'liana.cartwright', '[\"ROLE_USER\"]', '3Cz01$Ib-\'', 'Amelia Schuster', 'Cydney Rice', '1-914-151-9882', 'gusikowski.wiley@yahoo.com', 1, NULL),
(6, 1, 'greenfelder.dean', '[\"ROLE_USER\"]', '*|xdNKD`{L#&', 'Adolfo Terry', 'Wilfrid Goodwin', '633.816.7480x47686', 'chester61@hotmail.com', 0, NULL),
(7, 3, 'marjory.brekke', '[\"ROLE_USER\"]', 'o8>[g1=`e=JhTn|?', 'Dr. Alvera Tromp Jr.', 'Prof. Kattie Goodwin', '1-571-859-7840x93107', 'walsh.laura@hartmann.com', 0, NULL),
(8, 1, 'runolfsdottir.noemie', '[\"ROLE_USER\"]', '.,LH8!R', 'Lorenza Mosciski', 'Laila Bernier', '1-267-275-5711x236', 'kayden10@heller.com', 1, NULL),
(9, 1, 'jacques.maggio', '[\"ROLE_USER\"]', '06CZ7N', 'Prof. Halie Stroman MD', 'Rodger Kuhn I', '(784)225-0130x55026', 'markus84@yahoo.com', 0, NULL),
(10, 2, 'juliana35', '[\"ROLE_USER\"]', '`h]-(sn^cdMnPl', 'Dr. Don Haley', 'Jay Reichel Jr.', '(491)009-6905', 'toby37@yahoo.com', 0, NULL),
(11, 2, 'rose31', '[\"ROLE_USER\"]', 'tBsg;CXc0Tl=gM9S', 'Torey Padberg DVM', 'Dr. Nelda Hermiston', '08691271863', 'tjohnston@spinka.com', 1, NULL),
(12, 1, 'marina.spinka', '[\"ROLE_USER\"]', '1\'YwPr61$0Z', 'Joy Cassin', 'Domenic Bergstrom', '+73(1)3939975653', 'elfrieda.eichmann@gmail.com', 1, NULL),
(13, 3, 'glover.nicole', '[\"ROLE_USER\"]', '^[TlO!w', 'Ernie Skiles', 'Wendy Reinger', '05688669097', 'makayla.koepp@kihn.info', 1, NULL),
(14, 1, 'grimes.moshe', '[\"ROLE_USER\"]', '_OdqdQdKq5$Z=', 'Dr. Troy Waelchi', 'Mr. Nicholas Hermann', '515.131.7243', 'vandervort.jerrell@johnston.com', 1, NULL),
(15, 4, 'lindsey.baumbach', '[\"ROLE_USER\"]', 'sRiQ8us1DjSB~NoPYAaC', 'Easter Lebsack', 'Vincenzo Goodwin', '1-162-888-0214x13744', 'louvenia91@gmail.com', 1, NULL),
(16, 4, 'neha67', '[\"ROLE_USER\"]', '3EtV^Wygbc!W6FOY', 'Assunta West V', 'Pierre Smith', '915.098.7718x6341', 'tabshire@gmail.com', 1, NULL),
(17, 3, 'hlarkin', '[\"ROLE_USER\"]', '-jgM*\'i(qA7CVB!Ih', 'Karson Halvorson', 'Miss Lavina Barrows', '1-123-723-5176', 'levi.okuneva@beahan.net', 1, NULL),
(18, 1, 'rosanna.pacocha', '[\"ROLE_USER\"]', 'B}~&lnRKUej}C?@BU', 'Darian Hammes', 'Tom Labadie', '1-631-747-2657', 'helene.glover@reynolds.com', 1, NULL),
(19, 2, 'pansy.hodkiewicz', '[\"ROLE_USER\"]', '8Elzc+e{b;QW}:OF', 'Jade Konopelski', 'Prof. Jack Wilderman V', '768.466.0370', 'kacey80@hotmail.com', 1, NULL),
(20, 3, 'shields.dandre', '[\"ROLE_USER\"]', '$A`(\\hRkcLD', 'Adelle Kovacek II', 'America Schroeder', '175-718-5998', 'ddietrich@hotmail.com', 0, NULL),
(21, 1, 'roberts.krystel', '[\"ROLE_USER\"]', '^vrzc$F=88|u*xYW', 'Prof. Aaron Wolf DDS', 'Lawrence Lindgren', '1-408-029-5725x045', 'margarett78@gleason.com', 1, NULL),
(22, 4, 'tgrady', '[\"ROLE_USER\"]', 'aQq\"*BTI>L_z-', 'Prof. Carmelo Luettgen', 'Prof. Lexi Zboncak', '808.987.5435', 'marcelina.hettinger@yahoo.com', 0, NULL),
(23, 1, 'wreinger', '[\"ROLE_USER\"]', 'ag#][`XMS\"0Rn6{xH', 'Sophia Koelpin', 'Tillman Rodriguez', '(036)041-3057', 'gbruen@yahoo.com', 1, NULL),
(24, 3, 'florence22', '[\"ROLE_USER\"]', '3rkx<3l', 'Blaze Hills MD', 'Carter Hoeger', '+55(8)9765816323', 'nicola.schultz@murphy.com', 1, NULL),
(25, 1, 'vroberts', '[\"ROLE_USER\"]', 'f7GuMG(,F', 'Tyree Auer', 'Adalberto Murray', '1-347-541-3492x2915', 'ervin16@yahoo.com', 0, NULL),
(26, 3, 'okon.barton', '[\"ROLE_USER\"]', '\'jH<q-E.@/fQB$`_jl+', 'Solon Hamill', 'Miss Margaret Murazik', '01523438213', 'cecil.pfeffer@schulist.org', 0, NULL),
(27, 1, 'rhett33', '[\"ROLE_USER\"]', '!.d(\\e0<VRe\'Bc0Jj}<h', 'Kevin Botsford', 'Anne Hammes Jr.', '00134357528', 'ismitham@hotmail.com', 0, NULL),
(28, 3, 'pwilkinson', '[\"ROLE_USER\"]', 'b)-8P}\\O.C!NgbR1ia_', 'Zackery Lemke MD', 'Alda Carroll', '616-864-9681', 'alysha.stoltenberg@towne.info', 0, NULL),
(29, 3, 'fpadberg', '[\"ROLE_USER\"]', 'N;g`T1E|{\\H`<d', 'Garland Heaney', 'Creola Hahn', '594-046-3976x0270', 'qjacobi@yahoo.com', 1, NULL),
(30, 3, 'heller.carey', '[\"ROLE_USER\"]', 'o<7\'NZ{?:q|O2\\B|D', 'Prof. Branson Schultz', 'Antonietta Beahan', '1-665-114-2793x1706', 'efrain.conroy@kohler.com', 0, NULL),
(31, 2, 'fay.bridgette', '[\"ROLE_USER\"]', 'a{7[^D3K!.`Z', 'Dr. Cynthia Leannon II', 'Lula Bechtelar', '04590944136', 'kdooley@jacobs.info', 1, NULL),
(32, 4, 'xohara', '[\"ROLE_USER\"]', '!05?Z8XgnJ1mT3|3', 'Faye Dare', 'Addie Vandervort', '226.211.9835x35406', 'oberbrunner.madelynn@kreiger.info', 0, NULL),
(33, 1, 'leola04', '[\"ROLE_USER\"]', 'CySqW@S', 'Mr. Myron White III', 'Madelyn Sipes', '1-397-252-5247x03333', 'krystina08@gmail.com', 0, NULL),
(34, 3, 'effie.spinka', '[\"ROLE_USER\"]', 'T=60:!,W#!r5evQ/7W', 'Tony Shanahan', 'Dr. Mariah Runte Jr.', '(887)525-5633x2523', 'bertrand62@yahoo.com', 0, NULL),
(35, 1, 'cwitting', '[\"ROLE_USER\"]', '=4fy{GCK]P1t`N$n}A;m', 'Mr. Jamarcus Hettinger', 'Hertha Zulauf', '(518)540-9987x01165', 'vskiles@gmail.com', 0, NULL),
(36, 3, 'kelsie72', '[\"ROLE_USER\"]', '_I|QPAY29', 'Dr. Glenna Kutch DVM', 'Dr. Aletha Hegmann', '231.396.9536', 'fannie00@hotmail.com', 1, NULL),
(37, 2, 'luettgen.leanne', '[\"ROLE_USER\"]', 'O3CBa\'$]+', 'Prof. Julian O\'Reilly DDS', 'Annalise Zulauf', '(884)669-5483', 'jcole@hotmail.com', 1, NULL),
(38, 3, 'gideon.heidenreich', '[\"ROLE_USER\"]', 'rnR-0X', 'Karlie Shanahan', 'Eleanore Kautzer', '02020019415', 'glennie.rippin@schumm.com', 1, NULL),
(39, 1, 'dbreitenberg', '[\"ROLE_USER\"]', 'h0qJ)4LhM[/u!6l-jh', 'Paul Rogahn', 'Roscoe Conn', '+67(3)0083019048', 'giovanna.wintheiser@yahoo.com', 1, NULL),
(40, 1, 'alessandra68', '[\"ROLE_USER\"]', 'QYg6[]{2', 'Dario Runte I', 'Beulah Schimmel', '+97(9)1326898110', 'fohara@hotmail.com', 1, NULL),
(41, 2, 'aiyana44', '[\"ROLE_USER\"]', 'nq{kKIMt', 'Jerrold Larkin', 'Prof. Giovanni Gleason Jr.', '193.687.8488x7040', 'terry.becker@yahoo.com', 1, NULL),
(42, 1, 'egoodwin', '[\"ROLE_USER\"]', '\"$pwO?55_`', 'Dr. Brigitte McGlynn', 'Ms. Victoria Spencer Jr.', '(763)194-2692', 'ritchie.nadia@yahoo.com', 1, NULL),
(43, 1, 'drohan', '[\"ROLE_USER\"]', '\\!MO\\\\CfKIMGE`wS', 'Sonia Conn', 'Simone Harber', '649.111.3474x74256', 'wschaden@boyer.com', 0, NULL),
(44, 1, 'jamir39', '[\"ROLE_USER\"]', 'WJ)S$I5sc_Bq<u.k^', 'Damion Considine', 'Myriam Rau', '(229)592-0532x68080', 'sidney.blick@gmail.com', 0, NULL),
(45, 3, 'heather35', '[\"ROLE_USER\"]', 'z1H/Wp?__\"(', 'Prof. Guy Reichel', 'Maud Tillman', '305.669.0422', 'ahmed.lebsack@gmail.com', 1, NULL),
(46, 1, 'hdibbert', '[\"ROLE_USER\"]', 'QkZ?;r&g3:\'D_I-*\'', 'Ebony Sipes', 'Ms. Josiane Franecki MD', '415-946-6236x8526', 'garfield74@ullrich.com', 0, NULL),
(47, 1, 'kris.bernadine', '[\"ROLE_USER\"]', '[xP8pK}c=Y@lm1z2]XiS', 'Kaela Nikolaus', 'Christa Orn', '(510)199-5435', 'jeramy05@yahoo.com', 1, NULL),
(48, 3, 'ilehner', '[\"ROLE_USER\"]', 'C-Fr,Kg}QIV(x,wj4', 'Sid Cremin', 'Alysha Hayes', '(733)319-6349', 'kennedi53@gmail.com', 0, NULL),
(49, 3, 'kelsie.thiel', '[\"ROLE_USER\"]', 'ZoATv*qQ&QgQadM9', 'Pasquale Shanahan', 'Retta Gerlach', '1-408-406-8654x670', 'mitchell.carole@yahoo.com', 1, NULL),
(50, 2, 'cprosacco', '[\"ROLE_USER\"]', '\"Y^N#e', 'Laron Reichert', 'Prof. Cecil Weber IV', '+83(7)1448920184', 'stanton.marianna@gmail.com', 1, NULL),
(51, 2, 'retha71', '[\"ROLE_USER\"]', 'rplZ<CG9}[TY,', 'Prof. Cyril Sipes V', 'Sibyl Simonis', '968-506-7785x9130', 'stokes.aliya@gmail.com', 0, NULL),
(52, 1, 'adah.willms', '[\"ROLE_USER\"]', 'LW>`:7<fL&v(4I', 'Rashad Stokes MD', 'Benton Metz', '083.945.7095', 'ullrich.viviane@bartoletti.net', 1, NULL),
(53, 4, 'rosalinda30', '[\"ROLE_USER\"]', 'uII,c=v=', 'Christine Kerluke MD', 'Dr. Kristoffer McLaughlin Sr.', '1-791-233-3193x9851', 'leora.green@oconner.com', 1, NULL),
(54, 2, 'streutel', '[\"ROLE_USER\"]', '.S\'`rWnJNc;Rm', 'Jules Schneider', 'Clemens Moen PhD', '667.324.6853x3149', 'zulauf.theodore@gmail.com', 0, NULL),
(55, 4, 'cartwright.vinnie', '[\"ROLE_USER\"]', 'u\'cMAz-,1gs=EykR:c1', 'Mike Kling', 'June Runte', '(504)910-1195x37861', 'gschowalter@zieme.net', 1, NULL),
(56, 1, 'dangelo.schmeler', '[\"ROLE_USER\"]', '7flMuScqY\\>', 'Arnulfo Maggio', 'Dr. Tyrell Feil', '881-186-2210x1761', 'akovacek@wilderman.com', 0, NULL),
(57, 3, 'paula35', '[\"ROLE_USER\"]', 'EMz)Jmm#*g:g\'', 'Gerald Davis', 'Rosemary Lockman', '(929)957-0390x550', 'elyse.tremblay@gmail.com', 0, NULL),
(58, 4, 'ortiz.herminio', '[\"ROLE_USER\"]', '2i1JtvLM933{uV17', 'Ms. Estel Homenick DDS', 'Edwin Hagenes', '917-051-4599x97131', 'lbernhard@hotmail.com', 0, NULL),
(59, 2, 'jazmyne.walter', '[\"ROLE_USER\"]', '{qjweM6)xR', 'Loraine Herzog', 'Elias Zemlak', '+69(1)3984246218', 'collier.milo@roob.net', 1, NULL),
(60, 2, 'kenya.mohr', '[\"ROLE_USER\"]', '<h&2dt.+gP[\'=Xyk%Q', 'Mr. Omari Kautzer DDS', 'Kelley Feeney', '(017)425-5235', 'althea87@gmail.com', 1, NULL),
(61, 4, 'mnader', '[\"ROLE_USER\"]', 'F`+8iIt', 'Dr. Mariana Jenkins MD', 'Alayna Prohaska', '1-277-530-6430x887', 'darlene.grady@langworth.com', 1, NULL),
(62, 4, 'eweber', '[\"ROLE_USER\"]', 'eav}t}U5{=OBs=S$,', 'Domenico Kerluke', 'Dr. Johnny Herman', '(194)447-8024x880', 'granville.jast@hotmail.com', 1, NULL),
(63, 3, 'jhowe', '[\"ROLE_USER\"]', '9.9VEw2~ytS%#h', 'Darrel Hoppe', 'Prof. Franco Smitham', '(237)406-3694', 'ned.fisher@cummings.biz', 1, NULL),
(64, 2, 'dixie.wilkinson', '[\"ROLE_USER\"]', ';`U,M^eAbtKXa*W0^', 'Valentin Greenfelder', 'Jacques Graham', '1-038-406-4459', 'theller@hotmail.com', 0, NULL),
(65, 3, 'roma.pouros', '[\"ROLE_USER\"]', 'uXj8(2B8\'TMb!L', 'Enos Kuphal', 'Damian Wunsch', '01219396515', 'granville.reynolds@gmail.com', 0, NULL),
(66, 4, 'zgusikowski', '[\"ROLE_USER\"]', 'n\'eLR}', 'Sim Gislason V', 'Prof. Karlee Fadel Sr.', '249-681-3152', 'winifred.huel@hotmail.com', 0, NULL),
(67, 2, 'wyman08', '[\"ROLE_USER\"]', ':GQ\'hnK!L5c~Mw', 'Karson Abshire', 'Abby Bartoletti', '1-298-688-2555', 'yhomenick@yahoo.com', 0, NULL),
(68, 1, 'baron09', '[\"ROLE_USER\"]', 'y+<.dF', 'Dr. Virgie Bartoletti', 'Haley Stroman', '1-385-444-4902x333', 'obosco@bergstrom.net', 1, NULL),
(69, 4, 'jakob92', '[\"ROLE_USER\"]', '\">d;\'/LF#r', 'Creola Harber', 'Jadyn Armstrong', '478-107-9946x784', 'sraynor@hotmail.com', 0, NULL),
(70, 3, 'will.arianna', '[\"ROLE_USER\"]', 'J<*q9SFK0$S-', 'Shaniya Schroeder', 'Dr. Bruce Erdman Sr.', '551.081.8577x4216', 'mireya.von@grimes.com', 1, NULL),
(71, 4, 'lilian33', '[\"ROLE_USER\"]', '>k!o.!.U7\'uGy7jWI', 'Silas Spencer', 'Vito Schultz', '(199)519-3967', 'aheaney@beier.com', 0, NULL),
(72, 3, 'preston34', '[\"ROLE_USER\"]', '5HJDO-r,Ie%:)#0OA', 'Claud Schultz', 'Prof. Martin Batz DDS', '09751838868', 'sconn@yahoo.com', 1, NULL),
(73, 4, 'jakayla.boyle', '[\"ROLE_USER\"]', 'qW#kAJ!shM^)', 'Santina Walter MD', 'Ursula Klein', '(406)875-1688', 'strosin.mossie@gmail.com', 0, NULL),
(74, 3, 'estoltenberg', '[\"ROLE_USER\"]', 'Q\'sE40H]e?J.\"Q#', 'Lafayette Kozey', 'Ms. Carley Beer', '1-241-339-3504', 'larson.melany@ankunding.com', 1, NULL),
(75, 3, 'rogahn.ernie', '[\"ROLE_USER\"]', 'w@0^m6J', 'Dr. Alycia Marquardt III', 'Marjory Jones', '869-183-4655x32994', 'marcel00@gmail.com', 0, NULL),
(76, 2, 'boyer.hugh', '[\"ROLE_USER\"]', 'z\"kS5=Yk58}/m-', 'Ida Blick', 'Rosanna Halvorson', '324.638.7102x1616', 'hilario.durgan@glover.com', 1, NULL),
(77, 3, 'kshlerin.lilla', '[\"ROLE_USER\"]', 'o$9<;:h<*:l,Y;`J', 'Lesly White', 'Mr. Tre Franecki PhD', '1-330-168-2710x0733', 'zbogan@bode.com', 0, NULL),
(78, 4, 'ashlynn01', '[\"ROLE_USER\"]', 'B14LB|YA_aE*Y&', 'Dallin Nitzsche IV', 'Alysson Bartell', '588-868-2141x2495', 'spencer.german@yahoo.com', 0, NULL),
(79, 4, 'nienow.bella', '[\"ROLE_USER\"]', '<ep~yy6', 'Laurence Schroeder', 'Dr. Genesis Konopelski IV', '1-929-105-6481x457', 'eveline.moen@rice.com', 1, NULL),
(80, 3, 'marilou.doyle', '[\"ROLE_USER\"]', 'WW4^/F0y3~\'-x_{fE', 'Dr. Millie McKenzie', 'Gwen Streich', '(163)433-0286x946', 'fmarvin@murray.net', 0, NULL),
(81, 1, 'lenny.bartoletti', '[\"ROLE_USER\"]', 'w7SE^/^q`]+', 'Ines Brekke I', 'Lucas Roberts I', '1-692-619-1268x664', 'tobin.medhurst@legros.com', 0, NULL),
(82, 4, 'sconnelly', '[\"ROLE_USER\"]', 'G3FS&VQ+S3&[w!zSa+Y', 'Dr. Hazel Green DVM', 'Ernie Gleason', '(152)528-6447x5595', 'bert.kihn@reichel.com', 1, NULL),
(83, 3, 'rashad35', '[\"ROLE_USER\"]', '&\\Up$K)kkYvQ}UoFH', 'Prof. Jennyfer McClure I', 'Darlene O\'Kon', '1-523-191-5729x98249', 'aledner@murray.info', 0, NULL),
(84, 3, 'abahringer', '[\"ROLE_USER\"]', 'rphZ>i+H', 'Mr. Rodger Stracke', 'Luciano Tillman', '536.180.8770x98580', 'hoeger.lesley@ryan.com', 0, NULL),
(85, 2, 'amira29', '[\"ROLE_USER\"]', 'K!9Ol9V#|', 'Tiara Hirthe', 'Miss Clarabelle Lehner IV', '1-223-135-4690x843', 'destiny.kuphal@feest.info', 0, NULL),
(86, 4, 'dahlia00', '[\"ROLE_USER\"]', '2499XS.$~`Hgc*fDOGov', 'Leanna Huels MD', 'Mr. London O\'Conner V', '946-665-7297x364', 'lydia.raynor@gmail.com', 0, NULL),
(87, 2, 'leffler.loyce', '[\"ROLE_USER\"]', 'm,1thqNKcg', 'Mireya Luettgen', 'Priscilla Sauer DVM', '633-708-9862', 'river.mcglynn@kertzmann.com', 1, NULL),
(88, 1, 'heaney.estell', '[\"ROLE_USER\"]', '=bBQ=T#rTs+&_(&o/\"', 'Katherine Erdman', 'Zetta Dietrich', '(285)813-4201', 'ressie35@hotmail.com', 1, NULL),
(89, 2, 'atremblay', '[\"ROLE_USER\"]', '>{~nY)', 'Claudia Rogahn', 'Lucy Rohan', '1-311-223-1520', 'gleason.kris@fahey.com', 0, NULL),
(90, 2, 'yharris', '[\"ROLE_USER\"]', 'CxSg(^IVHJVvAt5ngYrB', 'Malika Ziemann', 'Max Stokes', '(209)725-1865', 'maybell.bashirian@nader.info', 1, NULL),
(91, 4, 'edd81', '[\"ROLE_USER\"]', 'L7%Slla', 'Prof. Linwood Casper Sr.', 'Loy Swift V', '827-248-3367', 'eloy06@hotmail.com', 0, NULL),
(92, 3, 'greg.romaguera', '[\"ROLE_USER\"]', '2gvl)zN4tJfrRoUzx;/O', 'Prof. Harry Moore', 'Carolyne Walter III', '334.649.7852x0121', 'maggio.zion@hermiston.com', 0, NULL),
(93, 1, 'noah16', '[\"ROLE_USER\"]', 'AGc\"SV%G8gb606t`H\"b', 'Miss Stacey Murphy II', 'Jadon Pollich', '(199)825-6931', 'zboncak.lyric@hotmail.com', 1, NULL),
(94, 1, 'quentin19', '[\"ROLE_USER\"]', '\'>k`$d:C\'.CUaS?d/=v', 'Lillian Bernhard', 'Victor Schmitt', '1-143-653-7303', 'marks.christiana@mosciski.biz', 1, NULL),
(95, 3, 'lexi42', '[\"ROLE_USER\"]', '9j:946aAWrvy#', 'Dr. Cade Brown', 'Dr. Rex Parker DDS', '586-492-9403x429', 'alphonso13@greenholt.com', 0, NULL),
(96, 3, 'rkozey', '[\"ROLE_USER\"]', ',IGhXAg5[g\"mG]o{X', 'Miss Carole Streich V', 'Dr. Trent McCullough', '+84(1)4204645472', 'ernser.lori@murray.com', 0, NULL),
(97, 4, 'ila81', '[\"ROLE_USER\"]', 'm5dbzi1%)M;#r]?gy|', 'Tremaine Kautzer', 'Prof. Clemens Ankunding Sr.', '535.181.8977x282', 'joaquin.howell@stark.com', 0, NULL),
(98, 2, 'wilhelmine.senger', '[\"ROLE_USER\"]', 's=!a#|<E>5j^D|', 'Alana Hammes', 'Dr. Ramon Koch Jr.', '247-808-4104', 'zhahn@kshlerin.info', 1, NULL),
(99, 1, 'keven.mcglynn', '[\"ROLE_USER\"]', '*q.r~!\"3!', 'Kay Macejkovic Sr.', 'Oma Hilpert', '812.257.7819', 'rafael66@carter.com', 0, NULL),
(100, 2, 'neha36', '[\"ROLE_USER\"]', '%eNx^c%8LD@l^7EMrqG', 'Keely Flatley', 'Tyrel Beier II', '349.029.1813', 'dpadberg@hagenes.com', 0, NULL),
(101, 3, 'jabari.purdy', '[\"ROLE_USER\"]', 'T8I?JfGa.Yy7&BM9LS]', 'Andres Walsh', 'Nayeli Marquardt DVM', '(924)913-4448x465', 'moshe.ankunding@yahoo.com', 0, NULL),
(102, 3, 'fisher.alejandra', '[\"ROLE_USER\"]', 'AI7F{Y=$-D', 'Isac Green', 'Hermann Ernser', '(371)381-1141', 'reese.ritchie@gmail.com', 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `participant_sortie`
--

DROP TABLE IF EXISTS `participant_sortie`;
CREATE TABLE IF NOT EXISTS `participant_sortie` (
  `participant_id` int NOT NULL,
  `sortie_id` int NOT NULL,
  PRIMARY KEY (`participant_id`,`sortie_id`),
  KEY `IDX_8E436D739D1C3019` (`participant_id`),
  KEY `IDX_8E436D73CC72D953` (`sortie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `participant_sortie`
--

INSERT INTO `participant_sortie` (`participant_id`, `sortie_id`) VALUES
(1, 96),
(2, 33),
(2, 55),
(2, 103);

-- --------------------------------------------------------

--
-- Structure de la table `sortie`
--

DROP TABLE IF EXISTS `sortie`;
CREATE TABLE IF NOT EXISTS `sortie` (
  `id` int NOT NULL AUTO_INCREMENT,
  `site_organisateur_id` int NOT NULL,
  `lieu_id` int NOT NULL,
  `etat_id` int NOT NULL,
  `organisateur_id` int NOT NULL,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_heure_debut` datetime NOT NULL,
  `duree` int NOT NULL,
  `date_limite_inscription` datetime NOT NULL,
  `nb_inscriptions_max` int NOT NULL,
  `infos_sortie` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_3C3FD3F2D7AC6C11` (`site_organisateur_id`),
  KEY `IDX_3C3FD3F26AB213CC` (`lieu_id`),
  KEY `IDX_3C3FD3F2D5E86FF` (`etat_id`),
  KEY `IDX_3C3FD3F2D936B2FA` (`organisateur_id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `sortie`
--

INSERT INTO `sortie` (`id`, `site_organisateur_id`, `lieu_id`, `etat_id`, `organisateur_id`, `nom`, `date_heure_debut`, `duree`, `date_limite_inscription`, `nb_inscriptions_max`, `infos_sortie`) VALUES
(1, 2, 28, 3, 55, 'Louvenia Harvey', '2021-05-18 11:16:27', 165, '2021-05-18 11:16:27', 221, 'Noel Reynolds'),
(2, 4, 29, 4, 8, 'Allie Powlowski', '2021-07-16 03:46:44', 589, '2021-07-16 03:46:44', 874, 'Moshe Kris DVM'),
(3, 1, 26, 5, 40, 'Prof. Tavares Becker', '2021-06-12 14:43:05', 919, '2021-06-12 14:43:05', 732, 'Dr. Eve McClure'),
(4, 3, 11, 1, 66, 'Lempi Barrows', '2022-11-10 06:23:37', 862, '2022-11-10 06:23:37', 493, 'Georgette Tremblay'),
(5, 4, 29, 3, 95, 'Reynold Sanford', '2022-05-02 03:57:20', 587, '2022-05-02 03:57:20', 407, 'Berenice Steuber'),
(6, 3, 6, 3, 80, 'Orlando Hyatt', '2022-10-12 20:25:11', 240, '2022-10-12 20:25:11', 826, 'Devin Jenkins'),
(7, 2, 45, 1, 3, 'Prof. Gracie Swift', '2022-06-17 18:14:05', 603, '2022-06-17 18:14:05', 179, 'Olen Quitzon IV'),
(8, 4, 37, 4, 2, 'Omari Senger', '2021-04-06 03:45:59', 240, '2021-04-06 03:45:59', 123, 'Mrs. Katlyn Davis DDS'),
(9, 2, 2, 4, 72, 'Aisha Rolfson', '2021-11-30 04:14:02', 711, '2021-11-30 04:14:02', 82, 'Tom Gerlach'),
(10, 3, 22, 3, 18, 'Mrs. Lavada Swaniawski I', '2021-12-23 16:43:05', 539, '2021-12-23 16:43:05', 279, 'Johann Koepp'),
(11, 3, 49, 5, 23, 'Maritza Brakus DVM', '2023-03-01 03:26:04', 675, '2023-03-01 03:26:04', 721, 'Cassandra Borer'),
(12, 4, 10, 2, 15, 'Anika Hane IV', '2021-11-12 13:56:02', 367, '2021-11-12 13:56:02', 653, 'Valentina Turcotte'),
(13, 4, 45, 3, 34, 'Ms. Liliana Heaney', '2022-07-29 02:29:56', 918, '2022-07-29 02:29:56', 264, 'Ms. Daphney Carroll'),
(14, 3, 23, 1, 18, 'Berenice Rath', '2021-08-13 00:58:27', 2, '2021-08-13 00:58:27', 971, 'Prof. Elvis O\'Keefe PhD'),
(15, 3, 6, 3, 82, 'Kaelyn Dietrich', '2022-06-06 21:26:27', 197, '2022-06-06 21:26:27', 354, 'Doris O\'Reilly PhD'),
(16, 3, 12, 2, 53, 'Ms. Jacklyn Spinka', '2022-04-11 16:26:46', 346, '2022-04-11 16:26:46', 163, 'Jena Kiehn Sr.'),
(17, 3, 19, 4, 72, 'Kaitlyn Hayes', '2022-11-18 21:20:53', 303, '2022-11-18 21:20:53', 961, 'Jarod Carter'),
(18, 1, 43, 5, 70, 'Annie Greenholt', '2022-09-16 00:40:41', 844, '2022-09-16 00:40:41', 714, 'Terrell Ullrich'),
(19, 2, 36, 5, 3, 'Ms. Missouri Gaylord DDS', '2023-01-16 13:01:36', 477, '2023-01-16 13:01:36', 906, 'Trycia Grady II'),
(20, 3, 19, 3, 53, 'Jewell Luettgen', '2022-06-30 20:53:17', 717, '2022-06-30 20:53:17', 198, 'Ms. Mary Reichel'),
(21, 2, 42, 5, 25, 'Niko Reynolds', '2022-05-17 00:21:22', 20, '2022-05-17 00:21:22', 671, 'Dr. Lambert Denesik MD'),
(22, 4, 12, 3, 84, 'Layne Spinka', '2021-10-24 18:42:21', 11, '2021-10-24 18:42:21', 272, 'Rosalee Yundt'),
(23, 2, 8, 4, 44, 'Mrs. Aliza O\'Connell III', '2021-05-02 11:56:31', 278, '2021-05-02 11:56:31', 114, 'Dr. Tyree Rempel'),
(24, 2, 18, 2, 66, 'Maude Hodkiewicz', '2023-02-11 01:01:23', 586, '2023-02-11 01:01:23', 191, 'Lance Kiehn'),
(25, 2, 25, 3, 41, 'Marlene Bartell', '2021-11-11 06:48:51', 811, '2021-11-11 06:48:51', 903, 'Katrina Friesen'),
(26, 4, 24, 5, 76, 'Jesus Bogan', '2022-05-01 15:53:44', 361, '2022-05-01 15:53:44', 241, 'Anais Fritsch'),
(27, 2, 31, 3, 81, 'Prof. Raoul Cremin II', '2022-01-26 05:59:34', 111, '2022-01-26 05:59:34', 861, 'Orpha Hahn'),
(28, 4, 35, 5, 88, 'Annabel Kuhic', '2021-11-21 19:02:18', 396, '2021-11-21 19:02:18', 44, 'Dr. Michael Rodriguez'),
(29, 4, 47, 5, 8, 'Brigitte Hilll', '2022-07-22 09:05:01', 192, '2022-07-22 09:05:01', 730, 'Rylan Sauer'),
(30, 2, 29, 1, 3, 'Ricardo Towne I', '2022-03-06 23:01:57', 921, '2022-03-06 23:01:57', 553, 'Faye Bergnaum'),
(31, 4, 43, 2, 11, 'Hayley Schneider', '2022-06-23 23:18:14', 661, '2022-06-23 23:18:14', 117, 'Talia Wisozk'),
(32, 2, 12, 3, 9, 'Irma Deckow', '2022-12-10 18:43:05', 709, '2022-12-10 18:43:05', 559, 'Ellen Lueilwitz'),
(33, 1, 45, 2, 36, 'Rollin Gutmann', '2023-01-30 02:46:30', 466, '2023-01-30 02:46:30', 669, 'Esperanza Homenick'),
(34, 3, 37, 3, 53, 'Lon Cummerata', '2022-01-05 06:21:40', 939, '2022-01-05 06:21:40', 973, 'Walter Schaden'),
(35, 3, 20, 4, 9, 'Gustave Reichert', '2021-03-25 03:16:47', 643, '2021-03-25 03:16:47', 903, 'Johnathon Lebsack IV'),
(36, 4, 38, 5, 87, 'Dr. Domenico Mraz V', '2021-05-27 21:51:29', 0, '2021-05-27 21:51:29', 294, 'Maya Yost'),
(37, 4, 25, 2, 81, 'Delpha Bailey V', '2023-03-06 01:42:48', 421, '2023-03-06 01:42:48', 677, 'Eugenia Crist'),
(38, 2, 38, 1, 8, 'Orlando Jacobs', '2021-12-19 14:27:21', 163, '2021-12-19 14:27:21', 935, 'Mossie Gerhold'),
(39, 3, 31, 5, 8, 'Pattie Walter Sr.', '2022-06-30 05:40:48', 162, '2022-06-30 05:40:48', 953, 'Dr. Chaim Gusikowski'),
(40, 2, 1, 2, 31, 'Kiara Lind', '2022-10-05 21:44:58', 762, '2022-10-05 21:44:58', 520, 'Jeffry Little'),
(41, 3, 35, 4, 54, 'Dr. Adrain Fay', '2021-04-20 14:52:29', 383, '2021-04-20 14:52:29', 39, 'Dudley Vandervort'),
(42, 1, 28, 1, 52, 'Hayley Olson', '2022-06-29 08:55:01', 708, '2022-06-29 08:55:01', 839, 'Hillard Boyle DVM'),
(43, 3, 34, 3, 23, 'Mariana Langworth DDS', '2022-11-27 03:22:08', 222, '2022-11-27 03:22:08', 965, 'Mrs. Katelynn Christiansen'),
(44, 2, 28, 1, 89, 'Jarrod Schneider IV', '2023-02-03 23:25:24', 124, '2023-02-03 23:25:24', 740, 'Mrs. Evelyn Baumbach'),
(45, 4, 6, 3, 12, 'Lambert Walter', '2023-01-29 17:41:11', 784, '2023-01-29 17:41:11', 35, 'Lizzie Wilderman'),
(46, 4, 19, 1, 100, 'Fabian Turcotte', '2022-03-17 09:47:00', 341, '2022-03-17 09:47:00', 313, 'Adalberto Kiehn'),
(47, 4, 45, 5, 66, 'Jordi Haag', '2021-10-05 21:34:30', 469, '2021-10-05 21:34:30', 349, 'Twila Schneider'),
(48, 3, 4, 3, 94, 'Nicolas Ondricka', '2021-06-12 05:24:46', 118, '2021-06-12 05:24:46', 146, 'Lexi Renner'),
(49, 1, 19, 2, 14, 'Ms. Leanne Conn Jr.', '2022-09-04 05:00:50', 699, '2022-09-04 05:00:50', 258, 'Jennie Gleason I'),
(50, 4, 45, 1, 99, 'Kale Ledner', '2021-11-16 15:58:50', 142, '2021-11-16 15:58:50', 417, 'Carrie Murazik'),
(51, 2, 24, 4, 52, 'Ms. Lelah Hintz V', '2022-04-23 21:40:20', 686, '2022-04-23 21:40:20', 855, 'Cruz Lind'),
(52, 4, 2, 4, 30, 'Royal Steuber I', '2022-07-26 15:57:28', 677, '2022-07-26 15:57:28', 841, 'Margret Spencer'),
(53, 3, 49, 3, 71, 'Walton Upton', '2022-07-28 01:46:23', 855, '2022-07-28 01:46:23', 465, 'Annabel Hilpert'),
(54, 3, 27, 3, 95, 'Fernando Armstrong', '2021-06-13 00:29:21', 373, '2021-06-13 00:29:21', 159, 'Aimee Effertz'),
(55, 1, 45, 2, 15, 'Mr. Alec Bednar PhD', '2021-08-08 08:31:06', 628, '2021-08-08 08:31:06', 914, 'Prof. Randall Cummerata PhD'),
(56, 1, 43, 4, 42, 'Kyler Kertzmann', '2021-03-12 20:13:32', 283, '2021-03-12 20:13:32', 411, 'Rachael Cremin'),
(57, 4, 45, 3, 95, 'Gia Stehr', '2022-08-13 14:25:51', 41, '2022-08-13 14:25:51', 988, 'Iva Wyman'),
(58, 3, 24, 1, 79, 'Eulah Lueilwitz', '2021-09-30 06:33:21', 111, '2021-09-30 06:33:21', 73, 'Prof. Brianne Grimes DVM'),
(59, 2, 26, 3, 76, 'Courtney Crona', '2021-07-09 03:26:16', 175, '2021-07-09 03:26:16', 208, 'Dr. Wilburn Crona'),
(60, 4, 25, 4, 33, 'Ms. Vesta Parisian', '2022-05-11 22:24:19', 949, '2022-05-11 22:24:19', 628, 'Dr. June Stark Sr.'),
(61, 1, 9, 3, 67, 'Amanda Thompson II', '2021-12-10 07:31:04', 426, '2021-12-10 07:31:04', 43, 'Bo Weber DVM'),
(62, 1, 36, 1, 75, 'Tierra Mann Sr.', '2021-05-08 20:47:01', 720, '2021-05-08 20:47:01', 495, 'Macy Frami'),
(63, 2, 31, 3, 21, 'Eliseo Rohan', '2021-10-23 10:04:24', 941, '2021-10-23 10:04:24', 819, 'Vivien Klein'),
(64, 3, 23, 4, 50, 'Lonie Bednar', '2022-03-02 22:43:58', 174, '2022-03-02 22:43:58', 212, 'Judah Mertz'),
(65, 4, 50, 3, 90, 'Ena Champlin', '2021-05-05 23:18:05', 411, '2021-05-05 23:18:05', 474, 'Bethel Murazik'),
(66, 3, 20, 1, 36, 'Fredrick Lubowitz DVM', '2022-04-25 01:09:54', 203, '2022-04-25 01:09:54', 687, 'Prof. Ethel O\'Conner DVM'),
(67, 1, 46, 5, 23, 'Mossie Lowe', '2023-01-05 11:48:44', 11, '2023-01-05 11:48:44', 15, 'Elise White'),
(68, 2, 34, 2, 22, 'Arne Weimann', '2021-07-10 12:05:11', 814, '2021-07-10 12:05:11', 708, 'Mr. Ezequiel Murphy'),
(69, 3, 26, 3, 96, 'Destini White MD', '2021-05-10 07:51:33', 610, '2021-05-10 07:51:33', 307, 'Carmen Deckow'),
(70, 4, 21, 1, 40, 'Nannie Mayer DVM', '2022-08-25 08:50:04', 847, '2022-08-25 08:50:04', 563, 'Lucious Weber'),
(71, 3, 12, 5, 3, 'Prof. Cynthia Dibbert', '2022-08-24 14:40:03', 555, '2022-08-24 14:40:03', 526, 'Mr. Myles Deckow'),
(72, 2, 28, 3, 37, 'Kendra Lemke', '2022-11-28 03:55:55', 738, '2022-11-28 03:55:55', 803, 'Prof. Sister Mraz Sr.'),
(73, 3, 29, 3, 93, 'Sister Ledner MD', '2022-10-13 00:29:05', 834, '2022-10-13 00:29:05', 689, 'Mrs. Vernice Hermann V'),
(74, 1, 33, 4, 57, 'Miss Heidi Yost PhD', '2023-01-28 06:56:04', 787, '2023-01-28 06:56:04', 477, 'Tyra Hettinger'),
(75, 4, 22, 3, 45, 'Mr. Lucas Murazik DDS', '2022-09-11 01:45:43', 862, '2022-09-11 01:45:43', 23, 'Ellsworth Corwin PhD'),
(76, 3, 2, 3, 94, 'Alden Grady III', '2022-03-07 00:47:46', 854, '2022-03-07 00:47:46', 403, 'Rachael Graham'),
(77, 2, 19, 5, 24, 'Vito Gibson', '2023-01-30 09:05:02', 809, '2023-01-30 09:05:02', 875, 'Georgette White'),
(78, 4, 38, 3, 70, 'Ms. Kathleen Sawayn', '2022-03-25 07:14:19', 140, '2022-03-25 07:14:19', 519, 'Pablo Kuhlman'),
(79, 1, 15, 3, 99, 'Dr. Kailee Hansen', '2022-02-24 16:50:05', 928, '2022-02-24 16:50:05', 974, 'Devon Kiehn MD'),
(80, 1, 16, 3, 49, 'Marques Upton', '2022-08-16 18:13:12', 816, '2022-08-16 18:13:12', 330, 'Darius Murray'),
(81, 1, 50, 3, 50, 'Prof. Franco Homenick PhD', '2022-09-25 06:09:58', 333, '2022-09-25 06:09:58', 343, 'Hermann Bartoletti'),
(82, 3, 32, 2, 64, 'Mohammed O\'Hara', '2022-06-18 12:34:11', 902, '2022-06-18 12:34:11', 711, 'Cordell Hauck'),
(83, 3, 46, 3, 11, 'Mr. Emilio Harber', '2021-08-23 20:40:00', 75, '2021-08-23 20:40:00', 647, 'Ally Homenick'),
(84, 2, 1, 5, 9, 'Brenna Kessler', '2022-04-02 09:41:06', 402, '2022-04-02 09:41:06', 709, 'Augusta Becker'),
(85, 2, 45, 3, 72, 'Mr. Neal Lindgren Jr.', '2021-10-13 16:07:11', 840, '2021-10-13 16:07:11', 328, 'Delbert Parisian'),
(86, 1, 48, 3, 4, 'Mrs. Iliana Romaguera', '2021-07-26 18:50:43', 569, '2021-07-26 18:50:43', 839, 'Sheridan Gottlieb'),
(87, 2, 44, 5, 53, 'Serenity Pouros DDS', '2021-12-16 10:38:10', 90, '2021-12-16 10:38:10', 933, 'Ms. Adrianna Dicki III'),
(88, 4, 49, 1, 8, 'Rowan Steuber', '2022-08-30 13:23:58', 250, '2022-08-30 13:23:58', 272, 'Ashly Kohler I'),
(89, 2, 44, 1, 63, 'Gia Howell', '2021-04-13 02:44:39', 375, '2021-04-13 02:44:39', 22, 'Samanta Hermann'),
(90, 3, 16, 3, 16, 'Prof. Libby Leffler V', '2021-08-27 10:31:08', 539, '2021-08-27 10:31:08', 324, 'Ms. Yolanda Jaskolski DDS'),
(91, 3, 2, 2, 97, 'Madonna Schuppe', '2021-04-26 16:41:15', 194, '2021-04-26 16:41:15', 310, 'Pamela DuBuque'),
(92, 3, 17, 3, 13, 'Julio Trantow', '2022-01-27 21:05:19', 134, '2022-01-27 21:05:19', 389, 'Sterling Koss'),
(93, 4, 46, 2, 31, 'Emerald Green', '2021-11-23 04:42:46', 706, '2021-11-23 04:42:46', 260, 'Prof. Keaton Bauch'),
(94, 3, 24, 5, 27, 'Paula Mitchell', '2021-06-22 03:04:23', 752, '2021-06-22 03:04:23', 263, 'Bobby Emard'),
(95, 3, 47, 3, 35, 'Lizzie Gislason', '2022-09-14 16:56:18', 647, '2022-09-14 16:56:18', 632, 'Miss Talia Kohler II'),
(96, 1, 2, 2, 19, 'Gabrielle Collins', '2021-12-06 13:15:28', 669, '2021-12-06 13:15:28', 499, 'Myah Greenholt I'),
(97, 4, 18, 3, 57, 'Dr. Eldridge Heaney', '2022-10-13 21:30:11', 567, '2022-10-13 21:30:11', 342, 'Humberto Abernathy'),
(98, 1, 30, 1, 12, 'Karson Medhurst', '2022-08-12 19:59:43', 401, '2022-08-12 19:59:43', 543, 'Oma Kuhic Jr.'),
(99, 3, 29, 5, 67, 'Douglas Harber', '2022-11-19 14:01:49', 681, '2022-11-19 14:01:49', 873, 'Rod Gutkowski'),
(100, 1, 34, 1, 90, 'Lorena Littel', '2022-01-17 12:05:50', 227, '2022-01-17 12:05:50', 503, 'Jackeline Howell'),
(101, 4, 46, 2, 1, 'Sortie bowling', '2023-03-12 14:26:00', 120, '2023-03-11 00:00:00', 10, 'sortie au bowling'),
(102, 1, 1, 1, 2, 'Ciné', '2023-03-26 14:57:00', 120, '2023-03-25 00:00:00', 10, 'sorite film ciné'),
(103, 1, 1, 1, 1, 'Test Syl', '2023-03-10 15:25:00', 78, '2023-03-08 00:00:00', 10, 'ljljklj');

-- --------------------------------------------------------

--
-- Structure de la table `ville`
--

DROP TABLE IF EXISTS `ville`;
CREATE TABLE IF NOT EXISTS `ville` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_postal` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `ville`
--

INSERT INTO `ville` (`id`, `nom`, `code_postal`) VALUES
(1, 'West Georgiana', 75323),
(2, 'North Jack', 12656),
(3, 'East Ulises', 46516),
(4, 'Hirthehaven', 92329),
(5, 'South Sonia', 81088),
(6, 'Monicaview', 4874),
(7, 'Felipachester', 8275),
(8, 'West Isabel', 66899),
(9, 'Lakinberg', 67680),
(10, 'Enosfurt', 94266),
(11, 'North Fannietown', 35103),
(12, 'Port Effie', 32368),
(13, 'Cotyhaven', 82102),
(14, 'Port Johann', 95527),
(15, 'Lake Alden', 14491),
(16, 'West Eugeniaside', 49885),
(17, 'New Haileechester', 50671),
(18, 'Conroyberg', 9632),
(19, 'Naomibury', 22418),
(20, 'Saigetown', 85134),
(21, 'Lelandshire', 63123),
(22, 'East Tyrel', 55102),
(23, 'South Marcus', 87939),
(24, 'South Catharine', 21573),
(25, 'Shyannfort', 804),
(26, 'Lake Vance', 81116),
(27, 'West Judson', 73640),
(28, 'Cortneyport', 31873),
(29, 'Bergeborough', 42697),
(30, 'East Lillianfort', 6426),
(31, 'Lake Eve', 65021),
(32, 'New Vicentaport', 34047),
(33, 'Considinemouth', 54107),
(34, 'Tremblayport', 46541),
(35, 'Zechariahbury', 36723),
(36, 'Schambergerberg', 22235),
(37, 'South Cortez', 1579),
(38, 'Lake Thad', 83908),
(39, 'Port Kennaview', 37912),
(40, 'Tillmanside', 32571),
(41, 'Desmondborough', 11182),
(42, 'New Garrettchester', 17098),
(43, 'Baumbachmouth', 85268),
(44, 'Leilamouth', 10924),
(45, 'Alftown', 9339),
(46, 'East Pete', 38861),
(47, 'Andreschester', 10778),
(48, 'Kilbackshire', 97652),
(49, 'Grantmouth', 15446),
(50, 'North Winstonville', 12711);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `lieu`
--
ALTER TABLE `lieu`
  ADD CONSTRAINT `FK_2F577D59A73F0036` FOREIGN KEY (`ville_id`) REFERENCES `ville` (`id`);

--
-- Contraintes pour la table `participant`
--
ALTER TABLE `participant`
  ADD CONSTRAINT `FK_D79F6B11AF5D55E1` FOREIGN KEY (`campus_id`) REFERENCES `campus` (`id`);

--
-- Contraintes pour la table `participant_sortie`
--
ALTER TABLE `participant_sortie`
  ADD CONSTRAINT `FK_8E436D739D1C3019` FOREIGN KEY (`participant_id`) REFERENCES `participant` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_8E436D73CC72D953` FOREIGN KEY (`sortie_id`) REFERENCES `sortie` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `sortie`
--
ALTER TABLE `sortie`
  ADD CONSTRAINT `FK_3C3FD3F26AB213CC` FOREIGN KEY (`lieu_id`) REFERENCES `lieu` (`id`),
  ADD CONSTRAINT `FK_3C3FD3F2D5E86FF` FOREIGN KEY (`etat_id`) REFERENCES `etat` (`id`),
  ADD CONSTRAINT `FK_3C3FD3F2D7AC6C11` FOREIGN KEY (`site_organisateur_id`) REFERENCES `campus` (`id`),
  ADD CONSTRAINT `FK_3C3FD3F2D936B2FA` FOREIGN KEY (`organisateur_id`) REFERENCES `participant` (`id`);
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
