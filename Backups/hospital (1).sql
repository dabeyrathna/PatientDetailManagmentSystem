-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 06, 2015 at 05:37 PM
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
-- Table structure for table `answer`
--

CREATE TABLE IF NOT EXISTS `answer` (
  `dId` char(4) NOT NULL,
  `ansNo` char(4) NOT NULL,
  `dateTime` datetime NOT NULL
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
('A100', 'D123', '2015-09-18', 'I124', 'Accident Prevention ', 'Accident Prevention Accident Prevention '),
('a123', 'D123', '2015-09-09', 'I109', 'Age-Related Macular Degeneration ', 'Age-Related Macular Degeneration Age-Related Macular Degeneration '),
('A144', 'D123', '2015-09-18', 'I124', 'Alternative Therapy for Cancer ', 'Alternative Therapy for Cancer Alternative Therapy for Cancer '),
('A488', 'D123', '2015-09-18', 'I176', 'Anterior Cruciate Ligament Injury ', 'Alternative Therapy for Cancer Alternative Therapy for Cancer ');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE IF NOT EXISTS `doctor` (
  `dId` char(4) NOT NULL,
  `name` varchar(50) NOT NULL,
  `gender` char(1) NOT NULL,
  `dPass` varchar(150) NOT NULL,
  `add` varchar(200) NOT NULL,
  `spId` char(4) NOT NULL,
  `hId` char(4) NOT NULL,
  `email` varchar(20) NOT NULL,
  `telNo` char(10) NOT NULL,
  `nic` char(10) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `forumans`
--

CREATE TABLE IF NOT EXISTS `forumans` (
  `ansNo` char(4) NOT NULL,
  `dId` char(4) NOT NULL,
  `qId` char(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `forumquest`
--

CREATE TABLE IF NOT EXISTS `forumquest` (
  `qId` char(4) NOT NULL,
  `pId` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gardian`
--

CREATE TABLE IF NOT EXISTS `gardian` (
  `gId` char(4) NOT NULL,
  `name` varchar(25) NOT NULL,
  `dob` date NOT NULL,
  `nic` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `name` varchar(50) NOT NULL,
  `telNo` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `active` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE IF NOT EXISTS `medicine` (
  `mid` char(5) NOT NULL,
  `medicine` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medicine`
--

INSERT INTO `medicine` (`mid`, `medicine`) VALUES
('M123', 'Lipitor'),
('M124', 'Nexium'),
('M125', 'Advair Diskus'),
('M126', 'Abilify'),
('M127', 'Seroquel'),
('M128', 'Singulair'),
('M129', 'Actos'),
('M133', 'Epogen'),
('M143', 'Enbrel'),
('M153', 'Copaxone'),
('M163', 'Lantus Solostar'),
('M174', 'Avastin');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE IF NOT EXISTS `patient` (
  `name` varchar(50) NOT NULL,
  `pId` char(10) NOT NULL,
  `dId` char(4) NOT NULL,
  `hId` char(4) NOT NULL,
  `nic` char(10) NOT NULL,
  `empId` char(4) NOT NULL,
  `gender` char(1) NOT NULL,
  `add` varchar(150) NOT NULL,
  `regDate` date NOT NULL,
  `dob` date NOT NULL,
  `pPass` varchar(150) NOT NULL,
  `bloodGroup` varchar(3) NOT NULL,
  `email` varchar(11) NOT NULL,
  `age` varchar(3) NOT NULL,
  `telNo` char(10) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `patient_history`
--

CREATE TABLE IF NOT EXISTS `patient_history` (
  `historyNo` int(4) NOT NULL,
  `patientStatus` tinyint(1) NOT NULL,
  `deathDate` datetime DEFAULT NULL,
  `date` datetime NOT NULL,
  `description` varchar(250) NOT NULL,
  `hId` char(4) NOT NULL,
  `reportNo` char(4) NOT NULL,
  `dId` char(4) NOT NULL,
  `pId` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE IF NOT EXISTS `prescription` (
  `presId` int(11) NOT NULL,
  `pid` char(10) NOT NULL,
  `did` char(10) NOT NULL,
  `medicine` char(5) NOT NULL,
  `dosage` varchar(30) NOT NULL,
  `frequency` varchar(30) NOT NULL,
  `date` datetime NOT NULL,
  `diagnosis` varchar(250) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

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
  `frequency` varchar(30) NOT NULL,
  `date` datetime NOT NULL,
  `diagnosis` varchar(250) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE IF NOT EXISTS `reports` (
  `reportNo` char(4) NOT NULL,
  `reportLoc` varchar(50) NOT NULL,
  `description` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`reportNo`, `reportLoc`, `description`) VALUES
('R123', 'fdgdf', 'dfsgds');

-- --------------------------------------------------------

--
-- Table structure for table `specialization`
--

CREATE TABLE IF NOT EXISTS `specialization` (
  `spId` char(4) NOT NULL,
  `spName` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `statistician`
--

CREATE TABLE IF NOT EXISTS `statistician` (
  `sId` char(4) NOT NULL,
  `name` varchar(50) NOT NULL,
  `add` varchar(200) NOT NULL,
  `telNo` char(10) NOT NULL,
  `regDate` date NOT NULL,
  `wrkStatus` tinyint(1) NOT NULL,
  `email` varchar(20) NOT NULL,
  `sPass` varchar(150) NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `temp_doctor`
--

CREATE TABLE IF NOT EXISTS `temp_doctor` (
  `name` varchar(50) NOT NULL,
  `add` varchar(200) NOT NULL,
  `gender` char(1) NOT NULL,
  `nic` char(10) NOT NULL,
  `dob` date NOT NULL,
  `specialization` varchar(50) NOT NULL,
  `district` varchar(50) NOT NULL,
  `hName` varchar(50) NOT NULL,
  `email` varchar(20) NOT NULL,
  `telNo` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `temp_patient`
--

CREATE TABLE IF NOT EXISTS `temp_patient` (
  `name` varchar(50) NOT NULL,
  `add` varchar(200) NOT NULL,
  `gender` char(1) NOT NULL,
  `nic` char(10) NOT NULL,
  `dob` date NOT NULL,
  `bloodGroup` varchar(3) NOT NULL,
  `email` varchar(20) NOT NULL,
  `telNo` char(10) NOT NULL,
  `district` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `temp_patient`
--

INSERT INTO `temp_patient` (`name`, `add`, `gender`, `nic`, `dob`, `bloodGroup`, `email`, `telNo`, `district`) VALUES
('sindhuja jeyagunaseelan', '217/3,maddegama,ampitiya', '', '563432748V', '0000-00-00', '', 'sjsindhee@gmail.com', '0772217343', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`dId`,`ansNo`);

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`artId`), ADD KEY `dId` (`dId`), ADD KEY `issueId` (`issueId`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`dId`), ADD KEY `hId` (`hId`), ADD KEY `spId` (`spId`);

--
-- Indexes for table `forumans`
--
ALTER TABLE `forumans`
  ADD PRIMARY KEY (`ansNo`), ADD KEY `qId` (`qId`), ADD KEY `dId` (`dId`);

--
-- Indexes for table `forumquest`
--
ALTER TABLE `forumquest`
  ADD PRIMARY KEY (`qId`), ADD KEY `pId` (`pId`), ADD KEY `pId_2` (`pId`);

--
-- Indexes for table `gardian`
--
ALTER TABLE `gardian`
  ADD PRIMARY KEY (`gId`);

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
  ADD PRIMARY KEY (`empId`), ADD KEY `hId` (`hId`);

--
-- Indexes for table `medicine`
--
ALTER TABLE `medicine`
  ADD PRIMARY KEY (`mid`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`pId`), ADD KEY `dId` (`dId`), ADD KEY `hId` (`hId`), ADD KEY `empId` (`empId`), ADD KEY `dId_2` (`dId`);

--
-- Indexes for table `patient_history`
--
ALTER TABLE `patient_history`
  ADD PRIMARY KEY (`historyNo`), ADD KEY `pId` (`pId`), ADD KEY `reportNo` (`reportNo`), ADD KEY `hId` (`hId`);

--
-- Indexes for table `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`presId`);

--
-- Indexes for table `prescription_temp`
--
ALTER TABLE `prescription_temp`
  ADD PRIMARY KEY (`presId`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`reportNo`);

--
-- Indexes for table `specialization`
--
ALTER TABLE `specialization`
  ADD PRIMARY KEY (`spId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `prescription`
--
ALTER TABLE `prescription`
  MODIFY `presId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `prescription_temp`
--
ALTER TABLE `prescription_temp`
  MODIFY `presId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- Constraints for dumped tables
--

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
-- Constraints for table `forumans`
--
ALTER TABLE `forumans`
ADD CONSTRAINT `forumans_ibfk_1` FOREIGN KEY (`qId`) REFERENCES `forumquest` (`qId`),
ADD CONSTRAINT `forumans_ibfk_2` FOREIGN KEY (`dId`) REFERENCES `doctor` (`dId`);

--
-- Constraints for table `forumquest`
--
ALTER TABLE `forumquest`
ADD CONSTRAINT `forumquest_ibfk_1` FOREIGN KEY (`pId`) REFERENCES `patient` (`pId`);

--
-- Constraints for table `hospital_emp`
--
ALTER TABLE `hospital_emp`
ADD CONSTRAINT `hospital_emp_ibfk_1` FOREIGN KEY (`hId`) REFERENCES `hospital` (`hId`);

--
-- Constraints for table `patient_history`
--
ALTER TABLE `patient_history`
ADD CONSTRAINT `patient_history_ibfk_1` FOREIGN KEY (`hId`) REFERENCES `hospital` (`hId`),
ADD CONSTRAINT `patient_history_ibfk_2` FOREIGN KEY (`reportNo`) REFERENCES `reports` (`reportNo`),
ADD CONSTRAINT `patient_history_ibfk_3` FOREIGN KEY (`pId`) REFERENCES `patient` (`pId`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
