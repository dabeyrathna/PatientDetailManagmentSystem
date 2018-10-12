<?php
	session_start();
 		if (!isset($_SESSION["uid"]))
        {
        	Header("Location: errorPage.php?info=7");
        }
		else if($_SESSION["uid"][0] != 'A' && $_SESSION["uid"][0] != 'a' ){
				Header("Location:errorPage.php?info=7");
		}
		else{   
			require_once("timeout.php");
			isTimedOut();    
		}  
		
		
		require_once("DBAccess.php");  
		$db = new DBAccess();
		$dbConnection = $db->initConnection();


		require('Backups\backup_restore.class.php');
		$newImport = new backup_restore ('localhost','hospital','root','','*');

		$result="";
		
		if(isset($_REQUEST['backup'])){
			$message=$newImport -> backup ();
			$result = $message;
		}

?>


<html>
<head>
<link rel="stylesheet" type="text/css" href="css/sty.css" />
<link rel="stylesheet" type="text/css" href="css/menustyle.css" />
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript">


</script>
</head>

<body>
<div id="wrapper">
	<?php 
	
		include 'header.php';
    	include 'menu.php';
		
		$user = "";
		if(isset($_SESSION['uid'])){
			$user = $_SESSION['uid'];
		}
  		$man = selectMenu($user);
		echo $man;
	?>
        
		<br class="clearfix" />
		
        <div id="page">
         
		<hr style="border:solid 1px #99FF00;"><br>

		  <div align="right">        
            <a class="button-link1" href="employeeList.php">Activate/Deactivate Employee</a>&nbsp;      
          </div>

<hr style="border:solid 1px #99FF00;">
			<br/>
        </div>
        <div align="center">
           <form id="myform" method='post' action="backUp1.php">
                        <img align="middle" src="images/backup.jpg" height="233" width="172"/>
                        <h4 align="center">Database Backup</h4>
                        <input type="submit" class="button-link1"  name="backup" value="Backup">
                        
                        <p style="color:#0F0" align="center"><?php echo($result); ?></p>
                        
                        
                        <a class="button-link1" href="aaccount.php">&nbsp;&nbsp;&nbsp;Back&nbsp;&nbsp;&nbsp;&nbsp;</a>&nbsp;
                        
                </form>
          </div>

		<?php 
			include 'footer.php';
		?>	
 </body>
 </html>