
<?php

		session_start();

		$user = "";
		if(isset($_SESSION['uid'])){
			$user = $_SESSION['uid'];
	 
			require_once("timeout.php");
			isTimedOut();    
		}

		$passError = "";
		$userError = "";
		if(isset($_GET["info"])){
		
			$message = "";
			if($_GET["info"] == 3){
				$passError = "<p>incorrect</p>";
			}	
			else if($_GET["info"] == 4){
				$userError = "<p>incorrect</p>";
			}
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
            <h1>Sign in to continue 
              <span>Something about login............</span>
            </h1>
          <table width="405" height="191" border="0" align="center">
            <tr>
		      <td width="124"><label><span>User Name :</span></label></td>
		      <td width="149"><div align="center">
		          <input name="username" type="text" id="username" size="100" maxlength="100" width="100px" placeholder="User name">
	          </td>
		      <td width="118"><span id="spanUser" style='color:red; font-size:14;'><?php echo $userError; ?></span></td>
	        </tr>
            <tr>
		      <td><label><span>Password :</span></label></td>
		      <td><input id="password" type="password" name="password" placeholder="" /></td>
		      <td><span id="spanPass" style='color:red; font-size:14;'><?php echo $passError; ?></span></td>
	        </tr>
            <tr>
		      <td height="49" colspan="2">
              <div align="center">
		        <input type="submit" class="button" value="Login" /> &nbsp;&nbsp;&nbsp;&nbsp;
                <input type="Reset" name="Reset" class="button" value="Reset">
              </div>
              </td>
		      <td>&nbsp;</td>
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
