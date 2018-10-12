
<?php

		session_start();
 		if (!isset($_SESSION["uid"]))
        {
        	Header("Location: errorPage.php?info=7");
        }
		else if($_SESSION["uid"][0] != 'D' && $_SESSION["uid"][0] != 'd' && $_SESSION["uid"][0] != 'P' && $_SESSION["uid"][0] != 'p' ){
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

<script type="text/javascript">
function messageHide(){
		document.getElementById('message').innerHTML = "";
	}
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
        
      <form name="form2" method="post" id="regForm" enctype="multipart/form-data" action="forumNewQContraller.php" class="hospital_form">
                 <h1>Add new Question<span></span>
            		</h1>
        <table id="printTable" width="100%" height="50%"  border="0" cellpadding="5" style="align:center;">
                    <tr>
                        <td height="5%" width="29%" >Discussion topic</td>
                        <td height="5%" colspan="2"><input type="text" name="Topic" id="Topic" onKeyPress="messageHide()" /></td>
		  </tr>
                      <tr>
                        <td height="5%" width="29%"><label for="desc">Question</label></td>
                        <td height="5%" colspan="2"><textarea name="Question" id="Question" cols="45" rows="5" onKeyPress="messageHide()"></textarea></td>
					  </tr>
                        <tr>
                          <td height="5%" width="29%"><label for="issue">Issue Catagory</label></td>
                        <td height="5%" colspan="2">
                        <?php
						include 'dbread.php';
						$issueList = healthIssueList(0); 
						echo $issueList;
						?>                        
                       </td>
					  </tr>
					
                        <tr>
                          <td height="5%" colspan="3" align="center"><p id="message" style="color:#00F"><?php if(isset($_GET['info'])){echo 'Your question has been added to the forum successfully.';} ?>
                          </p><div align="center"></div></td>
					     </tr>
                        <tr>
                          <td height="5%" colspan="3">
                            <div align="center">
                              <input type="submit" name="submit" value="Submit" id= "button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               <input type="reset" name="reset" value="Reset" id= "button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               <input type="button" name="submit" value="Back" id= "button" onClick="location.href = 'forumQList.php';">
                          </div>                           </td>
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
