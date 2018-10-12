
<?php

		session_start();
 		if (!isset($_SESSION["uid"]))
        {
        	Header("Location: errorPage.php?info=7");
        }
	   else if($_SESSION["uid"][0] != 'E' && $_SESSION["uid"][0] != 'e')
	    {
				Header("Location:errorPage.php?info=7");
		}
		
		else
		{   
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
		border: 1px solid #DFDFDF;
		background-color: #F9F9F9;
		width: 118.3%;
		margin: -51px;
		-moz-border-radius: 3px;
		-webkit-border-radius: 3px;
		border-radius: 3px;
		font-family: Arial,"Bitstream Vera Sans",Helvetica,Verdana,sans-serif;
		color: #333;
	}
	#table td, #table th {
		border-top-color: white;
		border-bottom: 1px solid #DFDFDF;
		color: #555;
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
	 
		
     <?php
        
        
          
	require_once("DBAccess.php");  
			$db = new DBAccess();
			$dbConnection = $db->initConnection();
			$str = "";
			$sql = "SELECT * FROM hospital_emp where empId = '$user'";	
			$employee="Business Admin";

				  
   	$query=mysql_query($sql,$dbConnection) or die("SQL Error ".mysql_error());
	$rows=mysql_fetch_assoc($query);
      
				 
	$name=$rows['name'];
	$nic=$rows['nic']  ;
	$gender=$rows['gender']; 
	$add=$rows['add'];
	$telNo=$rows['telNo']; 
	$email=$rows['email'];
	$dob=$rows['dob'];

?>
  </div>	

<br class="clearfix" />
		  <div id="page">  
		 <div style="background-color:#F8F8F8;height:400px; Align:right;font:Times New Roman, serif;" id='content'> 
<form name="form2" method="post" action="addEditedDData.php" id="regForm" class="hospital_form">
                 <h1>
               <span>Please alter the data with correct details</span>
            		</h1>
                    <table id="printTable" width="80%" height="50%"  border="0" cellpadding="5" style="align:center;">
		
                    <tr>
                        <td height="5%" width="29%" ><label for="name">Name</label></td>
                        <td height="5%" colspan="2"><input type="text" name="name" id="name" placeholder="<?php echo $name;?>"/></td>
						<td><span id="spanname"></span></td>
                      </tr>
                      <tr>
                        <td height="5%" width="29%"><label for="address">Address</label></td>
                        <td height="5%" colspan="2"><textarea name="dAddress" id="dAddress" cols="45" rows="5" placeholder="<?php echo $add;?>" ></textarea></td>
						<td height="5%" width="22%"><span id="spanaddress"></span></td>
                      </tr>
                   
                      <tr>
                        <td height="5%" width="29%"><label for="nic">NIC</label></td>
                        <td height="5%" colspan="2"><input type="text" name="nic" id="nic" placeholder="<?php echo $nic;?>"/></td>
						<td height="5%" width="22%"><span id="spannic"></span></td>
                       
                      </tr>
                      <tr>
                       <td height="5%" width="29%"><label for="dob">Date of Birth</label></td>
                        <td height="5%" colspan="2"><input type="text" name="dob" id="dob" placeholder="<?php echo $dob;?>"></td>
						<td height="5%" width="22%"><span id="spandob"></span></td>
                       
                      </tr>
                        <tr>
                          <td height="5%" width="29%"><label for="email">email</label></td>
                        <td height="5%" colspan="2"><input type="text" name="email" id="email"  placeholder="<?php echo $email;?>" "/></td>
						<td height="5%" width="22%"><span id="spanemail"></span></td>
                      </tr>
                        <tr>
                          <td height="5%" width="29%"><label for="contactNumber">Contact Number</label></td>
                        <td height="5%" colspan="2"><input type="text" name="telno" id="telno" placeholder="<?php echo $telNo;?>" /></td>
						<td height="5%" width="22%"><span id="spantelno"></span></td>
                      </tr>
					  
					    <!--
						<tr>
                          <td height="5%" width="29%"><label for="workingHospital">Working Hospital</label></td>
                        <td height="5%" colspan="2" placeholder="<?php echo $hospital;?>">
						<?php
						
						$hospital = hospitalList(); 
						echo $hospital;
						?> </td>
						<td height="5%" width="22%"><span id="spanhospital"></span></td>
                      </tr>
					    -->
                        <tr>
						
						<input type="hidden" id = "hidName" name="hidName" value="<?php echo $name;?>">
						<input type="hidden" id = "hidAddress" name="hidAddress" value="<?php echo $add;?>">
						<input type="hidden" id = "hidEmail" name="hidEmail" value="<?php echo $email;?>">
						<input type="hidden" id = "hidSpecialization" name="hidSpecialization" value="<?php echo $specialization;?>">
						<input type="hidden" id = "hidHospital" name="hidHospital" value="<?php echo $hospital;?>">
						<input type="hidden" id = "hidDistrict" name="hidDistrict" value="<?php echo $district;?>">
						<input type="hidden" id = "hidTelNo" name="hidTelNo" value="<?php echo $telNo;?>">
						
                          <td height="5%" width="29%"> </td>
                        <td height="5%" width="13%"><div align="right">
                          <input type="submit" name="submit" value="Update" id= "button" >
                        </div></td>
                        <td width="36%"><input type="reset" name="reset" value="Reset" id= "button" ></td>
						<td height="5%" width="22%"><span id="spanbtn"></span></td>
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
