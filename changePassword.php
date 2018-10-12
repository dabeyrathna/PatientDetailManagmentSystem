<?php
		session_start();
		
 		if (!isset($_SESSION["uid"]))
        {
        	header("Location: errorPage.php?info=7");
        }
	   else if($_SESSION["uid"][0] != 'D' && $_SESSION["uid"][0] != 'd' && $_SESSION["uid"][0] != 'P' && $_SESSION["uid"][0] != 'p' && $_SESSION["uid"][0] != 'E' && $_SESSION["uid"][0] != 'e')
	    {
				header("Location:errorPage.php?info=66666");
		}
		else
		{   
			require_once("timeout.php");
			isTimedOut();    
		} 


	require_once ("DBAccess.php");  
		
	
	if(isset($_POST['currPass']) && isset($_POST['newPass']) && isset($_POST['reNewPass'])){
		$currPass = mysql_real_escape_string($_POST['currPass']);
		$newPass = mysql_real_escape_string($_POST['newPass']);
		$reNewPass = mysql_real_escape_string($_POST['reNewPass']);
		$email = mysql_real_escape_string($_POST['email']);
		
		$db = new DBAccess();
		$dbConnection = $db->initConnection();
		
		
		if($_SESSION["uid"][0] == 'D' || $_SESSION["uid"][0]=='d'){
			$sql1 = "SELECT dPass from doctor where did = '".$_SESSION['uid']."'";
			$query=mysql_query($sql1,$dbConnection);
			$row=mysql_fetch_assoc($query);
			
			if(md5($currPass) == $row['dPass'] && md5($newPass) != $row['dPass']&& $reNewPass == $newPass) 
			{
				$sql2 = "UPDATE doctor set dPass='".md5($newPass)."' WHERE did ='".$_SESSION['uid']."'";
				if($query=mysql_query($sql2,$dbConnection))
				{
					include("Mailing/mail.php");
					sendMailDCP($email,$name, $newPass);
					
					header("location:editDDetails.php?info=12");
					
				}
				else
				{
					header("location:editDDetails.php?info=13");	
				}
			}
			else{
				header("location:editDDetails.php?info=14");	
			}
		}
			
			
			
			
			
			
		else if($_SESSION["uid"][0] == 'P' || $_SESSION["uid"][0]=='p')
		{
			$sql1 = "SELECT pPass from patient where pid = '".$_SESSION['uid']."'";
			$query=mysql_query($sql1,$dbConnection);
			$row=mysql_fetch_assoc($query);
			
			if(md5($currPass) == $row['pPass'] && md5($newPass) != $row['pPass']&& $reNewPass == $newPass) )
			{
				$sql2 = "UPDATE patient set pPass= '".md5($newPass)."' WHERE pid ='".$_SESSION['uid']."'";
				if($query=mysql_query($sql2,$dbConnection))
				{
					header("location:editPDetails.php?info=12");	
				}
				else
				{
					header("location:editPDetails.php?info=13");	
				}
			}
			else{
				header("location:editPDetails.php?info=14");	
			}
		}
		
		else if($_SESSION["uid"][0] == 'E' || $_SESSION["uid"][0]=='e')
		{
			$sql1 = "SELECT ePass from patient where eid = '".$_SESSION['uid']."'";
			$query=mysql_query($sql1,$dbConnection);
			$row=mysql_fetch_assoc($query);
			
			if(md5($currPass) == $row['ePass'])
			{
				$sql2 = "UPDATE employee set ePass= '".md5($newPass)."' WHERE eid ='".$_SESSION['uid']."'";
				if($query=mysql_query($sql2,$dbConnection))
				{					
					header("location:editEDetails.php?info=12");	
				}
				else
				{
					header("location:editEDetails.php?info=13");	
				}
			}
			else{
				header("location:editEDetails.php?info=14");	
			}
		}
	}
	else
	{
		if($_SESSION["uid"][0] == 'D' || $_SESSION["uid"][0]=='d'){
			header("location:editDDetails.php?info=15");	
		}
		else if($_SESSION["uid"][0] == 'P' || $_SESSION["uid"][0]=='p'){
			header("location:editPDetails.php?info=15");
		}
		else if($_SESSION["uid"][0] == 'E' || $_SESSION["uid"][0]=='e'){
			header("location:editEDetails.php?info=15");
		}
	}
?>
	
	
	
	

