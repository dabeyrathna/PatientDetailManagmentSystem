
<?php

		session_start();
 		if (!isset($_SESSION["uid"]))
        {
        	Header("Location: errorPage.php?info=7");
        }
		else if($_SESSION["uid"][0] != 'E' && $_SESSION["uid"][0] != 'e' ){
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
        
      <form name="form2" method="post" id="regForm" enctype="multipart/form-data" action="historyUpdateController.php" class="hospital_form">
        <h1>Upload Patient Data<span></span>
            		</h1>
        <table id="printTable" width="100%" height="50%"  border="0" cellpadding="5" style="align:center;">
                    <tr>
                      <td height="5%" colspan="3" >
                      		<div align="center" style="color:#F00">
					  			<?php 
									if(isset($_GET['info']) && ($_GET['info'] == 4))
									{
										echo 'Error occurred. Please try again !!!';
									}
									else if(isset($_GET['info']) && ($_GET['info'] == 1)){
										echo 'Added successfully';
									}
										
								?>
                              </div></td>
                    </tr>
                    <tr>
                        <td height="5%" width="29%" >Patient ID</td>
                        <td height="5%" colspan="2"><input name="pId" type="text" id="pId" size="15"/></td>
					</tr>
					<tr>
					  <td height="5%" >Doctor ID</td>
					  <td height="5%" colspan="2"><input type="text" name="dId" id="dId" /></td>
		  </tr>
					<tr>
                        <td height="5%" width="29%" >Prescription ID</td>
                        <td height="5%" colspan="2"><input type="text" name="presId" id="presId" /></td>
					</tr><tr>
                           <td height="5%" width="29%"><label for="Hospital"> Hospital</label></td>
                        <td height="5%" id="hospital">
						<?php
						include 'dbread.php';
						$hospital = hospitalList(0); 
						echo $hospital;
						?> </td>
					</tr>
                      <tr>
                        <td height="5%" width="29%"><label for="desc">Description</label></td>
                        <td height="5%" colspan="2"><textarea name="desc" id="desc" cols="45" rows="5"></textarea></td>
					  </tr>
                     <tr>
                        <td height="5%" width="29%"><label for="patientStatus">Dead</label></td>
                        <td height="5%" colspan="2">
                        	<input type="radio" name="patientStatus" CHECKED id="patientStatusLive" value="0">Live
							<input type="radio" name="patientStatus" id="patientStatusDead" value="1">Dead
                            </td>
					  </tr>
                        <tr>
                          <td height="5%" width="29%"><label for="report" id="report">Reports</label></td>
                        <td height="5%" colspan="2"><input type="file" id="reports" name="report[]" title="ssssss" multiple/>
                        <p style="font-size:12px">(Hint : Select multiple reports)</p></td>
					  </tr>
					  </tr>
 
                        <tr>
                          <td height="5%" width="29%"> </td>
                        <td height="5%" width="13%"><div align="right">
                          <input type="submit" name="submit" value="Submit" id= "button">
                          <input type="reset" name="reset" value="Reset" id= "button">
                        </div></td>
                        <td width="36%">&nbsp;</td>
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
