
	<?php
	

	require_once ("DBAccess.php");  
			echo $_POST['dobYear'];

// get form data, making sure it is valid
	
	if(isset($_POST['name']) &&
					isset($_POST['dAddress']) &&
					isset($_POST['gender']) &&
					isset($_POST['pId']) &&
					isset($_POST['dobYear']) && isset($_POST['dobMonth']) && isset($_POST['dobDate'])  &&
					isset($_POST['specialization']) &&
					isset($_POST['hospital']) &&
					isset($_POST['MOIC']) &&
					isset($_POST['mStatus']) &&
					isset($_POST['nationality']) &&
					isset($_POST['slmc']) &&
					isset($_POST['nic']) && isset($_POST['email']) && isset($_POST['telno']) && isset($_POST['district']) )
	{
		$name = mysql_real_escape_string($_POST['name']);
		$dAddress = mysql_real_escape_string($_POST['dAddress']);
		$gender = mysql_real_escape_string($_POST['gender']);
		$pId = mysql_real_escape_string($_POST['pId']);
		$specialization = mysql_real_escape_string($_POST['specialization']);
		$hospital = mysql_real_escape_string($_POST['hospital']);
		$MOIC = mysql_real_escape_string($_POST['MOIC']);
		$mStatus = mysql_real_escape_string($_POST['mStatus']);
		$nationality = mysql_real_escape_string($_POST['nationality']);
		$slmc =mysql_real_escape_string($_POST['slmc']);
		$nic =mysql_real_escape_string($_POST['nic']);
		$email = mysql_real_escape_string($_POST['email']);
		$telNo =($_POST['telno']);
		$district = mysql_real_escape_string($_POST['district']);	
		$dob = $_POST['dobYear']."-".$_POST['dobMonth']."-".$_POST['dobDate'];
	
		$db = new DBAccess();
		$dbConnection = $db->initConnection();
	// save the data to the database
	
	
		$sql = "INSERT INTO temp_doctor(`name`, `add`, `gender`, `nic`,`dob`,`spId`, `email`, `telNo`, `district`, `hId`,
										`MOIC`, `slmcRegNo`, `maritalStatus`, `nationality`) VALUES 
										('".$name."','".$dAddress."','".$gender."','".$nic."','".$dob."','".$specialization."',
										 '".$email."','".$telNo."','".$district."','".$hospital."','".$MOIC."','".$slmc."','".$mStatus."',
										 '".$nationality."')";
	
		if ($query=mysql_query($sql,$dbConnection)){
			header("location:successPage.php?info=3"); 
		}
		else{
			header("location:signupDoctor.php?info=5");
		}
	}
	else
	{
		header("location:signupDoctor.php?err=5");     // insufficient data. please try again
	}
	?>
	
	
	
	

