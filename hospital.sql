-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 11, 2016 at 03:40 PM
-- Server version: 5.6.24
-- PHP Version: 5.5.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `aId` char(4) NOT NULL,
  `name` varchar(50) NOT NULL,
  `gender` char(1) NOT NULL,
  `add` varchar(200) NOT NULL,
  `email` varchar(20) NOT NULL,
  `nic` char(10) NOT NULL,
  `regDate` date NOT NULL,
  `aPass` varchar(150) NOT NULL,
  `imageType` varchar(6) NOT NULL,
  `telNo` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`aId`, `name`, `gender`, `add`, `email`, `nic`, `regDate`, `aPass`, `imageType`, `telNo`) VALUES
('a123', 'Domatila', 'f', '217/3, maddagama, ampitiya', 'sjsindhee@gmail.com', '896733222v', '2016-03-09', '123', '', '0812217991');

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE IF NOT EXISTS `appointment` (
  `appId` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `tital` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `did` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `description` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`artId`, `dId`, `date`, `issueId`, `topic`, `description`) VALUES
('A33859', 'd123', '2016-03-10', 'I176', 'MENTAL HEALTH ', 'Mental Health\r\nResearch Findings\r\nPresident, World Federation for Mental Health'),
('A44985', 'd123', '2016-03-11', 'I123', 'Alcohol and blood sugar ', 'There have been some research especially in type2 diabetes and fasting glucose levels.Consumption of alcohol lead to a moderate decrease in fasting blood glucose,but it did not have any bearing on postprandial levels when compared to teetotaling days'),
('A45903', 'd123', '2016-03-11', 'I102', 'Reversal of type 2 Diabetes', 'Decrease in fasting blood glucose,but it did not have any bearing on postprandial levels when compared to \r\n\r\nteetotaling days prior to the study..There have been some research especially in type2 diabetes and fasting glucose levels.Consumption of al'),
('A50207', 'd123', '2016-03-11', 'I105', 'Medical reports', 'People should know how to read medical reports in case of urgent.'),
('A50284', 'd123', '2016-03-11', 'I100', 'An excessive amount of the wrong insulin ', 'An excessive amount of any type of insulin can cause low blood sugars and can be dangerous. Your grandmother''s doctor needs to be involved to ensure that things are correct. Please note that sometimes when patients are hospitalized their insulin need'),
('A74149', 'd123', '2016-03-11', 'I100', 'Cancer protection', 'People should know how to read medical reports in case of urgent.'),
('A77255', 'd123', '2016-03-10', 'I176', 'WORLD MENTAL HEALTH DAY', 'Prof. George Christodoulou\r\nPresident, World Federation for Mental Health'),
('A88156', 'd123', '2016-03-11', 'I102', 'Diabetic Eye Disease ', 'Decrease in fasting blood glucose,but it did not have any bearing on postprandial levels when compared to \r\n\r\nteetotaling days prior to the study..There have been some research especially in type2 diabetes and fasting glucose levels.Consumption of al'),
('A97063', 'd123', '2016-03-11', 'I123', 'Cardiology Treatment Modalities ', 'There have been some research especially in type2 diabetes and fasting glucose levels.Consumption of alcohol lead to a moderate decrease in fasting blood glucose,but it did not have any bearing on postprandial levels when compared to teetotaling days');

-- --------------------------------------------------------

--
-- Table structure for table `diagnosis`
--

