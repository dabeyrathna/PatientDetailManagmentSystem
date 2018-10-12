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
			$dRequestId = $_GET['no'];
			$sql = "SELECT * FROM temp_doctor, specialization, hospital where
									dRequestId = '".$dRequestId."' AND
									specialization.spId = temp_doctor.spId AND
									hospital.hId = temp_doctor.hId";		
			

				  
   	$query=mysql_query($sql,$dbConnection) or die("SQL Error ".mysql_error());
	$rows=mysql_fetch_assoc($query);
	
								$drequestId=$rows['dRequestId'];
								$name = $rows['name'];
								$nic = $rows['nic'];
								$gender = $rows['gender'];
								$spName = $rows['spName'];
								$hName = $rows['hName'];
								$MOIC = $rows['MOIC'];
								$dob = $rows['dob'];
								$add = $rows['add'];
								$telNo = $rows['telNo'];
								$email = $rows['email'];
								$district = $rows['district'];
								$maritalStatus = $rows['maritalStatus'];
								$nationality = $rows['nationality'];
								$slmcRegNo = $rows['slmcRegNo'];
								

	?>
	
		<br class="clearfix" />
		<div style="width:900px;align:center">
		<div style="width:650px;height:auto;float:none;align:center" >
		
				<form name="form3" method="post" action="pendingRequestContraller.php?info=d" id="regForm" class="hospital_form" >
                 
                    <table id="printTable" width="93%" height="auto"  border="0" cellpadding="5">
                    
					<tr>
                        <td height="5%" colspan="2" ><h1>Doctor Registration Request </h1></td>
                       
						
                      </tr>
					  <tr>
                        <td height="5%" width="40%" ><label for="name">Request Id:</label></td>
                        <td width="60%" height="5%" colspan="2"><?php echo $drequestId;?></td>
						<input type="hidden" value="<?php echo $drequestId;?>" name="drequestId" />
                      </tr>
					<tr>
                        <td height="5%" width="40%" ><label for="name">Name:</label></td>
                        <td height="5%" colspan="2"><?php echo $name;?></td>
						
                      </tr>
					      <tr>
                        <td height="5%" width="40%"><label for="specialization">Specialization:</label></td>
                        <td height="5%" colspan="2"><?php echo $spName;?> </td>
						
                       
                      </tr>
					      <tr>
                        <td height="5%" width="40%"><label for="specialization">Working Hospital:</label></td>
                        <td height="5%" colspan="2"><?php echo $hName;?> </td>
						
                       
                      </tr>
					      <tr>
                        <td height="5%" width="40%"><label for="specialization">MOIC:</label></td>
                        <td height="5%" colspan="2"><?php echo $MOIC;?> </td>
						
                       
                      </tr>
					  </tr>
					      <tr>
                        <td height="5%" width="40%"><label for="specialization">slmcRegNo:</label></td>
                        <td height="5%" colspan="2"><?php echo $slmcRegNo;?> </td>
						
                       
                      </tr></tr>
					      <tr>
                        <td height="5%" width="40%"><label for="specialization">Nationality:</label></td>
                        <td height="5%" colspan="2"><?php echo $nationality;?> </td>
						
                       
                      </tr></tr>
					      <tr>
                        <td height="5%" width="40%"><label for="specialization">Marital Status:</label></td>
                        <td height="5%" colspan="2"><?php echo $maritalStatus;?> </td>
						
                       
                      </tr>
                      <tr>
                        <td height="5%" width="40%"><label for="address">Address:</label></td>
                        <td height="5%" colspan="2"><?php echo $add;?></td>
						
                      </tr>
                     <tr>
                        <td height="5%" width="40%"><label for="gender">Gender:</label></td>
                        <td height="5%" colspan="2"><?php echo $gender;?></td>
						
                      </tr>
                      <tr>
                        <td height="5%" width="40%"><label for="nic">NIC:</label></td>
                        <td height="5%" colspan="2"><?php echo $nic;?> </td>
						
                       
                      </tr>
                      <tr>
                       <td height="5%" width="40%"><label for="dob">Date of Birth:</label></td>
                        <td height="5%" colspan="2"><?php echo $dob;?> </td> 
                      </tr>
                        <tr>
                          <td height="5%" width="40%"><label for="email">email:</label></td>
                        <td height="5%" colspan="2"><?php echo $email;?></td>
						
                      </tr>
                        <tr>
                          <td height="5%" width="40%"><label for="contactNumber">Contact Number:</label></td>
                        <td height="5%" colspan="2"><?php echo $telNo;?></td>
						
                      </tr>
					   <tr>
                          <td height="5%" width="40%"><label for="district"> District : </label></td>
                        <td height="5%" colspan="2"><?php echo $district;?></td>
						
                      </tr>
					    <tr>
                          <td height="5%" width="40%"><label for="workingHospital">Gardian :</label></td>
                        <td height="5%" colspan="2"><?php echo $gender;?> </td>
						
                      </tr>
					    
                        <tr>
                       
                        <td height="5%" colspan="7">
                          
                          <div align="center">
                            <input type="submit" value="Accept" id= "btnAccept" name="btnDoctorAccept" class="button-link1">                        
                              &nbsp;&nbsp;&nbsp;&nbsp;  <input type="submit" name="btnDoctorReject" value="Reject" id= "btnReject" onClick="" class="button-link1">
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
