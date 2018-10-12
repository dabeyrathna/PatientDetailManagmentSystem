<?php
	require_once("DBAccess.php");
	session_start();
	
	$desc  = $_POST["desc"];
	$department  = $_POST["department"];


$target_dir = "rosterUploads/";
$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
$uploadOk = 1;

if ($_FILES["fileToUpload"]["size"] > 50000000){ 
     header("Location:errorPage.php?info=11");
	$uploadOk = 0;
}

if(strtolower(pathinfo($target_file,PATHINFO_EXTENSION)) != "pdf") {
     header("Location:errorPage.php?info=10");
    $uploadOk = 0;
}

 else
{
	$temp = explode(".", $_FILES["fileToUpload"]["name"]);
	$newfilename = 'Roster'.date("D-M-Y");
     
	   }
	   
	   
	     if(move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_dir.$newfilename)){
		$db = new DBAccess();
		$dbConnection = $db->initConnection();
		
        $sql = "INSERT INTO rosters (`empId`, `date`, `description`, `department`) 
		VALUES ('".$_SESSION['uid']."', '".date("Y-m-d")."', '".$desc."', '".$department."')";
	echo $sql;
	$query = mysql_query($sql,$dbConnection);
		echo $query; 
		header("Location:successPage.php?info=4");
    }
	else {
         header("Location:errorPage.php?info=10");
    }  
?>