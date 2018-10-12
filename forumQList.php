
<?php

		session_start();
 		if (!isset($_SESSION["uid"]))
        {
        	Header("Location:login.php");
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
<script type="text/javascript" src="js/tables.js"></script>

<style type="text/css">

	.button-link {
		text-decoration: none;
		padding: 10px 15px;
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

	.button-link:hover, .button-link:focus {
		background: #356094;
		border: solid 1px #2A4E77;
		text-decoration: none;   
		-webkit-transition-duration: 0.2s;
		-moz-transition-duration: 0.2s;
		transition-duration: 0.2s;
	}

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

	
	#table {
		border: 1px solid #339900;
		background-color: #99CC00;
		width: 118.3%;
		margin: -51px;
		-moz-border-radius: 3px;
		-webkit-border-radius: 3px;
		border-radius: 3px;
		font-family: Arial,"Bitstream Vera Sans",Helvetica,Verdana,sans-serif;
		color: #000000;
	}
	#table td, #table th {
		border-top-color: white;
		border-bottom: 1px solid #DFDFDF;
		color: #000000;
	}
	#table th {
		text-shadow: rgba(255, 255, 255, 0.796875) 0px 1px 0px; 
		font-family: Georgia,"Times New Roman","Bitstream Charter",Times,serif;
		font-weight: normal;
		padding: 7px 7px 8px;
		text-align: left;
		line-height: 1.3em;
		font-size: 14px;
	}
	#table td {
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

        
        <div id="page" style="min-height:400px">  
        
    		<table align="center">
            	<tr>
                     	<td><p align="center"><a class="button-link" style="cursor:pointer;padding: 3px 10px;" href = "forumNewQ.php">Ask New Question</a></p></td>
                    <td><span id='errorPid'></span></td>
                </tr>
            </table>   
           <hr><br>
        
        
        
          <?php
		  	include 'forumQListController.php';
			$fList = getForumList();
		  	echo $fList;
		  ?>
        
        </div>

	 	<?php 
			include 'footer.php';
		?>	
 </div>

  </body>
 </html>
