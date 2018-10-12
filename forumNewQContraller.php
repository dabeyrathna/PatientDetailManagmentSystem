<?php
	require_once("DBAccess.php");
	session_start();
	$topic = sprintf('%s',mysql_real_escape_string($_POST["Topic"]));
	$question  =  sprintf('%s',mysql_real_escape_string($_POST["Question"]));
	$issueId  = $_POST["issue"];

try{
	$db = new DBAccess();
	$dbConnection = $db->initConnection();
	
	
	$query = "INSERT INTO forumquest (`uId`, `topic`, `question`,`issueId`, `time`) VALUES ('".$_SESSION['uid']."', '".$topic."' , '".$question."' , '".$issueId."',now())";
	$query = mysql_query($query,$dbConnection) or die("MySql Error".mysql_error());
	
	Header("Location:forumNewQ.php?info=1");
}
catch(Exception $e){
		Header("Location:errorPage.php?info=-1");
	}

?>