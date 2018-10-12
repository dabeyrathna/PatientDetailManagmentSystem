<?php

		session_start();
 		if (!isset($_SESSION["uid"]))
        {
        	Header("Location: errorPage.php?info=7");
        }
		else if($_SESSION["uid"][0] != 'A' && $_SESSION["uid"][0] != 'a' ){
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
		$sql = "SELECT * FROM admin where aId = '".$_SESSION["uid"]."'";	
			
				  
		$query=mysql_query($sql,$dbConnection) or die("SQL Error ".mysql_error());
		$rows=mysql_fetch_assoc($query);
		
		$imgName = "defaultAdmin.ico";
		$name = $rows['name'];
		$nic = $rows['nic'];
		$gender = $rows['gender'];
		$add = $rows['add'];
		$telNo = $rows['telNo'];
		$email = $rows['email'];
		$spId = $rows['regDate'];
		
	
		if($rows['imageType'] != "")
			$imgName = $_SESSION['uid'].".".$rows['imageType'];
			
?>


<html>
<head>
<link rel="stylesheet" type="text/css" href="css/sty.css" />
<link rel="stylesheet" type="text/css" href="css/menustyle.css" />
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
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
	
		background-color:#99CC00;
		box-shadow: 0px 5px 5px #000000;
		width: 118.3%;
		
		-moz-border-radius: 10px;
		-webkit-border-radius: 10px;
		border-radius: 3px;
		font-family: Arial,"Bitstream Vera Sans",Helvetica,Verdana,sans-serif;
		color: #000000;
	}
	#table td, #table th {
		border-top-color: black;
		border-bottom: 1px solid #DFDFDF;
		color: #000;
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
		
        <div id="page">
         <div id="myDetails" style="visibility:hidden; height:0; ">
		  <table border="0" width="100%"> 
		  <tr>
		  <td width="69%" height="259">
      
 
 		<table border='0' width='100%'>				
					<tr width='50%'>
					  <th width='10%'>&nbsp;</th>
					  <th width='28%'><div align="left">ADMINISTRATOR ID </div></th>
					  <td width='4%'>:                                            
					  <td width='50%'><?php echo $_SESSION['uid']; ?><td width="8%"></tr>
					<tr>
					  <th width='10%'>&nbsp;</th>
					  <th width='28%'><div align="left">NAME </div></th>
					  <td width='4%'>:                                            
					  <td width='50%'><?php echo $name ; ?><td></tr>
					<tr>
					  <th width='10%'>&nbsp;</th>
					  <th width='28%'><div align="left">NIC  </div></th>
					  <td width='4%'>:                                            
					  <td width='50%'><?php echo  $nic; ?><td></tr>
					<tr>
					  <th width='10%'>&nbsp;</th>
					  <th width='28%'><div align="left">GENDER</div></th>
					  <td width='4%'> :                                            
					  <td width='50%'><?php echo  $gender; ?><td></tr>
					<tr>
					  <th width='10%'>&nbsp;</th>
					  <th width='28%'><div align="left">ADDRESS  </div></th>
					  <td width='4%'>:                                            
					  <td width='50%'><?php echo $add;  ?><td></tr>
					<tr>
					  <th width='10%'>&nbsp;</th>
					  <th width='28%'><div align="left">CONTACT NO </div></th>
					  <td width='4%'>:                                            
					  <td width='50%'><?php echo $telNo ; ?><td></tr>
					<tr>
					  <th width='10%'>&nbsp;</th>
					  <th width='28%'><div align="left">E-MAIL </div></th>
					  <td width='4%'>:                                            
					  <td width='50%'><?php echo $email;  ?><td></tr>
					<tr>
					  <th>&nbsp;</th>
					  <th colspan="3">&nbsp;</th>
					  <td>                    
		    		</tr>
					
		</table>
 
        </td>             
                 <td width="31%">
                   <p><img class="profile-photo" align="middle" src="imgUploads/<?php echo $imgName; ?>" width="210" height="275"/></p>
            </td>
         </tr>

		</table>

	</div>
<hr style="border:solid 1px #99FF00;"><br>

		  <div align="right">        
            <a class="button-link1" href="#" onClick="view();" id="view" style="visibility:visible;" >View My Details</a>&nbsp; 
		  	<a class="button-link1" href="#" onClick="hide();" id="hide" style="visibility:hidden;">Hide My Details</a>&nbsp;

            <a class="button-link1" href="employeeList.php">Activate/Deactivate Employee</a>&nbsp;      
		  	<a class="button-link1" href="backUp1.php">Backups</a>&nbsp; 
          </div>

<hr style="border:solid 1px #99FF00;">
				<br/>
			
		<div>
<table width="100%"border="0" height="80%">
			
			<tr>

				 <td height="15%" >
				
				 
            </div>
			  </div></td>
				 </tr>

				  <tr>
				    
				    <td >		
				      
				      <div style ="width:95%; min-height:400px;background-color:#339900;box-shadow: 10px 10px 5px #000000;">
				      <br>
                      
				       	
				     <!-- <div id='appointmentDisplay' style="color:#06F;font-size:18px">
                      	
                      
                      </div>  -->
                      
                      
                     
				  <?php
		  	include 'employeeListController.php';
			$aList = getEmployeeList();
		  	echo $aList;
		  ?>
				 
                 
                 <div align="center" id="empList">
				 
				 </div>
			        </td>
			    </tr>
          </table>
		  </div>
       
        </div>

		<?php 
			include 'footer.php';
		?>	
 




</body>
 </html>