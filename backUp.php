<?php
session_start();
if(isset($_SESSION['users']['eid']))
{


include("connection.php");
require('Backups\backup_restore.class.php');
$newImport = new backup_restore ('localhost','bisreg','root','','*');

$result="";

if(isset($_REQUEST['backup'])){
	$message=$newImport -> backup ();
	$result = $message;
}
if(isset($_REQUEST['restore'])){

		$message=$newImport -> restore ($_POST['FileDialog']);
		echo $message;
}


?>


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Home Page</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/jquery.dropotron-1.0.js"></script>
<script type="text/javascript" src="js/jquery.slidertron-1.1.js"></script>
<script type="text/javascript">
	$(function() {
		$('#menu > ul').dropotron({
			mode: 'fade',
			globalOffsetY: 11,
			offsetY: -15
		});
	});
	
	
	
	function validate()
	{
		var path= document.getElementById("FileDialog").value;
		
		if(path=="")
		{
			alert("Please select sql file to restore database");
			path.focus();
			return false;
		}
		else
		{
			document.forms["myform"].submit();
			return true;
		}
	}
	
</script>



<style>
		.rounded-corners {
			 -moz-border-radius: 40px;
			-webkit-border-radius: 40px;
			-khtml-border-radius: 40px;
			border-radius: 40px;
		}
		.rounded-corners-top {
			 -moz-border-top-radius: 40px;
			-webkit-border-radius: 40px;
			-khtml-border-radius: 40px;
			border-radius: 40px;
		}
		
		#register-form {
			background: url("form-fieldset.gif") repeat-x scroll left bottom #F8FDEF;
			border: 1px solid #DFDCDC;
			border-radius: 15px 15px 15px 15px;
			display: inline-block;
			margin-bottom: 30px;
			margin-left: 20px;
			margin-top: 10px;
			padding: 25px 50px 10px;
			width: 350px;
		}
</style>
</head>
<body>
<div id="wrapper">
	<div id="header">
		
</div>
	<div id="menu">
  	<ul>
    
    		<li><a href="index.php">Home</a></li>
            <li><a href="introduction.php">Introduction</a></li>
            <li class="first">
            <span class="opener">Login<b></b></span>
				<ul>
					<li><a href="userLogin.php"><img align="middle" src="images/Buttons/log.png"/>User</a></li>
					<li><a href="employeeLogin.php"><img align="middle" src="images/Buttons/log.png"/>Employee</a></li>
				</ul>
				<li class="first">
				<span class="opener">Services<b></b></span>
				<ul>
                	<li><a onClick="ajaxPending(1);"><img align="middle" src="images/Buttons/search.png"/>Pending List</a></li>
					<li><a onClick="ajaxPending(2);"><img align="middle" src="images/Buttons/search.png"/>Search User</a></li>
					<li><a onClick="ajaxPending(3);"><img align="middle" src="images/Buttons/search.png"/>Business Registration</a></li>
				</ul>
			</li>
			<li>
				<span class="opener">Editing<b></b></span>
				<ul>
					<li><a onClick="ajaxPending(5);"><img align="middle" src="images/Buttons/search.png"/>Emendation List</a></li>
					<li><a onClick="ajaxPending(6);"><img align="middle" src="images/Buttons/search.png"/>Cancellation List</a></li>
					
				</ul>
			</li>
            <li class="last"><a style="font-size:14px;color: rgb(0, 232, 232);" href="#"><?php echo " Logged :".$_SESSION['users']['eid'];?></a>
            	<span class="opener"><b></b></span>
				<ul>
					<li><a href="logout.php?log=1">Logout</a></li>
				</ul>
            </li>
	  </ul>
        
		<br class="clearfix" />
	</div>
    
<div style="width:980px;" align="center">
	<div style="width:400px;" align="center" id="register-form">
    

    
    
        <form id="myform" method='post' action="backUp.php">
                <img align="middle" src="images/Buttons/backup.png"/>
                <h4 align="center">Database Backup</h4>
                <input type="submit"  name="backup" value="Backup">
                
                <p style="color:#0F0" align="center"><?php echo($result); ?></p>
                
                <br><input type="button" value="" class="HomeButton" onClick="window.location.href='adminIndex.php'"/>
        </form>
        
        
  </div>
  <div id="menu" style="background: #209D9D url(images/footer.png) repeat-x top left;border-top: none;border-bottom: none;margin:0px 0px 50px 0px;height: 90px;width: 890px;">		
