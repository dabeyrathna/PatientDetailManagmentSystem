-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 28, 2016 at 04:13 AM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `hospital`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE IF NOT EXISTS `appointment` (
  `appId` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `tital` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `did` varchar(20) NOT NULL,
  PRIMARY KEY (`appId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=105 ;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appId`, `date`, `tital`, `description`, `did`) VALUES
(1, '2016-02-22 15:55:00', 'dfdsfsd', 'desc', 'd123'),
(2, '2016-02-22 15:56:00', 'werewr', 'werwer', 'd123'),
(3, '2016-02-22 15:30:00', 'werewr', 'werwer', 'd123'),
(4, '2016-02-20 02:00:00', 'Appointment added on 2016-02-22', 'No description', 'd123'),
(5, '2015-06-22 00:00:00', 'HyVee Inc', 'ut volutpat sapien arcu sed augue aliquam erat', 'D673669105'),
(6, '2015-09-17 00:00:00', 'Walgreen Company', 'sociis natoque penatibus et magnis dis parturient montes', 'D802871721'),
(7, '2015-09-12 00:00:00', 'Mutual Pharmaceutical Company, Inc.', 'eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra', 'D936940682'),
(8, '2016-01-20 00:00:00', 'Mckesson (Sunmark)', 'erat fermentum justo nec condimentum neque sapien', 'D412956157'),
(9, '2016-02-02 00:00:00', 'Natural Creations, Inc.', 'viverra diam vitae quam suspendisse potenti', 'D954904066'),
(10, '2015-09-09 00:00:00', 'Dolgencorp, LLC', 'primis in faucibus orci luctus et ultrices posuere cubilia', 'D507870236'),
(11, '2016-02-14 00:00:00', 'Merle Norman Cosmetics, Inc', 'enim leo rhoncus sed vestibulum sit amet', 'D067388700'),
(12, '2016-01-20 00:00:00', 'AvKARE, Inc.', 'nam ultrices libero non mattis pulvinar', 'D643757776'),
(13, '2015-12-05 00:00:00', 'STAT Rx USA LLC', 'platea dictumst aliquam augue quam sollicitudin vitae consectetuer', 'D771627053'),
(14, '2015-09-08 00:00:00', 'Preferred Pharmaceuticals, Inc', 'hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat', 'D607989804'),
(15, '2016-05-09 00:00:00', 'Patriot Pharmaceuticals, LLC', 'aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed', 'D888949435'),
(16, '2015-11-29 00:00:00', 'Lake Erie Medical DBA Quality Care Products LLC', 'enim leo rhoncus sed vestibulum sit amet', 'D006334807'),
(17, '2016-02-06 00:00:00', 'Pfizer Laboratories Div Pfizer Inc', 'vulputate elementum nullam varius nulla facilisi cras non', 'D529913962'),
(18, '2015-12-20 00:00:00', 'AMERICAN SALES COMPANY', 'ultrices libero non mattis pulvinar nulla pede ullamcorper', 'D055491459'),
(19, '2015-07-23 00:00:00', 'Newton Laboratories, Inc.', 'cursus urna ut tellus nulla ut erat id mauris vulputate', 'D751428571'),
(20, '2015-06-24 00:00:00', 'B. Braun Medical Inc.', 'quam fringilla rhoncus mauris enim leo rhoncus sed', 'D180707532'),
(21, '2015-12-09 00:00:00', 'Taro Pharmaceuticals U.S.A., Inc.', 'eleifend pede libero quis orci nullam molestie nibh in lectus', 'D600163216'),
(22, '2016-03-16 00:00:00', 'WG Critical Care, LLC', 'aliquet ultrices erat tortor sollicitudin mi sit', 'D488418419'),
(23, '2015-12-04 00:00:00', 'Organon USA Inc.', 'scelerisque quam turpis adipiscing lorem vitae mattis', 'D576653412'),
(24, '2015-10-06 00:00:00', 'REMEDYREPACK INC.', 'turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam', 'D725318298'),
(25, '2016-02-13 00:00:00', 'Watson Laboratories, Inc.', 'adipiscing elit proin risus praesent lectus vestibulum quam sapien', 'D852339387'),
(26, '2015-07-11 00:00:00', 'Clinical Solutions Wholesale', 'pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac', 'D659100527'),
(27, '2015-10-13 00:00:00', 'Ultra Seal Corporation', 'nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus', 'D174947421'),
(28, '2015-08-08 00:00:00', 'Native Remedies, LLC', 'pede lobortis ligula sit amet eleifend pede libero quis orci nullam', 'D378767542'),
(29, '2015-07-30 00:00:00', 'Antigen Laboratories, Inc.', 'placerat praesent blandit nam nulla integer pede justo lacinia', 'D519778732'),
(30, '2015-07-10 00:00:00', 'Cipla Limited', 'etiam pretium iaculis justo in hac habitasse platea', 'D024996842'),
(31, '2015-10-25 00:00:00', 'Actavis Elizabeth LLC', 'odio condimentum id luctus nec molestie sed justo pellentesque', 'D575361312'),
(32, '2016-03-11 00:00:00', 'Greenstone LLC', 'feugiat et eros vestibulum ac est lacinia nisi venenatis', 'D698521089'),
(33, '2015-10-24 00:00:00', 'Qualitest Pharmaceuticals', 'vestibulum sit amet cursus id turpis integer aliquet massa id', 'D878045574'),
(34, '2015-10-14 00:00:00', 'Liddell Laboratories', 'purus aliquet at feugiat non pretium quis lectus suspendisse', 'D434781264'),
(35, '2015-10-05 00:00:00', 'Idelle Labs, Ltd', 'vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non', 'D778847867'),
(36, '2016-02-10 00:00:00', 'Mylan Pharmaceuticals Inc.', 'cursus urna ut tellus nulla ut erat id', 'D186037613'),
(37, '2016-01-20 00:00:00', 'West-ward Pharmaceutical Corp.', 'ridiculus mus etiam vel augue vestibulum rutrum', 'D615656103'),
(38, '2016-04-03 00:00:00', 'Sun & Skin Care Research, LLC', 'scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula', 'D049747637'),
(39, '2016-01-12 00:00:00', 'Cobalt Laboratories', 'mauris enim leo rhoncus sed vestibulum sit amet cursus', 'D965709937'),
(40, '2015-10-06 00:00:00', 'Dispensing Solutions, Inc.', 'morbi ut odio cras mi pede malesuada', 'D351936832'),
(41, '2015-09-09 00:00:00', 'Cardinal Health', 'dis parturient montes nascetur ridiculus mus vivamus vestibulum', 'D921116763'),
(42, '2015-07-20 00:00:00', 'Par Pharmaceutical, Inc.', 'adipiscing elit proin risus praesent lectus vestibulum quam sapien varius', 'D245409547'),
(43, '2015-06-26 00:00:00', 'Zep Inc.', 'ultrices vel augue vestibulum ante ipsum primis in faucibus orci', 'D981686168'),
(44, '2016-01-15 00:00:00', 'Eon Labs, Inc.', 'ligula nec sem duis aliquam convallis nunc proin at turpis a', 'D962878464'),
(45, '2015-07-15 00:00:00', 'Amway Corp', 'risus praesent lectus vestibulum quam sapien varius ut', 'D082723976'),
(46, '2015-12-28 00:00:00', 'Conopco Inc. d/b/a Unilever', 'fringilla rhoncus mauris enim leo rhoncus sed', 'D851116866'),
(47, '2015-05-28 00:00:00', 'Zhejiang Huahai Pharmaceutical Co., Ltd.', 'turpis eget elit sodales scelerisque mauris', 'D465833063'),
(48, '2015-08-15 00:00:00', 'Roerig', 'magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in', 'D098103171'),
(49, '2015-06-04 00:00:00', 'Unifirst First Aid Corporation', 'nisi vulputate nonummy maecenas tincidunt lacus', 'D935004745'),
(50, '2015-12-05 00:00:00', 'Aurobindo Pharma Limited', 'accumsan tellus nisi eu orci mauris lacinia sapien', 'D623879914'),
(51, '2015-10-16 00:00:00', 'The Hain Celestial Group, Inc.', 'vel augue vestibulum rutrum rutrum neque aenean auctor gravida', 'D936883595'),
(52, '2015-10-31 00:00:00', 'Anastasia Beverly Hills', 'sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus', 'D302458858'),
(53, '2015-08-01 00:00:00', 'TyraTech, Inc.', 'ac est lacinia nisi venenatis tristique fusce congue diam id ornare', 'D699208374'),
(54, '2015-10-02 00:00:00', 'Teva Pharmaceuticals USA Inc', 'a pede posuere nonummy integer non velit', 'D902038341'),
(55, '2016-04-30 00:00:00', 'NCS HealthCare of KY, Inc dba Vangard Labs', 'morbi a ipsum integer a nibh', 'D436531718'),
(56, '2015-11-30 00:00:00', 'AMERICAN SALES COMPANY', 'nec dui luctus rutrum nulla tellus in sagittis dui vel', 'D043710782'),
(57, '2016-05-19 00:00:00', 'H E B', 'volutpat quam pede lobortis ligula sit amet eleifend pede libero quis', 'D380231049'),
(58, '2016-04-30 00:00:00', 'Contract Pharmacy Services-PA', 'curabitur convallis duis consequat dui nec nisi volutpat', 'D338853747'),
(59, '2015-11-20 00:00:00', 'Dr. Reddy''s Laboratories Limited', 'orci nullam molestie nibh in lectus pellentesque at nulla suspendisse', 'D341773836'),
(60, '2015-09-23 00:00:00', 'Lofthouse of Fleetwood, Ltd.', 'posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet', 'D356131038'),
(61, '2015-08-03 00:00:00', 'Oral BioTech', 'nulla elit ac nulla sed vel enim sit amet', 'D855241252'),
(62, '2015-09-13 00:00:00', 'Genuine First Aid LLC', 'mi in porttitor pede justo eu', 'D687496905'),
(63, '2015-07-24 00:00:00', 'Chattem, Inc.', 'nec molestie sed justo pellentesque viverra', 'D185516010'),
(64, '2016-05-14 00:00:00', 'Ricola USA Inc.', 'nibh fusce lacus purus aliquet at feugiat', 'D190496234'),
(65, '2015-12-02 00:00:00', 'Accord Healthcare Inc.', 'nisi eu orci mauris lacinia sapien quis libero nullam sit', 'D369150489'),
(66, '2016-03-02 00:00:00', 'Mylan Pharmaceuticals Inc.', 'nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit', 'D161173013'),
(67, '2015-09-20 00:00:00', 'A-S Medication Solutions LLC', 'sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum', 'D945349219'),
(68, '2016-04-30 00:00:00', 'Glenmark Generics Inc.,USA', 'aliquet massa id lobortis convallis tortor', 'D654361773'),
(69, '2015-09-13 00:00:00', 'Sun Pharma Global FZE', 'metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean', 'D769827833'),
(70, '2015-07-12 00:00:00', 'ALK-Abello, Inc.', 'elementum nullam varius nulla facilisi cras non velit nec nisi vulputate', 'D095736187'),
(71, '2015-10-27 00:00:00', 'Aphena Pharma Solutions - Tennessee, LLC', 'volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci', 'D541441820'),
(72, '2016-05-01 00:00:00', 'Pharmaceutical Associates, Inc.', 'pharetra magna ac consequat metus sapien ut nunc vestibulum', 'D489347741'),
(73, '2015-07-26 00:00:00', 'ARMY AND AIR FORCE EXCHANGE SERVICE', 'rhoncus aliquet pulvinar sed nisl nunc rhoncus', 'D686221583'),
(74, '2015-10-01 00:00:00', 'SEVENTH GENERATION INC', 'ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi', 'D418519303'),
(75, '2015-06-25 00:00:00', 'American Sales Company', 'fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus', 'D610320005'),
(76, '2015-06-25 00:00:00', 'Beutlich LP, Pharmaceuticals', 'in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus', 'D163109394'),
(77, '2015-08-26 00:00:00', 'McKesson', 'non interdum in ante vestibulum ante ipsum', 'D726138493'),
(78, '2016-05-02 00:00:00', 'Boots Retail USA Inc', 'justo maecenas rhoncus aliquam lacus morbi quis tortor', 'D793426351'),
(79, '2015-12-07 00:00:00', 'H E B', 'eleifend quam a odio in hac habitasse platea', 'D192490894'),
(80, '2015-09-01 00:00:00', 'Lake Erie Medical DBA Quality Care Products LLC', 'platea dictumst etiam faucibus cursus urna ut tellus', 'D003368881'),
(81, '2016-02-03 00:00:00', 'Novartis Pharmaceuticals Corporation', 'accumsan odio curabitur convallis duis consequat', 'D722422329'),
(82, '2015-12-25 00:00:00', 'Lake Erie Medical DBA Quality Care Products LLC', 'at velit eu est congue elementum in', 'D295304331'),
(83, '2015-09-03 00:00:00', 'GREAT LAKES WHOLESALE, MARKETING, & SALES, INC.', 'tellus in sagittis dui vel nisl duis ac nibh', 'D638792017'),
(84, '2015-10-06 00:00:00', 'IVAX Pharmaceuticals, Inc.', 'sodales sed tincidunt eu felis fusce posuere', 'D276004146'),
(85, '2015-07-16 00:00:00', 'Rite Aid Corporation', 'in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet', 'D798115034'),
(86, '2015-08-23 00:00:00', 'Teva Pharmaceuticals USA Inc', 'donec vitae nisi nam ultrices libero non mattis pulvinar', 'D545370550'),
(87, '2015-10-12 00:00:00', 'Northwind Pharmaceuticals', 'magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu', 'D574855023'),
(88, '2015-09-19 00:00:00', 'Sun & Skin Care Research, LLC', 'sit amet consectetuer adipiscing elit proin', 'D784510391'),
(89, '2015-11-21 00:00:00', 'DZA Brands LLC', 'quis turpis sed ante vivamus tortor duis mattis egestas', 'D911699092'),
(90, '2015-12-08 00:00:00', 'Enzyme Solutions, Inc.', 'morbi vel lectus in quam fringilla rhoncus mauris enim leo', 'D881099130'),
(91, '2015-07-16 00:00:00', 'STAT Rx USA LLC', 'ante ipsum primis in faucibus orci luctus et', 'D235914844'),
(92, '2015-07-07 00:00:00', 'Alternative Pharmacal Corporation', 'velit eu est congue elementum in hac habitasse platea', 'D783428158'),
(93, '2015-09-26 00:00:00', 'Kmart Corporation', 'nam dui proin leo odio porttitor id', 'D371058250'),
(94, '2016-04-23 00:00:00', 'Synergy Formulas, Inc.', 'dui vel sem sed sagittis nam congue risus semper porta', 'D138653654'),
(95, '2015-08-15 00:00:00', 'Your Military Exchanges', 'sem mauris laoreet ut rhoncus aliquet', 'D804839417'),
(96, '2016-02-18 00:00:00', 'Nelco Laboratories, Inc.', 'eget eros elementum pellentesque quisque porta volutpat erat', 'D572377610'),
(97, '2015-12-22 00:00:00', 'MedVantx, Inc.', 'dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula', 'D636371608'),
(98, '2015-06-27 00:00:00', 'Nelco Laboratories, Inc.', 'luctus rutrum nulla tellus in sagittis dui vel nisl duis ac', 'D936342358'),
(99, '2016-04-03 00:00:00', 'Coria Laboratories, LTD', 'mauris eget massa tempor convallis nulla neque libero convallis', 'D694659832'),
(100, '2015-11-14 00:00:00', 'Johnson & Johnson Conosumer Products Company, Division of Johnson & Johnson Consumer Companies, Inc.', 'amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at', 'D189171294'),
(101, '2015-08-12 00:00:00', 'Carilion Materials Management', 'sit amet nulla quisque arcu libero', 'D429371524'),
(102, '2016-02-20 00:00:00', 'NCS HealthCare of KY, Inc dba Vangard Labs', 'ligula nec sem duis aliquam convallis', 'D334040212'),
(103, '2016-01-17 00:00:00', 'Aidarex Pharmaceuticals LLC', 'amet erat nulla tempus vivamus in felis', 'D616664398'),
(104, '2016-01-23 00:00:00', 'Sandoz Inc', 'massa quis augue luctus tincidunt nulla', 'D180577914');

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE IF NOT EXISTS `article` (
  `artId` char(6) NOT NULL,
  `dId` char(4) NOT NULL,
  `date` date NOT NULL,
  `issueId` char(4) NOT NULL,
  `topic` varchar(250) NOT NULL,
  `description` varchar(250) NOT NULL,
  PRIMARY KEY (`artId`),
  KEY `dId` (`dId`),
  KEY `issueId` (`issueId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`artId`, `dId`, `date`, `issueId`, `topic`, `description`) VALUES
('A00025', 'd123', '2015-05-22', 'I127', 'Zinc Oxide, Titanium Dioxide', 'The Hain Celestial Group, Inc.'),
('A00569', 'd123', '2015-11-18', 'I127', 'ACETAMINOPHEN, ASPIRIN, CAFFEINE', 'Unifirst First Aid Corporation'),
('A02931', 'd123', '2015-12-28', 'I127', 'Prednisone', 'JUBILANT CADISTA PHARMACEUTICALS, INC.'),
('A03581', 'd123', '2015-08-27', 'I127', 'Western Water Hemp', 'Nelco Laboratories, Inc.'),
('A05194', 'd123', '2015-04-02', 'I127', 'clonidine hydrochloride and chlorthalidone', 'Mylan Pharmaceuticals Inc.'),
('A05449', 'd123', '2015-05-27', 'I127', 'HEPARIN SODIUM', 'Hospira, Inc.'),
('A06025', 'd123', '2015-06-08', 'I127', 'NOT APPLICABLE', 'Deseret Biologicals, Inc.'),
('A06110', 'd123', '2015-11-02', 'I127', 'methotrexate', 'Medac Pharma, Inc'),
('A07201', 'd123', '2015-04-23', 'I127', 'HYDROMORPHONE HYDROCHLORIDE', 'Teva Parenteral Medicines, Inc.'),
('A07849', 'd123', '2015-11-05', 'I127', 'Lorazepam', 'Preferred Pharmaceuticals, Inc'),
('A08330', 'd123', '2016-02-08', 'I127', 'Triamterene and Hydrochlorothiazide', 'KAISER FOUNDATION HOSPITALS'),
('A11116', 'd123', '2015-07-28', 'I127', 'PERPHENAZINE', 'REMEDYREPACK INC.'),
('A11489', 'd123', '2015-11-12', 'I127', 'TITANIUM DIOXIDE', 'CHANEL PARFUMS BEAUTE'),
('A13236', 'd123', '2016-02-05', 'I127', 'Alclometasone dipropionate', 'Taro Pharmaceuticals U.S.A., Inc.'),
('A15917', 'd123', '2015-08-03', 'I127', 'titanium dioxide', 'Koh Gen Do USA, Inc'),
('A15922', 'd123', '2015-09-03', 'I127', 'Colchicine', 'Physicians Total Care, Inc.'),
('A17180', 'd123', '2015-10-24', 'I127', 'Aluminum Chlorohydrate', 'Avon Products, Inc'),
('A18454', 'd123', '2015-02-28', 'I127', 'hydrocortisone', 'Chattem, Inc.'),
('A18559', 'd123', '2015-05-16', 'I127', 'Menthol', 'Stressa Incorporated'),
('A20915', 'd123', '2015-07-28', 'I127', 'Sulfur', 'Nature''s Innovation, Inc.'),
('A21221', 'd123', '2015-12-28', 'I127', 'Cows Milk', 'Nelco Laboratories, Inc.'),
('A22901', 'd123', '2015-11-22', 'I127', 'Nitrogen', 'IWS Gas and Supply of Texas, LTD'),
('A23394', 'd123', '2016-01-31', 'I127', 'Promethazine Hydrochloride', 'Prestium Pharma, Inc.'),
('A23399', 'd123', '2015-11-21', 'I127', 'indomethacin', 'REMEDYREPACK INC.'),
('A24131', 'd123', '2015-05-29', 'I127', 'clobetasol propionate', 'Physicians Total Care, Inc.'),
('A24763', 'd123', '2015-11-09', 'I127', 'Bicalutamide', 'Teva Pharmaceuticals USA Inc'),
('A24855', 'd123', '2015-10-03', 'I127', 'Trihexyphenidyl Hydrochloride', 'REMEDYREPACK INC.'),
('A25091', 'd123', '2015-11-17', 'I127', 'paroxetine hydrochloride', 'Cardinal Health'),
('A25095', 'd123', '2015-11-24', 'I127', 'Malt', 'Nelco Laboratories, Inc.'),
('A25735', 'd123', '2015-06-16', 'I127', 'Indomethacin', 'Rebel Distributors Corp'),
('A29183', 'd123', '2015-07-12', 'I127', 'hydrocortisone', 'Kmart Corporation'),
('A29410', 'd123', '2015-12-22', 'I127', 'Sodium Fluoride', 'Dharma Research, inc.'),
('A29455', 'd123', '2015-12-04', 'I127', 'Methylcellulose', 'McKesson'),
('A30381', 'd123', '2015-03-05', 'I127', 'Zinc Pyrithione', 'GS-TK Co., Ltd'),
('A30802', 'd123', '2015-11-02', 'I127', 'Ondansetron', 'West-Ward Pharmaceutical Corp.'),
('A32140', 'd123', '2016-02-15', 'I127', 'Aspirin', 'Contract Pharmacy Services-PA'),
('A34301', 'd123', '2015-09-28', 'I127', 'tramadol hydrochloride', 'Rebel Distributors Corp'),
('A35157', 'd123', '2015-12-17', 'I127', 'Acetaminophen, Dextromethorphan Hydrobromide, Doxylamine succinate, and Pseudoephedrine Hydrochloride', 'The Procter & Gamble Manufacturing Company'),
('A36104', 'd123', '2015-03-24', 'I127', 'Metronidazole', 'Bryant Ranch Prepack'),
('A38600', 'd123', '2015-06-24', 'I127', 'Trazodone Hydrochloride', 'Cardinal Health'),
('A38871', 'd123', '2016-01-26', 'I127', 'HYDROCHLOROTHIAZIDE, VALSARTAN', 'STAT RX USA LLC'),
('A38963', 'd123', '2015-11-23', 'I127', 'Avobenzone and Octinoxate', 'SHISEIDO INTERNATIONAL FRANCE'),
('A41317', 'd123', '2015-10-27', 'I127', 'Candida albicans', 'Nelco Laboratories, Inc.'),
('A41377', 'd123', '2015-12-07', 'I127', 'Sotalol Hydrochloride', 'AvKARE, Inc.'),
('A42839', 'd123', '2015-04-18', 'I127', 'BUPROPION HYDROCHLORIDE, TYROSINE', 'Physician Therapeutics LLC'),
('A44675', 'd123', '2015-05-27', 'I127', 'Norethindrone and Ethinyl Estradiol', 'Watson Pharma, Inc.'),
('A45271', 'd123', '2015-05-22', 'I127', 'Naphazoline Hydrochloride', 'Insight Pharmaceuticals LLC'),
('A45532', 'd123', '2015-08-21', 'I127', 'BUFO BUFO CUTANEOUS GLAND', 'Natural Health Supply'),
('A46519', 'd123', '2015-04-10', 'I127', 'TITANIUM DIOXIDE', 'J. A. Cosmetics U.S. INC'),
('A48552', 'd123', '2015-09-15', 'I127', 'SENNOSIDES', 'Mckesson (Sunmark)'),
('A50516', 'd123', '2016-01-19', 'I127', 'Titanium Dioxide and Zinc Oxide', 'Bare Escentuals Beauty Inc.'),
('A52673', 'd123', '2015-03-29', 'I127', 'ISOPROPYL ALCOHOL', 'Smith & Nephew, Inc.'),
('A57917', 'd123', '2016-01-18', 'I127', 'Dextromethorphan HBr', 'HyVee Inc'),
('A58816', 'd123', '2016-02-01', 'I127', 'Nicotine', 'Cardinal Health'),
('A60957', 'd123', '2015-04-29', 'I127', 'CINCHONA OFFICINALIS BARK, ACONITUM NAPELLUS, PSEUDOGNAPHALIUM OBTUSIFOLIUM, LEDUM PALUSTRE TWIG, MAGNESIUM PHOSPHATE, DIBASIC TRIHYDRATE, TOXICODENDRON PUBESCENS LEAF, and VISCUM ALBUM FRUITING TOP', 'Hyland''s'),
('A61610', 'd123', '2015-04-27', 'I127', 'azithromycin', 'REMEDYREPACK INC.'),
('A63747', 'd123', '2015-06-29', 'I127', 'Rutin', 'Deseret Biologicals, Inc.'),
('A63832', 'd123', '2015-05-03', 'I127', 'Primidone', 'Physicians Total Care, Inc.'),
('A65180', 'd123', '2015-11-29', 'I127', 'diphenhydramine citrate, ibuprofen', 'L Perrigo Company'),
('A65436', 'd123', '2015-05-08', 'I127', 'ZINC OXIDE', 'CCA Industries, Inc'),
('A65588', 'd123', '2015-12-08', 'I127', 'TITANIUM DIOXIDE', 'Laboratoires M&L'),
('A66609', 'd123', '2015-04-14', 'I127', 'eculizumab', 'Alexion Pharmaceuticals Inc.'),
('A66777', 'd123', '2015-03-10', 'I127', 'Propoxyphene Hydrochloride', 'Bryant Ranch Prepack'),
('A67717', 'd123', '2015-07-25', 'I127', 'Venlafaxine Hydrochloride', 'Lake Erie Medical DBA Quality Care Products LLC'),
('A67792', 'd123', '2015-04-21', 'I127', 'Diphenhydramine HCl', 'EQUALINE (SuperValu)'),
('A68540', 'd123', '2015-03-20', 'I127', 'STANNOUS FLUORIDE', 'Massco Dental A Division of Dunagin Pharmaceuticals'),
('A69701', 'd123', '2015-07-01', 'I127', 'Benzalkonium Chloride', 'Eastern Century Pharmaceuticals'),
('A70307', 'd123', '2015-03-12', 'I127', 'Ranitidine', 'Amerisource Bergen'),
('A71589', 'd123', '2015-10-08', 'I127', 'Levofloxacin', 'Dr. Reddy''s Laboratories Limited'),
('A74568', 'd123', '2015-12-18', 'I127', 'Pantoprazole Sodium', 'AvPAK'),
('A74612', 'd123', '2015-07-17', 'I127', 'Octinoxate, Oxybenzone', 'Susanne Lang Fragrance Inc.'),
('A74881', 'd123', '2015-10-23', 'I127', 'PULSATILLA VULGARIS and EUPHORBIA RESINIFERA RESIN and LUFFA OPSILVER NITRATEERCULATA FRUIT and MERCURIC IODIDE and SUS SCROFA NASAL MUCOSA and SILVER NITRATE and CALCIUM SULFIDE and SINUSITISINUM', 'Biologische Heilmittel Heel'),
('A75801', 'd123', '2015-07-30', 'I127', 'Clonazepam', 'Unit Dose Services'),
('A77013', 'd123', '2015-03-15', 'I127', 'Carvedilol', 'Gen-Source Rx'),
('A77302', 'd123', '2015-08-16', 'I127', 'Bismuth Subsalicylate', 'Kinray, Inc'),
('A77643', 'd123', '2015-10-07', 'I127', 'MITOXANTRONE HYDROCHLORIDE', 'Fresenius Kabi USA, LLC'),
('A78673', 'd123', '2015-12-21', 'I127', 'Oxygen', 'OxyPros Plus'),
('A78906', 'd123', '2015-11-09', 'I127', 'Oxycodone and Acetaminophen', 'Amneal Pharmaceuticals, LLC'),
('A80545', 'd123', '2015-03-20', 'I127', 'Zolpidem Tartrate', 'Aurobindo Pharma Limited'),
('A82258', 'd123', '2015-06-09', 'I127', 'NAPROXEN SODIUM', 'Bayer HealthCare Consumer Care'),
('A82962', 'd123', '2015-04-12', 'I127', 'Blueberry', 'Nelco Laboratories, Inc.'),
('A84217', 'd123', '2015-07-05', 'I127', 'Allergenic Extracts Alum Precipitated', 'ALK-Abello, Inc.'),
('A85845', 'd123', '2015-07-05', 'I127', 'baclofen', 'Mallinckrodt Inc (Brand Pharmaceuticals)'),
('A85908', 'd123', '2015-04-18', 'I127', 'Acetaminophen and Diphenhydramine HCl', 'SUPERVALU INC.'),
('A85951', 'd123', '2015-11-20', 'I127', 'Escitalopram', 'Teva Pharmaceuticals USA Inc'),
('A87124', 'd123', '2015-08-15', 'I127', 'Brome Grass', 'ALK-Abello, Inc.'),
('A87327', 'd123', '2015-05-20', 'I127', 'Johnson Grass Smut', 'Antigen Laboratories, Inc.'),
('A88494', 'd123', '2015-07-16', 'I127', 'diflorasone diacetate', 'PharmaDerm a division of Fougera Pharmaceuticals Inc.'),
('A91470', 'd123', '2015-12-10', 'I127', 'CLOTRIMAZOLE', 'SHANGHAI SONGHUA PHARMACEUTICAL CO LTD'),
('A91641', 'd123', '2015-06-29', 'I127', 'Valacyclovir Hydrochloride', 'MedVantx, Inc.'),
('A91952', 'd123', '2015-06-21', 'I127', 'sertraline hydrochloride', 'Mylan Institutional Inc.'),
('A92182', 'd123', '2015-10-23', 'I127', 'Naproxen Sodium', 'Dolgencorp Inc'),
('A92256', 'd123', '2015-05-29', 'I127', 'OCTINOXATE, TITANIUM DIOXIDE, ZINC OXIDE', 'Skin Alive, Ltd.'),
('A92282', 'd123', '2015-03-14', 'I127', 'Magesium Citrate', 'Geiss, Destin & Dunn, Inc.'),
('A93039', 'd123', '2015-04-15', 'I127', 'Quetiapine fumarate', 'Major Pharmaceuticals'),
('A94035', 'd123', '2015-11-22', 'I127', 'Butalbital, Aspirin, Caffeine and Codeine Phosphate', 'Lannett Company, Inc.'),
('A94187', 'd123', '2015-03-31', 'I127', 'Red Cedar', 'Nelco Laboratories, Inc.'),
('A97581', 'd123', '2015-09-05', 'I127', 'venlafaxine hydrochloride', 'Kremers Urban Pharmaceuticals Inc.'),
('A97927', 'd123', '2015-09-27', 'I127', 'Ondansetron', 'Lake Erie Medical DBA Quality Care Products LLC'),
('A99123', 'd123', '2016-01-04', 'I127', 'TRICLOSAN', 'Certus Medical, Inc.');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE IF NOT EXISTS `doctor` (
  `dId` char(10) NOT NULL,
  `MOIC` tinyint(4) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `gender` char(1) NOT NULL,
  `dPass` varchar(150) NOT NULL,
  `add` varchar(200) NOT NULL,
  `spId` char(4) NOT NULL,
  `hId` char(4) NOT NULL,
  `email` varchar(20) NOT NULL,
  `telNo` char(10) NOT NULL,
  `nic` char(10) NOT NULL,
  `dob` date NOT NULL,
  `district` varchar(50) NOT NULL,
  `slmcRegNo` int(4) NOT NULL,
  `imageType` varchar(6) NOT NULL,
  `maritalStatus` char(1) NOT NULL,
  `nationality` char(1) NOT NULL,
  PRIMARY KEY (`dId`),
  KEY `hId` (`hId`),
  KEY `spId` (`spId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`dId`, `MOIC`, `name`, `gender`, `dPass`, `add`, `spId`, `hId`, `email`, `telNo`, `nic`, `dob`, `district`, `slmcRegNo`, `imageType`, `maritalStatus`, `nationality`) VALUES
('d123', 0, 'L.P Wijesinghe', 'f', '202cb962ac59075b964b07152d234b70', 'dddddddddddddddddddddddddd', 'sp16', 'h001', '', '', '456456456V', '2014-05-08', 'dddddddddd', 0, 'jpg', '', ''),
('D882892730', 0, 'Dilanga', 'm', '202cb962ac59075b964b07152d234b70', 'wewe', 'sp28', 'h001', 'dilanga198@gmail.com', 'dddd', '324324535', '1988-10-16', 'ddddd', 232, '', 'S', 'S');

-- --------------------------------------------------------

--
-- Table structure for table `forumans`
--

CREATE TABLE IF NOT EXISTS `forumans` (
  `ansId` int(11) NOT NULL,
  `uid` varchar(10) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `time` datetime NOT NULL,
  `attachment` varchar(100) NOT NULL,
  `qid` int(11) NOT NULL,
  `likes` int(11) NOT NULL,
  PRIMARY KEY (`ansId`),
  KEY `fk_forumQandA` (`qid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `forumans`
--

INSERT INTO `forumans` (`ansId`, `uid`, `answer`, `time`, `attachment`, `qid`, `likes`) VALUES
(1, 'p123', 'ssssssssssssssssssssssssssssssssss', '2015-11-11 00:00:00', '', 9, 4),
(2, 'p123', 'asasdfttytys', '2015-11-11 00:00:00', '', 9, 4),
(3, 'p123', 'asasdfttytys', '2015-11-24 11:18:23', '', 9, 4);

-- --------------------------------------------------------

--
-- Table structure for table `forumquest`
--

CREATE TABLE IF NOT EXISTS `forumquest` (
  `qId` int(11) NOT NULL,
  `uid` varchar(10) NOT NULL,
  `topic` varchar(100) NOT NULL,
  `question` varchar(255) NOT NULL,
  `issueId` char(4) NOT NULL,
  `time` datetime NOT NULL,
  `attachment` varchar(100) NOT NULL,
  `likes` int(11) NOT NULL,
  PRIMARY KEY (`qId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `forumquest`
--

INSERT INTO `forumquest` (`qId`, `uid`, `topic`, `question`, `issueId`, `time`, `attachment`, `likes`) VALUES
(7, 'd123', 'Anxiety and Depression: Which one do I have?', 'I''ve always been puzzled as to why I get so much better with SSRIs and wonder if something like Diazepam would do the same job in a shorter term dose.', 'I176', '2015-11-14 13:09:46', '', 0),
(8, 'd123', 'Maybe i never had a mental health problem in the first place?', 'Im seeing the GP next week because I have alot of digestive health problems. I think maybe im not absorbing vitamins and minerals properly from my digestive tract. And this could potentially explain everything that has ever happened to me !', 'I176', '2015-11-14 13:12:03', '', 0),
(9, 'd123', 'Does this sound like hyperthyroid?', 'Hi! I''m 19, female and after having my iron and vitamin d tests I''m frustrated that the doctors tell me I should have ''peace of mind'' now! My iron was good but my vit d was a tiny bit low (was told to take supplements) However I''m still experiencing sympt', 'I200', '2015-11-14 13:28:31', '', 0),
(10, 'd123', 'qqqqqqqqqqqqqqqqqqq', 'aaaaaaaaaaaaaaaaaaaaa', 'I124', '2015-11-14 14:30:17', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `frequency_med`
--

CREATE TABLE IF NOT EXISTS `frequency_med` (
  `frequencyId` char(4) NOT NULL,
  `frequency` varchar(15) NOT NULL,
  `shortForm` varchar(4) NOT NULL,
  PRIMARY KEY (`frequencyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `frequency_med`
--

INSERT INTO `frequency_med` (`frequencyId`, `frequency`, `shortForm`) VALUES
('f001', 'Daily', ''),
('f002', '12 Hourly', 'bd'),
('f003', '8 Hourly', 'tds'),
('f004', '6 Hourly', 'qds');

-- --------------------------------------------------------

--
-- Table structure for table `health_issue`
--

CREATE TABLE IF NOT EXISTS `health_issue` (
  `issueId` char(4) NOT NULL DEFAULT '',
  `description` varchar(250) NOT NULL,
  `issue` varchar(50) NOT NULL,
  PRIMARY KEY (`issueId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `health_issue`
--

INSERT INTO `health_issue` (`issueId`, `description`, `issue`) VALUES
('I100', 'Physical Activity and Nutrition', 'Physical Activity and Nutrition'),
('I102', 'Tobacco', 'Tobacco'),
('I109', 'HIV/AIDS', 'HIV/AIDS'),
('I123', 'Substance Abuse', 'Substance Abuse'),
('I124', 'Environmental Quality', 'Environmental Quality'),
('I127', 'Injury and Violence', 'Injury and Violence'),
('I176', 'Mental Health', 'Mental Health'),
('I200', 'Overweight and Obesity', 'Overweight and Obesity');

-- --------------------------------------------------------

--
-- Table structure for table `hospital`
--

CREATE TABLE IF NOT EXISTS `hospital` (
  `hId` char(4) NOT NULL,
  `district` varchar(20) NOT NULL,
  `add` varchar(200) NOT NULL,
  `description` varchar(350) NOT NULL,
  `hName` varchar(50) NOT NULL,
  `hTelNo` char(10) NOT NULL,
  PRIMARY KEY (`hId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hospital`
--

INSERT INTO `hospital` (`hId`, `district`, `add`, `description`, `hName`, `hTelNo`) VALUES
('h001', 'Kandy', 'Teaching Hospital Kandy, Kandy 20000 Sri Lanka', 'The Teaching Hospital Kandy is the second largest medical institution in Sri Lanka, established and administered under the purview of the Ministry of Health, Sri Lanka which is a key Government Hospital maintained by the Sri Lankan Government.  We mainly serve general public living in the Central Province which consists of Kandy, Matale and Nuwara ', 'Teaching Hospital Kandy', '0812 22226'),
('h002', 'Kandy', 'E W Perera Mawatha, Colombo', 'This Hospital serves as the National Referral Center for medical and surgical care in Sri Lanka. The National Hospital which is the largest teaching hospital in Sri Lanka consists of 3300 beds and is considered as the largest hospital in South East Asia. This hospital has 106 wards, 35 Operating Theatres and 12 Intensive Care Units in addition to o', 'National Hospital of Sri Lanka', '011 2 6911');

-- --------------------------------------------------------

--
-- Table structure for table `hospital_emp`
--

CREATE TABLE IF NOT EXISTS `hospital_emp` (
  `empId` char(4) NOT NULL,
  `name` varchar(50) NOT NULL,
  `add` varchar(200) NOT NULL,
  `hId` char(4) NOT NULL,
  `telNo` char(10) NOT NULL,
  `regDate` date NOT NULL,
  `wrkStatus` tinyint(1) NOT NULL,
  `email` varchar(20) NOT NULL,
  `ePass` varchar(150) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `nic` char(10) NOT NULL,
  `gender` char(1) NOT NULL,
  `imageType` varchar(6) NOT NULL,
  PRIMARY KEY (`empId`),
  KEY `hId` (`hId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hospital_emp`
--

INSERT INTO `hospital_emp` (`empId`, `name`, `add`, `hId`, `telNo`, `regDate`, `wrkStatus`, `email`, `ePass`, `active`, `nic`, `gender`, `imageType`) VALUES
('E123', 'Sindhuja', 'hkfdhfsdfjdjfdjfldsjflsdjfldjlkdjfldf,kjlkfjldjfkdsjfds,lkdsjflkdsjflkf', '', '077254626', '0000-00-00', 0, 'jhfkdshfsdhflkj@gmai', '123', 0, '886655222v', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE IF NOT EXISTS `medicine` (
  `mid` char(4) NOT NULL,
  `medicine` varchar(100) NOT NULL,
  `frequencyId` char(4) NOT NULL,
  PRIMARY KEY (`mid`),
  KEY `frequencyId` (`frequencyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medicine`
--

INSERT INTO `medicine` (`mid`, `medicine`, `frequencyId`) VALUES
('M116', 'Paracetamol', 'f004'),
('M117', 'chlorpheniramine', 'f002'),
('M118', 'Amoxicillin', 'f003'),
('M119', 'Metronidazole', 'f003'),
('M120', 'Cloxacillin', 'f004'),
('M121', 'Erythromycin', 'f004'),
('M122', 'Ciprofloxacin', 'f002'),
('M127', 'Seroquel', 'f004'),
('M128', 'Singulair', 'f004'),
('M129', 'Actos', 'f004'),
('M133', 'Epogen', 'f004'),
('M143', 'Enbrel', 'f004'),
('M153', 'Copaxone', 'f004'),
('M163', 'Lantus Solostar', 'f004'),
('M174', 'Avastin', 'f004');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE IF NOT EXISTS `patient` (
  `name` varchar(50) NOT NULL,
  `pId` char(10) NOT NULL,
  `nic` char(10) NOT NULL,
  `gender` char(1) NOT NULL,
  `add` varchar(150) NOT NULL,
  `regDate` date NOT NULL,
  `dob` date NOT NULL,
  `pPass` varchar(150) NOT NULL,
  `bloodGroup` varchar(3) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telNo` char(10) NOT NULL,
  `district` varchar(50) NOT NULL,
  `gId` char(4) NOT NULL,
  `imageType` varchar(6) NOT NULL,
  PRIMARY KEY (`pId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`name`, `pId`, `nic`, `gender`, `add`, `regDate`, `dob`, `pPass`, `bloodGroup`, `email`, `telNo`, `district`, `gId`, `imageType`) VALUES
('sindhuja jeyagunaseelan', 'p123', '896733222v', 'f', '11111', '2015-12-20', '1989-06-21', '202cb962ac59075b964b07152d234b70', '', 'dilanga198@gmail.com', 'dilanga198', '111111111', '', 'jpg'),
('ddd', 'P155312605', '', 'f', 'dd', '2016-02-09', '2015-02-01', 'b9b2f1cc62a4c1702c7c57ea08250c67', 'A+', 'dilangapct@', '', '', 'dd', ''),
('ss', 'P785324640', 'ss', 'f', 'ss', '2016-02-09', '1978-02-02', 'cde186bda8a347e9f188a80eacfa8958', 'B-', 'dilanga198@', 'ss', 's', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `patient_history`
--

CREATE TABLE IF NOT EXISTS `patient_history` (
  `historyNo` int(11) NOT NULL AUTO_INCREMENT,
  `patientStatus` tinyint(1) NOT NULL,
  `deathDate` datetime DEFAULT NULL,
  `date` datetime NOT NULL,
  `description` varchar(250) NOT NULL,
  `hId` char(4) NOT NULL,
  `reportNo` varchar(100) NOT NULL,
  `dId` char(4) NOT NULL,
  `pId` char(10) NOT NULL,
  `presId` int(11) NOT NULL,
  PRIMARY KEY (`historyNo`),
  KEY `pId` (`pId`),
  KEY `reportNo` (`reportNo`),
  KEY `hId` (`hId`),
  KEY `presId` (`presId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `patient_history`
--

INSERT INTO `patient_history` (`historyNo`, `patientStatus`, `deathDate`, `date`, `description`, `hId`, `reportNo`, `dId`, `pId`, `presId`) VALUES
(5, 0, NULL, '2016-02-09 00:00:00', 'cc', 'h002', 'Report_cc_cc_3556593237.jpg', 'd123', 'p123', 2),
(6, 0, NULL, '2016-02-09 00:00:00', 'cc', 'h002', 'Report_cc_cc_4055953769.pdf', 'd123', 'p123', 2),
(7, 0, NULL, '2016-02-09 00:00:00', 'cc', 'h002', 'Report_cc_cc_4055953769.pdf', 'd123', 'p123', 2),
(8, 1, '2016-02-09 00:00:00', '2016-02-09 00:00:00', 'cc', 'h002', 'Report_cc_cc_8968922132.jpg', 'cc', 'cc', 3),
(9, 1, '2016-02-09 00:00:00', '2016-02-09 00:00:00', 'cc', 'h002', 'Report_cc_cc_3705031858.pdf', 'cc', 'cc', 3),
(10, 0, NULL, '2016-02-16 00:00:00', 'fdgfg', 'h002', 'Report_fdgfdg_dgdfgfdg_3460854452.js', 'gffg', 'fdgfdg', 1),
(11, 0, NULL, '2016-02-16 00:00:00', 'fdgfg', 'h002', 'Report_fdgfdg_dgdfgfdg_6179661568.js', 'gffg', 'fdgfdg', 1),
(12, 0, NULL, '2016-02-16 00:00:00', 'fdgfg', 'h002', 'Report_fdgfdg_dgdfgfdg_6630218880.js', 'd123', 'p123', 1),
(13, 0, NULL, '2016-02-16 00:00:00', 'fdgfg', 'h002', 'Report_fdgfdg_dgdfgfdg_6178416532.js', 'gffg', 'fdgfdg', 1),
(14, 1, '2016-02-21 00:00:00', '2016-02-21 00:00:00', 'Dead', 'h002', 'Report_p123_pre123_853295846.jpg', 'd123', 'p123', 0),
(15, 1, '2016-02-21 00:00:00', '2016-02-21 00:00:00', 'Dead', 'h002', 'Report_p123_pre123_3195810743.jpg', 'd123', 'p123', 0),
(16, 1, '2016-02-21 00:00:00', '2016-02-21 00:00:00', 'Dead', 'h002', 'Report_p123_pre123_3180647199.jpg', 'd123', 'p123', 0),
(17, 1, '2016-02-21 00:00:00', '2016-02-21 00:00:00', 'Dead', 'h002', 'Report_p123_pre123_19175802.jpg', 'd123', 'p123', 0),
(18, 1, '2016-02-21 00:00:00', '2016-02-21 00:00:00', 'dfsdfs  fds dfsd ', 'h001', 'Report_p123_123_420745078.jpg', 'd123', 'p123', 123),
(19, 1, '2016-02-21 00:00:00', '2016-02-21 00:00:00', 'dfsdfs  fds dfsd ', 'h001', 'Report_p123_123_9182311243.bmp', 'd123', 'p123', 123),
(20, 1, '2016-02-21 00:00:00', '2016-02-21 00:00:00', 'dfsdfs  fds dfsd ', 'h001', 'Report_p123_123_8006131016.bmp', 'd123', 'p123', 123),
(21, 1, '2016-02-21 00:00:00', '2016-02-21 00:00:00', 'dfsdfs  fds dfsd ', 'h001', 'Report_p123_123_7820156205.jpg', 'd123', 'p123', 123);

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE IF NOT EXISTS `prescription` (
  `presId` int(11) NOT NULL AUTO_INCREMENT,
  `pid` char(10) NOT NULL,
  `did` char(10) NOT NULL,
  `medicine` char(5) NOT NULL,
  `dosage` varchar(30) NOT NULL,
  `frequency` varchar(30) NOT NULL,
  `date` datetime NOT NULL,
  `diagnosis` varchar(250) NOT NULL,
  `duration` varchar(10) NOT NULL,
  `issueId` char(4) NOT NULL,
  PRIMARY KEY (`presId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=75 ;

--
-- Dumping data for table `prescription`
--

INSERT INTO `prescription` (`presId`, `pid`, `did`, `medicine`, `dosage`, `frequency`, `date`, `diagnosis`, `duration`, `issueId`) VALUES
(1, 'p123', 'd123', '', '', '', '2015-02-16 00:00:00', '', '', 'I100'),
(2, 'p123', 'd123', '', '', '', '2012-02-16 00:00:00', '', '', 'I100'),
(3, 'p123', 'd123', '', '', '', '2015-02-16 00:00:00', '', '', 'I100'),
(4, 'p123', 'd123', '', '', '', '2015-02-16 00:00:00', '', '', 'I100'),
(5, 'p123', 'd123', '', '', '', '2014-02-16 00:00:00', '', '', 'I109'),
(6, 'p123', 'd123', '', '', '', '2014-02-16 00:00:00', '', '', 'I100'),
(7, 'p123', 'd123', '', '', '', '2013-02-16 00:00:00', '', '', 'I100'),
(8, 'p123', 'd123', '', '', '', '2014-02-16 00:00:00', '', '', 'I109'),
(9, 'p123', 'd123', '', '', '', '2014-02-16 00:00:00', '', '', 'I100'),
(10, 'p123', 'd123', '', '', '', '2013-02-16 00:00:00', '', '', 'I102'),
(11, 'p123', 'd123', '', '', '', '2013-02-16 00:00:00', '', '', 'I100'),
(12, 'p123', 'd123', '', '', '', '2013-02-16 00:00:00', '', '', 'I102'),
(13, 'p123', 'd123', '', '', '', '2015-02-16 00:00:00', '', '', 'I100'),
(14, 'p123', 'd123', '', '', '', '2012-02-16 00:00:00', '', '', 'I102'),
(15, 'p123', 'd123', '', '', '', '2015-02-16 00:00:00', '', '', 'I100'),
(16, 'p123', 'd123', '', '', '', '2015-02-16 00:00:00', '', '', 'I100'),
(17, 'p123', 'd123', '', '', '', '2014-02-16 00:00:00', '', '', 'I109'),
(18, 'p123', 'd123', '', '', '', '2014-02-16 00:00:00', '', '', 'I100'),
(19, 'p123', 'd123', '', '', '', '2013-02-16 00:00:00', '', '', 'I100'),
(20, 'p123', 'd123', '', '', '', '2014-02-16 00:00:00', '', '', 'I109'),
(21, 'p123', 'd123', '', '', '', '2014-02-16 00:00:00', '', '', 'I100'),
(22, 'p123', 'd123', '', '', '', '2013-02-16 00:00:00', '', '', 'I102'),
(23, 'p123', 'd123', '', '', '', '2013-02-16 00:00:00', '', '', 'I100'),
(24, 'p123', 'd123', '', '', '', '2013-02-16 00:00:00', '', '', 'I102'),
(25, 'p123', 'd123', '', '', '', '0000-00-00 00:00:00', '', '', 'I100'),
(26, 'p123', 'd123', '', '', '', '0000-00-00 00:00:00', '', '', 'I100'),
(27, 'p123', 'd123', '', '', '', '0000-00-00 00:00:00', '', '', 'I100'),
(28, 'p123', 'd123', '', '', '', '0000-00-00 00:00:00', '', '', 'I102'),
(29, 'p123', 'd123', '', '', '', '0000-00-00 00:00:00', '', '', 'I100'),
(30, 'p123', 'd123', '', '', '', '0000-00-00 00:00:00', '', '', 'I100'),
(31, 'p123', 'd123', '', '', '', '0000-00-00 00:00:00', '', '', 'I100'),
(32, 'p123', 'd123', '', '', '', '0000-00-00 00:00:00', '', '', 'I100'),
(33, 'p123', 'd123', '', '', '', '0000-00-00 00:00:00', '', '', 'I102'),
(34, 'p123', 'd123', '', '', '', '0000-00-00 00:00:00', '', '', 'I100'),
(35, 'p123', 'd123', '', '', '', '0000-00-00 00:00:00', '', '', 'I100'),
(36, 'p123', 'd123', '', '', '', '0000-00-00 00:00:00', '', '', 'I102'),
(37, 'p123', 'd123', '', '', '', '0000-00-00 00:00:00', '', '', 'I124'),
(38, 'p123', 'd123', '', '', '', '0000-00-00 00:00:00', '', '', 'I102'),
(39, 'p123', 'd123', '', '', '', '0000-00-00 00:00:00', '', '', 'I100'),
(40, 'p123', 'd123', '', '', '', '0000-00-00 00:00:00', '', '', 'I102'),
(41, 'p123', 'd123', '', '', '', '0000-00-00 00:00:00', '', '', 'I100'),
(42, 'p123', 'd123', '', '', '', '0000-00-00 00:00:00', '', '', 'I100'),
(43, 'p123', 'd123', '', '', '', '0000-00-00 00:00:00', '', '', 'I100'),
(44, 'p123', 'd123', '', '', '', '0000-00-00 00:00:00', '', '', 'I100'),
(45, 'p123', 'd123', '', '', '', '0000-00-00 00:00:00', '', '', 'I102'),
(46, 'p123', 'd123', '', '', '', '0000-00-00 00:00:00', '', '', 'I100'),
(47, 'p123', 'd123', '', '', '', '0000-00-00 00:00:00', '', '', 'I100'),
(48, 'p123', 'd123', '', '', '', '0000-00-00 00:00:00', '', '', 'I102'),
(49, 'p123', 'd123', '', '', '', '0000-00-00 00:00:00', '', '', 'I124'),
(50, 'p123', 'd123', '', '', '', '0000-00-00 00:00:00', '', '', 'I102'),
(51, 'p123', 'd123', '', '', '', '0000-00-00 00:00:00', '', '', 'I100'),
(52, 'p123', 'd123', '', '', '', '0000-00-00 00:00:00', '', '', 'I102'),
(53, 'p123', 'd123', '', '', '', '0000-00-00 00:00:00', '', '', 'I100'),
(54, 'p123', 'd123', '', '', '', '0000-00-00 00:00:00', '', '', 'I100'),
(55, 'p123', 'd123', '', '', '', '0000-00-00 00:00:00', '', '', 'I100'),
(56, 'p123', 'd123', '', '', '', '0000-00-00 00:00:00', '', '', 'I100'),
(57, 'p123', 'd123', '', '', '', '0000-00-00 00:00:00', '', '', 'I102'),
(58, 'p123', 'd123', '', '', '', '0000-00-00 00:00:00', '', '', 'I100'),
(59, 'p123', 'd123', '', '', '', '0000-00-00 00:00:00', '', '', 'I100'),
(60, 'p123', 'd123', '', '', '', '0000-00-00 00:00:00', '', '', 'I102'),
(61, 'p123', 'd123', '', '', '', '0000-00-00 00:00:00', '', '', 'I124'),
(62, 'p123', 'd123', '', '', '', '0000-00-00 00:00:00', '', '', 'I102'),
(63, 'p123', 'd123', '', '', '', '0000-00-00 00:00:00', '', '', 'I100'),
(64, 'p123', 'd123', '', '', '', '0000-00-00 00:00:00', '', '', 'I102'),
(65, 'p123', 'd123', '', '', '', '0000-00-00 00:00:00', '', '', 'I100'),
(66, 'p123', 'd123', '', '', '', '0000-00-00 00:00:00', '', '', 'I100'),
(67, 'p123', 'd123', '', '', '', '0000-00-00 00:00:00', '', '', 'I100'),
(68, 'p123', 'd123', '', '', '', '0000-00-00 00:00:00', '', '', 'I100'),
(69, 'p123', 'd123', '', '', '', '0000-00-00 00:00:00', '', '', 'I102'),
(70, 'p123', 'd123', '', '', '', '0000-00-00 00:00:00', '', '', 'I100'),
(71, 'p123', 'd123', '', '', '', '0000-00-00 00:00:00', '', '', 'I100'),
(72, 'p123', 'd123', '', '', '', '0000-00-00 00:00:00', '', '', 'I102'),
(73, 'p123', 'd123', '', '', '', '0000-00-00 00:00:00', '', '', 'I124'),
(74, 'p123', 'd123', '', '', '', '0000-00-00 00:00:00', '', '', 'I102');

-- --------------------------------------------------------

--
-- Table structure for table `prescription_temp`
--

CREATE TABLE IF NOT EXISTS `prescription_temp` (
  `presId` int(11) NOT NULL AUTO_INCREMENT,
  `pid` char(10) NOT NULL,
  `did` char(10) NOT NULL,
  `mid` char(5) NOT NULL,
  `dosage` varchar(30) NOT NULL,
  `frequencyId` char(4) NOT NULL,
  `date` datetime NOT NULL,
  `diagnosis` varchar(250) NOT NULL,
  `duration` varchar(10) NOT NULL,
  `issueId` char(4) NOT NULL,
  PRIMARY KEY (`presId`),
  KEY `frequencyId` (`frequencyId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `prescription_temp`
--

INSERT INTO `prescription_temp` (`presId`, `pid`, `did`, `mid`, `dosage`, `frequencyId`, `date`, `diagnosis`, `duration`, `issueId`) VALUES
(3, 'p123', 'd123', 'M128', 'vbv', 'f004', '2016-02-27 20:19:57', '', 'cgc', 'I102'),
(4, 'p123', 'd123', 'M128', 'cbcb', 'f004', '2016-02-27 20:21:40', '', 'bv', 'I102');

-- --------------------------------------------------------

--
-- Table structure for table `rosters`
--

CREATE TABLE IF NOT EXISTS `rosters` (
  `rosterId` varchar(20) NOT NULL,
  `empId` char(4) NOT NULL,
  `date` date NOT NULL,
  `description` varchar(50) NOT NULL,
  `department` varchar(50) NOT NULL,
  PRIMARY KEY (`rosterId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rosters`
--

INSERT INTO `rosters` (`rosterId`, `empId`, `date`, `description`, `department`) VALUES
('RosterFri-Jan-2016', 'E123', '2016-01-15', '', ''),
('RosterTue-Jan-2016', 'E123', '2016-01-05', 'rdhrhrhr', '');

-- --------------------------------------------------------

--
-- Table structure for table `specialization`
--

CREATE TABLE IF NOT EXISTS `specialization` (
  `spId` char(4) NOT NULL,
  `spName` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY (`spId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `specialization`
--

INSERT INTO `specialization` (`spId`, `spName`, `description`) VALUES
('sp01', 'General Surgeon', ''),
('sp02', 'Anesthesiologist', ''),
('sp03', 'Cardiologist', ''),
('sp04', 'Dentist', ''),
('sp05', 'Dematologist', ''),
('sp06', 'Diabetologist', ''),
('sp07', 'Gynocologist', ''),
('sp08', 'Hematologist', ''),
('sp09', 'Immunologist', ''),
('sp10', 'Nephrologist', ''),
('sp11', 'Toxicologist', ''),
('sp12', 'Endocrinologist', ''),
('sp13', 'Radiologist', ''),
('sp14', 'Rheumatologist', ''),
('sp15', 'Urologist', ''),
('sp16', 'Oncologist', ''),
('sp17', 'Opthalmologist', ''),
('sp18', 'Venereologist', ''),
('sp19', 'Nutritionist', ''),
('sp20', 'Eye Surgeon', ''),
('sp21', 'Vascular Surgeon', ''),
('sp22', 'Plastic Surgeon', ''),
('sp23', 'Dental Surgeon', ''),
('sp24', 'Pediatric Surgeon', ''),
('sp25', 'Oncology Surgeon', ''),
('sp26', 'Thoracic Surgeon', ''),
('sp27', 'Urinary Surgeon', ''),
('sp28', 'Orthopedic Surgeon', ''),
('sp29', 'Neuro Surgeon', ''),
('sp30', 'Cardiac Surgeon', '');

-- --------------------------------------------------------

--
-- Table structure for table `statistician`
--

CREATE TABLE IF NOT EXISTS `statistician` (
  `sId` char(4) NOT NULL,
  `name` varchar(50) NOT NULL,
  `add` varchar(200) NOT NULL,
  `nic` char(10) NOT NULL,
  `gender` char(1) NOT NULL,
  `telNo` char(10) NOT NULL,
  `regDate` date NOT NULL,
  `email` varchar(20) NOT NULL,
  `sPass` varchar(150) NOT NULL,
  `imageType` varchar(6) NOT NULL,
  PRIMARY KEY (`sId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `statistician`
--

INSERT INTO `statistician` (`sId`, `name`, `add`, `nic`, `gender`, `telNo`, `regDate`, `email`, `sPass`, `imageType`) VALUES
('S123', 'Kamal Surendra', '45/7, Kandt rd, Kandy', '', '', '0812342345', '2016-02-15', 'kamals@gmail.com', '202cb962ac59075b964b07152d234b70', '');

-- --------------------------------------------------------

--
-- Table structure for table `temp_doctor`
--

CREATE TABLE IF NOT EXISTS `temp_doctor` (
  `dRequestId` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `add` varchar(200) NOT NULL,
  `gender` char(1) NOT NULL,
  `nic` char(10) NOT NULL,
  `dob` date NOT NULL,
  `spId` char(4) NOT NULL,
  `district` varchar(50) NOT NULL,
  `hId` char(4) NOT NULL,
  `email` varchar(20) NOT NULL,
  `telNo` char(10) NOT NULL,
  `MOIC` tinyint(4) NOT NULL DEFAULT '0',
  `maritalStatus` char(1) NOT NULL,
  `nationality` char(1) NOT NULL,
  `slmcRegNo` int(4) NOT NULL,
  PRIMARY KEY (`dRequestId`),
  KEY `dRequestId` (`dRequestId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `temp_doctor`
--

INSERT INTO `temp_doctor` (`dRequestId`, `name`, `add`, `gender`, `nic`, `dob`, `spId`, `district`, `hId`, `email`, `telNo`, `MOIC`, `maritalStatus`, `nationality`, `slmcRegNo`) VALUES
(1, 'dis', 'sdfdsf', 'f', 'dfsdf', '1984-09-01', 'sp30', 'sds', 'h001', 'dilanga198@gmail.com', 'sdsd', 0, 'S', 'S', 0),
(2, 'ffffhf', 'fhd', 'f', 'fdg', '1987-09-01', 'sp27', 'dfs', 'h002', 'dilanga198@gmail.com', 'dsf', 0, 'S', 'S', 0),
(3, 'dsf', 'dsf', 'f', 'dsfds', '1986-09-01', 'sp30', 'fds', 'h002', 'dilanga198@gmail.com', 'dsf', 0, 'S', 'S', 0),
(4, 'd', 'd', 'f', 'd', '1972-03-01', 'sp30', 'd', 'h002', 'dilanga198@gmail.com', 'd', 0, 'S', 'S', 0),
(5, 'd', 'd', 'f', 'd', '1987-10-01', 'sp30', 'd', 'h002', 'dilanga198@gmail.com', 'd', 0, 'S', 'S', 0),
(6, 'f', 'f', 'f', 'f', '1985-03-01', 'sp30', 'd', 'h002', 'dilangapct@gmail.com', 'd', 0, 'S', 'S', 0);

-- --------------------------------------------------------

--
-- Table structure for table `temp_patient`
--

CREATE TABLE IF NOT EXISTS `temp_patient` (
  `pRequestId` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `add` varchar(200) NOT NULL,
  `gender` char(1) NOT NULL,
  `nic` char(10) NOT NULL,
  `dob` date NOT NULL,
  `bloodGroup` varchar(3) NOT NULL,
  `email` varchar(20) NOT NULL,
  `telNo` char(10) NOT NULL,
  `district` varchar(50) NOT NULL,
  `maritalStatus` char(1) NOT NULL,
  `gId` char(4) NOT NULL,
  PRIMARY KEY (`pRequestId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=49 ;

--
-- Dumping data for table `temp_patient`
--

INSERT INTO `temp_patient` (`pRequestId`, `name`, `add`, `gender`, `nic`, `dob`, `bloodGroup`, `email`, `telNo`, `district`, `maritalStatus`, `gId`) VALUES
(5, 'ff', 'fff', 'f', 'ff', '1991-03-01', 'B+', 'dilanga198@gmail.com', 'fff', 'fff', 'S', ''),
(7, 'dd', 'dd', 'f', 'dd', '1991-01-01', 'A+', 'dilangapct@gmail.com', 'dsfds', 'dd', 'S', ''),
(8, 'dfdsfdf', 'dfdsfdf', 'f', '324432342V', '2000-12-02', 'A+', 'dilanga198@gmail.com', '123123213', 'dfdsfdf', 's', 'p123'),
(9, 'dfdsfdf', 'dfdsfdf', 'f', '324432342V', '2000-12-02', 'A+', 'dilanga198@gmail.com', '123123213', 'dfdsfdf', 's', 'p123'),
(10, 'dfdsfdf', 'dfdsfdf', 'f', '324432342V', '2000-12-02', 'A+', 'dilanga198@gmail.com', '123123213', 'dfdsfdf', 's', 'p123'),
(11, 'dfdsfdf', 'dfdsfdf', 'f', '324432342V', '2000-12-02', 'A+', 'dilanga198@gmail.com', '123123213', 'dfdsfdf', 's', 'p123'),
(12, 'dfdsfdf', 'dfdsfdf', 'f', '324432342V', '2000-12-02', 'A+', 'dilanga198@gmail.com', '123123213', 'dfdsfdf', 's', 'p123'),
(13, 'dfdsfdf', 'dfdsfdf', 'f', '324432342V', '2000-12-02', 'A+', 'dilanga198@gmail.com', '123123213', 'dfdsfdf', 's', 'p123'),
(14, 'dfdsfdf', 'dfdsfdf', 'f', '324432342V', '2000-12-02', 'A+', 'dilanga198@gmail.com', '123123213', 'dfdsfdf', 's', 'p123'),
(15, 'dfdsfdf', 'dfdsfdf', 'f', '324432342V', '2000-12-02', 'A+', 'dilanga198@gmail.com', '123123213', 'dfdsfdf', 's', 'p123'),
(16, 'dfdsfdf', 'dfdsfdf', 'f', '324432342V', '2000-12-02', 'A+', 'dilanga198@gmail.com', '123123213', 'dfdsfdf', 's', 'p123'),
(17, 'dfdsfdf', 'dfdsfdf', 'f', '324432342V', '2000-12-02', 'A+', 'dilanga198@gmail.com', '123123213', 'dfdsfdf', 's', 'p123'),
(18, 'dfdsfdf', 'dfdsfdf', 'f', '324432342V', '2000-12-02', 'A+', 'dilanga198@gmail.com', '123123213', 'dfdsfdf', 's', 'p123'),
(19, 'dfdsfdf', 'dfdsfdf', 'f', '324432342V', '2000-12-02', 'A+', 'dilanga198@gmail.com', '123123213', 'dfdsfdf', 's', 'p123'),
(20, 'dfdsfdf', 'dfdsfdf', 'f', '324432342V', '2000-12-02', 'A+', 'dilanga198@gmail.com', '123123213', 'dfdsfdf', 's', 'p123'),
(21, 'dfdsfdf', 'dfdsfdf', 'f', '324432342V', '2000-12-02', 'A+', 'dilanga198@gmail.com', '123123213', 'dfdsfdf', 's', 'p123'),
(22, 'dfdsfdf', 'dfdsfdf', 'f', '324432342V', '2000-12-02', 'A+', 'dilanga198@gmail.com', '123123213', 'dfdsfdf', 's', 'p123'),
(23, 'dfdsfdf', 'dfdsfdf', 'f', '324432342V', '2000-12-02', 'A+', 'dilanga198@gmail.com', '123123213', 'dfdsfdf', 's', 'p123'),
(24, 'dfdsfdf', 'dfdsfdf', 'f', '324432342V', '2000-12-02', 'A+', 'dilanga198@gmail.com', '123123213', 'dfdsfdf', 's', 'p123'),
(25, 'dfdsfdf', 'dfdsfdf', 'f', '324432342V', '2000-12-02', 'A+', 'dilanga198@gmail.com', '123123213', 'dfdsfdf', 's', 'p123'),
(26, 'dfdsfdf', 'dfdsfdf', 'f', '324432342V', '2000-12-02', 'A+', 'dilanga198@gmail.com', '123123213', 'dfdsfdf', 's', 'p123'),
(27, 'dfdsfdf', 'dfdsfdf', 'f', '324432342V', '2000-12-02', 'A+', 'dilanga198@gmail.com', '123123213', 'dfdsfdf', 's', 'p123'),
(28, 'dfdsfdf', 'dfdsfdf', 'f', '324432342V', '2000-12-02', 'A+', 'dilanga198@gmail.com', '123123213', 'dfdsfdf', 's', 'p123'),
(29, 'dfdsfdf', 'dfdsfdf', 'f', '324432342V', '2000-12-02', 'A+', 'dilanga198@gmail.com', '123123213', 'dfdsfdf', 's', 'p123'),
(30, 'dfdsfdf', 'dfdsfdf', 'f', '324432342V', '2000-12-02', 'A+', 'dilanga198@gmail.com', '123123213', 'dfdsfdf', 's', 'p123'),
(31, 'dfdsfdf', 'dfdsfdf', 'f', '324432342V', '2000-12-02', 'A+', 'dilanga198@gmail.com', '123123213', 'dfdsfdf', 's', 'p123'),
(32, 'dfdsfdf', 'dfdsfdf', 'f', '324432342V', '2000-12-02', 'A+', 'dilanga198@gmail.com', '123123213', 'dfdsfdf', 's', 'p123'),
(33, 'dfdsfdf', 'dfdsfdf', 'f', '324432342V', '2000-12-02', 'A+', 'dilanga198@gmail.com', '123123213', 'dfdsfdf', 's', 'p123'),
(34, 'dfdsfdf', 'dfdsfdf', 'f', '324432342V', '2000-12-02', 'A+', 'dilanga198@gmail.com', '123123213', 'dfdsfdf', 's', 'p123'),
(35, 'dfdsfdf', 'dfdsfdf', 'f', '324432342V', '2000-12-02', 'A+', 'dilanga198@gmail.com', '123123213', 'dfdsfdf', 's', 'p123'),
(36, 'dfdsfdf', 'dfdsfdf', 'f', '324432342V', '2000-12-02', 'A+', 'dilanga198@gmail.com', '123123213', 'dfdsfdf', 's', 'p123'),
(37, 'dfdsfdf', 'dfdsfdf', 'f', '324432342V', '2000-12-02', 'A+', 'dilanga198@gmail.com', '123123213', 'dfdsfdf', 's', 'p123'),
(38, 'dfdsfdf', 'dfdsfdf', 'f', '324432342V', '2000-12-02', 'A+', 'dilanga198@gmail.com', '123123213', 'dfdsfdf', 's', 'p123'),
(39, 'dfdsfdf', 'dfdsfdf', 'f', '324432342V', '2000-12-02', 'A+', 'dilanga198@gmail.com', '123123213', 'dfdsfdf', 's', 'p123'),
(40, 'dfdsfdf', 'dfdsfdf', 'f', '324432342V', '2000-12-02', 'A+', 'dilanga198@gmail.com', '123123213', 'dfdsfdf', 's', 'p123'),
(41, 'dfdsfdf', 'dfdsfdf', 'f', '324432342V', '2000-12-02', 'A+', 'dilanga198@gmail.com', '123123213', 'dfdsfdf', 's', 'p123'),
(42, 'dfdsfdf', 'dfdsfdf', 'f', '324432342V', '2000-12-02', 'A+', 'dilanga198@gmail.com', '123123213', 'dfdsfdf', 's', 'p123'),
(43, 'dfdsfdf', 'dfdsfdf', 'f', '324432342V', '2000-12-02', 'A+', 'dilanga198@gmail.com', '123123213', 'dfdsfdf', 's', 'p123'),
(44, 'dfdsfdf', 'dfdsfdf', 'f', '324432342V', '2000-12-02', 'A+', 'dilanga198@gmail.com', '123123213', 'dfdsfdf', 's', 'p123'),
(45, 'dfdsfdf', 'dfdsfdf', 'f', '324432342V', '2000-12-02', 'A+', 'dilanga198@gmail.com', '123123213', 'dfdsfdf', 's', 'p123'),
(46, 'dfdsfdf', 'dfdsfdf', 'f', '324432342V', '2000-12-02', 'A+', 'dilanga198@gmail.com', '123123213', 'dfdsfdf', 's', 'p123'),
(47, 'dfdsfdf', 'dfdsfdf', 'f', '324432342V', '2000-12-02', 'A+', 'dilanga198@gmail.com', '123123213', 'dfdsfdf', 's', 'p123'),
(48, 'rgr', 'regrgr', 'f', 'regrgree', '1962-03-06', 'A-', 'dilanga198@gmail.com', 'fgfdg', 'dfgdfg', 'S', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
