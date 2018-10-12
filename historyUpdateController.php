<?php
	require_once("DBAccess.php");
	session_start();

if (isset($_SESSION["uid"]) &&
					isset($_FILES['report']) &&
					isset($_POST["pId"]) &&
					isset($_POST["dId"]) &&
					isset($_POST["presId"]) &&
					isset($_POST["hospital"])) 
{
                
			$pid =mysql_real_escape_string($_POST["pId"]);
			$presId  = mysql_real_escape_string($_POST["presId"]);
			$hospital  = $_POST["hospital"];
			$desc  = mysql_real_escape_string($_POST["desc"]);
			$did = mysql_real_escape_string($_POST["dId"]);
			$patientStatus = $_POST["patientStatus"];
			
			
			
			$myFile = $_FILES['report'];
			$fileCount = count($myFile["name"]);

			$target_dir = "uploads/patient_reports/";	
				
			for ($i = 0; $i < $fileCount; $i++) 
			{
					 $temp = explode(".", $myFile["name"][$i]);
					 $newfilename = 'Report_'.$pid.'_'.$presId.'_'.rand(100,99999).rand(100,99999).'.'. end($temp);
					 
					 if (move_uploaded_file($myFile["tmp_name"][$i], $target_dir.$newfilename)) 
					 {
							$db = new DBAccess();
							$dbConnection = $db->initConnection();
								
							if($patientStatus == 0)
							{
								
								$sql = "INSERT INTO `patient_history`(
																	  `patientStatus`,
																	  `date`,
																	  `description`,
																	  `hId`,
																	  `reportNo`,
																	  `dId`,
																	  `pId`,
																	  `presId`)	
															VALUES (
																	". 0 .",
																	'".date("Y-m-d")."',
																	'".$desc."',
																	'".$hospital."',
																	'".$newfilename."',
																	'".$did."',
																	'".$pid."',
																	'".$presId."'
																	)";
		
							}
							else
							{
								$sql = "INSERT INTO `patient_history`(
																	  `patientStatus`,
																	  `deathDate`,
																	  `date`,
																	  `description`,
																	  `hId`,
																	  `reportNo`,
																	  `dId`,
																	  `pId`,
																	  `presId`)	
															VALUES (
																	". 1 .",
																	'".date("Y-m-d")."',
																	'".date("Y-m-d")."',
																	'".$desc."',
																	'".$hospital."',
																	'".$newfilename."',
																	'".$did."',
																	'".$pid."',
																	'".$presId."'
																	)";
							}
							
							echo $sql. "<br>";

							if ($query=mysql_query($sql,$dbConnection)){
								//header("location:historyDataUpload.php?info=1"); 
							}
							else{
								//header("location:historyDataUpload.php?info=4");   // data adding error. try again
							}
						}
		
                }
}
else
{
	header("location:historyDataUpload.php?info=5");   // insufficient data
}


?>