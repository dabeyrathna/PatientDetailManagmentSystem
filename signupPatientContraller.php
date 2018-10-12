
	<?php


	require_once ("DBAccess.php");  
			
	$db = new DBAccess();
	$dbConnection = $db->initConnection();
	
	$email = "";$telNo = "";
	if(isset($_POST['name']) &&
					isset($_POST['paddress']) &&
					isset($_POST['gender']) &&
					isset($_POST['nic']) &&
					isset($_POST['bgrp']) &&
					isset($_POST['dobYear']) && isset($_POST['dobMonth']) && isset($_POST['dobDate'])  &&
					isset($_POST['district']) && (isset($_POST['email']) && $_POST['email'] != ""))
		{
			$name = mysql_real_escape_string($_POST['name']);
			$paddress = mysql_real_escape_string($_POST['paddress']);
			$gender = $_POST['gender'];
			$nic = mysql_real_escape_string($_POST['nic']);
			$bgrp = $_POST['bgrp'];
			$dob = $_POST['dobYear']."-".$_POST['dobMonth']."-".$_POST['dobDate'];
			
			if(isset($_POST['email']))
				$email = mysql_real_escape_string($_POST['email']);
		
			if(isset($_POST['telno']))	
				$telNo =mysql_real_escape_string($_POST['telno']);

				
			$district = mysql_real_escape_string($_POST['district']);	
			$mStatus = mysql_real_escape_string($_POST['mStatus']);	
			
			
			
			
				$sql = "INSERT INTO temp_patient(`name`, `add`, `gender`, `nic`, `bloodGroup`,  `dob`, `email`, `telNo`, `district`, `maritalStatus`) 
						VALUES ('".$name."','".$paddress."','".$gender."','".$nic."','".$bgrp."','".$dob."','".$email."','".$telNo."','".$district."','".$mStatus."')";
				
				echo "first : ".$sql;
				if($query=mysql_query($sql,$dbConnection)){
					header("location:successPage.php?info=3");
				}
				else{
					header("location:signupPatient.php?err=5");   
				}
				
				
	}
	else if(isset($_POST['name']) &&
					isset($_POST['paddress']) &&
					isset($_POST['gender']) &&
					isset($_POST['dobYear']) && isset($_POST['dobMonth']) && isset($_POST['dobDate'])  &&
					isset($_POST['gardianPId']))
					
		{
				$name = mysql_real_escape_string($_POST['name']);
				$paddress = mysql_real_escape_string($_POST['paddress']);
				$gender = $_POST['gender'];
				$bgrp = $_POST['bgrp'];
				$dob = $_POST['dobYear']."-".$_POST['dobMonth']."-".$_POST['dobDate'];
				$gardianPId = $_POST['gardianPId'];
				$gEmail = $_POST['gardianEmail'];
	
			$sql = "INSERT INTO temp_patient(`name`, `add`, `gender`,`bloodGroup`, `dob`, `gId`, `email`) 
						VALUES ('".$name."','".$paddress."','".$gender."','".$bgrp."','".$dob."','".$gardianPId."','".$gEmail."')";
						
					echo "sec : ".$sql;
				if($query=mysql_query($sql,$dbConnection)){
					header("location:successPage.php?info=3");				// ur request has successfully submitted
				}
				else{
					header("location:signupPatient.php?err=5");        //error in request. please try again
				}	
		}
		else
		{
				header("location:signupPatient.php?err=5");     // insufficient data. please try again
		}
?>
	
	
	
	

