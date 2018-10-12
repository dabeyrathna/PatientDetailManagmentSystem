
<?php
		session_start();
 		if (!isset($_SESSION["uid"]))
        {
        	header("Location: errorPage.php?info=7");
        }
	   else if($_SESSION["uid"][0] != 'P' && $_SESSION["uid"][0] != 'p')
	    {
			header("Location:errorPage.php?info=7");
		}
		
		else
		{   
			require_once("timeout.php");
			isTimedOut();    
		} 
		
	require_once ("DBAccess.php");  
		
	if(isset($_POST['dAddress'])){
		$dAddress = mysql_real_escape_string($_POST['dAddress']);
	}
	else{
		$dAddress = mysql_real_escape_string($_POST['hidAddress']);
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
	
	
	
	$sql = "UPDATE `patient` SET `add`='".$dAddress."',`email`='".$email."', `telNo`='".$email."',`district`='".$district."' WHERE pId = '".$_SESSION['uid']."'";
	
	
	echo $sql;
	if ($query=mysql_query($sql,$dbConnection)){
		header("location:paccount.php?info=3"); 
	}
	else{
		header("location:paccount.php?info=8");
	}  
?>
	
	
	
	

