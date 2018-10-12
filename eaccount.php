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
		
		
			require_once("DBAccess.php");  
			$db = new DBAccess();
			$dbConnection = $db->initConnection();
			$str = "";
			$sql = "SELECT * FROM hospital_emp where empId= '".$_SESSION['uid']."'";	
			
			$query=mysql_query($sql,$dbConnection);
			$rows=mysql_fetch_array($query);
	
	
			$empId = $rows['empId'];
			$name = $rows['name'];
			$nic = $rows['nic'];
			$gender = $rows['gender'];
			$add = $rows['add'];
			$telNo = $rows['telNo'];
			$email = $rows['email'];
			
			$imgName = "defaultEmployee.jpg";
			
			if($rows['imageType'] != "")
				$imgName = $_SESSION['uid'].".".$rows['imageType'];
			else
				$imgName = 'defaultEmployee.jpg';

				  
   	
?>


<html>
<head>
<link rel="stylesheet" type="text/css" href="css/sty.css" />
<link rel="stylesheet" type="text/css" href="css/menustyle.css" />
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/tables.js"></script>
<script type="text/javascript">

function view(){

		document.getElementById("myDetails").style.height="auto";
		document.getElementById("myDetails").style.visibility="visible";
		document.getElementById("hide").style.visibility="visible";
		document.getElementById("view").style.visibility="hidden";
	}
	
function hide(){

		document.getElementById("myDetails").style.height="0";
		document.getElementById("myDetails").style.visibility="hidden";
		document.getElementById("hide").style.visibility="hidden";
		document.getElementById("view").style.visibility="visible";
	}		
</script>

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
  <div id="myDetails" style="visibility:hidden; height:0; ">
		  <table border="0" width="100%"> 
		  <tr>
		  <td width="70%">

     				<table width='96%'>
                        <tr width='100%'>
                          <th width='11%'>&nbsp;</th>
                        <th width='29%'><div align="left">Employee ID </div></th>
                        <td width='5%'>:                                                
                        <td width='42%'><?php echo $empId; ?></tr>
                        <tr>
                          <th width='11%'>&nbsp;</th>
                        <th width='29%'><div align="left">NAME</div></th>
                        <td width='5%'>:</td>
                        <td width='42%'><?php echo $name; ?></td></tr> 
                        <tr>
                          <th width='11%'>&nbsp;</th>
                        <th width='29%'><div align="left">NIC</div></th>
                        <td width='5%'>:</td>
                        <td width='42%'><?php echo $nic; ?></td></tr>
                        <tr>
                          <th width='11%'>&nbsp;</th>
                        <th width='29%'><div align="left">GENDER  </div></th>
                        <td width='5%'>:</td>
                        <td width='42%'><?php echo $gender; ?></td></tr>
                        <tr>
                          <th>&nbsp;</th>
                        <th><div align="left">ADDRESS  </div></th>
                        <td>:</td>
                        <td><?php echo $add; ?></td></tr>
                        <tr>
                          <th height="23">&nbsp;</th>
                        <th><div align="left">CONTACT NO </div></th>
                        <td>:</td>
                        <td><?php echo $telNo; ?></td></tr>
                        <tr>
                          <th>&nbsp;</th>
                        <th><div align="left">E-MAIL </div></th>
                        <td>:</td>
                        <td><?php echo $email; ?></td></tr>
                        <tr>
                          <th>&nbsp;</th>
                          <th colspan="3">&nbsp;</th>
                      </tr>
                        <tr>
                          <th>&nbsp;</th>
                          <th colspan="3"><a class='button-link' style='cursor:pointer;padding: 2px 2px;' href='editEDetails.php'>Edit Details</a></th>
                     </tr></table>
    	</td>             
         <td width="30%"> 
		 <img src="imgUploads/<?php echo $imgName; ?>" width="210" height="275" align="middle" class="profile-photo" />
		  </td>
		
 </tr>
		
 </tr>

</table>
</div>
<hr style="border:solid 1px #99FF00;"><br>
<input type="button" value=" View My Details" onClick="view()" id="view" class= "button-link1" style="visibility:visible;" >
<input type="button" value=" Hide My Details" onClick="hide()" id="hide" class= "button-link1" style="visibility:hidden;">
                 
          <a class="button-link1" href="contactDoctors.php">Contact Doctors</a>&nbsp; 
		  <a class="button-link1" href="rosterUpload.php">View SLMC</a>&nbsp; 
		  <a class="button-link1" href="rosterUpload.php"> Upload New Roster </a>&nbsp; 
		  <a class="button-link1" href="rosterList.php">Roster Details</a>&nbsp; 
		  <a class="button-link1" href="historyDataUpload.php">Update Patient Details</a>&nbsp; 

<hr style="border:solid 1px #99FF00;">
				
         
		  
            <div style="height:outo; Align:right;font:Times New Roman, serif;" id='reqList'>
        <?php
		  	include 'registrationRequestListController.php';
			$aList = getRequestList();
		  	echo $aList;
		  ?>

         
			
 </div>
 </div>
 	 <?php 
			include 'footer.php';
		?>
		</div>
 </body>
 </html>
