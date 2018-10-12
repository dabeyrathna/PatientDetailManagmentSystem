<?php

		session_start();
		if(isset($_GET['no']))
	$id=$_GET['no'];
else
	echo 'Something wrong';
		
 		
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
			$sql = "SELECT * FROM hospital_emp where empId = '".$empId."'";		
			

				  
   	$query=mysql_query($sql,$dbConnection) or die("SQL Error ".mysql_error());
	while($rows=mysql_fetch_array($query))
	{
								$empId = $rows['empId'];
								$name = $rows['name'];
								$nic = $rows['nic'];
								$gender = $rows['gender'];							
								$add = $rows['add'];
								$telNo = $rows['telNo'];
								$email = $rows['email'];
								$district = $rows['district'];
	}
	?>
          
  <br class="clearfix" />
		<div style="width:900px;align:center">
		<div style="width:650px;height:auto;float:none;align:center" >
		
				<form name="form3" method="post" action="actDeactController.php?info=p" id="regForm" class="hospital_form">
                 
                    <table id="printTable" width="61%" height="auto"  border="0" cellpadding="5">
                    
					<tr>
                        <td height="5%" colspan="2" ><h1>Employee Details </h1></td>
                       
						
                      </tr>
					  <tr>
                        <td height="5%" width="46%" ><label for="name">Employee Id:</label></td>
                        <td width="54%" height="5%" colspan="2"><?php echo $empId;?></td>
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
                          <td height="5%" width="46%"><label for="email">email:</label></td>
                        <td height="5%" colspan="2"><?php echo $email;?></td>
						
                      </tr>
                        <tr>
                          <td height="5%" width="46%"><label for="contactNumber">Contact Number:</label></td>
                        <td height="5%" colspan="2"><?php echo $telNo;?></td>
						
                      </tr>
					
						
                     
					    
                        <tr>
                       
                        <td height="5%" colspan="7">
                          
                          <div align="center">
                            <input type="submit" name="btndeact" value="deactivate" id= "deactivate" class="button-link1" >                        
                            &nbsp;&nbsp;&nbsp;&nbsp; 
							
                            
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
