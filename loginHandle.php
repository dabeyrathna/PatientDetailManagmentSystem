<?php

    require_once("DBAccess.php");
      
      
	  $username=$_POST["username"];
	  $password=$_POST["password"];


	  
	if($username[0] == 'P' || $username[0] == 'p')
  	{
			if(($username=="")||($password==""))
			{
				header("location:login.php?info=1");
			}
			else
			{  
				$db = new DBAccess();
				$dbConnection = $db->initConnection();
				$queryString=sprintf("SELECT * FROM patient WHERE pid='%s' ",mysql_real_escape_string($username));         
				$query = mysql_query($queryString,$dbConnection) or die("MySql Error".mysql_error());
				$noOfRaws = mysql_num_rows($query); 
				
				if($noOfRaws==1)
				{            
					$rec = mysql_fetch_assoc($query);
					if($rec["pPass"] == md5($password)) // if($dbPass == md5($password) && $rec["active"]>0)
					{
					//		$queryString="UPDATE patient SET active=1 WHERE pid='".mysql_real_escape_string($username)."'";
					//		mysql_query($queryString) or die ("MySql Error ".mysql_error());
							
							session_start();  
									
							$_SESSION["uid"] = $username;
							$_SESSION["lastAction"] = time();
							$_SESSION["timeOut"]=5000;										 
							header("location:index.php?info=1");			 
							
					}
					else
					{
							header("location:login.php?info=3");//Invalid password
					}
		  
				}
				else
				{
				   header("location:login.php?info=6");  //Invalid User
				}
    		}
	}
	else if($username[0] == 'D' || $username[0] == 'd')
	{
		if(($username=="")||($password==""))
			{
				header("location:login.php?info=1");
			}
			else
			{  
				$db = new DBAccess();
				$dbConnection = $db->initConnection();
				$queryString=sprintf("SELECT * FROM doctor WHERE did='%s' ",mysql_real_escape_string($username));         
				$query = mysql_query($queryString,$dbConnection) or die("MySql Error".mysql_error());
				$noOfRaws = mysql_num_rows($query); 
				
				if($noOfRaws==1)
				{            
					$rec = mysql_fetch_assoc($query);
					if($rec["dPass"] == md5($password)) // if($dbPass == md5($password) && $rec["active"]>0)
					{
					//		$queryString="UPDATE patient SET active=1 WHERE did='".mysql_real_escape_string($username)."'";
					//		mysql_query($queryString) or die ("MySql Error ".mysql_error());
							
							session_start();  
									
							$_SESSION["uid"] = $username;
							$_SESSION["lastAction"] = time();
							$_SESSION["timeOut"]=5000;			 
							header("location:index.php?info=1");			 
							
					}
					else
					{
							header("location:login.php?info=3");//Invalid password
					}		  
				}
				else
				{
				   header("location:login.php?info=5");  //Invalid User
				}
    		}
	}
	else if($username[0] == 'S' || $username[0] == 's')
	{
	if(($username=="")||($password==""))
			{
				header("location:login.php?info=1");
			}
			else
			{  
				$db = new DBAccess();
				$dbConnection = $db->initConnection();
				$queryString=sprintf("SELECT * FROM statistician WHERE sid='%s' ",mysql_real_escape_string($username));         
				$query = mysql_query($queryString,$dbConnection) or die("MySql Error".mysql_error());
				$noOfRaws = mysql_num_rows($query); 
				
				if($noOfRaws==1)
				{            
					$rec = mysql_fetch_assoc($query);
					if($rec["sPass"] == md5($password)) // if($dbPass == md5($password))
					{
					//		$queryString="UPDATE patient SET active=1 WHERE did='".mysql_real_escape_string($username)."'";
					//		mysql_query($queryString) or die ("MySql Error ".mysql_error());
							
							session_start();  
									
							$_SESSION["uid"] = $username;
							$_SESSION["lastAction"] = time();
							$_SESSION["timeOut"]=5000;			 
							header("location:saccount.php?info=1");			 
							
					}
					else
					{
							header("location:login.php?info=3");//Invalid password
					}		  
				}
				else
				{
				   header("location:login.php?info=5");  //Invalid User
				}
    		}	
	}
	else if($username[0] == 'E' || $username[0] == 'e')
	{
	if(($username=="")||($password==""))
			{
				header("location:login.php?info=1");
			}
			else
			{  
				$db = new DBAccess();
				$dbConnection = $db->initConnection();
				$queryString=sprintf("SELECT * FROM hospital_emp WHERE empId='%s' ",mysql_real_escape_string($username));         
				$query = mysql_query($queryString,$dbConnection) or die("MySql Error".mysql_error());
				$noOfRaws = mysql_num_rows($query); 
				
				if($noOfRaws==1)
				{            
					$rec = mysql_fetch_assoc($query);
					if($rec["ePass"] == md5($password)) // if($dbPass == md5($password) && $rec["active"]>0)
					{
							session_start();  
									
							$_SESSION["uid"] = $username;
							$_SESSION["lastAction"] = time();
							$_SESSION["timeOut"]=5000;			 
							header("location:eaccount.php?info=1");			 
							
					}
					else
					{
							header("location:login.php?info=3");//Invalid password
					}		  
				}
				else
				{
				   header("location:login.php?info=5");  //Invalid User
				}
    		}	
	}
	
	
	else if($username[0] == 'A' || $username[0] == 'a')
	{
	if(($username=="")||($password==""))
			{
				header("location:login.php?info=1");
			}
			else
			{  
				$db = new DBAccess();
				$dbConnection = $db->initConnection();
				$queryString=sprintf("SELECT * FROM admin WHERE aId='%s' ",mysql_real_escape_string($username));         
				$query = mysql_query($queryString,$dbConnection) or die("MySql Error".mysql_error());
				$noOfRaws = mysql_num_rows($query); 
				
				if($noOfRaws==1)
				{            
					$rec = mysql_fetch_assoc($query);
					if($rec["aPass"] == ($password)) // if($dbPass == md5($password) && $rec["active"]>0)
					{
							session_start();  
									
							$_SESSION["uid"] = $username;
							$_SESSION["lastAction"] = time();
							$_SESSION["timeOut"]=5000;			 
							header("location:aaccount.php?info=1");			 
							
					}
					else
					{
							header("location:login.php?info=3");//Invalid password
					}		  
				}
				else
				{
				   header("location:login.php?info=5");  //Invalid User
				}
    		}	
	}
	else
	{
		header("location:login.php?info=4");  //Invalid User
	}
    
?>