CREATE TABLE IF NOT EXISTS `diagnosis` (
  `id` int(11) NOT NULL,
  `diagnosisNo` int(11) NOT NULL,
  `medicine` char(5) NOT NULL,
  `dosage` varchar(30) NOT NULL,
  `frequency` varchar(30) NOT NULL,
  `duration` varchar(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `diagnosis`
--

INSERT INTO `diagnosis` (`id`, `diagnosisNo`, `medicine`, `dosage`, `frequency`, `duration`) VALUES
(11, 11, 'M128', 'ttttttttttt', 'f004', 'tttttttttt'),
(12, 11, 'M128', 'rrrrrrrrrrrrrr', 'f004', 'rrrrrrrrrr'),
(13, 11, 'M128', 'eeeeeeeee', 'f004', 'eeeeeeee'),
(14, 11, 'M128', 'wwwwwwwww', 'f004', 'wwwwwwwww'),
(15, 11, 'M128', 'qqqqqqqq', 'f004', 'qqqqqqqqqq'),
(16, 2, 'M126', '456', 'f002', 'rhhrthrt'),
(17, 2, 'M116', '35', 'f002', 'fdhdhd'),
(18, 3, 'M124', 'hk', 'f004', 'kjl'),
(19, 4, 'M124', 'hgj', 'f004', 'kj');

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
  `nationality` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`dId`, `MOIC`, `name`, `gender`, `dPass`, `add`, `spId`, `hId`, `email`, `telNo`, `nic`, `dob`, `district`, `slmcRegNo`, `imageType`, `maritalStatus`, `nationality`) VALUES
('d123', 0, 'Sindhuja', 'f', '202cb962ac59075b964b07152d234b70', 'jkjkghjkgk,kjhkbkjahf, Kandy', 'sp10', 'h001', 'sjsindhee@gmail.com', '0772217343', '896733222v', '1989-06-21', 'Kandy', 1258, 'jpg', 's', 's'),
('D745611325', 0, 'fgfdgfd', 'f', 'fd22213103d21881c16b627bade8bc74', 'gfhfgh', 'sp13', 'h002', 'ddddd@gmail.com', 'cbfcbf', 'fghfh', '1974-03-03', 'dffgd', 0, 'jpg', 'S', 'S'),
('D80766507', 0, 'Kamal Silva', 'm', '202cb962ac59075b964b07152d234b70', '24/A, Colombo rd, Kandy', 'sp24', 'h001', 'dilangapct@gmail.com', '235435365', '12323456', '1980-03-17', 'Kandy', 1234, 'jpg', 'S', 'S'),
('D881211598', 0, 'Suriya', 'm', 'add4aa8d0ab6084565157f752abdd380', '26/6 , Kandy', 'sp01', 'h001', 'fhjkifh@yahoo.com', '0775965398', '8866369924', '1988-05-02', 'Kandy', 1256, '', 'S', 'S');

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
  `likes` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `forumans`
--

INSERT INTO `forumans` (`ansId`, `uid`, `answer`, `time`, `attachment`, `qid`, `likes`) VALUES
(21, 'd123 ', 'ftrnytyt', '2016-03-10 21:39:15', '', 15, 6),
(24, 'd123 ', 'utryuttr', '2016-03-11 14:34:36', '', 14, 4),
(25, 'd123 ', 'Clinical trials are needed to evaluate the safety and efficacy of moderate drinking for reaching the improved outcomes suggested by observational studies.Best wishes', '2016-03-11 14:39:23', '', 18, 0),
(26, 'd123 ', 'did not have any bearing on postprandial levels when compared to teetotaling days prior to the study.Shai I et al. Glycemic effects of moderate alcohol intake among patients with type 2 diabetes:', '2016-03-11 14:39:46', '', 18, 0),
(28, 'd123 ', 'I cannot provide much more information than that based on the information provided, nor would it be appropriate for me to do so since the limitations of the internet would preclude me from being able to truly give you accurate answers. If you are concerne', '2016-03-11 14:44:36', '', 20, 2),
(29, 'd123 ', 'Though there is no specific breath smell linking to diabetes except in diabetic ketoacidosis in which you get a typical fruity odour.This is due to acetone a bi product of fat metabolism which is seen in severe types.In regular uncomplicated diabetes gum ', '2016-03-11 14:45:19', '', 17, 0);

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
  `likes` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `forumquest`
--

INSERT INTO `forumquest` (`qId`, `uid`, `topic`, `question`, `issueId`, `time`, `attachment`, `likes`) VALUES
(13, 'd123', 'A community of expecting mothers concerned about Gestational Diabetes', 'Anyone having breech baby and gestational diabetes. I am 31 weeks now and i am worried about not having natural birth.', 'I200', '2016-03-10 21:37:23', '', 0),
(14, 'd123', 'Pregnancy Replated', 'This is my first pregnancy and I am expecting September 23... !!! I don''t know how to feel about this but I am going to take on this new journey!', 'I102', '2016-03-10 21:37:34', '', 3),
(15, 'd123', 'Diabetes Feedback ...', 'I undergo abscess drainage surgery for anorectal abscess last october, it healed quickly but recurring bleeding and irritation is always present. it bleeds a lot now, my surgeon said to observe it and wait to heal I already took several ...', 'I104', '2016-03-10 21:38:27', '', 0),
(16, 'D123', 'I had bad time for 5months now I was suspected ... ', 'I was not well for past 6 months. I had to go to my parents to get diagnosis for.my persistent low grade fever . I nearly changed 6 doctors even got hospitalized for investigation. Nothing abnormal found.', 'I200', '2016-03-09 00:00:00', '', 0),
(17, 'P123', 'Radio logy related question ... ', 'or at least six years or so, when I yawn, my jaw pops. As in, both sides almost jump out of place at the joint. It doesn’t really hurt when it happens, but sometimes getting my mouth shut again hurts a bit.', 'I100', '2016-03-08 00:00:00', '', 0),
(18, 'P123', 'Proteinuria, no edema, nocturia and metallic taste in mouth ', 'diabetic, dialysis patient with vascular access, renal function is 14%. Has been short of breath since last treatment Friday morning. Blood Pressure is stedily rising and currently at 208/90. blood sugar levels are nid 200s.', 'I200', '2016-03-06 00:00:00', '', 2),
(19, 'P123', 'peritoneal dialysis and pregnacy ', 'I am a 32 year old women and i am on peritoneal dialysis. I am also on the list for a kidney transplant and have been on that list for the past 4 years. My question to you is , is it possible to have a healthy baby while on dialysis. I think my time is ru', 'I100', '2016-03-03 00:00:00', '', 0),
(20, 'D123', 'peritoneal dialysis and pregnacy ', 'I am a 32 year old women and i am on peritoneal dialysis. I am also on the list for a kidney transplant and have been on that list for the past 4 years. My question to you is , is it possible to have a healthy baby while on dialysis. I think my time is ru', 'I100', '2016-03-03 00:00:00', '', 2),
(21, 'P123', 'Lower back pain and hard breathing, kidney related?', 'We have Case Report of a 43 year old women, 4 years on peritoneal dialysis. She has three daughters. First two she had before starting PD, and one when she had while she was on PD.', 'I176', '2016-03-07 00:00:00', '', 0),
(22, 'D123', 'Peritonitis in CAPD patients', 'My mother was diagnosed with peritonitis on 4-9-02 (Tues.) due to being on peritoneal dialysis.', 'I200', '2016-03-06 00:00:00', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `frequency_med`
--

CREATE TABLE IF NOT EXISTS `frequency_med` (
  `frequencyId` char(4) NOT NULL,
  `frequency` varchar(15) NOT NULL,
  `shortForm` varchar(4) NOT NULL
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
  `issue` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `health_issue`
--

INSERT INTO `health_issue` (`issueId`, `description`, `issue`) VALUES
('I100', 'Physical Activity and Nutrition', 'Physical Activity and Nutrition'),
('I102', 'Tobacco', 'Tobacco'),
('I103', 'Immunization', 'Immunization'),
('I104', 'Headaches', 'Headaches'),
('I105', 'Other', 'Other'),
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
  `hTelNo` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hospital`
--

INSERT INTO `hospital` (`hId`, `district`, `add`, `description`, `hName`, `hTelNo`) VALUES
('h001', 'Kandy', 'Teaching Hospital Kandy, Kandy 20000 Sri Lanka', 'The Teaching Hospital Kandy is the second largest medical institution in Sri Lanka, established and administered under the purview of the Ministry of Health, Sri Lanka which is a key Government Hospital maintained by the Sri Lankan Government.  We mainly serve general public living in the Central Province which consists of Kandy, Matale and Nuwara ', 'Teaching Hospital Kandy', '0812 22226'),
('h002', 'Colombo', 'E W Perera Mawatha, Colombo', 'This Hospital serves as the National Referral Center for medical and surgical care in Sri Lanka. The National Hospital which is the largest teaching hospital in Sri Lanka consists of 3300 beds and is considered as the largest hospital in South East Asia. This hospital has 106 wards, 35 Operating Theatres and 12 Intensive Care Units in addition to o', 'National Hospital of Sri Lanka', '011 2 6911'),
('h003', 'Ampara', 'Ampara District General Hospital', ' established and administered under the purview of the Ministry of Health, Sri Lanka which is a key Government Hospital maintained by the Sri Lankan Government', 'Ampara District General Hospital', '0773652984'),
('h004', 'Kalutara', 'Kalutara District General Hospital', ' established and administered under the purview of the Ministry of Health, Sri Lanka which is a key Government Hospital maintained by the Sri Lankan Government', 'Kalutara District General Hospital', '0773562984'),
('h005', 'Matara', 'Matara District General Hospital', ' established and administered under the purview of the Ministry of Health, Sri Lanka which is a key Government Hospital maintained by the Sri Lankan Government', 'Matara District General Hospital', '0773562984'),
('h006', 'Batticaloa', 'Batticaloa District General Hospital', ' established and administered under the purview of the Ministry of Health, Sri Lanka which is a key Government Hospital maintained by the Sri Lankan Government', 'Batticaloa District General Hospital', '0773562984'),
('h007', 'Galle', 'Galle District General Hospital', ' established and administered under the purview of the Ministry of Health, Sri Lanka which is a key Government Hospital maintained by the Sri Lankan Government', 'Galle District General Hospital', '0773562984'),
('h008', 'Gampaha', 'Gampaha District General Hospital', ' established and administered under the purview of the Ministry of Health, Sri Lanka which is a key Government Hospital maintained by the Sri Lankan Government', 'Gampaha District General Hospital', '0773562984'),
('h009', 'Jaffna', 'Jaffna District General Hospital', ' established and administered under the purview of the Ministry of Health, Sri Lanka which is a key Government Hospital maintained by the Sri Lankan Government', 'Jaffna District General Hospital', '0773562984'),
('h010', 'Hambantota', 'Hambantota District General Hospital', ' established and administered under the purview of the Ministry of Health, Sri Lanka which is a key Government Hospital maintained by the Sri Lankan Government', 'Hambantota District General Hospital', '0773562984'),
('h011', 'Kegalle', 'Kegalle District General Hospital', ' established and administered under the purview of the Ministry of Health, Sri Lanka which is a key Government Hospital maintained by the Sri Lankan Government', 'Kegalle District General Hospital', '0773562984'),
('h012', 'Anuradhapura', 'Anuradhapura District General Hospital', ' established and administered under the purview of the Ministry of Health, Sri Lanka which is a key Government Hospital maintained by the Sri Lankan Government', 'Anuradhapura District General Hospital', '0773562984'),
('h200', 'Kandy', 'Kandy Rd, kandy', ' established and administered under the purview of the Ministry of Health, Sri Lanka which is a key Government Hospital maintained by the Sri Lankan Government', 'Suwasewana Hospital', '123123123'),
('h201', 'Kurunagala', 'Kandy Rd, kandy', ' established and administered under the purview of the Ministry of Health, Sri Lanka which is a key Government Hospital maintained by the Sri Lankan Government', 'Kurunagala Private Hospital', '123123123'),
('h202', 'Kandy', 'Kandy Rd, kandy', ' established and administered under the purview of the Ministry of Health, Sri Lanka which is a key Government Hospital maintained by the Sri Lankan Government', 'Suwasewana Hospital', '123123123'),
('h203', 'Kurunagala', 'Kurunagala Rd, Kurunagala', ' established and administered under the purview of the Ministry of Health, Sri Lanka which is a key Government Hospital maintained by the Sri Lankan Government', 'Kurunagala New Hospital', '123123123'),
('h204', 'Kandy', 'Kandy Rd, kandy', ' established and administered under the purview of the Ministry of Health, Sri Lanka which is a key Government Hospital maintained by the Sri Lankan Government', 'Suwasewana Hospital', '123123123'),
('h205', 'Kurunagala', 'Kurunagala Rd, Kurunagala', ' established and administered under the purview of the Ministry of Health, Sri Lanka which is a key Government Hospital maintained by the Sri Lankan Government', 'Kurunagala General Hospital', '123123123'),
('h206', 'Kandy', 'Kurunagala Rd, Kurunagala', ' established and administered under the purview of the Ministry of Health, Sri Lanka which is a key Government Hospital maintained by the Sri Lankan Government', 'Peradeniya Hospital', '123123123'),
('h207', 'Kandy', 'Kandy Rd, kandy', ' established and administered under the purview of the Ministry of Health, Sri Lanka which is a key Government Hospital maintained by the Sri Lankan Government', 'Lake side Hospital', '123123123');

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
  `imageType` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hospital_emp`
--

INSERT INTO `hospital_emp` (`empId`, `name`, `add`, `hId`, `telNo`, `regDate`, `wrkStatus`, `email`, `ePass`, `active`, `nic`, `gender`, `imageType`) VALUES
('e123', 'Nimal', 'Kandy rd Colombo', 'h001', '123132435', '0000-00-00', 1, 'email@email.com', '202cb962ac59075b964b07152d234b70', 1, '123342423V', 'M', 'jpg');

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE IF NOT EXISTS `medicine` (
  `mid` char(4) NOT NULL,
  `medicine` varchar(100) NOT NULL,
  `frequencyId` char(4) NOT NULL
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
('M123', 'Seroquel', 'f004'),
('M124', 'Singulair', 'f004'),
('M125', 'Actos', 'f004'),
('M126', 'Epogen', 'f004'),
('M127', 'Enbrel', 'f004'),
('M128', 'Copaxone', 'f004'),
('M129', 'Lantus Solostar', 'f004'),
('M130', 'Avastin', 'f004');

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
  `imageType` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`name`, `pId`, `nic`, `gender`, `add`, `regDate`, `dob`, `pPass`, `bloodGroup`, `email`, `telNo`, `district`, `gId`, `imageType`) VALUES
('Sindhuja', 'p123', '896733222v', 'f', '217, maddehama ,kandy', '2016-03-04', '1989-06-21', '202cb962ac59075b964b07152d234b70', 'B+', 'sjsindhee@gmail.com', '0772217343', 'Kandy', '-', 'jpg'),
('Nimal', 'P872182243', '8766559924', 'm', '25/6 , Ampara', '2016-03-10', '1987-08-08', 'aec729cc97fad3b46510472fdbfea8b7', 'A+', 'fhgfjhfjhfh@yahoo.co', '0715562398', 'Ampara', '', ''),
('Suriya', 'P881216376', '8866369924', 'm', '26/6 , Kandy', '2016-03-10', '1988-05-02', 'c360e5d4238b95f94f6c15a8acd233ee', 'AB+', 'fhjkifh@yahoo.com', '0775965398', 'Kandy', '', ''),
('Annon', 'P882325199', '8866559924', 'm', '25/6 , Ampara', '2016-03-10', '1988-08-21', 'f4417684d254da9def08438cbb9151b0', 'A+', 'fhgfjhfjhfh@yahoo.co', '0715562398', 'Ampara', '', ''),
('Annon', 'P882326169', '8866559924', 'm', '25/6, Kandy', '2016-03-10', '1988-08-21', 'd088d8a8a4c754abca6d149e43705c03', 'A+', 'fhgfjhfjhfh@yahoo.co', '0715562398', 'Kandy', '', ''),
('Ann', 'P882326683', '8866559924', 'm', '25/6, Kandy', '2016-03-10', '1988-08-21', 'b766c54e1b43f301643ab0c8312b5a50', 'A+', 'fhgfjhfjhfh@yahoo.co', '0715562398', 'Kandy', '', ''),
('Sithara', 'P882328579', '8866559924', 'm', '25/5 , Kandy', '2016-03-10', '1988-08-21', 'd4aa50e07e4801e7038052107c0bc943', 'A+', 'fhgfjhhfh@yahoo.com', '0715562398', 'Kandy', '', ''),
('Vimal', 'P882328769', '8866559924', 'm', '25/6 , Kandy', '2016-03-10', '1988-08-21', '694adff72c0d9cfa9714945a3e71bc71', 'A+', 'fhgfjhfjhfh@yahoo.co', '0715562398', 'Kandy', '', ''),
('Chitra', 'P887323720', '8866549924', 'f', '25/5 , Kandy', '2016-03-10', '1988-08-21', 'e8c27b40f4c955660d2887c6a80334b9', 'A+', 'fhgfjhhfh@yahoo.com', '0715562398', 'Kandy', '', ''),
('Saman Silva', 'P88937003', '234353533V', 'm', '23/3, Kandy Rd, Colombo.', '2016-02-28', '1988-04-04', '202cb962ac59075b964b07152d234b70', 'A-', 'dilangapct@gmail.com', '0112342343', 'Kandy', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `patient_history`
--

CREATE TABLE IF NOT EXISTS `patient_history` (
  `historyNo` int(11) NOT NULL,
  `patientStatus` tinyint(1) NOT NULL,
  `deathDate` datetime DEFAULT NULL,
  `date` datetime NOT NULL,
  `description` varchar(250) NOT NULL,
  `hId` char(4) NOT NULL,
  `reportNo` varchar(100) NOT NULL,
  `dId` char(4) NOT NULL,
  `pId` char(10) NOT NULL,
  `presId` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient_history`
--

INSERT INTO `patient_history` (`historyNo`, `patientStatus`, `deathDate`, `date`, `description`, `hId`, `reportNo`, `dId`, `pId`, `presId`) VALUES
(1, 0, NULL, '2016-02-09 00:00:00', 'gf', 'h001', '', 'D123', 'P88937003', 6),
(2, 0, NULL, '2016-03-11 00:00:00', 'dsf d fe4wfewgfewfe wf', 'h207', 'Report_p123_6_4142554488.jpg', 'd123', 'p123', 6),
(17, 0, NULL, '2016-03-11 00:00:00', 'fdsf dsf dsfds', 'h207', 'Report_p123_6_5074296000.jpg', 'd123', 'p123', 6),
(18, 0, NULL, '2016-03-11 00:00:00', 'fdsf dsf dsfds', 'h207', 'Report_p123_6_5074296000.jpg', 'd123', 'p123', 6),
(19, 0, NULL, '2016-03-11 00:00:00', 'fdsf dsf dsfds', 'h207', 'Report_p123_6_7372350373.jpg', 'd123', 'p123', 6),
(20, 0, NULL, '2015-03-11 00:00:00', 'fdsf dsf dsfds', 'h207', 'Report_p123_6_5074296000.jpg', 'd123', 'p123', 7),
(21, 0, NULL, '2015-03-11 00:00:00', 'fdsf dsf dsfds', 'h201', 'Report_p123_6_5129647214.jpg', 'd123', 'p123', 8),
(22, 0, NULL, '2015-03-11 00:00:00', 'fdsf dsf dsfds', 'h207', 'Report_p123_6_5074296000.jpg', 'd123', 'p123', 9),
(23, 0, NULL, '2014-03-11 00:00:00', 'fdsf dsf dsfds', 'h201', 'Report_p123_6_7372350373.jpg', 'd123', 'p123', 10),
(24, 0, NULL, '2014-03-11 00:00:00', 'fdsf dsf dsfds', 'h207', 'Report_p123_6_5129647214.jpg', 'd123', 'p123', 11),
(25, 0, NULL, '2016-03-11 00:00:00', 'fdsf dsf dsfds', 'h201', 'Report_p123_6_5074296000.jpg', 'd123', 'p123', 12),
(26, 0, NULL, '2014-03-11 00:00:00', 'fdsf dsf dsfds', 'h207', 'Report_p123_6_7372350373.jpg', 'd123', 'p123', 13),
(27, 0, NULL, '2016-03-11 00:00:00', 'fdsf dsf dsfds', 'h201', 'Report_p123_6_5129647214.jpg', 'd123', 'p123', 14),
(28, 0, NULL, '2013-03-11 00:00:00', 'fdsf dsf dsfds', 'h207', 'Report_p123_6_5074296000.jpg', 'd123', 'p123', 15),
(29, 0, NULL, '2016-03-11 00:00:00', 'fdsf dsf dsfds', 'h201', 'Report_p123_6_5129647214.jpg', 'd123', 'p123', 15),
(30, 0, NULL, '2013-03-11 00:00:00', 'fdsf dsf dsfds', 'h201', 'Report_p123_6_5074296000.jpg', 'd123', 'p123', 17),
(31, 0, NULL, '2016-03-11 00:00:00', 'fdsf dsf dsfds', 'h207', 'Report_p123_6_7372350373.jpg', 'd123', 'p123', 26),
(32, 0, NULL, '2015-03-11 00:00:00', 'fdsf dsf dsfds', 'h207', 'Report_p123_6_5074296000.jpg', 'd123', 'p123', 27),
(33, 0, NULL, '2015-03-11 00:00:00', 'fdsf dsf dsfds', 'h201', 'Report_p123_6_5129647214.jpg', 'd123', 'p123', 28),
(34, 0, NULL, '2015-03-11 00:00:00', 'fdsf dsf dsfds', 'h207', 'Report_p123_6_5074296000.jpg', 'd123', 'p123', 29),
(35, 0, NULL, '2014-03-11 00:00:00', 'fdsf dsf dsfds', 'h201', 'Report_p123_6_7372350373.jpg', 'd123', 'p123', 30),
(36, 0, NULL, '2014-03-11 00:00:00', 'fdsf dsf dsfds', 'h207', 'Report_p123_6_5129647214.jpg', 'd123', 'p123', 31),
(37, 0, NULL, '2016-03-11 00:00:00', 'fdsf dsf dsfds', 'h201', 'Report_p123_6_5074296000.jpg', 'd123', 'p123', 32),
(38, 0, NULL, '2014-03-11 00:00:00', 'fdsf dsf dsfds', 'h207', 'Report_p123_6_7372350373.jpg', 'd123', 'p123', 33),
(39, 0, NULL, '2016-03-11 00:00:00', 'fdsf dsf dsfds', 'h201', 'Report_p123_6_5129647214.jpg', 'd123', 'p123', 34),
(40, 0, NULL, '2013-03-11 00:00:00', 'fdsf dsf dsfds', 'h207', 'Report_p123_6_5074296000.jpg', 'd123', 'p123', 35),
(41, 0, NULL, '2016-03-11 00:00:00', 'fdsf dsf dsfds', 'h201', 'Report_p123_6_5129647214.jpg', 'd123', 'p123', 35),
(42, 0, NULL, '2013-03-11 00:00:00', 'fdsf dsf dsfds', 'h201', 'Report_p123_6_5074296000.jpg', 'd123', 'p123', 37),
(43, 0, NULL, '2016-03-11 00:00:00', 'fdsf dsf dsfds', 'h207', 'Report_p123_6_5074296000.jpg', 'd123', 'p123', 6),
(44, 0, NULL, '2016-03-11 00:00:00', 'fdsf dsf dsfds', 'h202', 'Report_p123_6_7372350373.jpg', 'd123', 'p123', 6),
(45, 0, NULL, '2015-03-11 00:00:00', 'fdsf dsf dsfds', 'h202', 'Report_p123_6_5074296000.jpg', 'd123', 'p123', 7),
(46, 0, NULL, '2015-03-11 00:00:00', 'fdsf dsf dsfds', 'h201', 'Report_p123_6_5129647214.jpg', 'd123', 'p123', 8),
(47, 0, NULL, '2015-03-11 00:00:00', 'fdsf dsf dsfds', 'h207', 'Report_p123_6_5074296000.jpg', 'd123', 'p123', 9),
(48, 0, NULL, '2014-03-11 00:00:00', 'fdsf dsf dsfds', 'h202', 'Report_p123_6_7372350373.jpg', 'd123', 'p123', 10),
(49, 0, NULL, '2014-03-11 00:00:00', 'fdsf dsf dsfds', 'h207', 'Report_p123_6_5129647214.jpg', 'd123', 'p123', 11),
(50, 0, NULL, '2016-03-11 00:00:00', 'fdsf dsf dsfds', 'h202', 'Report_p123_6_5074296000.jpg', 'd123', 'p123', 12),
(51, 0, NULL, '2014-03-11 00:00:00', 'fdsf dsf dsfds', 'h207', 'Report_p123_6_7372350373.jpg', 'd123', 'p123', 13),
(52, 0, NULL, '2016-03-11 00:00:00', 'fdsf dsf dsfds', 'h202', 'Report_p123_6_5129647214.jpg', 'd123', 'p123', 14),
(53, 0, NULL, '2013-03-11 00:00:00', 'fdsf dsf dsfds', 'h207', 'Report_p123_6_5074296000.jpg', 'd123', 'p123', 15),
(54, 0, NULL, '2016-03-11 00:00:00', 'fdsf dsf dsfds', 'h202', 'Report_p123_6_5129647214.jpg', 'd123', 'p123', 15),
(55, 0, NULL, '2013-03-11 00:00:00', 'fdsf dsf dsfds', 'h201', 'Report_p123_6_5074296000.jpg', 'd123', 'p123', 17),
(56, 0, NULL, '2016-03-11 00:00:00', 'fdsf dsf dsfds', 'h202', 'Report_p123_6_7372350373.jpg', 'd123', 'p123', 26),
(57, 0, NULL, '2015-03-11 00:00:00', 'fdsf dsf dsfds', 'h207', 'Report_p123_6_5074296000.jpg', 'd123', 'p123', 27),
(58, 0, NULL, '2015-03-11 00:00:00', 'fdsf dsf dsfds', 'h202', 'Report_p123_6_5129647214.jpg', 'd123', 'p123', 28),
(59, 0, NULL, '2015-03-11 00:00:00', 'fdsf dsf dsfds', 'h207', 'Report_p123_6_5074296000.jpg', 'd123', 'p123', 29),
(60, 0, NULL, '2014-03-11 00:00:00', 'fdsf dsf dsfds', 'h202', 'Report_p123_6_7372350373.jpg', 'd123', 'p123', 30),
(61, 0, NULL, '2014-03-11 00:00:00', 'fdsf dsf dsfds', 'h207', 'Report_p123_6_5129647214.jpg', 'd123', 'p123', 31),
(62, 0, NULL, '2016-03-11 00:00:00', 'fdsf dsf dsfds', 'h201', 'Report_p123_6_5074296000.jpg', 'd123', 'p123', 32),
(63, 0, NULL, '2014-03-11 00:00:00', 'fdsf dsf dsfds', 'h202', 'Report_p123_6_7372350373.jpg', 'd123', 'p123', 33),
(64, 0, NULL, '2016-03-11 00:00:00', 'fdsf dsf dsfds', 'h201', 'Report_p123_6_5129647214.jpg', 'd123', 'p123', 34),
(65, 0, NULL, '2013-03-11 00:00:00', 'fdsf dsf dsfds', 'h205', 'Report_p123_6_5074296000.jpg', 'd123', 'p123', 35),
(66, 0, NULL, '2016-03-11 00:00:00', 'fdsf dsf dsfds', 'h202', 'Report_p123_6_5129647214.jpg', 'd123', 'p123', 35),
(67, 0, NULL, '2013-03-11 00:00:00', 'fdsf dsf dsfds', 'h201', 'Report_p123_6_5074296000.jpg', 'd123', 'p123', 37),
(68, 0, NULL, '2016-03-11 00:00:00', 'fdsf dsf dsfds', 'h207', 'Report_p123_6_7372350373.jpg', 'd123', 'p123', 6),
(69, 0, NULL, '2015-03-11 00:00:00', 'fdsf dsf dsfds', 'h205', 'Report_p123_6_5074296000.jpg', 'd123', 'p123', 7),
(70, 0, NULL, '2015-03-11 00:00:00', 'fdsf dsf dsfds', 'h201', 'Report_p123_6_5129647214.jpg', 'd123', 'p123', 8),
(71, 0, NULL, '2015-03-11 00:00:00', 'fdsf dsf dsfds', 'h207', 'Report_p123_6_5074296000.jpg', 'd123', 'p123', 9),
(72, 0, NULL, '2014-03-11 00:00:00', 'fdsf dsf dsfds', 'h202', 'Report_p123_6_7372350373.jpg', 'd123', 'p123', 40),
(73, 0, NULL, '2014-03-11 00:00:00', 'fdsf dsf dsfds', 'h207', 'Report_p123_6_5129647214.jpg', 'd123', 'p123', 41),
(74, 0, NULL, '2016-03-11 00:00:00', 'fdsf dsf dsfds', 'h201', 'Report_p123_6_5074296000.jpg', 'd123', 'p123', 42),
(75, 0, NULL, '2014-03-11 00:00:00', 'fdsf dsf dsfds', 'h205', 'Report_p123_6_7372350373.jpg', 'd123', 'p123', 43),
(76, 0, NULL, '2016-03-11 00:00:00', 'fdsf dsf dsfds', 'h202', 'Report_p123_6_5129647214.jpg', 'd123', 'p123', 44),
(77, 0, NULL, '2013-03-11 00:00:00', 'fdsf dsf dsfds', 'h207', 'Report_p123_6_5074296000.jpg', 'd123', 'p123', 45),
(78, 0, NULL, '2016-03-11 00:00:00', 'fdsf dsf dsfds', 'h201', 'Report_p123_6_5129647214.jpg', 'd123', 'p123', 45),
(79, 0, NULL, '2013-03-11 00:00:00', 'fdsf dsf dsfds', 'h201', 'Report_p123_6_5074296000.jpg', 'd123', 'p123', 47),
(80, 0, NULL, '2016-03-11 00:00:00', 'fdsf dsf dsfds', 'h202', 'Report_p123_6_7372350373.jpg', 'd123', 'p123', 46),
(81, 0, NULL, '2015-03-11 00:00:00', 'fdsf dsf dsfds', 'h207', 'Report_p123_6_5074296000.jpg', 'd123', 'p123', 47),
(82, 0, NULL, '2015-03-11 00:00:00', 'fdsf dsf dsfds', 'h201', 'Report_p123_6_5129647214.jpg', 'd123', 'p123', 48),
(83, 0, NULL, '2015-03-11 00:00:00', 'fdsf dsf dsfds', 'h205', 'Report_p123_6_5074296000.jpg', 'd123', 'p123', 49),
(84, 0, NULL, '2014-03-11 00:00:00', 'fdsf dsf dsfds', 'h202', 'Report_p123_6_7372350373.jpg', 'd123', 'p123', 50),
(85, 0, NULL, '2014-03-11 00:00:00', 'fdsf dsf dsfds', 'h207', 'Report_p123_6_5129647214.jpg', 'd123', 'p123', 51),
(86, 0, NULL, '2016-03-11 00:00:00', 'fdsf dsf dsfds', 'h201', 'Report_p123_6_5074296000.jpg', 'd123', 'p123', 52),
(87, 0, NULL, '2014-03-11 00:00:00', 'fdsf dsf dsfds', 'h205', 'Report_p123_6_7372350373.jpg', 'd123', 'p123', 53),
(88, 0, NULL, '2016-03-11 00:00:00', 'fdsf dsf dsfds', 'h201', 'Report_p123_6_5129647214.jpg', 'd123', 'p123', 54),
(89, 0, NULL, '2013-03-11 00:00:00', 'fdsf dsf dsfds', 'h202', 'Report_p123_6_5074296000.jpg', 'd123', 'p123', 55),
(90, 0, NULL, '2016-03-11 00:00:00', 'fdsf dsf dsfds', 'h205', 'Report_p123_6_5129647214.jpg', 'd123', 'p123', 55),
(91, 0, NULL, '2013-03-11 00:00:00', 'fdsf dsf dsfds', 'h205', 'Report_p123_6_5074296000.jpg', 'd123', 'p123', 57);

-- --------------------------------------------------------

--
-- Table structure for table `pending_reports`
--

CREATE TABLE IF NOT EXISTS `pending_reports` (
  `pendingId` int(11) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `description` varchar(250) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=694 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pending_reports`
--

INSERT INTO `pending_reports` (`pendingId`, `subject`, `description`, `date`) VALUES
(622, 'Report on Kandy district', 'It should generated within 5 days', '2016-03-11 13:27:00'),
(623, 'Report on Kandy district', 'It should generated within 5 days', '2016-03-11 13:30:00'),
(624, 'Report on Dengu', 'It should generated before 7th', '2016-03-11 13:32:00'),
(625, 'Report on Kandy district', 'It should generated within 5 days', '2016-03-11 13:33:00'),
(626, 'Report on Kandy district', 'It should generated within 5 days', '2016-03-11 13:36:00'),
(627, 'Report on Kandy district', 'It should generated within 5 days', '2016-03-11 13:39:00'),
(628, 'Report on Dengu', 'It should generated before 7th', '2016-03-11 13:39:00'),
(629, 'Report on Kandy district', 'It should generated within 5 days', '2016-03-11 13:42:00'),
(630, 'Report on Kandy district', 'It should generated within 5 days', '2016-03-11 13:45:00'),
(631, 'Report on Dengu', 'It should generated before 7th', '2016-03-11 13:46:00'),
(632, 'Report on Kandy district', 'It should generated within 5 days', '2016-03-11 13:48:00'),
(633, 'Report on Kandy district', 'It should generated within 5 days', '2016-03-11 13:51:00'),
(634, 'Report on Dengu', 'It should generated before 7th', '2016-03-11 13:53:00'),
(635, 'Report on Kandy district', 'It should generated within 5 days', '2016-03-11 13:54:00'),
(636, 'Report on Kandy district', 'It should generated within 5 days', '2016-03-11 13:57:00'),
(637, 'Report on Kandy district', 'It should generated within 5 days', '2016-03-11 14:00:00'),
(638, 'Report on Dengu', 'It should generated before 7th', '2016-03-11 14:00:00'),
(639, 'Report on Kandy district', 'It should generated within 5 days', '2016-03-11 14:03:00'),
(640, 'Report on Kandy district', 'It should generated within 5 days', '2016-03-11 14:06:00'),
(641, 'Report on Dengu', 'It should generated before 7th', '2016-03-11 14:07:00'),
(642, 'Report on Kandy district', 'It should generated within 5 days', '2016-03-11 14:09:00'),
(643, 'Report on Kandy district', 'It should generated within 5 days', '2016-03-11 14:12:00'),
(644, 'Report on Dengu', 'It should generated before 7th', '2016-03-11 14:14:00'),
(645, 'Report on Kandy district', 'It should generated within 5 days', '2016-03-11 14:15:00'),
(646, 'Report on Kandy district', 'It should generated within 5 days', '2016-03-11 14:18:00'),
(647, 'Report on Kandy district', 'It should generated within 5 days', '2016-03-11 14:21:00'),
(648, 'Report on Dengu', 'It should generated before 7th', '2016-03-11 14:21:00'),
(649, 'Report on Kandy district', 'It should generated within 5 days', '2016-03-11 14:24:00'),
(650, 'Report on Kandy district', 'It should generated within 5 days', '2016-03-11 14:27:00'),
(651, 'Report on Dengu', 'It should generated before 7th', '2016-03-11 14:28:00'),
(652, 'Report on Kandy district', 'It should generated within 5 days', '2016-03-11 14:30:00'),
(653, 'Report on Kandy district', 'It should generated within 5 days', '2016-03-11 14:33:00'),
(654, 'Report on Dengu', 'It should generated before 7th', '2016-03-11 14:35:00'),
(655, 'Report on Kandy district', 'It should generated within 5 days', '2016-03-11 14:36:00'),
(656, 'Report on Kandy district', 'It should generated within 5 days', '2016-03-11 14:39:00'),
(657, 'Report on Kandy district', 'It should generated within 5 days', '2016-03-11 14:42:00'),
(658, 'Report on Dengu', 'It should generated before 7th', '2016-03-11 14:42:01'),
(659, 'Report on Kandy district', 'It should generated within 5 days', '2016-03-11 14:45:00'),
(660, 'Report on Kandy district', 'It should generated within 5 days', '2016-03-11 14:48:00'),
(661, 'Report on Dengu', 'It should generated before 7th', '2016-03-11 14:49:00'),
(662, 'Report on Kandy district', 'It should generated within 5 days', '2016-03-11 14:51:00'),
(663, 'Report on Kandy district', 'It should generated within 5 days', '2016-03-11 14:54:00'),
(664, 'Report on Dengu', 'It should generated before 7th', '2016-03-11 14:56:00'),
(665, 'Report on Kandy district', 'It should generated within 5 days', '2016-03-11 14:57:00'),
(666, 'Report on Kandy district', 'It should generated within 5 days', '2016-03-11 15:00:00'),
(667, 'Report on Dengu', 'It should generated before 7th', '2016-03-11 15:03:00'),
(668, 'Report on Kandy district', 'It should generated within 5 days', '2016-03-11 15:03:00'),
(669, 'Report on Kandy district', 'It should generated within 5 days', '2016-03-11 15:06:00'),
(670, 'Report on Kandy district', 'It should generated within 5 days', '2016-03-11 15:09:00'),
(671, 'Report on Dengu', 'It should generated before 7th', '2016-03-11 15:10:01'),
(672, 'Report on Kandy district', 'It should generated within 5 days', '2016-03-11 15:12:01'),
(673, 'Report on Kandy district', 'It should generated within 5 days', '2016-03-11 15:15:00'),
(674, 'Report on Dengu', 'It should generated before 7th', '2016-03-11 15:17:00'),
(675, 'Report on Kandy district', 'It should generated within 5 days', '2016-03-11 15:18:00'),
(676, 'Report on Kandy district', 'It should generated within 5 days', '2016-03-11 15:21:00'),
(677, 'Report on Dengu', 'It should generated before 7th', '2016-03-11 15:24:00'),
(678, 'Report on Kandy district', 'It should generated within 5 days', '2016-03-11 15:24:00'),
(679, 'Report on Kandy district', 'It should generated within 5 days', '2016-03-11 15:27:00'),
(680, 'Report on Kandy district', 'It should generated within 5 days', '2016-03-11 15:30:00'),
(681, 'Report on Dengu', 'It should generated before 7th', '2016-03-11 15:31:00'),
(682, 'Report on Kandy district', 'It should generated within 5 days', '2016-03-11 15:33:00'),
(683, 'Report on Kandy district', 'It should generated within 5 days', '2016-03-11 15:36:00'),
(684, 'Report on Dengu', 'It should generated before 7th', '2016-03-11 15:38:00'),
(685, 'Report on Kandy district', 'It should generated within 5 days', '2016-03-11 15:39:00'),
(686, 'Report on Kandy district', 'It should generated within 5 days', '2016-03-11 15:42:00'),
(687, 'Report on Dengu', 'It should generated before 7th', '2016-03-11 15:45:00'),
(688, 'Report on Kandy district', 'It should generated within 5 days', '2016-03-11 15:45:00'),
(689, 'Report on Kandy district', 'It should generated within 5 days', '2016-03-11 15:48:00'),
(690, 'Report on Kandy district', 'It should generated within 5 days', '2016-03-11 15:51:00'),
(691, 'Report on Dengu', 'It should generated before 7th', '2016-03-11 15:52:00'),
(692, 'Report on Kandy district', 'It should generated within 5 days', '2016-03-11 15:54:00'),
(693, 'Report on Kandy district', 'It should generated within 5 days', '2016-03-11 15:57:00');

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE IF NOT EXISTS `prescription` (
  `presId` int(11) NOT NULL,
  `pid` char(10) NOT NULL,
  `did` char(10) NOT NULL,
  `date` datetime NOT NULL,
  `diagnosis` varchar(250) NOT NULL,
  `issueId` char(4) NOT NULL,
  `diagnosisNo` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=322 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prescription`
--

INSERT INTO `prescription` (`presId`, `pid`, `did`, `date`, `diagnosis`, `issueId`, `diagnosisNo`) VALUES
(6, 'P88937003', 'D80766507', '2016-03-01 00:10:36', 'qqqqqqqqqq', 'I102', 11),
(7, 'p123', 'd123', '2016-03-11 17:56:42', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(8, 'p123', 'd123', '2016-03-11 18:26:34', 'Being overweight or obese increases your chances of dying from hypertension, type 2 diabetes, coronary heart disease, stroke, gallbladder disease, osteoarthritis, sleep apnea, respiratory problems, dyslipidemia and endometrial, breas', 'I124', 3),
(9, 'p123', 'd123', '2016-03-11 18:27:17', 'Being overweight or obese increases your chances of dying from hypertension, type 2 diabetes, coronary heart disease, stroke, gallbladder disease, osteoarthritis, sleep apnea, respiratory problems, dyslipidemia and endometrial, breas', 'I102', 4),
(10, 'p123', 'd123', '2016-01-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 2),
(11, 'p123', 'd123', '2015-01-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 2),
(12, 'p123', 'd123', '2014-01-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 3),
(13, 'p123', 'd123', '2015-01-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 2),
(14, 'p123', 'd123', '2015-01-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 3),
(15, 'p123', 'd123', '2014-01-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 3),
(16, 'p123', 'd123', '2015-01-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(17, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(18, 'p123', 'd123', '2015-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(19, 'p123', 'd123', '2015-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(20, 'p123', 'd123', '2014-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 4),
(21, 'p123', 'd123', '2015-01-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(22, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(23, 'p123', 'd123', '2013-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(24, 'p123', 'd123', '2014-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(25, 'p123', 'd123', '2015-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 4),
(26, 'p123', 'd123', '2015-01-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(27, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(28, 'p123', 'd123', '2015-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(29, 'p123', 'd123', '2015-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(30, 'p123', 'd123', '2014-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(31, 'p123', 'd123', '2015-01-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(32, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 2),
(33, 'p123', 'd123', '2013-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(34, 'p123', 'd123', '2014-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(35, 'p123', 'd123', '2015-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 4),
(36, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(37, 'p123', 'd123', '2015-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(38, 'p123', 'd123', '2015-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(39, 'p123', 'd123', '2014-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(40, 'p123', 'd123', '2015-01-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(41, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 2),
(42, 'p123', 'd123', '2013-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(43, 'p123', 'd123', '2014-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(44, 'p123', 'd123', '2015-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 4),
(45, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(46, 'p123', 'd123', '2015-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(47, 'p123', 'd123', '2015-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(48, 'p123', 'd123', '2014-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(49, 'p123', 'd123', '2015-01-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(50, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 2),
(51, 'p123', 'd123', '2013-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(52, 'p123', 'd123', '2014-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(53, 'p123', 'd123', '2015-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 4),
(54, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(55, 'p123', 'd123', '2015-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(56, 'p123', 'd123', '2015-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(57, 'p123', 'd123', '2014-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(58, 'p123', 'd123', '2015-01-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(59, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 2),
(60, 'p123', 'd123', '2013-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(61, 'p123', 'd123', '2014-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(62, 'p123', 'd123', '2015-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 4),
(63, 'p123', 'd123', '2015-01-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(64, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(65, 'p123', 'd123', '2015-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(66, 'p123', 'd123', '2015-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(67, 'p123', 'd123', '2014-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(68, 'p123', 'd123', '2015-01-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(69, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 2),
(70, 'p123', 'd123', '2013-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(71, 'p123', 'd123', '2014-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(72, 'p123', 'd123', '2015-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 4),
(73, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(74, 'p123', 'd123', '2015-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(75, 'p123', 'd123', '2015-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(76, 'p123', 'd123', '2014-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(77, 'p123', 'd123', '2015-01-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(78, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 2),
(79, 'p123', 'd123', '2013-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(80, 'p123', 'd123', '2014-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(81, 'p123', 'd123', '2015-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 4),
(82, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(83, 'p123', 'd123', '2015-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(84, 'p123', 'd123', '2015-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(85, 'p123', 'd123', '2014-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(86, 'p123', 'd123', '2015-01-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(87, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 2),
(88, 'p123', 'd123', '2013-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(89, 'p123', 'd123', '2014-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(90, 'p123', 'd123', '2015-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 4),
(91, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(92, 'p123', 'd123', '2015-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(93, 'p123', 'd123', '2015-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(94, 'p123', 'd123', '2014-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(95, 'p123', 'd123', '2015-01-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(96, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 2),
(97, 'p123', 'd123', '2013-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(98, 'p123', 'd123', '2014-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(99, 'p123', 'd123', '2015-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 4),
(100, 'p123', 'd123', '2015-01-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(101, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(102, 'p123', 'd123', '2015-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(103, 'p123', 'd123', '2015-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(104, 'p123', 'd123', '2014-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(105, 'p123', 'd123', '2015-01-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(106, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 2),
(107, 'p123', 'd123', '2013-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(108, 'p123', 'd123', '2014-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(109, 'p123', 'd123', '2015-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 4),
(110, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(111, 'p123', 'd123', '2015-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(112, 'p123', 'd123', '2015-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(113, 'p123', 'd123', '2014-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(114, 'p123', 'd123', '2015-01-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(115, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 2),
(116, 'p123', 'd123', '2013-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(117, 'p123', 'd123', '2014-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(118, 'p123', 'd123', '2015-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 4),
(119, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(120, 'p123', 'd123', '2015-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(121, 'p123', 'd123', '2015-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(122, 'p123', 'd123', '2014-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(123, 'p123', 'd123', '2015-01-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(124, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 2),
(125, 'p123', 'd123', '2013-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(126, 'p123', 'd123', '2014-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(127, 'p123', 'd123', '2015-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 4),
(128, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(129, 'p123', 'd123', '2015-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(130, 'p123', 'd123', '2015-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(131, 'p123', 'd123', '2014-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(132, 'p123', 'd123', '2015-01-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(133, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 2),
(134, 'p123', 'd123', '2013-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(135, 'p123', 'd123', '2014-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(136, 'p123', 'd123', '2015-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 4),
(137, 'p123', 'd123', '2015-01-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(138, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(139, 'p123', 'd123', '2015-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(140, 'p123', 'd123', '2015-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(141, 'p123', 'd123', '2014-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(142, 'p123', 'd123', '2015-01-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(143, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 2),
(144, 'p123', 'd123', '2013-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(145, 'p123', 'd123', '2014-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(146, 'p123', 'd123', '2015-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 4),
(147, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(148, 'p123', 'd123', '2015-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(149, 'p123', 'd123', '2015-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(150, 'p123', 'd123', '2014-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(151, 'p123', 'd123', '2015-01-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(152, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 2),
(153, 'p123', 'd123', '2013-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(154, 'p123', 'd123', '2014-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(155, 'p123', 'd123', '2015-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 4),
(156, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(157, 'p123', 'd123', '2015-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(158, 'p123', 'd123', '2015-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(159, 'p123', 'd123', '2014-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(160, 'p123', 'd123', '2015-01-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(161, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 2),
(162, 'p123', 'd123', '2013-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(163, 'p123', 'd123', '2014-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(164, 'p123', 'd123', '2015-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 4),
(165, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(166, 'p123', 'd123', '2015-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(167, 'p123', 'd123', '2015-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3);
INSERT INTO `prescription` (`presId`, `pid`, `did`, `date`, `diagnosis`, `issueId`, `diagnosisNo`) VALUES
(168, 'p123', 'd123', '2014-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(169, 'p123', 'd123', '2015-01-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(170, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 2),
(171, 'p123', 'd123', '2013-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(172, 'p123', 'd123', '2014-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(173, 'p123', 'd123', '2015-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 4),
(174, 'p123', 'd123', '2015-01-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(175, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(176, 'p123', 'd123', '2015-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(177, 'p123', 'd123', '2015-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(178, 'p123', 'd123', '2014-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(179, 'p123', 'd123', '2015-01-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(180, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 2),
(181, 'p123', 'd123', '2013-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(182, 'p123', 'd123', '2014-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(183, 'p123', 'd123', '2015-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 4),
(184, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(185, 'p123', 'd123', '2015-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(186, 'p123', 'd123', '2015-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(187, 'p123', 'd123', '2014-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(188, 'p123', 'd123', '2015-01-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(189, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 2),
(190, 'p123', 'd123', '2013-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(191, 'p123', 'd123', '2014-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(192, 'p123', 'd123', '2015-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 4),
(193, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(194, 'p123', 'd123', '2015-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(195, 'p123', 'd123', '2015-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(196, 'p123', 'd123', '2014-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(197, 'p123', 'd123', '2015-01-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(198, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 2),
(199, 'p123', 'd123', '2013-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(200, 'p123', 'd123', '2014-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(201, 'p123', 'd123', '2015-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 4),
(202, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(203, 'p123', 'd123', '2015-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(204, 'p123', 'd123', '2015-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(205, 'p123', 'd123', '2014-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(206, 'p123', 'd123', '2015-01-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(207, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 2),
(208, 'p123', 'd123', '2013-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(209, 'p123', 'd123', '2014-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(210, 'p123', 'd123', '2015-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 4),
(211, 'p123', 'd123', '2015-01-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(212, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(213, 'p123', 'd123', '2015-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(214, 'p123', 'd123', '2015-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(215, 'p123', 'd123', '2014-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(216, 'p123', 'd123', '2015-01-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(217, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 2),
(218, 'p123', 'd123', '2013-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(219, 'p123', 'd123', '2014-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(220, 'p123', 'd123', '2015-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 4),
(221, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(222, 'p123', 'd123', '2015-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(223, 'p123', 'd123', '2015-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(224, 'p123', 'd123', '2014-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(225, 'p123', 'd123', '2015-01-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(226, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 2),
(227, 'p123', 'd123', '2013-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(228, 'p123', 'd123', '2014-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(229, 'p123', 'd123', '2015-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 4),
(230, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(231, 'p123', 'd123', '2015-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(232, 'p123', 'd123', '2015-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(233, 'p123', 'd123', '2014-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(234, 'p123', 'd123', '2015-01-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(235, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 2),
(236, 'p123', 'd123', '2013-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(237, 'p123', 'd123', '2014-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(238, 'p123', 'd123', '2015-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 4),
(239, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(240, 'p123', 'd123', '2015-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(241, 'p123', 'd123', '2015-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(242, 'p123', 'd123', '2014-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(243, 'p123', 'd123', '2015-01-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(244, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 2),
(245, 'p123', 'd123', '2013-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(246, 'p123', 'd123', '2014-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(247, 'p123', 'd123', '2015-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 4),
(248, 'p123', 'd123', '2015-01-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(249, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(250, 'p123', 'd123', '2015-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(251, 'p123', 'd123', '2015-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(252, 'p123', 'd123', '2014-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(253, 'p123', 'd123', '2015-01-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(254, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 2),
(255, 'p123', 'd123', '2013-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(256, 'p123', 'd123', '2014-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(257, 'p123', 'd123', '2015-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 4),
(258, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(259, 'p123', 'd123', '2015-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(260, 'p123', 'd123', '2015-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(261, 'p123', 'd123', '2014-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(262, 'p123', 'd123', '2015-01-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(263, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 2),
(264, 'p123', 'd123', '2013-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(265, 'p123', 'd123', '2014-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(266, 'p123', 'd123', '2015-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 4),
(267, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(268, 'p123', 'd123', '2015-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(269, 'p123', 'd123', '2015-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(270, 'p123', 'd123', '2014-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(271, 'p123', 'd123', '2015-01-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(272, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 2),
(273, 'p123', 'd123', '2013-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(274, 'p123', 'd123', '2014-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(275, 'p123', 'd123', '2015-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 4),
(276, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(277, 'p123', 'd123', '2015-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(278, 'p123', 'd123', '2015-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(279, 'p123', 'd123', '2014-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(280, 'p123', 'd123', '2015-01-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(281, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 2),
(282, 'p123', 'd123', '2013-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(283, 'p123', 'd123', '2014-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(284, 'p123', 'd123', '2015-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 4),
(285, 'p123', 'd123', '2015-01-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(286, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(287, 'p123', 'd123', '2015-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(288, 'p123', 'd123', '2015-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(289, 'p123', 'd123', '2014-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(290, 'p123', 'd123', '2015-01-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(291, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 2),
(292, 'p123', 'd123', '2013-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(293, 'p123', 'd123', '2014-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(294, 'p123', 'd123', '2015-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 4),
(295, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(296, 'p123', 'd123', '2015-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(297, 'p123', 'd123', '2015-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(298, 'p123', 'd123', '2014-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(299, 'p123', 'd123', '2015-01-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(300, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 2),
(301, 'p123', 'd123', '2013-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(302, 'p123', 'd123', '2014-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(303, 'p123', 'd123', '2015-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 4),
(304, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(305, 'p123', 'd123', '2015-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(306, 'p123', 'd123', '2015-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(307, 'p123', 'd123', '2014-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(308, 'p123', 'd123', '2015-01-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(309, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 2),
(310, 'p123', 'd123', '2013-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(311, 'p123', 'd123', '2014-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(312, 'p123', 'd123', '2015-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 4),
(313, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(314, 'p123', 'd123', '2015-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(315, 'p123', 'd123', '2015-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(316, 'p123', 'd123', '2014-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(317, 'p123', 'd123', '2015-01-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 2),
(318, 'p123', 'd123', '2014-03-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 2),
(319, 'p123', 'd123', '2013-07-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I100', 4),
(320, 'p123', 'd123', '2014-08-06 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 3),
(321, 'p123', 'd123', '2015-08-01 00:00:00', 'Diagnostic Tests for Diabetes. Diabetes may be diagnosed based on A1C criteria or plasma glucose criteria, either the fasting plasma glucose (FPG) or the 2-h plasma glucose (2-h PG) value after a 75-g oral glucose tolerance test (OGTT) (1,2) (Table 2', 'I102', 4);

-- --------------------------------------------------------

--
-- Table structure for table `prescription_temp`
--

CREATE TABLE IF NOT EXISTS `prescription_temp` (
  `presId` int(11) NOT NULL,
  `pid` char(10) NOT NULL,
  `did` char(10) NOT NULL,
  `mid` char(5) NOT NULL,
  `dosage` varchar(30) NOT NULL,
  `frequencyId` char(4) NOT NULL,
  `date` datetime NOT NULL,
  `diagnosis` varchar(250) NOT NULL,
  `duration` varchar(10) NOT NULL,
  `issueId` char(4) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rosters`
--

CREATE TABLE IF NOT EXISTS `rosters` (
  `rosterId` int(11) NOT NULL,
  `empId` char(4) NOT NULL,
  `date` date NOT NULL,
  `description` varchar(50) NOT NULL,
  `department` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rosters`
--

INSERT INTO `rosters` (`rosterId`, `empId`, `date`, `description`, `department`) VALUES
(1, 'E123', '2016-03-10', 'fgfdhdfh', 'gfhgfhg'),
(2, 'E123', '2016-03-10', 'cbfbfb', 'fdbdf');

-- --------------------------------------------------------

--
-- Table structure for table `specialization`
--

CREATE TABLE IF NOT EXISTS `specialization` (
  `spId` char(4) NOT NULL,
  `spName` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL
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
  `imageType` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `statistician`
--

INSERT INTO `statistician` (`sId`, `name`, `add`, `nic`, `gender`, `telNo`, `regDate`, `email`, `sPass`, `imageType`) VALUES
('S123', 'Kamal Surendra', '45/7, Kandt rd, Kandy', '', '', '0812342345', '2016-02-15', 'kamals@gmail.com', '202cb962ac59075b964b07152d234b70', '');

-- --------------------------------------------------------

--
-- Table structure for table `statistics`
--

CREATE TABLE IF NOT EXISTS `statistics` (
  `statisticsId` varchar(20) NOT NULL,
  `uploader` varchar(10) NOT NULL,
  `Title` varchar(250) NOT NULL,
  `description` varchar(250) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `statistics`
--

INSERT INTO `statistics` (`statisticsId`, `uploader`, `Title`, `description`, `date`) VALUES
('S165252016-03-10', 's123', 'fdgdf', 'gdfgd', '2016-03-10 13:22:05'),
('S447822016-03-10', 's123', 'tutyuytu', 'ytutyutyt', '2016-03-10 18:43:57'),
('S470952016-03-10', 's123', 'ury', 'utyuti', '2016-03-10 00:00:00'),
('S569852016-03-10', 's123', 'ghg fhg fh', 'f hjgf hgf ', '2016-03-10 00:00:00'),
('S873872016-03-10', 's123', 'jhgj', 'hgjghjgh', '2016-03-10 08:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `temp_doctor`
--

CREATE TABLE IF NOT EXISTS `temp_doctor` (
  `dRequestId` int(10) NOT NULL,
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
  `slmcRegNo` int(4) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `temp_doctor`
--

INSERT INTO `temp_doctor` (`dRequestId`, `name`, `add`, `gender`, `nic`, `dob`, `spId`, `district`, `hId`, `email`, `telNo`, `MOIC`, `maritalStatus`, `nationality`, `slmcRegNo`) VALUES
(3, 'Satara', '25/5 , Colombo', 'm', '8866559924', '1988-08-21', 'sp05', 'Colombo', 'h006', 'fhgfjhfjhfh@yahoo.co', '0715562398', 0, 'S', 'S', 1784),
(4, 'Ann', '25/6, Colombo', 'm', '8866559924', '1988-08-21', 'sp06', 'Colombo', 'h005', 'fhgfjhfjhfh@yahoo.co', '0715562398', 0, 'm', 'S', 1734),
(5, 'Annon', '25/6 , Ampara', 'm', '8866559924', '1988-08-21', 'sp10', 'Ampara', 'h006', 'fhgfjhfjhfh@yahoo.co', '0715562398', 0, 'm', 'S', 1334),
(6, 'Annon', '25/6, Kandy', 'm', '8866559924', '1988-08-21', 'sp11', 'Ampara', 'h007', 'fhgfjhfjhfh@yahoo.co', '0715562398', 0, 'm', 'S', 9752),
(7, 'Nimal', '25/6 , Ampara', 'm', '8766559924', '1987-08-08', 'sp06', 'Ampara', 'h008', 'fhgfjhfjhfh@yahoo.co', '0715562398', 0, 'm', 'S', 1259),
(8, 'Vimal', '25/6 , Kandy', 'm', '8866559924', '1988-08-21', 'sp20', 'Ampara', 'h008', 'fhgfjhfjhfh@yahoo.co', '0715562398', 0, 'm', 'S', 1367),
(9, 'Sunil', '2/6 , Badulle', 'm', '8833449224', '1988-06-26', 'sp11', 'Ampara', 'h003', 'fhgfjhfjhfh@yahoo.co', '0715562398', 0, 'm', 'S', 1357),
(10, 'Anitha', '25/2 , Kandy', 'f', '8866559924', '1989-09-11', 'sp09', 'Ampara', 'h002', 'fhgfjhfjhfh@gmail.co', '0713462398', 0, 'm', 'S', 1348),
(11, 'Diron', '25/6 , Badulle', 'm', '8866559924', '1988-08-21', 'sp08', 'Ampara', 'h001', 'fhgfjhfjhfh@yahoo.co', '0715562398', 0, 'm', 'S', 1852),
(12, 'Marei', '25 , Galle', 'm', '8186559924', '1981-08-01', 'sp04', 'Ampara', 'h002', 'fuyiyuhjsfh@yahoo.co', '0715562398', 0, 'm', 'S', 1159),
(13, 'Anil', '2 , Galle', 'm', '8866559924', '1988-08-21', 'sp03', 'Ampara', 'h008', 'fhgfjhfjhfh@yahoo.co', '0715562398', 0, 'm', 'S', 1753),
(15, 'Charu', '25 , Galle', 'm', '6386559924', '1963-08-01', 'sp20', 'Ampara', 'h002', 'sjsindhee@gmail.com', '0715562398', 0, 'S', 'S', 1349),
(16, 'Anil', '2 , Galle', 'm', '6066559924', '1960-08-21', 'sp02', 'Ampara', 'h003', 'sjsindhee@gmail.com', '0715562398', 0, 'S', 'S', 1765),
(17, 'Pavithra', '25/52 , Colombo', 'f', '6066559924', '1960-12-21', 'sp01', 'Ampara', 'h005', 'sjsindhee@gmail.com', '0715562398', 0, 'S', 'S', 1726),
(18, 'Jack', '25/6 , Gampaha', 'm', '5666559924', '1956-08-21', 'sp05', 'Ampara', 'h003', 'sjsindhee@gmail.com', '0715562398', 0, 'S', 'S', 1354),
(19, 'Anura', '25/6 , Gampaha', 'm', '6166559924', '1961-08-21', 'sp02', 'Ampara', 'h007', 'sjsindhee@yahoo.com', '0715562398', 0, 'S', 'S', 1284),
(20, 'Silva', '25/6 , Kalutara', 'm', '5666559924', '1956-08-21', 'sp03', 'Ampara', 'h001', 'sjsindhee@gmail.com', '0715562398', 0, 'S', 'S', 1184),
(21, 'Vimal', '25/6 , Kalutara', 'm', '5466559924', '1954-08-21', 'sp09', 'Ampara', 'h005', 'sjsindhee@gmail.com', '0715562398', 0, 'S', 'S', 1984),
(22, 'Henry', '25/6 , Kalutara', 'm', '5466559924', '1954-08-21', 'sp07', 'Ampara', 'h009', 'sjsindhee@gmail.com', '0715562398', 0, 'S', 'S', 1884),
(23, 'Annon', '25/6 , Jaffna', 'm', '6066559924', '1960-08-21', 'sp15', 'Ampara', 'h009', 'sjsindhee@gmail.com', '0715562398', 0, 'S', 'S', 1454),
(24, 'Amila', '25/6 , Colombo', 'm', '5466559924', '1954-08-21', 'sp14', 'Ampara', 'h005', 'sjsindhee@gmail.com', '0715562398', 0, 'S', 'S', 1774);

-- --------------------------------------------------------

--
-- Table structure for table `temp_patient`
--

CREATE TABLE IF NOT EXISTS `temp_patient` (
  `pRequestId` int(10) NOT NULL,
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
  `gId` char(4) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `temp_patient`
--

INSERT INTO `temp_patient` (`pRequestId`, `name`, `add`, `gender`, `nic`, `dob`, `bloodGroup`, `email`, `telNo`, `district`, `maritalStatus`, `gId`) VALUES
(15, 'Anitha', '25/2 , Kandy', 'f', '8866559924', '1989-09-11', 'A+', 'fhgfjhfjhfh@gmail.co', '0713462398', 'Kandy', 'M', ''),
(16, 'Annon', '25/6 , Badulle', 'm', '8866559924', '1988-08-21', 'A+', 'fhgfjhfjhfh@yahoo.co', '0715562398', 'Badulle', 'S', ''),
(17, 'Annon', '25 , Galle', 'm', '8186559924', '1981-08-01', 'A+', 'fuyiyuhjsfh@yahoo.co', '0715562398', 'Galle', 's', ''),
(18, 'Anil', '2 , Galle', 'm', '8866559924', '1988-08-21', 'AB+', 'fhgfjhfjhfh@yahoo.co', '0715562398', 'Galle', 's', ''),
(19, 'Annon', '25/52 , Colombo', 'm', '8866559924', '1988-08-21', 'A+', 'fhgfjhfjhfh@yahoo.co', '0715562398', 'Colombo', 's', ''),
(20, 'Jack', '25/6 , Gampaha', 'm', '8866559924', '1988-08-21', 'A+', 'fhgfjhfjhfh@yahoo.co', '0715562398', 'Gampaha', 's', ''),
(21, 'Anura', '25/6 , Gampaha', 'm', '8866559924', '1988-08-21', 'A+', 'fhgfjhfjhfh@yahoo.co', '0715562398', 'Gampaha', 's', ''),
(22, 'Silva', '25/6 , Kalutara', 'm', '8866559924', '1988-08-21', 'A+', 'fhgfjhfjhfh@yahoo.co', '0715562398', 'Kalutara', 's', ''),
(23, 'Vimal', '25/6 , Kalutara', 'm', '8866559924', '1988-08-21', 'B+', 'fhgfjhfjhfh@yahoo.co', '0715562398', 'Kalutara', 's', ''),
(24, 'Henry', '25/6 , Kalutara', 'm', '8866559924', '1988-08-21', 'B+', 'fhgfjhfjhfh@yahoo.co', '0715562398', 'Kalutara', 's', ''),
(25, 'Annon', '25/6 , Jaffna', 'm', '8866559924', '1988-08-21', 'A+', 'fhgfjhfjhfh@yahoo.co', '0715562398', 'Jaffna', 's', ''),
(26, 'Amila', '25/6 , Colombo', 'm', '8866559924', '1988-08-21', 'A+', 'fhgfjhfjhfh@yahoo.co', '0715562398', 'Colombo', 's', ''),
(27, 'Seetha', '26/6 , Kandy', 'f', '886325924v', '1988-05-02', 'AB+', 'fhjkifh@yahoo.com', '0775965398', 'Kandy', 'S', ''),
(29, 'Thara', '25/5 , Kandy', 'f', '8536559924', '1985-08-21', 'A+', 'fhgfjhfjhfh@yahoo.co', '0715562398', 'Kandy', 's', ''),
(30, 'Anitha', '25/6, Kandy', 'f', '8866759924', '1988-08-21', 'AB+', 'fhgfjhfjhfh@yahoo.co', '0715562398', 'Kandy', 's', ''),
(31, 'Jeya', '25/6 , Ampara', 'm', '8866553224', '1988-08-21', 'A+', 'fhgfjhfjhfh@yahoo.co', '0715562398', 'Ampara', 's', ''),
(32, 'Sriya', '25/6, Kandy', 'f', '8866576224', '1988-08-21', 'A+', 'fhgfjhfjhfh@yahoo.co', '0715562398', 'Kandy', 's', ''),
(33, 'Nimal', '252/6 , Ampara', 'm', '8236559924', '1982-08-08', 'A+', 'fhgfjhfjhfh@yahoo.co', '0715562398', 'Ampara', 's', ''),
(34, 'Mala', '25/6 , Kandy', 'f', '8866559924', '1988-08-21', 'A+', 'fhgfjhfjhfh@yahoo.co', '0715562398', 'Kandy', 'M', ''),
(35, 'Sunethra', '2/6 , Badulle', 'f', '8933449224', '1989-06-26', 'B+', 'fhgfjhfjhfh@yahoo.co', '0715562398', 'Kegalle', 's', ''),
(36, 'Anitha', '25/2 , Kandy', 'f', '8866559924', '1989-09-11', 'A+', 'fhgfjhfjhfh@gmail.co', '0713462398', 'Kandy', 'M', ''),
(37, 'Vivan', '25/6 , Badulle', 'm', '8166559924', '1981-08-21', 'A+', 'fhgfjhfjhfh@yahoo.co', '0715562398', 'Badulle', 'S', ''),
(38, 'Charu', '25 , Galle', 'm', '8186559924', '1981-08-01', 'A+', 'fuyiyuhjsfh@yahoo.co', '0715562398', 'Galle', 's', ''),
(39, 'Anil', '2 , Galle', 'm', '8866559924', '1988-08-21', 'AB+', 'fhgfjhfjhfh@yahoo.co', '0715562398', 'Galle', 's', ''),
(40, 'Pavithra', '25/52 , Colombo', 'f', '8866559924', '1988-12-21', 'A+', 'fhgfjhfjhfh@yahoo.co', '0715562398', 'Colombo', 's', ''),
(41, 'Jack', '25/6 , Gampaha', 'm', '6466559924', '1964-08-21', 'A+', 'fhgfjhfjhfh@yahoo.co', '0715562398', 'Gampaha', 's', ''),
(42, 'Anura', '25/6 , Gampaha', 'm', '5666559924', '1956-08-21', 'A+', 'fhgfjhfjhfh@yahoo.co', '0715562398', 'Gampaha', 's', ''),
(43, 'Silva', '25/6 , Kalutara', 'm', '5466559924', '1954-08-21', 'A+', 'fhgfjhfjhfh@yahoo.co', '0715562398', 'Kalutara', 's', ''),
(44, 'Vimal', '25/6 , Kalutara', 'm', '8866559924', '1988-08-21', 'B+', 'fhgfjhfjhfh@yahoo.co', '0715562398', 'Kalutara', 's', ''),
(45, 'Henry', '25/6 , Kalutara', 'm', '6466559924', '1964-08-21', 'B+', 'fhgfjhfjhfh@yahoo.co', '0715562398', 'Kalutara', 's', ''),
(46, 'Annon', '25/6 , Jaffna', 'm', '6566559924', '1965-08-21', 'A+', 'fhgfjhfjhfh@yahoo.co', '0715562398', 'Jaffna', 's', ''),
(47, 'Amila', '25/6 , Colombo', 'm', '6366559924', '1963-08-21', 'A+', 'fhgfjhfjhfh@yahoo.co', '0715562398', 'Colombo', 's', ''),
(48, 'Seetha', '26/6 , Kandy', 'f', '896325924v', '1989-05-02', 'AB+', 'sjsindhee@gmail.com', '0775965398', 'Kandy', 'S', ''),
(49, 'Chitra', '25/5 , Kandy', 'f', '8966549924', '1989-08-21', 'A+', 'sjsindhee@gmail.com', '0715562398', 'Kandy', 's', ''),
(50, 'Thara', '25/5 , Kandy', 'f', '8636559924', '1986-08-21', 'A+', 'sjsindhee@gmail.com', '0715562398', 'Kandy', 's', ''),
(51, 'Anitha', '25/6, Kandy', 'f', '8666759924', '1986-08-21', 'AB+', 'sjsindhee@gmail.com', '0715562398', 'Kandy', 's', ''),
(52, 'Jeya', '25/6 , Ampara', 'm', '8766553224', '1987-08-21', 'A+', 'sjsindhee@gmail.com', '0715562398', 'Ampara', 's', ''),
(53, 'Sriya', '25/6, Kandy', 'f', '8766576224', '1987-08-21', 'A+', 'sjsindhee@gmail.com', '0715562398', 'Kandy', 's', ''),
(54, 'Nimal', '252/6 , Ampara', 'm', '8536559924', '1985-08-08', 'A+', 'sjsindhee@gmail.com', '0715562398', 'Ampara', 's', ''),
(55, 'Mala', '25/6 , Kandy', 'f', '6566559924', '1965-08-21', 'A+', 'sjsindhee@gmail.com', '0715562398', 'Kandy', 'M', ''),
(56, 'Sunethra', '2/6 , Badulle', 'f', '6533449224', '1965-06-26', 'B+', 'sjsindhee@gmail.com', '0715562398', 'Kegalle', 's', ''),
(57, 'Anitha', '25/2 , Kandy', 'f', '6466559924', '1964-09-11', 'A+', 'sjsindhee@gmail.com', '0713462398', 'Kandy', 'M', ''),
(58, 'Vivan', '25/6 , Badulle', 'm', '6466559924', '1964-08-21', 'A+', 'sjsindhee@gmail.com', '0715562398', 'Badulle', 'S', ''),
(59, 'Charu', '25 , Galle', 'm', '6386559924', '1963-08-01', 'A+', 'sjsindhee@gmail.com', '0715562398', 'Galle', 's', ''),
(60, 'Anil', '2 , Galle', 'm', '6066559924', '1960-08-21', 'AB+', 'sjsindhee@gmail.com', '0715562398', 'Galle', 's', ''),
(61, 'Pavithra', '25/52 , Colombo', 'f', '6066559924', '1960-12-21', 'A+', 'sjsindhee@gmail.com', '0715562398', 'Colombo', 's', ''),
(62, 'Jack', '25/6 , Gampaha', 'm', '5666559924', '1956-08-21', 'A+', 'sjsindhee@gmail.com', '0715562398', 'Gampaha', 's', ''),
(63, 'Anura', '25/6 , Gampaha', 'm', '6166559924', '1961-08-21', 'A+', 'sjsindhee@yahoo.com', '0715562398', 'Gampaha', 's', ''),
(64, 'Silva', '25/6 , Kalutara', 'm', '5666559924', '1956-08-21', 'A+', 'sjsindhee@gmail.com', '0715562398', 'Kalutara', 's', ''),
(65, 'Vimal', '25/6 , Kalutara', 'm', '5466559924', '1954-08-21', 'B+', 'sjsindhee@gmail.com', '0715562398', 'Kalutara', 's', ''),
(66, 'Henry', '25/6 , Kalutara', 'm', '5466559924', '1954-08-21', 'B+', 'sjsindhee@gmail.com', '0715562398', 'Kalutara', 's', ''),
(67, 'Annon', '25/6 , Jaffna', 'm', '6066559924', '1960-08-21', 'A+', 'sjsindhee@gmail.com', '0715562398', 'Jaffna', 's', ''),
(68, 'Amila', '25/6 , Colombo', 'm', '5466559924', '1954-08-21', 'A+', 'sjsindhee@gmail.com', '0715562398', 'Colombo', 's', ''),
(69, 'Kamal Gunawardhana', 'Kandy Rd,\r\nKandy.', 'm', '123453455v', '1938-05-15', 'A-', 'kamal@gmail.com', '1233422341', 'Kandy', 'S', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`aId`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`appId`), ADD KEY `did` (`did`);

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`artId`), ADD KEY `dId` (`dId`), ADD KEY `issueId` (`issueId`), ADD KEY `dId_2` (`dId`);

--
-- Indexes for table `diagnosis`
--
ALTER TABLE `diagnosis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`dId`), ADD KEY `hId` (`hId`), ADD KEY `spId` (`spId`), ADD KEY `spId_2` (`spId`), ADD KEY `hId_2` (`hId`);

--
-- Indexes for table `forumans`
--
ALTER TABLE `forumans`
  ADD PRIMARY KEY (`ansId`), ADD KEY `fk_forumQandA` (`qid`);

--
-- Indexes for table `forumquest`
--
ALTER TABLE `forumquest`
  ADD PRIMARY KEY (`qId`);

--
-- Indexes for table `frequency_med`
--
ALTER TABLE `frequency_med`
  ADD PRIMARY KEY (`frequencyId`);

--
-- Indexes for table `health_issue`
--
ALTER TABLE `health_issue`
  ADD PRIMARY KEY (`issueId`);

--
-- Indexes for table `hospital`
--
ALTER TABLE `hospital`
  ADD PRIMARY KEY (`hId`);

--
-- Indexes for table `hospital_emp`
--
ALTER TABLE `hospital_emp`
  ADD PRIMARY KEY (`empId`), ADD KEY `hId` (`hId`), ADD KEY `hId_2` (`hId`);

--
-- Indexes for table `medicine`
--
ALTER TABLE `medicine`
  ADD PRIMARY KEY (`mid`), ADD KEY `frequencyId` (`frequencyId`), ADD KEY `frequencyId_2` (`frequencyId`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`pId`);

--
-- Indexes for table `patient_history`
--
ALTER TABLE `patient_history`
  ADD PRIMARY KEY (`historyNo`), ADD KEY `pId` (`pId`), ADD KEY `reportNo` (`reportNo`), ADD KEY `hId` (`hId`), ADD KEY `presId` (`presId`), ADD KEY `hId_3` (`hId`);

--
-- Indexes for table `pending_reports`
--
ALTER TABLE `pending_reports`
  ADD PRIMARY KEY (`pendingId`);

--
-- Indexes for table `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`presId`), ADD KEY `pid` (`pid`), ADD KEY `did` (`did`), ADD KEY `issueId` (`issueId`);

--
-- Indexes for table `prescription_temp`
--
ALTER TABLE `prescription_temp`
  ADD PRIMARY KEY (`presId`), ADD KEY `frequencyId` (`frequencyId`);

--
-- Indexes for table `rosters`
--
ALTER TABLE `rosters`
  ADD PRIMARY KEY (`rosterId`);

--
-- Indexes for table `specialization`
--
ALTER TABLE `specialization`
  ADD PRIMARY KEY (`spId`);

--
-- Indexes for table `statistician`
--
ALTER TABLE `statistician`
  ADD PRIMARY KEY (`sId`);

--
-- Indexes for table `statistics`
--
ALTER TABLE `statistics`
  ADD PRIMARY KEY (`statisticsId`);

--
-- Indexes for table `temp_doctor`
--
ALTER TABLE `temp_doctor`
  ADD PRIMARY KEY (`dRequestId`), ADD KEY `dRequestId` (`dRequestId`);

--
-- Indexes for table `temp_patient`
--
ALTER TABLE `temp_patient`
  ADD PRIMARY KEY (`pRequestId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `appId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `diagnosis`
--
ALTER TABLE `diagnosis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `forumans`
--
ALTER TABLE `forumans`
  MODIFY `ansId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `forumquest`
--
ALTER TABLE `forumquest`
  MODIFY `qId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `patient_history`
--
ALTER TABLE `patient_history`
  MODIFY `historyNo` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=92;
--
-- AUTO_INCREMENT for table `pending_reports`
--
ALTER TABLE `pending_reports`
  MODIFY `pendingId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=694;
--
-- AUTO_INCREMENT for table `prescription`
--
ALTER TABLE `prescription`
  MODIFY `presId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=322;
--
-- AUTO_INCREMENT for table `prescription_temp`
--
ALTER TABLE `prescription_temp`
  MODIFY `presId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `rosters`
--
ALTER TABLE `rosters`
  MODIFY `rosterId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `temp_doctor`
--
ALTER TABLE `temp_doctor`
  MODIFY `dRequestId` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `temp_patient`
--
ALTER TABLE `temp_patient`
  MODIFY `pRequestId` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=70;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`did`) REFERENCES `doctor` (`dId`);

--
-- Constraints for table `article`
--
ALTER TABLE `article`
ADD CONSTRAINT `article_ibfk_1` FOREIGN KEY (`dId`) REFERENCES `doctor` (`dId`),
ADD CONSTRAINT `article_ibfk_2` FOREIGN KEY (`issueId`) REFERENCES `health_issue` (`issueId`);

--
-- Constraints for table `doctor`
--
ALTER TABLE `doctor`
ADD CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`spId`) REFERENCES `specialization` (`spId`),
ADD CONSTRAINT `doctor_ibfk_2` FOREIGN KEY (`hId`) REFERENCES `hospital` (`hId`);

--
-- Constraints for table `hospital_emp`
--
ALTER TABLE `hospital_emp`
ADD CONSTRAINT `hospital_emp_ibfk_1` FOREIGN KEY (`hId`) REFERENCES `hospital` (`hId`);

--
-- Constraints for table `medicine`
--
ALTER TABLE `medicine`
ADD CONSTRAINT `medicine_ibfk_1` FOREIGN KEY (`frequencyId`) REFERENCES `frequency_med` (`frequencyId`);

--
-- Constraints for table `prescription`
--
ALTER TABLE `prescription`
ADD CONSTRAINT `prescription_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `patient` (`pId`),
ADD CONSTRAINT `prescription_ibfk_2` FOREIGN KEY (`did`) REFERENCES `doctor` (`dId`),
ADD CONSTRAINT `prescription_ibfk_3` FOREIGN KEY (`issueId`) REFERENCES `health_issue` (`issueId`);

DELIMITER $$
--
-- Events
--
CREATE DEFINER=`root`@`localhost` EVENT `pendingReportIssue` ON SCHEDULE EVERY 7 MINUTE STARTS '2016-01-01 00:00:00' ENDS '2016-08-01 00:00:00' ON COMPLETION NOT PRESERVE ENABLE DO INSERT INTO `pending_reports`( `subject`, `description`, `date`) VALUES ("Report on Dengu",'It should generated before 7th',now())$$

CREATE DEFINER=`root`@`localhost` EVENT `pendingReports` ON SCHEDULE EVERY 1 DAY STARTS '2016-01-01 00:00:00' ENDS '2017-02-01 00:00:00' ON COMPLETION NOT PRESERVE ENABLE DO INSERT INTO `pending_reports`( `subject`, `description`, `date`) VALUES ("Mounthly report",'It should generated before 5th',now())$$

CREATE DEFINER=`root`@`localhost` EVENT `pendingReportDistrict` ON SCHEDULE EVERY 3 MINUTE STARTS '2016-01-01 00:00:00' ENDS '2016-07-01 00:00:00' ON COMPLETION NOT PRESERVE ENABLE DO INSERT INTO `pending_reports`( `subject`, `description`, `date`) VALUES ("Report on Kandy district",'It should generated within 5 days',now())$$

DELIMITER ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