<p align="center">&copy; Copyright 2012,All rights reserved by Kundasale Divisional Secretariat<br/>
Menikhinna, Kandy<br />
Sri Lanka</p>
</div> 
</div>
</body>
</html>


<?php

}
	else
	{
	
		$error ='<img align="middle" src="images/Buttons/dialog-error.png"/>
        				<h4 align="center">First You have to Loggin</h4>
						<table id="printTable" width="344" height="130" border="0">
                       	<tr><td width="184" height="126"><div style="border:2px;color:#FFC">
                                  <div align="center">
                                    <input type="button" value="" class="LoginButton" onClick="window.location.href=\'employeeLogin.php\'"/>
                                  </div>
                                </div></td>
                          <td width="150"><div style="border:2px;color:#FFC">
                            <div align="center">
                              <input type="button" value="" class="HomeButton" onClick="window.location.href=\'index.php\'"/>
                            </div>
                          </div></td>
                   	  </tr>

                    </table>';
	
		
?>		
		

		<html xmlns="http://www.w3.org/1999/xhtml">
		<head>
		<title>Home Page</title>
		<link rel="stylesheet" type="text/css" href="style.css" />
		<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
		<script type="text/javascript" src="js/jquery.dropotron-1.0.js"></script>
		<script type="text/javascript" src="js/jquery.slidertron-1.1.js"></script>
		<script type="text/javascript">
			$(function() {
				$('#menu > ul').dropotron({
					mode: 'fade',
					globalOffsetY: 11,
					offsetY: -15
				});
			});
			
			
		</script>
		
		
		
		<style>
				.rounded-corners {
					 -moz-border-radius: 40px;
					-webkit-border-radius: 40px;
					-khtml-border-radius: 40px;
					border-radius: 40px;
				}
				.rounded-corners-top {
					 -moz-border-top-radius: 40px;
					-webkit-border-radius: 40px;
					-khtml-border-radius: 40px;
					border-radius: 40px;
				}
				
				#register-form {
					background: url("form-fieldset.gif") repeat-x scroll left bottom #F8FDEF;
					border: 1px solid #DFDCDC;
					border-radius: 15px 15px 15px 15px;
					display: inline-block;
					margin-bottom: 30px;
					margin-left: 20px;
					margin-top: 10px;
					padding: 25px 50px 10px;
					width: 350px;
				}
		</style>
		</head>
		<body>
		<div id="wrapper">
			<div id="header">
				
		</div>
			<div id="menu">
			<ul>
			
					<li><a href="index.php">Home</a></li>
					<li><a href="introduction.php">Introduction</a></li>
					<li class="first">
					<span class="opener">Login<b></b></span>
						<ul>
							<li><a href="userLogin.php"><img align="middle" src="images/Buttons/log.png"/>User</a></li>
							<li><a href="employeeLogin.php"><img align="middle" src="images/Buttons/log.png"/>Employee</a></li>
						</ul>
					<li class="first">
						<span class="opener">Services<b></b></span>
						<ul>
							<li><a onClick="ajaxPending(1);"><img align="middle" src="images/Buttons/search.png"/>Pending List</a></li>
                            <li><a onClick="ajaxPending(2);"><img align="middle" src="images/Buttons/search.png"/>Search User</a></li>
                            <li><a onClick="ajaxPending(3);"><img align="middle" src="images/Buttons/search.png"/>Business Registration</a></li>
						</ul>
					</li>
					<li>
						<span class="opener">Editing<b></b></span>
						<ul>
							<li><a onClick="ajaxPending(5);"><img align="middle" src="images/Buttons/search.png"/>Emendation List</a></li>
					<li><a onClick="ajaxPending(6);"><img align="middle" src="images/Buttons/search.png"/>Cancellation List</a></li>
						</ul>
					</li>
					<li class="last"><a href="contactUs.php">Contact Us</a></li>
			  </ul>
				
				<br class="clearfix" />
			</div>
			
		<div style="width:980px;" align="center">
			<div style="width:400px;" align="center" id="register-form">
				<?php echo($error);?>
					
		  </div>
		</div>
        <div id="menu" style="background: #209D9D url(images/footer.png) repeat-x top left;border-top: none;border-bottom: none;margin:50px 0px 50px 0px;height: 90px;width: 890px;">		
            <p align="center">&copy; Copyright 2012,All rights reserved by Kundasale Divisional Secretariat<br/>
            Menikhinna, Kandy<br />
            Sri Lanka</p>
        </div> 
		</body>
		</html>
	<?php	
	}

?>