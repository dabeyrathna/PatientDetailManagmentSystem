<?php
    session_start();
    require_once("DBAccess.php");  
	$db = new DBAccess();
	$dbConnection = $db->initConnection();

	if($_GET['no']==1){

		$date = $_GET["date"];
		
		if($_GET["tital"] == ""){
			$tital = "Appointment added on ".date("Y-m-d");
		}
		else{
			$tital  = $_GET["tital"];
		}
		
		if($_GET["desc"] == ""){
			$desc = "No description";
		}
		else{
			$desc  = $_GET["desc"];
		}
		$sql = "INSERT INTO `appointment`(`date`, `tital`, `description`, `did`) VALUES ('".$date."','".$tital."','".$desc."','".$_SESSION['uid']."')";
		
		if($query=mysql_query($sql,$dbConnection) or die("SQL Error ".mysql_error())){
			
			echo "added successfully."; 	
		}
		else{
			echo "Error... Try again.";
		}
	}
	else if($_GET['no']==2){
		$date = $_GET["date"];
		
		$sql = "SELECT * FROM `appointment` WHERE date = '".$date."' LIMIT 1";
		$query=mysql_query($sql,$dbConnection);
		
		if(mysql_num_rows($query) > 0){
			$rec = mysql_fetch_assoc($query);
			echo $rec['tital']." : ".$rec['description'];
		}
		else{
			echo "no appoinment for this time slot";
		}
	}
	
?>