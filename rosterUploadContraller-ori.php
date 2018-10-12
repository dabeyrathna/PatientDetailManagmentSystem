<?php
	require_once("DBAccess.php");
	session_start();
	
	$desc  = $_POST["desc"];
	



$target_dir = "rosterUploads/";
$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
$uploadOk = 1;

if ($_FILES["fileToUpload"]["size"] > 5000000) {
    echo "Sorry, your file is too large.\n";
	$uploadOk = 0;
}

if(pathinfo($target_file,PATHINFO_EXTENSION) != "xlsx") {
     Header("Location:errorPage.php?info=10");
    $uploadOk = 0;
}

if ($uploadOk == 0) {
    Header("Location:errorPage.php?info=9");

}
elseif ($uploadOk == 1)
{
	$temp = explode(".", $_FILES["fileToUpload"]["name"]);
	$newfilename = 'Roster'.date("D-M-Y") . '.' . end($temp);
	
  

	 if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_dir.$newfilename)){
		$db = new DBAccess();
		$dbConnection = $db->initConnection();
		
		$query = "INSERT INTO rosters (`rosterId`, `empId`, `date`, `description`) VALUES ('".$newfilename."', '".$_SESSION['uid']."', '".date("Y-m-d")."', '".$desc."')";
		$query = mysql_query($query,$dbConnection)
		 
       header("Location:successPage.php?info=4");
   } 
	else {
         header("Location:errorPage.php?info=9");
    } 

}
?>