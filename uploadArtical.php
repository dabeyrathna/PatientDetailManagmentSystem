<?php
	require_once("DBAccess.php");
	session_start();
	$tital = $_POST["Topic"];
	$desc  = $_POST["desc"];
	$issueId  = $_POST["issue"];



$target_dir = "uploads/";
$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
$uploadOk = 1;

if ($_FILES["fileToUpload"]["size"] > 500000) {
    echo "Sorry, your file is too large.\n";
	$uploadOk = 0;
}

if(pathinfo($target_file,PATHINFO_EXTENSION) != "pdf") {
    echo "Sorry, only PDF files are allowed.\n";
    $uploadOk = 0;
}

if ($uploadOk == 0) {
    echo "Sorry, your file was not uploaded.";

}
else
{
	$temp = explode(".", $_FILES["fileToUpload"]["name"]);
	$newfilename = 'A'.rand(10000,99999) . '.' . end($temp);
	
    if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_dir.$newfilename)) {
		$db = new DBAccess();
		$dbConnection = $db->initConnection();
		
		
		$query = "INSERT INTO article (`artId`, `dId`, `date`, `issueId`, `topic`, `description`) VALUES ('".$newfilename."', '".$_SESSION['uid']."', '".date("Y-m-d")."', '".$issueId."', '".$tital."', '".$desc."')";
		$query = mysql_query($query,$dbConnection) or die("MySql Error".mysql_error());
		
        echo "The file ". $newfilename. " has been uploaded.";
    } else {
        echo "Sorry, there was an error uploading your file.";
    }
}


?>