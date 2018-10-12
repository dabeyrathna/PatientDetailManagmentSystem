<?php
	require_once("DBAccess.php");
	session_start();
/* 	$tital = $_POST["Topic"];
	$desc  = $_POST["desc"];
	$issueId  = $_POST["issue"]; */



$target_dir = "imgUploads/";
$target_file = $target_dir . basename($_FILES["ImageToUpload"]["name"]);
$uploadOk = 1;

if ($_FILES["ImageToUpload"]["size"] > 5000000) {
    echo "Sorry, your file is too large.\n";
	$uploadOk = 0;
}

if(strtolower(pathinfo($target_file,PATHINFO_EXTENSION)) != "jpeg" && strtolower(pathinfo($target_file,PATHINFO_EXTENSION)) != "jpg" && strtolower(pathinfo($target_file,PATHINFO_EXTENSION)) != "png")
 {
	echo pathinfo($target_file,PATHINFO_EXTENSION);
    echo "Sorry, only jpeg and png files are allowed.\n";
    $uploadOk = 0;
}

if ($uploadOk == 0) {
    echo "Sorry, your file was not uploaded.";

}
else
{
	$temp = explode(".", $_FILES["ImageToUpload"]["name"]);
	$newfilename = $_SESSION['uid'] . '.' . end($temp);
	
    if (move_uploaded_file($_FILES["ImageToUpload"]["tmp_name"], $target_dir.$newfilename)) {
		$db = new DBAccess();
		$dbConnection = $db->initConnection();
		
		$sql = '';

		
		
		if($_SESSION['uid'][0] == 'D' || $_SESSION['uid'][0] == 'd'){
			$sql = "UPDATE doctor set `imageType` = '".pathinfo($target_file,PATHINFO_EXTENSION)."' WHERE dId = '".$_SESSION['uid']."'";
			$query = mysql_query($sql,$dbConnection) or die("MySql Error".mysql_error());
			header("location:editDDetails.php?info=2");
		}
		else if($_SESSION['uid'][0] == 'P' || $_SESSION['uid'][0] == 'p')
		{
			$sql = "UPDATE patient set `imageType` = '".pathinfo($target_file,PATHINFO_EXTENSION)."' WHERE pId = '".$_SESSION['uid']."'";
			$query = mysql_query($sql,$dbConnection) or die("MySql Error".mysql_error());
			header("location:editPDetails.php?info=2");
		}
		else if($_SESSION['uid'][0] == 'E' || $_SESSION['uid'][0] == 'e')
		{
			$sql = "UPDATE patient set `imageType` = '".pathinfo($target_file,PATHINFO_EXTENSION)."' WHERE eId = '".$_SESSION['uid']."'";
			$query = mysql_query($sql,$dbConnection) or die("MySql Error".mysql_error());
			header("location:editEDetails.php?info=2");
		}

    } else {
        header("location:index.php?info=2");
    }
}


?>