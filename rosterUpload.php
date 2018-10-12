
<?php

		session_start();
 		if (!isset($_SESSION["uid"]))
        {
        	Header("Location: errorPage.php?info=7");
        }
		else if($_SESSION["uid"][0] != 'E' && $_SESSION["uid"][0] != 'E' ){
				Header("Location:errorPage.php?info=7");
		}
		else{   
			require_once("timeout.php");
			isTimedOut();    
		} 
		
		
?>

<html>
<head>
<link rel="stylesheet" type="text/css" href="css/sty.css" />
<link rel="stylesheet" type="text/css" href="css/menustyle.css" />
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
        
      <form name="form2" method="post" id="regForm" enctype="multipart/form-data" action="rosterUploadContraller.php" class="hospital_form">
                 <h1>Upload Roster<span></span>
            		</h1>
        <table id="printTable" width="100%" height="50%"  border="0" cellpadding="5" style="align:center;">
                    <tr>
                        <td height="5%" width="29%"  >Employee Id</td>
                        <td height="5%" colspan="2"><input type="text" name="employee" id="employee"  value="<?php echo $user?>"/></td>
		  </tr>
                      <tr>
                        <td height="5%" width="29%"><label for="desc">Description</label></td>
                        <td height="5%" colspan="2"><textarea name="desc" id="desc" cols="45" rows="5"></textarea></td>
					 
					  </tr>
					  <tr>
                        <td height="5%" width="29%"><label for="department">Department</label></td>
                        <td height="5%" colspan="2"><input type="text"name="department" id="department" cols="45" rows="5"/> <td>
					 
					  </tr>
                        <tr>
                          <td height="5%" width="29%">&nbsp;</td>
                        <td height="5%" colspan="2">&nbsp;</td>
					  </tr></tr>
                        <tr>
                          <td height="5%" width="29%"><label for="roster">Select the Roster</label></td>
                        <td height="5%" colspan="2"><input type="file" name="fileToUpload" id="fileToUpload"></td>
					  </tr>
					     </tr>
                        <tr>
                          <td height="5%" width="29%"> </td>
                        <td height="5%" width="13%"><div align="right">
                          <input type="submit" name="submit" value="Submit" id= "button">
                        </div></td>
                        <td width="36%"><input type="reset" name="reset" value="Reset" id= "button"></td>
					  </tr>
                      
        </table>
		  </form>
        
        </div>

		<?php 
			include 'footer.php';
		?>	
 </div>
 </body>
 </html>
