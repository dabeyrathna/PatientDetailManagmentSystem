
<?php

		session_start();
 		if (!isset($_SESSION["uid"]))
        {
        	Header("Location: errorPage.php?info=7");
        }
		else if($_SESSION["uid"][0] != 'S' && $_SESSION["uid"][0] != 's' ){
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
        
      <form name="form2" method="post" id="regForm" enctype="multipart/form-data" action="statisticsUploadContraller.php" class="hospital_form">
                 <h1>Upload an statistic<span></span>
            		</h1>
        <table id="printTable" width="100%" height="50%"  border="0" cellpadding="5" style="align:center;">
                    <tr>
                        <td height="5%" width="29%" >Topic</td>
                        <td height="5%" colspan="2"><input type="text" name="Topic" id="Topic" /></td>
		  </tr>
                      <tr>
                        <td height="5%" width="29%"><label for="desc">Description</label></td>
                        <td height="5%" colspan="2"><textarea name="desc" id="desc" cols="45" rows="5"></textarea></td>
					  </tr>
					  </tr>
                        <tr>
                          <td height="5%" width="29%" style="color:#F00">&nbsp;</td>
                        <td height="5%" colspan="2">
						
						<?php 
						if(isset($_GET['info'])){
								if($_GET['info']==2)
								{
									echo "<p style='color:#00F' > File has successfully added </p>";
								}
								else if($_GET['info']==3)
								{
									echo "<p style='color:#F00' > Error occured. Please try again </p>";
								}
						}
						?>
						</td>
					  </tr></tr>
                        <tr>
                          <td height="5%" width="29%"><label for="contactNumber">Select the statistic</label></td>
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
