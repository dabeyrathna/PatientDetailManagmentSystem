
<?php
	session_start();
	$message = "";
	if($_GET["info"] == 2){
		 $message .= "<h3>You have logged in to your account already.</h3>
	          <h3>If it is not you, it is possible, some one has logged in to your account. Beter to change your account passowrd.</h3>";
	}
	else if($_GET["info"] == 3){
		$message .= "<h3>The password you have entered is not correct.</h3>
	          <h3>Please try again...</h3>";
	}	
	else if($_GET["info"] == 4){
		$message .= "<h3>The User name you have entered is not correct.</h3>
	          <h3>Please try again...</h3>";
	}
	else if($_GET["info"] == 6){
		$message .= "<p align='center'>User time out</p>";
	}
	else if($_GET["info"] == 7){
		$message .= "<h3>Unauthorized page</h3>
	          <h3>Please login first...</h3>";;
	}
	
	else if($_GET["info"] == 8){
		$message .= "<h3>Sorry</h3>
	          <h3>Something wrong with your request...</h3>";
	}
	
	else if($_GET["info"] == 9){
		$message .= "<h3>Sorry</h3>
	          <h3>Something wrong with your Uploading...</h3>";
	}
	
	else if($_GET["info"] == 10){
		$message .= "<h3>Sorry</h3>
	          <h3>Only JPG Images Are Allowed (.htm)  are allowed.</h3>";
	}
	
	else if($_GET["info"] == 11){
		$message .= "<h3>Sorry</h3>
	          <h3>Your file is too large.</h3>";
	}
	
	else if($_GET["info"] == 13){
		$message .= "<div id='closeTab' onFocus='window.close();'> Error </div>";
	}
	
	else
	{
		$message .= "<h3>Unknown error...</h3>";
	}
?>

<html>
<head>
<link rel="stylesheet" type="text/css" href="css/sty.css" />
<link rel="stylesheet" type="text/css" href="css/menustyle.css" />
<script type="text/javascript">


	function popupcloase() {
			window.close();
	}
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
               
           <form action="loginHandle.php" method="post" class="hospital_form">
            <h1>Error... 
              <span>The most possible coused can be...</span>
            </h1>
          <table width="352" height="191" border="0" align="center">
          <tr>
          <td align="center"><img align='center' src='images/dialog-error.png'></td>
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
