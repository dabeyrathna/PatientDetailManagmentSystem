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
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/tables.js"></script>

<style type="text/css">

	

	.paging-link {
		text-decoration: none;
		padding: 2px 5px;
		background: #4479BA;
		color: #FFF;-webkit-border-radius: 4px;
		-moz-border-radius: 4px;
		border-radius: 4px;
		border: solid 1px #20538D;
		text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.4);
		-webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.4), 0 1px 1px rgba(0, 0, 0, 0.2);
		-moz-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.4), 0 1px 1px rgba(0, 0, 0, 0.2);
		box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.4), 0 1px 1px rgba(0, 0, 0, 0.2);
	}

	.paging-link:hover, .paging-link:focus {
		background: #356094;
		border: solid 1px #2A4E77;
		text-decoration: none;   
		-webkit-transition-duration: 0.2s;
		-moz-transition-duration: 0.2s;
		transition-duration: 0.2s;
	}

	
	#table,#table1 {
		border: 1px solid #339900;
	
		background-color:#99CC00;
		box-shadow: 0px 5px 5px #000000;
		width: 100%;
		-moz-border-radius: 10px;
		-webkit-border-radius: 10px;
		border-radius: 3px;
		font-family: Arial,"Bitstream Vera Sans",Helvetica,Verdana,sans-serif;
		color: #000000;
	}
	#table td, #table th, #table1 td, #table1 th  {
		border-top-color: black;
		border-bottom: 1px solid #DFDFDF;
		color: #000;
	}
	#table th,#table1 th {
		text-shadow: rgba(255, 255, 255, 0.796875) 0px 1px 0px;
		font-family: Georgia,"Times New Roman","Bitstream Charter",Times,serif;
		font-weight: normal;
		padding: 7px 7px 8px;
		text-align: left;
		line-height: 1.3em;
		font-size: 14px;
	}
	#table td,#table1 td, {
		font-size: 12px;
		padding: 4px 7px 2px;
		vertical-align: top;
	}
	

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
			margin-left: -20px;
			margin-top: 10px;
			padding: 25px 50px 10px;
			width: 350px;
		}		

</style>
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
          <p>
            <?php 
			include 'contactDoctorsController.php';
			$list = getDoctorsList();
			echo $list;
			
			$homeButton='';
			$backButton='';
			
			if(strtolower($_SESSION['uid'][0]) == 'd'){
					$homeButton = '<div align="center"><a class="button-link1" href="index.php">&nbsp&nbsp&nbsp&nbsp&nbspHome&nbsp&nbsp&nbsp&nbsp</a>&nbsp&nbsp&nbsp&nbsp'; 
		  			$backButton = '<a class="button-link1" href="daccount.php">&nbsp&nbsp&nbsp&nbsp&nbsp&nbspBack&nbsp&nbsp&nbsp&nbsp&nbsp</a>&nbsp</div>'; 
			}
			else if(strtolower($_SESSION['uid'][0]) == 'e'){
					$homeButton = '<a class="button-link1" href="index.php">Home</a>&nbsp'; 
		  			$backButton = '<a class="button-link1" href="eaccount.php">Back</a>&nbsp';
			}
			else if(strtolower($_SESSION['uid'][0]) == 'p'){
					$homeButton = '<a class="button-link1" href="index.php">Home</a>&nbsp'; 
		  			$backButton = '<a class="button-link1" href="paccount.php">Back</a>&nbsp';
			}
			
			echo $homeButton;
			echo $backButton;
		
		?>
          </p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
        </div>

		<?php 
			include 'footer.php';
		?>	
 </div>
 </body>
 </html>