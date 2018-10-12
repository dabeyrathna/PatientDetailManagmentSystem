<?php
	session_start();
	require_once("DBAccess.php");	
	$tital = $_POST["Topic"];
	$desc  = $_POST["desc"];



$target_dir = "uploads/";
$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
$uploadOk = 1;

if ($_FILES["fileToUpload"]["size"] > 500000) {
    echo "Sorry, your file is too large.\n";
	$uploadOk = 0;
}

if ($uploadOk == 0) {
    echo "Sorry, your file was not uploaded.";

}
else
{
	$temp = explode(".", $_FILES["fileToUpload"]["name"]);
	$statId = 'S'.rand(10000,99999).date("Y-m-d");
	$newfilename = $statId.".".end($temp);
	
    if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_dir.$newfilename)) {
		$db = new DBAccess();
		$dbConnection = $db->initConnection();
		
		$query = "INSERT INTO statistics (`statisticsId`,`uploader`, `date`,`title`, `description`) VALUES ('".$statId."', '".$_SESSION['uid']."', now(),'".$tital."', '".$desc."')";
	
	
		$query = mysql_query($query,$dbConnection) or die("MySql Error".mysql_error());
		
        header("Location:statisticsUpload.php?info=2");
    } else {
        header("Location:statisticsUpload.php?info=3");
    }

}


?>