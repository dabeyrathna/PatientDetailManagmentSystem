-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 28, 2016 at 06:17 AM
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
  PRIMARY KEY (`appId`),
  KEY `did` (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  KEY `issueId` (`issueId`),
  KEY `dId_2` (`dId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  KEY `spId` (`spId`),
  KEY `spId_2` (`spId`),
  KEY `hId_2` (`hId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  KEY `hId` (`hId`),
  KEY `hId_2` (`hId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE IF NOT EXISTS `medicine` (
  `mid` char(4) NOT NULL,
  `medicine` varchar(100) NOT NULL,
  `frequencyId` char(4) NOT NULL,
  PRIMARY KEY (`mid`),
  KEY `frequencyId` (`frequencyId`),
  KEY `frequencyId_2` (`frequencyId`)
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
  UNIQUE KEY `hId_2` (`hId`),
  KEY `pId` (`pId`),
  KEY `reportNo` (`reportNo`),
  KEY `hId` (`hId`),
  KEY `presId` (`presId`),
  KEY `hId_3` (`hId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  PRIMARY KEY (`presId`),
  KEY `pid` (`pid`),
  KEY `did` (`did`),
  KEY `issueId` (`issueId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  ADD CONSTRAINT `article_ibfk_2` FOREIGN KEY (`issueId`) REFERENCES `health_issue` (`issueId`),
  ADD CONSTRAINT `article_ibfk_1` FOREIGN KEY (`dId`) REFERENCES `doctor` (`dId`);

--
-- Constraints for table `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `doctor_ibfk_2` FOREIGN KEY (`hId`) REFERENCES `hospital` (`hId`),
  ADD CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`spId`) REFERENCES `specialization` (`spId`);

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
-- Constraints for table `patient_history`
--
ALTER TABLE `patient_history`
  ADD CONSTRAINT `patient_history_ibfk_3` FOREIGN KEY (`presId`) REFERENCES `prescription` (`presId`),
  ADD CONSTRAINT `patient_history_ibfk_1` FOREIGN KEY (`hId`) REFERENCES `hospital` (`hId`),
  ADD CONSTRAINT `patient_history_ibfk_2` FOREIGN KEY (`pId`) REFERENCES `patient` (`pId`);

--
-- Constraints for table `prescription`
--
ALTER TABLE `prescription`
  ADD CONSTRAINT `prescription_ibfk_3` FOREIGN KEY (`issueId`) REFERENCES `health_issue` (`issueId`),
  ADD CONSTRAINT `prescription_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `patient` (`pId`),
  ADD CONSTRAINT `prescription_ibfk_2` FOREIGN KEY (`did`) REFERENCES `doctor` (`dId`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
