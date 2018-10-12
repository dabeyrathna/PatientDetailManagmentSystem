<?php
	session_start();
	$user = "";
	if(isset($_SESSION['uid'])){
			$user = $_SESSION['uid'];
	 
			require_once("timeout.php");
			isTimedOut();    
	}  
?>


<html>
<head>
<link rel="stylesheet" type="text/css" href="css/sty.css" />
<link rel="stylesheet" type="text/css" href="css/menustyle.css" />
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
        
		 
      

<?php 
			include 'hospitalDetailsController.php';
			$aList = getHospitalList();
		  	echo $aList;
		?>	
		
		</div>
		<?php 
			include 'footer.php';
		?>	

</div>

</body>
</html>





