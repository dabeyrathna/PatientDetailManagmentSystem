
<?php
	session_start();
	$message = "";
	if($_GET["info"] == 2){
		 $message .= "<h3>Request Accepted</h3>
	          <h3>Email sent</h3>";
	}
	
	else if($_GET["info"] == 3){
		$message .= "<h3>Request Success</h3>
	          <h3>Please Check your email for User Name and Password within 24 Hours...</h3>";;
	}	
	else if($_GET["info"] == 4){
		$message .= "<h3>Uploading Success.</h3>
	          <h3>Thank you...</h3>";
	}
	
	else
	{
		$message .= "<h3>success...</h3>";
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
               
           <form action="loginHandle.php" method="post" class="hospital_form">
            <h1>Success... 
              <span>...</span>
            </h1>
          <table width="352" height="191" border="0" align="center">
          <tr>
          <td align="center"><img height="100px" width="100px" align='center' src='images/success.png'></td>
          </tr>
            <tr>
		      <td align="center" colspan="2"><?php echo $message; ?></td>
	        </tr>
            <tr>
		      <td width="162" height="49" align="center">		        
		          <input type="button" onClick="location.href = 'index.php';" class="button" value="Home" />
              </td>
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
