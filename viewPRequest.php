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
?>

<html>
<head>
<link rel="stylesheet" type="text/css" href="css/sty.css" />
<link rel="stylesheet" type="text/css" href="css/menustyle.css" />
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>



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
		
        <div id="page" align="center">
  
          <?php
	 
			
		
	require_once("DBAccess.php");  
			$db = new DBAccess();
			$dbConnection = $db->initConnection();
			
			//include 'registrationRequestListController.php';
			//$user = $rows["dRequestId"];
			$pRequestId = $_GET['no'];
			$sql = "SELECT * FROM temp_patient where pRequestId = '".$pRequestId."'";		
			

				  
   	$query=mysql_query($sql,$dbConnection) or die("SQL Error ".mysql_error());
	while($rows=mysql_fetch_array($query))
	{
								//$dId = $rows['dId'];
								$name = $rows['name'];
								$nic = $rows['nic'];
								$gender = $rows['gender'];
								$dob = $rows['dob'];
								$add = $rows['add'];
								$telNo = $rows['telNo'];
								$email = $rows['email'];
								$bloodGroup = $rows['bloodGroup'];
								$district = $rows['district'];
	}
	?>
          
  <br class="clearfix" />
		<div style="width:900px;align:center">
		<div style="width:650px;height:auto;float:none;align:center" >
		
				<form name="form3" method="post" action="pendingRequestContraller.php?info=p" id="regForm" class="hospital_form">
                 
                    <table id="printTable" width="61%" height="auto"  border="0" cellpadding="5">
                    
					<tr>
                        <td height="5%" colspan="2" ><h1>Patient Registration Request </h1></td>
                       
						
                      </tr>
					  <tr>
                        <td height="5%" width="46%" ><label for="name">Request Id:</label></td>
                        <td width="54%" height="5%" colspan="2"><?php echo $pRequestId;?></td>
						<input type="hidden" value="<?php echo $pRequestId;?>" name="pRequestId" />
                      </tr>
					<tr>
                        <td height="5%" width="46%" ><label for="name">Name:</label></td>
                        <td height="5%" colspan="2"><?php echo $name;?></td>
						
                      </tr>
                      <tr>
                        <td height="5%" width="46%"><label for="address">Address:</label></td>
                        <td height="5%" colspan="2"><?php echo $add;?></td>
						
                      </tr>
                     <tr>
                        <td height="5%" width="46%"><label for="gender">Gender:</label></td>
                        <td height="5%" colspan="2"><?php echo $gender;?></td>
						
                      </tr>
                      <tr>
                        <td height="5%" width="46%"><label for="nic">NIC:</label></td>
                        <td height="5%" colspan="2"><?php echo $nic;?> </td>
						
                       
                      </tr>
                      <tr>
                       <td height="5%" width="46%"><label for="dob">Date of Birth:</label></td>
                        <td height="5%" colspan="2"><?php echo $dob;?> </td>
						
                       
                      </tr>
                           <tr>
                        <td height="5%" width="46%"><label for="specialization">Blood Group:</label></td>
                        <td height="5%" colspan="2"><?php echo $bloodGroup;?> </td>
						
                       
                      </tr>
					  
                        <tr>
                          <td height="5%" width="46%"><label for="email">email:</label></td>
                        <td height="5%" colspan="2"><?php echo $email;?></td>
						
                      </tr>
                        <tr>
                          <td height="5%" width="46%"><label for="contactNumber">Contact Number:</label></td>
                        <td height="5%" colspan="2"><?php echo $telNo;?></td>
						
                      </tr>
					   <tr>
                          <td height="5%" width="46%"><label for="district"> District : </label></td>
                        <td height="5%" colspan="2"><?php echo $district;?></td>
						
                      </tr>
					    <tr>
                          <td height="5%" width="46%"><label for="workingHospital">Gardian :</label></td>
                        <td height="5%" colspan="2"><?php echo $gender;?> </td>
						
                      </tr>
					    
                        <tr>
                       
                        <td height="5%" colspan="7">
                          
                          <div align="center">
                            <input type="submit" name="btnPatientAccept" value="Accept" id= "btnPatientAccept" class="button-link1" >                        
                            &nbsp;&nbsp;&nbsp;&nbsp; 
                            <input type="submit" name="btnPatientReject" value="Reject" id= "btnPatientReject" class="button-link1">
                                 </div></td>
					  </tr>
                      
                 </table>
</form>
  			</div> 

 </div>

      </div>

		<?php 
			include 'footer.php';
		?>	
 </div>
 </body>
 </html>
