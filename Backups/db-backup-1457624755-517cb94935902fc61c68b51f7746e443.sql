DROP TABLE admin;

CREATE TABLE `admin` (
  `aId` char(4) NOT NULL,
  `name` varchar(50) NOT NULL,
  `gender` char(1) NOT NULL,
  `add` varchar(200) NOT NULL,
  `email` varchar(20) NOT NULL,
  `nic` char(10) NOT NULL,
  `regDate` date NOT NULL,
  `aPass` varchar(150) NOT NULL,
  `imageType` varchar(6) NOT NULL,
  `telNo` char(10) NOT NULL,
  PRIMARY KEY (`aId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO admin VALUES("a123","Domatila","f","217/3, maddagama, ampitiya","sjsindhee@gmail.com","896733222v","2016-03-09","123","","0812217991");



DROP TABLE appointment;

CREATE TABLE `appointment` (
  `appId` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `tital` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `did` varchar(20) NOT NULL,
  PRIMARY KEY (`appId`),
  KEY `did` (`did`),
  CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`did`) REFERENCES `doctor` (`dId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




DROP TABLE article;

CREATE TABLE `article` (
  `artId` char(6) NOT NULL,
  `dId` char(4) NOT NULL,
  `date` date NOT NULL,
  `issueId` char(4) NOT NULL,
  `topic` varchar(250) NOT NULL,
  `description` varchar(250) NOT NULL,
  PRIMARY KEY (`artId`),
  KEY `dId` (`dId`),
  KEY `issueId` (`issueId`),
  KEY `dId_2` (`dId`),
  CONSTRAINT `article_ibfk_1` FOREIGN KEY (`dId`) REFERENCES `doctor` (`dId`),
  CONSTRAINT `article_ibfk_2` FOREIGN KEY (`issueId`) REFERENCES `health_issue` (`issueId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO article VALUES("A33859","d123","2016-03-10","I176","MENTAL HEALTH ","Mental Health\nResearch Findings\nPresident, World Federation for Mental Health");
INSERT INTO article VALUES("A77255","d123","2016-03-10","I176","WORLD MENTAL HEALTH DAY","Prof. George Christodoulou\nPresident, World Federation for Mental Health");



DROP TABLE diagnosis;

CREATE TABLE `diagnosis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `diagnosisNo` int(11) NOT NULL,
  `medicine` char(5) NOT NULL,
  `dosage` varchar(30) NOT NULL,
  `frequency` varchar(30) NOT NULL,
  `duration` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

INSERT INTO diagnosis VALUES("11","11","M128","ttttttttttt","f004","tttttttttt");
INSERT INTO diagnosis VALUES("12","11","M128","rrrrrrrrrrrrrr","f004","rrrrrrrrrr");
INSERT INTO diagnosis VALUES("13","11","M128","eeeeeeeee","f004","eeeeeeee");
INSERT INTO diagnosis VALUES("14","11","M128","wwwwwwwww","f004","wwwwwwwww");
INSERT INTO diagnosis VALUES("15","11","M128","qqqqqqqq","f004","qqqqqqqqqq");



DROP TABLE doctor;

CREATE TABLE `doctor` (
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
  KEY `hId_2` (`hId`),
  CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`spId`) REFERENCES `specialization` (`spId`),
  CONSTRAINT `doctor_ibfk_2` FOREIGN KEY (`hId`) REFERENCES `hospital` (`hId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO doctor VALUES("d123","0","Sindhuja","f","202cb962ac59075b964b07152d234b70","jkjkghjkgk,kjhkbkjahf, Kandy","sp10","h001","sjsindhee@gmail.com","0772217343","896733222v","1989-06-21","Kandy","1258","","s","s");
INSERT INTO doctor VALUES("D745611325","0","fgfdgfd","f","fd22213103d21881c16b627bade8bc74","gfhfgh","sp13","h002","ddddd@gmail.com","cbfcbf","fghfh","1974-03-03","dffgd","0","jpg","S","S");
INSERT INTO doctor VALUES("D80766507","0","Kamal Silva","m","202cb962ac59075b964b07152d234b70","24/A, Colombo rd, Kandy","sp24","h001","dilangapct@gmail.com","235435365","12323456","1980-03-17","Kandy","1234","jpg","S","S");
INSERT INTO doctor VALUES("D881211598","0","Suriya","m","add4aa8d0ab6084565157f752abdd380","26/6 , Kandy","sp01","h001","fhjkifh@yahoo.com","0775965398","8866369924","1988-05-02","Kandy","1256","","S","S");



DROP TABLE forumans;

CREATE TABLE `forumans` (
  `ansId` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(10) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `time` datetime NOT NULL,
  `attachment` varchar(100) NOT NULL,
  `qid` int(11) NOT NULL,
  `likes` int(11) NOT NULL,
  PRIMARY KEY (`ansId`),
  KEY `fk_forumQandA` (`qid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

INSERT INTO forumans VALUES("1","D80766507 ","I think it could be IBS with looking at the symptoms, I\'m going to go for a food intolerance test. Is there anything that might help meanwhile?","2016-03-01 00:41:25","","10","1");
INSERT INTO forumans VALUES("2","D80766507 ","I can only think of looking at your diet.","2016-03-01 00:41:44","","10","0");
INSERT INTO forumans VALUES("3","D80766507 "," grgrege","2016-03-01 00:41:49","","10","0");
INSERT INTO forumans VALUES("4","D80766507 "," eregtre gregfgrf 54tg5t","2016-03-01 00:41:57","","10","0");
INSERT INTO forumans VALUES("5","D80766507 ","df g dsgew","2016-03-01 01:08:39","","10","0");
INSERT INTO forumans VALUES("8","D80766507 ","fd g4e t4 ter gfrg","2016-03-01 13:55:28","","9","0");
INSERT INTO forumans VALUES("10","D80766507 ","fg r gr egr","2016-03-01 13:56:16","","9","0");
INSERT INTO forumans VALUES("14","D80766507 ","iron was good but my vit d was a tiny bit low","2016-03-01 14:12:42","","11","11");
INSERT INTO forumans VALUES("18","D80766507 "," get the AA working and its one day at a time, then pick yourself up dust yourself down and start a new life, fix your self a time to get up each day and that includes Sunday say 7o/c, if you want earlier then do so, and start your day there, get out and ","2016-03-01 14:37:06","","11","3");



DROP TABLE forumquest;

CREATE TABLE `forumquest` (
  `qId` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(10) NOT NULL,
  `topic` varchar(100) NOT NULL,
  `question` varchar(255) NOT NULL,
  `issueId` char(4) NOT NULL,
  `time` datetime NOT NULL,
  `attachment` varchar(100) NOT NULL,
  `likes` int(11) NOT NULL,
  PRIMARY KEY (`qId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

INSERT INTO forumquest VALUES("9","d123","Does this sound like hyperthyroid?","Hi! I\'m 19, female and after having my iron and vitamin d tests I\'m frustrated that the doctors tell me I should have \'peace of mind\' now! My iron was good but my vit d was a tiny bit low (was told to take supplements) However I\'m still experiencing sympt","I200","2015-11-14 13:28:31","","0");
INSERT INTO forumquest VALUES("10","d123","Feeling Depressed...","Hi! I\'m 19, female and after having my iron and vitamin d tests I\'m frustrated that the doctors tell me I should have \'peace of mind\' now! My iron was good but my vit d was a tiny bit low (was told to take supplements) However I\'m still experiencing sympt","I124","2015-11-14 14:30:17","","2");
INSERT INTO forumquest VALUES("11","d123","Often Headaches","I am getting headaches after travelling . What is the reason and is it a serious situation ?","I104","2016-03-10 15:45:36","","0");



DROP TABLE frequency_med;

CREATE TABLE `frequency_med` (
  `frequencyId` char(4) NOT NULL,
  `frequency` varchar(15) NOT NULL,
  `shortForm` varchar(4) NOT NULL,
  PRIMARY KEY (`frequencyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO frequency_med VALUES("f001","Daily","");
INSERT INTO frequency_med VALUES("f002","12 Hourly","bd");
INSERT INTO frequency_med VALUES("f003","8 Hourly","tds");
INSERT INTO frequency_med VALUES("f004","6 Hourly","qds");



DROP TABLE health_issue;

CREATE TABLE `health_issue` (
  `issueId` char(4) NOT NULL DEFAULT '',
  `description` varchar(250) NOT NULL,
  `issue` varchar(50) NOT NULL,
  PRIMARY KEY (`issueId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO health_issue VALUES("I100","Physical Activity and Nutrition","Physical Activity and Nutrition");
INSERT INTO health_issue VALUES("I102","Tobacco","Tobacco");
INSERT INTO health_issue VALUES("I103","aaaaa","qwereqew");
INSERT INTO health_issue VALUES("I104","Headaches","Headaches");
INSERT INTO health_issue VALUES("I105","Other","Other");
INSERT INTO health_issue VALUES("I109","HIV/AIDS","HIV/AIDS");
INSERT INTO health_issue VALUES("I123","Substance Abuse","Substance Abuse");
INSERT INTO health_issue VALUES("I124","Environmental Quality","Environmental Quality");
INSERT INTO health_issue VALUES("I127","Injury and Violence","Injury and Violence");
INSERT INTO health_issue VALUES("I176","Mental Health","Mental Health");
INSERT INTO health_issue VALUES("I200","Overweight and Obesity","Overweight and Obesity");



DROP TABLE hospital;

CREATE TABLE `hospital` (
  `hId` char(4) NOT NULL,
  `district` varchar(20) NOT NULL,
  `add` varchar(200) NOT NULL,
  `description` varchar(350) NOT NULL,
  `hName` varchar(50) NOT NULL,
  `hTelNo` char(10) NOT NULL,
  PRIMARY KEY (`hId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO hospital VALUES("h001","Kandy","Teaching Hospital Kandy, Kandy 20000 Sri Lanka","The Teaching Hospital Kandy is the second largest medical institution in Sri Lanka, established and administered under the purview of the Ministry of Health, Sri Lanka which is a key Government Hospital maintained by the Sri Lankan Government.  We mainly serve general public living in the Central Province which consists of Kandy, Matale and Nuwara ","Teaching Hospital Kandy","0812 22226");
INSERT INTO hospital VALUES("h002","Colombo","E W Perera Mawatha, Colombo","This Hospital serves as the National Referral Center for medical and surgical care in Sri Lanka. The National Hospital which is the largest teaching hospital in Sri Lanka consists of 3300 beds and is considered as the largest hospital in South East Asia. This hospital has 106 wards, 35 Operating Theatres and 12 Intensive Care Units in addition to o","National Hospital of Sri Lanka","011 2 6911");
INSERT INTO hospital VALUES("h003","Ampara","Ampara District General Hospital"," established and administered under the purview of the Ministry of Health, Sri Lanka which is a key Government Hospital maintained by the Sri Lankan Government","Ampara District General Hospital","0773652984");
INSERT INTO hospital VALUES("h004","Kalutara","Kalutara District General Hospital"," established and administered under the purview of the Ministry of Health, Sri Lanka which is a key Government Hospital maintained by the Sri Lankan Government","Kalutara District General Hospital","0773562984");
INSERT INTO hospital VALUES("h005","Matara","Matara District General Hospital"," established and administered under the purview of the Ministry of Health, Sri Lanka which is a key Government Hospital maintained by the Sri Lankan Government","Matara District General Hospital","0773562984");
INSERT INTO hospital VALUES("h006","Batticaloa","Batticaloa District General Hospital"," established and administered under the purview of the Ministry of Health, Sri Lanka which is a key Government Hospital maintained by the Sri Lankan Government","Batticaloa District General Hospital","0773562984");
INSERT INTO hospital VALUES("h007","Galle","Galle District General Hospital"," established and administered under the purview of the Ministry of Health, Sri Lanka which is a key Government Hospital maintained by the Sri Lankan Government","Galle District General Hospital","0773562984");
INSERT INTO hospital VALUES("h008","Gampaha","Gampaha District General Hospital"," established and administered under the purview of the Ministry of Health, Sri Lanka which is a key Government Hospital maintained by the Sri Lankan Government","Gampaha District General Hospital","0773562984");
INSERT INTO hospital VALUES("h009","Jaffna","Jaffna District General Hospital"," established and administered under the purview of the Ministry of Health, Sri Lanka which is a key Government Hospital maintained by the Sri Lankan Government","Jaffna District General Hospital","0773562984");
INSERT INTO hospital VALUES("h010","Hambantota","Hambantota District General Hospital"," established and administered under the purview of the Ministry of Health, Sri Lanka which is a key Government Hospital maintained by the Sri Lankan Government","Hambantota District General Hospital","0773562984");
INSERT INTO hospital VALUES("h011","Kegalle","Kegalle District General Hospital"," established and administered under the purview of the Ministry of Health, Sri Lanka which is a key Government Hospital maintained by the Sri Lankan Government","Kegalle District General Hospital","0773562984");
INSERT INTO hospital VALUES("h012","Anuradhapura","Anuradhapura District General Hospital"," established and administered under the purview of the Ministry of Health, Sri Lanka which is a key Government Hospital maintained by the Sri Lankan Government","Anuradhapura District General Hospital","0773562984");



DROP TABLE hospital_emp;

CREATE TABLE `hospital_emp` (
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
  KEY `hId_2` (`hId`),
  CONSTRAINT `hospital_emp_ibfk_1` FOREIGN KEY (`hId`) REFERENCES `hospital` (`hId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO hospital_emp VALUES("e123","Nimal","Kandy rd Colombo","h001","123132435","0000-00-00","1","email@email.com","202cb962ac59075b964b07152d234b70","1","123342423V","M","jpg");



DROP TABLE medicine;

CREATE TABLE `medicine` (
  `mid` char(4) NOT NULL,
  `medicine` varchar(100) NOT NULL,
  `frequencyId` char(4) NOT NULL,
  PRIMARY KEY (`mid`),
  KEY `frequencyId` (`frequencyId`),
  KEY `frequencyId_2` (`frequencyId`),
  CONSTRAINT `medicine_ibfk_1` FOREIGN KEY (`frequencyId`) REFERENCES `frequency_med` (`frequencyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO medicine VALUES("M116","Paracetamol","f004");
INSERT INTO medicine VALUES("M117","chlorpheniramine","f002");
INSERT INTO medicine VALUES("M118","Amoxicillin","f003");
INSERT INTO medicine VALUES("M119","Metronidazole","f003");
INSERT INTO medicine VALUES("M120","Cloxacillin","f004");
INSERT INTO medicine VALUES("M121","Erythromycin","f004");
INSERT INTO medicine VALUES("M122","Ciprofloxacin","f002");
INSERT INTO medicine VALUES("M123","Seroquel","f004");
INSERT INTO medicine VALUES("M124","Singulair","f004");
INSERT INTO medicine VALUES("M125","Actos","f004");
INSERT INTO medicine VALUES("M126","Epogen","f004");
INSERT INTO medicine VALUES("M127","Enbrel","f004");
INSERT INTO medicine VALUES("M128","Copaxone","f004");
INSERT INTO medicine VALUES("M129","Lantus Solostar","f004");
INSERT INTO medicine VALUES("M130","Avastin","f004");



DROP TABLE patient;

CREATE TABLE `patient` (
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

INSERT INTO patient VALUES("Sindhuja","p123","896733222v","f","217, maddehama ,kandy","2016-03-04","1989-06-21","202cb962ac59075b964b07152d234b70","B+","sjsindhee@gmail.com","0772217343","Kandy","-","jpg");
INSERT INTO patient VALUES("","P7001190","","","","2016-03-10","0000-00-00","0284827bec86a0e9ac36fbe5f6486c68","","","","","","");
INSERT INTO patient VALUES("","P7003878","","","","2016-03-10","0000-00-00","8ae89e9d382c00420ec3bc0d2ca2087d","","","","","","");
INSERT INTO patient VALUES("","P7004726","","","","2016-03-10","0000-00-00","af664aee9496e4b874554d1e76fac436","","","","","","");
INSERT INTO patient VALUES("","P7004775","","","","2016-03-10","0000-00-00","1bbb84b0498c0b4db451d9634181e1ef","","","","","","");
INSERT INTO patient VALUES("","P7006626","","","","2016-03-10","0000-00-00","69713912eeb474ea8d68ca6cdb0399f9","","","","","","");
INSERT INTO patient VALUES("","P7009987","","","","2016-03-10","0000-00-00","d36f87b2b0cfd17e1e8ba4d7b893f2dc","","","","","","");
INSERT INTO patient VALUES("Nimal","P872182243","8766559924","m","25/6 , Ampara","2016-03-10","1987-08-08","aec729cc97fad3b46510472fdbfea8b7","A+","fhgfjhfjhfh@yahoo.co","0715562398","Ampara","","");
INSERT INTO patient VALUES("Suriya","P881216376","8866369924","m","26/6 , Kandy","2016-03-10","1988-05-02","c360e5d4238b95f94f6c15a8acd233ee","AB+","fhjkifh@yahoo.com","0775965398","Kandy","","");
INSERT INTO patient VALUES("Annon","P882325199","8866559924","m","25/6 , Ampara","2016-03-10","1988-08-21","f4417684d254da9def08438cbb9151b0","A+","fhgfjhfjhfh@yahoo.co","0715562398","Ampara","","");
INSERT INTO patient VALUES("Annon","P882326169","8866559924","m","25/6, Kandy","2016-03-10","1988-08-21","d088d8a8a4c754abca6d149e43705c03","A+","fhgfjhfjhfh@yahoo.co","0715562398","Kandy","","");
INSERT INTO patient VALUES("Ann","P882326683","8866559924","m","25/6, Kandy","2016-03-10","1988-08-21","b766c54e1b43f301643ab0c8312b5a50","A+","fhgfjhfjhfh@yahoo.co","0715562398","Kandy","","");
INSERT INTO patient VALUES("Sithara","P882328579","8866559924","m","25/5 , Kandy","2016-03-10","1988-08-21","d4aa50e07e4801e7038052107c0bc943","A+","fhgfjhhfh@yahoo.com","0715562398","Kandy","","");
INSERT INTO patient VALUES("Vimal","P882328769","8866559924","m","25/6 , Kandy","2016-03-10","1988-08-21","694adff72c0d9cfa9714945a3e71bc71","A+","fhgfjhfjhfh@yahoo.co","0715562398","Kandy","","");
INSERT INTO patient VALUES("Chitra","P887323720","8866549924","f","25/5 , Kandy","2016-03-10","1988-08-21","e8c27b40f4c955660d2887c6a80334b9","A+","fhgfjhhfh@yahoo.com","0715562398","Kandy","","");
INSERT INTO patient VALUES("Saman Silva","P88937003","234353533V","m","23/3, Kandy Rd, Colombo.","2016-02-28","1988-04-04","202cb962ac59075b964b07152d234b70","A-","dilangapct@gmail.com","0112342343","Kandy","","");



DROP TABLE patient_history;

CREATE TABLE `patient_history` (
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
  KEY `hId_3` (`hId`),
  CONSTRAINT `patient_history_ibfk_1` FOREIGN KEY (`hId`) REFERENCES `hospital` (`hId`),
  CONSTRAINT `patient_history_ibfk_2` FOREIGN KEY (`pId`) REFERENCES `patient` (`pId`),
  CONSTRAINT `patient_history_ibfk_3` FOREIGN KEY (`presId`) REFERENCES `prescription` (`presId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO patient_history VALUES("1","0","","2016-02-09 00:00:00","gf","h001","","D123","P88937003","6");



DROP TABLE pending_reports;

CREATE TABLE `pending_reports` (
  `pendingId` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(200) NOT NULL,
  `description` varchar(250) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`pendingId`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=latin1;

INSERT INTO pending_reports VALUES("10","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("11","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("12","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("13","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("14","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("15","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("16","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("17","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("18","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("19","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("20","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("21","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("22","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("23","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("24","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("25","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("26","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("27","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("28","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("29","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("30","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("31","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("32","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("33","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("34","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("35","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("36","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("37","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("38","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("39","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("40","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("41","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("42","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("43","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("44","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("45","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("46","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("47","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("48","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("49","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("50","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("51","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("52","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("53","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("54","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("55","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("56","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("57","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("58","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("59","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("60","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("61","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("62","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("63","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("64","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("65","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("66","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("67","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("68","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("69","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("70","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("71","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("72","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("73","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("74","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("75","Monthly report","It should generated before 5th","2016-03-10");
INSERT INTO pending_reports VALUES("76","Monthly report","It should generated before 5th","2016-03-10");



DROP TABLE prescription;

CREATE TABLE `prescription` (
  `presId` int(11) NOT NULL AUTO_INCREMENT,
  `pid` char(10) NOT NULL,
  `did` char(10) NOT NULL,
  `date` datetime NOT NULL,
  `diagnosis` varchar(250) NOT NULL,
  `issueId` char(4) NOT NULL,
  `diagnosisNo` int(11) NOT NULL,
  PRIMARY KEY (`presId`),
  KEY `pid` (`pid`),
  KEY `did` (`did`),
  KEY `issueId` (`issueId`),
  CONSTRAINT `prescription_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `patient` (`pId`),
  CONSTRAINT `prescription_ibfk_2` FOREIGN KEY (`did`) REFERENCES `doctor` (`dId`),
  CONSTRAINT `prescription_ibfk_3` FOREIGN KEY (`issueId`) REFERENCES `health_issue` (`issueId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO prescription VALUES("6","P88937003","D80766507","2016-03-01 00:10:36","qqqqqqqqqq","I102","11");



DROP TABLE prescription_temp;

CREATE TABLE `prescription_temp` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




DROP TABLE rosters;

CREATE TABLE `rosters` (
  `rosterId` int(11) NOT NULL AUTO_INCREMENT,
  `empId` char(4) NOT NULL,
  `date` date NOT NULL,
  `description` varchar(50) NOT NULL,
  `department` varchar(50) NOT NULL,
  PRIMARY KEY (`rosterId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO rosters VALUES("1","E123","2016-03-10","fgfdhdfh","gfhgfhg");
INSERT INTO rosters VALUES("2","E123","2016-03-10","cbfbfb","fdbdf");



DROP TABLE specialization;

CREATE TABLE `specialization` (
  `spId` char(4) NOT NULL,
  `spName` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY (`spId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO specialization VALUES("sp01","General Surgeon","");
INSERT INTO specialization VALUES("sp02","Anesthesiologist","");
INSERT INTO specialization VALUES("sp03","Cardiologist","");
INSERT INTO specialization VALUES("sp04","Dentist","");
INSERT INTO specialization VALUES("sp05","Dematologist","");
INSERT INTO specialization VALUES("sp06","Diabetologist","");
INSERT INTO specialization VALUES("sp07","Gynocologist","");
INSERT INTO specialization VALUES("sp08","Hematologist","");
INSERT INTO specialization VALUES("sp09","Immunologist","");
INSERT INTO specialization VALUES("sp10","Nephrologist","");
INSERT INTO specialization VALUES("sp11","Toxicologist","");
INSERT INTO specialization VALUES("sp12","Endocrinologist","");
INSERT INTO specialization VALUES("sp13","Radiologist","");
INSERT INTO specialization VALUES("sp14","Rheumatologist","");
INSERT INTO specialization VALUES("sp15","Urologist","");
INSERT INTO specialization VALUES("sp16","Oncologist","");
INSERT INTO specialization VALUES("sp17","Opthalmologist","");
INSERT INTO specialization VALUES("sp18","Venereologist","");
INSERT INTO specialization VALUES("sp19","Nutritionist","");
INSERT INTO specialization VALUES("sp20","Eye Surgeon","");
INSERT INTO specialization VALUES("sp21","Vascular Surgeon","");
INSERT INTO specialization VALUES("sp22","Plastic Surgeon","");
INSERT INTO specialization VALUES("sp23","Dental Surgeon","");
INSERT INTO specialization VALUES("sp24","Pediatric Surgeon","");
INSERT INTO specialization VALUES("sp25","Oncology Surgeon","");
INSERT INTO specialization VALUES("sp26","Thoracic Surgeon","");
INSERT INTO specialization VALUES("sp27","Urinary Surgeon","");
INSERT INTO specialization VALUES("sp28","Orthopedic Surgeon","");
INSERT INTO specialization VALUES("sp29","Neuro Surgeon","");
INSERT INTO specialization VALUES("sp30","Cardiac Surgeon","");



DROP TABLE statistician;

CREATE TABLE `statistician` (
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

INSERT INTO statistician VALUES("S123","Kamal Surendra","45/7, Kandt rd, Kandy","","","0812342345","2016-02-15","kamals@gmail.com","202cb962ac59075b964b07152d234b70","");



DROP TABLE statistics;

CREATE TABLE `statistics` (
  `statisticsId` varchar(20) NOT NULL,
  `uploader` varchar(10) NOT NULL,
  `Title` varchar(250) NOT NULL,
  `description` varchar(250) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`statisticsId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO statistics VALUES("S165252016-03-10","s123","fdgdf","gdfgd","2016-03-10 13:22:05");
INSERT INTO statistics VALUES("S447822016-03-10","s123","tutyuytu","ytutyutyt","2016-03-10 18:43:57");
INSERT INTO statistics VALUES("S470952016-03-10","s123","ury","utyuti","2016-03-10 00:00:00");
INSERT INTO statistics VALUES("S569852016-03-10","s123","ghg fhg fh","f hjgf hgf ","2016-03-10 00:00:00");
INSERT INTO statistics VALUES("S873872016-03-10","s123","jhgj","hgjghjgh","2016-03-10 08:00:00");



DROP TABLE temp_doctor;

CREATE TABLE `temp_doctor` (
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

INSERT INTO temp_doctor VALUES("3","Satara","25/5 , Colombo","m","8866559924","1988-08-21","sp05","Colombo","h006","fhgfjhfjhfh@yahoo.co","0715562398","0","S","S","1784");
INSERT INTO temp_doctor VALUES("4","Ann","25/6, Colombo","m","8866559924","1988-08-21","sp06","Colombo","h005","fhgfjhfjhfh@yahoo.co","0715562398","0","m","S","1734");
INSERT INTO temp_doctor VALUES("5","Annon","25/6 , Ampara","m","8866559924","1988-08-21","sp10","Ampara","h006","fhgfjhfjhfh@yahoo.co","0715562398","0","m","S","1334");
INSERT INTO temp_doctor VALUES("6","Annon","25/6, Kandy","m","8866559924","1988-08-21","sp11","Ampara","h007","fhgfjhfjhfh@yahoo.co","0715562398","0","m","S","9752");
INSERT INTO temp_doctor VALUES("7","Nimal","25/6 , Ampara","m","8766559924","1987-08-08","sp06","Ampara","h008","fhgfjhfjhfh@yahoo.co","0715562398","0","m","S","1259");
INSERT INTO temp_doctor VALUES("8","Vimal","25/6 , Kandy","m","8866559924","1988-08-21","sp20","Ampara","h008","fhgfjhfjhfh@yahoo.co","0715562398","0","m","S","1367");
INSERT INTO temp_doctor VALUES("9","Sunil","2/6 , Badulle","m","8833449224","1988-06-26","sp11","Ampara","h003","fhgfjhfjhfh@yahoo.co","0715562398","0","m","S","1357");
INSERT INTO temp_doctor VALUES("10","Anitha","25/2 , Kandy","f","8866559924","1989-09-11","sp09","Ampara","h002","fhgfjhfjhfh@gmail.co","0713462398","0","m","S","1348");
INSERT INTO temp_doctor VALUES("11","Diron","25/6 , Badulle","m","8866559924","1988-08-21","sp08","Ampara","h001","fhgfjhfjhfh@yahoo.co","0715562398","0","m","S","1852");
INSERT INTO temp_doctor VALUES("12","Marei","25 , Galle","m","8186559924","1981-08-01","sp04","Ampara","h002","fuyiyuhjsfh@yahoo.co","0715562398","0","m","S","1159");
INSERT INTO temp_doctor VALUES("13","Anil","2 , Galle","m","8866559924","1988-08-21","sp03","Ampara","h008","fhgfjhfjhfh@yahoo.co","0715562398","0","m","S","1753");
INSERT INTO temp_doctor VALUES("15","Charu","25 , Galle","m","6386559924","1963-08-01","sp20","Ampara","h002","sjsindhee@gmail.com","0715562398","0","S","S","1349");
INSERT INTO temp_doctor VALUES("16","Anil","2 , Galle","m","6066559924","1960-08-21","sp02","Ampara","h003","sjsindhee@gmail.com","0715562398","0","S","S","1765");
INSERT INTO temp_doctor VALUES("17","Pavithra","25/52 , Colombo","f","6066559924","1960-12-21","sp01","Ampara","h005","sjsindhee@gmail.com","0715562398","0","S","S","1726");
INSERT INTO temp_doctor VALUES("18","Jack","25/6 , Gampaha","m","5666559924","1956-08-21","sp05","Ampara","h003","sjsindhee@gmail.com","0715562398","0","S","S","1354");
INSERT INTO temp_doctor VALUES("19","Anura","25/6 , Gampaha","m","6166559924","1961-08-21","sp02","Ampara","h007","sjsindhee@yahoo.com","0715562398","0","S","S","1284");
INSERT INTO temp_doctor VALUES("20","Silva","25/6 , Kalutara","m","5666559924","1956-08-21","sp03","Ampara","h001","sjsindhee@gmail.com","0715562398","0","S","S","1184");
INSERT INTO temp_doctor VALUES("21","Vimal","25/6 , Kalutara","m","5466559924","1954-08-21","sp09","Ampara","h005","sjsindhee@gmail.com","0715562398","0","S","S","1984");
INSERT INTO temp_doctor VALUES("22","Henry","25/6 , Kalutara","m","5466559924","1954-08-21","sp07","Ampara","h009","sjsindhee@gmail.com","0715562398","0","S","S","1884");
INSERT INTO temp_doctor VALUES("23","Annon","25/6 , Jaffna","m","6066559924","1960-08-21","sp15","Ampara","h009","sjsindhee@gmail.com","0715562398","0","S","S","1454");
INSERT INTO temp_doctor VALUES("24","Amila","25/6 , Colombo","m","5466559924","1954-08-21","sp14","Ampara","h005","sjsindhee@gmail.com","0715562398","0","S","S","1774");



DROP TABLE temp_patient;

CREATE TABLE `temp_patient` (
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
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;

INSERT INTO temp_patient VALUES("15","Anitha","25/2 , Kandy","f","8866559924","1989-09-11","A+","fhgfjhfjhfh@gmail.co","0713462398","Kandy","M","");
INSERT INTO temp_patient VALUES("16","Annon","25/6 , Badulle","m","8866559924","1988-08-21","A+","fhgfjhfjhfh@yahoo.co","0715562398","Badulle","S","");
INSERT INTO temp_patient VALUES("17","Annon","25 , Galle","m","8186559924","1981-08-01","A+","fuyiyuhjsfh@yahoo.co","0715562398","Galle","s","");
INSERT INTO temp_patient VALUES("18","Anil","2 , Galle","m","8866559924","1988-08-21","AB+","fhgfjhfjhfh@yahoo.co","0715562398","Galle","s","");
INSERT INTO temp_patient VALUES("19","Annon","25/52 , Colombo","m","8866559924","1988-08-21","A+","fhgfjhfjhfh@yahoo.co","0715562398","Colombo","s","");
INSERT INTO temp_patient VALUES("20","Jack","25/6 , Gampaha","m","8866559924","1988-08-21","A+","fhgfjhfjhfh@yahoo.co","0715562398","Gampaha","s","");
INSERT INTO temp_patient VALUES("21","Anura","25/6 , Gampaha","m","8866559924","1988-08-21","A+","fhgfjhfjhfh@yahoo.co","0715562398","Gampaha","s","");
INSERT INTO temp_patient VALUES("22","Silva","25/6 , Kalutara","m","8866559924","1988-08-21","A+","fhgfjhfjhfh@yahoo.co","0715562398","Kalutara","s","");
INSERT INTO temp_patient VALUES("23","Vimal","25/6 , Kalutara","m","8866559924","1988-08-21","B+","fhgfjhfjhfh@yahoo.co","0715562398","Kalutara","s","");
INSERT INTO temp_patient VALUES("24","Henry","25/6 , Kalutara","m","8866559924","1988-08-21","B+","fhgfjhfjhfh@yahoo.co","0715562398","Kalutara","s","");
INSERT INTO temp_patient VALUES("25","Annon","25/6 , Jaffna","m","8866559924","1988-08-21","A+","fhgfjhfjhfh@yahoo.co","0715562398","Jaffna","s","");
INSERT INTO temp_patient VALUES("26","Amila","25/6 , Colombo","m","8866559924","1988-08-21","A+","fhgfjhfjhfh@yahoo.co","0715562398","Colombo","s","");
INSERT INTO temp_patient VALUES("27","Seetha","26/6 , Kandy","f","886325924v","1988-05-02","AB+","fhjkifh@yahoo.com","0775965398","Kandy","S","");
INSERT INTO temp_patient VALUES("29","Thara","25/5 , Kandy","f","8536559924","1985-08-21","A+","fhgfjhfjhfh@yahoo.co","0715562398","Kandy","s","");
INSERT INTO temp_patient VALUES("30","Anitha","25/6, Kandy","f","8866759924","1988-08-21","AB+","fhgfjhfjhfh@yahoo.co","0715562398","Kandy","s","");
INSERT INTO temp_patient VALUES("31","Jeya","25/6 , Ampara","m","8866553224","1988-08-21","A+","fhgfjhfjhfh@yahoo.co","0715562398","Ampara","s","");
INSERT INTO temp_patient VALUES("32","Sriya","25/6, Kandy","f","8866576224","1988-08-21","A+","fhgfjhfjhfh@yahoo.co","0715562398","Kandy","s","");
INSERT INTO temp_patient VALUES("33","Nimal","252/6 , Ampara","m","8236559924","1982-08-08","A+","fhgfjhfjhfh@yahoo.co","0715562398","Ampara","s","");
INSERT INTO temp_patient VALUES("34","Mala","25/6 , Kandy","f","8866559924","1988-08-21","A+","fhgfjhfjhfh@yahoo.co","0715562398","Kandy","M","");
INSERT INTO temp_patient VALUES("35","Sunethra","2/6 , Badulle","f","8933449224","1989-06-26","B+","fhgfjhfjhfh@yahoo.co","0715562398","Kegalle","s","");
INSERT INTO temp_patient VALUES("36","Anitha","25/2 , Kandy","f","8866559924","1989-09-11","A+","fhgfjhfjhfh@gmail.co","0713462398","Kandy","M","");
INSERT INTO temp_patient VALUES("37","Vivan","25/6 , Badulle","m","8166559924","1981-08-21","A+","fhgfjhfjhfh@yahoo.co","0715562398","Badulle","S","");
INSERT INTO temp_patient VALUES("38","Charu","25 , Galle","m","8186559924","1981-08-01","A+","fuyiyuhjsfh@yahoo.co","0715562398","Galle","s","");
INSERT INTO temp_patient VALUES("39","Anil","2 , Galle","m","8866559924","1988-08-21","AB+","fhgfjhfjhfh@yahoo.co","0715562398","Galle","s","");
INSERT INTO temp_patient VALUES("40","Pavithra","25/52 , Colombo","f","8866559924","1988-12-21","A+","fhgfjhfjhfh@yahoo.co","0715562398","Colombo","s","");
INSERT INTO temp_patient VALUES("41","Jack","25/6 , Gampaha","m","6466559924","1964-08-21","A+","fhgfjhfjhfh@yahoo.co","0715562398","Gampaha","s","");
INSERT INTO temp_patient VALUES("42","Anura","25/6 , Gampaha","m","5666559924","1956-08-21","A+","fhgfjhfjhfh@yahoo.co","0715562398","Gampaha","s","");
INSERT INTO temp_patient VALUES("43","Silva","25/6 , Kalutara","m","5466559924","1954-08-21","A+","fhgfjhfjhfh@yahoo.co","0715562398","Kalutara","s","");
INSERT INTO temp_patient VALUES("44","Vimal","25/6 , Kalutara","m","8866559924","1988-08-21","B+","fhgfjhfjhfh@yahoo.co","0715562398","Kalutara","s","");
INSERT INTO temp_patient VALUES("45","Henry","25/6 , Kalutara","m","6466559924","1964-08-21","B+","fhgfjhfjhfh@yahoo.co","0715562398","Kalutara","s","");
INSERT INTO temp_patient VALUES("46","Annon","25/6 , Jaffna","m","6566559924","1965-08-21","A+","fhgfjhfjhfh@yahoo.co","0715562398","Jaffna","s","");
INSERT INTO temp_patient VALUES("47","Amila","25/6 , Colombo","m","6366559924","1963-08-21","A+","fhgfjhfjhfh@yahoo.co","0715562398","Colombo","s","");
INSERT INTO temp_patient VALUES("48","Seetha","26/6 , Kandy","f","896325924v","1989-05-02","AB+","sjsindhee@gmail.com","0775965398","Kandy","S","");
INSERT INTO temp_patient VALUES("49","Chitra","25/5 , Kandy","f","8966549924","1989-08-21","A+","sjsindhee@gmail.com","0715562398","Kandy","s","");
INSERT INTO temp_patient VALUES("50","Thara","25/5 , Kandy","f","8636559924","1986-08-21","A+","sjsindhee@gmail.com","0715562398","Kandy","s","");
INSERT INTO temp_patient VALUES("51","Anitha","25/6, Kandy","f","8666759924","1986-08-21","AB+","sjsindhee@gmail.com","0715562398","Kandy","s","");
INSERT INTO temp_patient VALUES("52","Jeya","25/6 , Ampara","m","8766553224","1987-08-21","A+","sjsindhee@gmail.com","0715562398","Ampara","s","");
INSERT INTO temp_patient VALUES("53","Sriya","25/6, Kandy","f","8766576224","1987-08-21","A+","sjsindhee@gmail.com","0715562398","Kandy","s","");
INSERT INTO temp_patient VALUES("54","Nimal","252/6 , Ampara","m","8536559924","1985-08-08","A+","sjsindhee@gmail.com","0715562398","Ampara","s","");
INSERT INTO temp_patient VALUES("55","Mala","25/6 , Kandy","f","6566559924","1965-08-21","A+","sjsindhee@gmail.com","0715562398","Kandy","M","");
INSERT INTO temp_patient VALUES("56","Sunethra","2/6 , Badulle","f","6533449224","1965-06-26","B+","sjsindhee@gmail.com","0715562398","Kegalle","s","");
INSERT INTO temp_patient VALUES("57","Anitha","25/2 , Kandy","f","6466559924","1964-09-11","A+","sjsindhee@gmail.com","0713462398","Kandy","M","");
INSERT INTO temp_patient VALUES("58","Vivan","25/6 , Badulle","m","6466559924","1964-08-21","A+","sjsindhee@gmail.com","0715562398","Badulle","S","");
INSERT INTO temp_patient VALUES("59","Charu","25 , Galle","m","6386559924","1963-08-01","A+","sjsindhee@gmail.com","0715562398","Galle","s","");
INSERT INTO temp_patient VALUES("60","Anil","2 , Galle","m","6066559924","1960-08-21","AB+","sjsindhee@gmail.com","0715562398","Galle","s","");
INSERT INTO temp_patient VALUES("61","Pavithra","25/52 , Colombo","f","6066559924","1960-12-21","A+","sjsindhee@gmail.com","0715562398","Colombo","s","");
INSERT INTO temp_patient VALUES("62","Jack","25/6 , Gampaha","m","5666559924","1956-08-21","A+","sjsindhee@gmail.com","0715562398","Gampaha","s","");
INSERT INTO temp_patient VALUES("63","Anura","25/6 , Gampaha","m","6166559924","1961-08-21","A+","sjsindhee@yahoo.com","0715562398","Gampaha","s","");
INSERT INTO temp_patient VALUES("64","Silva","25/6 , Kalutara","m","5666559924","1956-08-21","A+","sjsindhee@gmail.com","0715562398","Kalutara","s","");
INSERT INTO temp_patient VALUES("65","Vimal","25/6 , Kalutara","m","5466559924","1954-08-21","B+","sjsindhee@gmail.com","0715562398","Kalutara","s","");
INSERT INTO temp_patient VALUES("66","Henry","25/6 , Kalutara","m","5466559924","1954-08-21","B+","sjsindhee@gmail.com","0715562398","Kalutara","s","");
INSERT INTO temp_patient VALUES("67","Annon","25/6 , Jaffna","m","6066559924","1960-08-21","A+","sjsindhee@gmail.com","0715562398","Jaffna","s","");
INSERT INTO temp_patient VALUES("68","Amila","25/6 , Colombo","m","5466559924","1954-08-21","A+","sjsindhee@gmail.com","0715562398","Colombo","s","");



