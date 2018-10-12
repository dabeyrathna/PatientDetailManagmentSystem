
<?php
		session_start();
 		if (!isset($_SESSION["uid"]))
        {
        	Header("Location: errorPage.php?info=7");
        }
	   else if($_SESSION["uid"][0] != 'D' && $_SESSION["uid"][0] != 'd')
	    {
				Header("Location:errorPage.php?info=7");
		}
		
		else
		{   
			require_once("timeout.php");
			isTimedOut();    
		} 

	require_once ("DBAccess.php");  
		
	
	if(isset($_POST['name'])){
		$name = mysql_real_escape_string($_POST['name']);
	}
	else{
		$name = mysql_real_escape_string($_POST['hidName']);
	}
	
	if(isset($_POST['dAddress'])){
		$dAddress = mysql_real_escape_string($_POST['dAddress']);
	}
	else{
		$dAddress = mysql_real_escape_string($_POST['hidAddress']);
	}
	
	if(isset($_POST['specialization'])){
		$specialization = mysql_real_escape_string($_POST['specialization']);
	}
	else{
		$specialization = mysql_real_escape_string($_POST['hidSpecialization']);
	}
	
	if(isset($_POST['hospital'])){
		$hospital = mysql_real_escape_string($_POST['hospital']);
	}
	else{
		$hospital = mysql_real_escape_string($_POST['hidHospital']);
	}
	
	if(isset($_POST['MOIC'])){
		$MOIC = mysql_real_escape_string($_POST['moic']);
	}
	else{
		$MOIC = mysql_real_escape_string($_POST['hidMoic']);
	}
	
	if(isset($_POST['email'])){
		$email = mysql_real_escape_string($_POST['email']);
	}
	else{
		$email = mysql_real_escape_string($_POST['hidEmail']);
	}
	
	if(isset($_POST['telno'])){
		$telNo =($_POST['telno']);
	}
	else{
		$telNo =($_POST['hidTelno']);
	}
	
	if(isset($_POST['district'])){
	$district = mysql_real_escape_string($_POST['district']);	
	}
	else{
	$district = mysql_real_escape_string($_POST['hidDistrict']);
	}
	
	$db = new DBAccess();
	$dbConnection = $db->initConnection();
	
	
	
	$sql = "UPDATE `doctor` SET  `add`='".$dAddress."', `spId`='".$specialization."', `hId`='".$hospital."', `email`='".$email."', `telNo`='".$email."',`district`='".$district."' WHERE dId = '".$_SESSION['uid']."'";
	
	if ($query=mysql_query($sql,$dbConnection)){
		header("location:daccount.php?info=3"); 
	}
	else{
		header("location:daccount.php?info=8");
	}
?>
	
	
	
	

