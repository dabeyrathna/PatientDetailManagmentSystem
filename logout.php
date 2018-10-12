<?php
session_start();
require_once("DBAccess.php");
if(isset($_GET['log']))
{
	
		/** LOG file **/
		$myFile = "Backups\login_ history.log";
		$fh = fopen($myFile, 'a') or die("can't open file");
		$stringData = "User	:	".$_SESSION['uid']."	Logout at: ".date('Y-m-d H:i:s')."\n";
		fwrite($fh, $stringData);
		fclose($fh);
		
		/** DBA object **/
		$db = new DBAccess();
		$dbConnection = $db->initConnection();
		
		$username = $_SESSION['uid'];
		unset($_SESSION['uid']);
		session_destroy();		
	
		
		if($_GET['log']==1)
		{		
			header("Location:errorPage.php?info=6");
		}
		else{
			header("Location:index.php");
		}		
}
else
{
		header("Location:index.php");
}
?>