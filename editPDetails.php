
<?php

		session_start();
 		if (!isset($_SESSION["uid"]))
        {
        	Header("Location: errorPage.php?info=7");
        }
	   else if($_SESSION["uid"][0] != 'P' && $_SESSION["uid"][0] != 'p')
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
<script type="text/javascript">
 function userValidate()
	{
		var email=document.getElementById('email').value;
		var add=document.getElementById('dAddress').value;
		var district=document.getElementById('district').value; 
		var telno=document.getElementById('telno').value;
		var flag = 0;
		

		if(email=="")
		{
			// if it is empty, its fine in this case
		}
		else if(email.indexOf(".") == -1 ||
							  email.indexOf("@") == -1 ||
							  email.lastIndexOf(".") < email.indexOf("@") ||
							  email.lastIndexOf(".")+1 == email.length )
		{
			document.getElementById('spanemail').innerHTML="Invalid Email address";
			document.getElementById('spanemail').style.color="red";
			document.getElementById('spanemail').style.fontSize="11px";
			flag = 1;
		}
			
		if(flag == 1)
			return false;
	}	
</script>
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
		 <div> 
     <?php
        
        
          
		require_once("DBAccess.php");  
		$db = new DBAccess();
		$dbConnection = $db->initConnection();
		$str = "";
		$sql = "SELECT * FROM patient where pId ='".$_SESSION['uid']."'";	


		$query=mysql_query($sql,$dbConnection) or die("SQL Error ".mysql_error());
		$rows=mysql_fetch_array($query);
			
			$pid = $rows['pId'];
			$name = $rows['name'];
			$pPass = $rows['pPass'];
			$add = $rows['add'];
			$telNo = $rows['telNo'];
			$email = $rows['email'];
			$district = $rows['district'];
			$imageType = $rows['imageType'];		
				
			
   	$query=mysql_query($sql,$dbConnection) or die("SQL Error ".mysql_error());
	$rows=mysql_fetch_array($query);

?>

              <p><form name="form2" method="post" id="regForm" enctype="multipart/form-data" action="uploadImage.php" class="hospital_form">
                     <h1>
                   <span>Change profile Picture</span>
                </h1>  
                           <input type="file" name="ImageToUpload" id="ImageToUpload" value="choos a new image" class= "button-link1">
        
                              <input type="submit" name="submit" value="Submit" class= "button-link1">
                               
                            <td><span id="spanImage"></span></td>
    
              </form></p>
              </td>
              </tr>
              
               <br class="clearfix" />
		
		  <p><form name="form2" method="post" id="regForm" action="changePassword.php" class="hospital_form">
            <h1>
               Change Password</h1>&nbsp;&nbsp;&nbsp;<div align="center">
            <?php if(isset($_GET['info'])){ if($_GET['info']==12){echo '<span style="color:blue;">Password updated</span>';}else if($_GET['info']==13){echo '<span style="color:red;">Please try again</span>';}else if($_GET['info']==14){echo '<span style="color:red;">Password is incorrect</span>';}else if($_GET['info']==15){echo '<span style="color:red;">Please fill all the fields</span>';} }?></div>
            <td><table width="100%" height="201" border="0">
              <tr>
                <th width="27%" scope="row"><div align="left">Current Password</div></th>
                <td width="46%"><input name='currPass' type="password"></td>
                <td width="27%"><span id='spanOldPass'></span></td>
              </tr>
              <tr>
                <th scope="row"><div align="left"><p>New Password</p></div></th>
                <td><input name='newPass' type="password"></td>
                <td><span id='spanNewPassword'></span></td>
              </tr>
              <tr>
                <th scope="row"><div align="left">Re-Enter</div></th>
                <td><input name='reNewPass' type="password"></td>
                <td><span id='spanReNewPass'></span></td>
              </tr>
              <tr>
                <th height="71" scope="row">&nbsp;</th>
                <td height="71" width="46%"><div align="center">
                  <input type="submit" name="submit" value="Change" id= "button" >
                  &nbsp;&nbsp;&nbsp;&nbsp;
                  <input type="reset" name="reset" value="Reset" id= "button" >
                </div>
              </tr>
            </table>              <span id="spanImage"></span></td>

		  </form></p>
		  </td>
		  </tr>



				<form name="form2" method="post" action="editPDetailsContraller.php" id="regForm" class="hospital_form" onSubmit="return userValidate();">
                 
                    <table id="printTable" width="98%" height="auto"  border="0" cellpadding="5">
                    
					<tr>
                        <td height="5%" colspan="4" ><h1>Please alter the data with correct details</h1></td>
                      </tr>
                      
                     <tr>
                        <td height="5%" width="29%" ><label for="name">Name</label></td>
                        <td height="5%" colspan="2"><input type="text" name="name" disabled="disabled" placeholder="<?php echo $rows['name'];?>" style="background-color:green; color:Lime;" /></td>
						<td><span id="spanname"></span></td>
                      </tr>
                      <tr>
                        <td height="5%" width="29%"><label for="address">Address</label></td>
                        <td height="5%" colspan="2"><textarea name="dAddress" id="dAddress" cols="45" rows="5" placeholder="<?php echo $rows['add'];?>" ></textarea></td>
						<td height="5%" width="22%"><span id="spanaddress"></span></td>
                      </tr>                   
                      <tr>
                        <td height="5%" width="29%"><label for="nic">NIC</label></td>
                        <td height="5%" colspan="2"><input type="text" name="nic" id="nic" disabled="disabled" style="background-color:green; color:Lime;" placeholder="<?php echo $rows['nic'];?>"/></td>
						<td height="5%" width="22%"><span id="spannic"></span></td>
                       
                      </tr>
                      <tr>
                       <td height="5%" width="29%"><label for="dob">Date of Birth</label></td>
                        <td height="5%" colspan="2"><input type="text" name="dob" id="dob" disabled="disabled" style="background-color:green; color:Lime;" placeholder="<?php echo $rows['dob'];?>"></td>
						<td height="5%" width="22%"><span id="spandob"></span></td>
                       
                      </tr>

                        <tr>
                          <td height="5%" width="29%"><label for="email">Email</label></td>
                        <td height="5%" colspan="2"><input type="text" name="email" id="email"  placeholder="<?php echo $rows['email'];?>" ></td>
						<td height="5%" width="22%"><span id="spanemail"></span></td>
                      </tr>                       
                        <tr>
                          <td height="5%" width="29%"><label for="contactNumber">Contact Number</label></td>
                        <td height="5%" colspan="2"><input type="text" name="telno" id="telno" placeholder="<?php echo $rows['telNo'];?>" ></td>
						<td height="5%" width="22%"><span id="spantelno"></span></td>
                      </tr>
					   <tr>
                          <td height="5%" width="29%"><label for="district">Your District </label></td>
                        <td height="5%" colspan="2"><input type="text" name="district" id="district" placeholder="<?php echo $rows['district'];?>"></td>
						<td height="5%" width="22%"><span id="spandistrict"> </span></td>
                      </tr>					  
                        <tr>
						
						<input type="hidden" id = "hidAddress" name="hidAddress" value="<?php echo $add;?>">
						<input type="hidden" id = "hidEmail" name="hidEmail" value="<?php echo $email;?>">
						<input type="hidden" id = "hidDistrict" name="hidDistrict" value="<?php echo $district;?>">
						<input type="hidden" id = "hidTelNo" name="hidTelNo" value="<?php echo $telNo;?>">
						
                          <td height="5%" width="29%"> </td>
                        <td height="5%" width="41%"><div align="right">
                          <input type="submit" name="submit" value="Update" id= "button" >
                        </div></td>
                        <td width="8%"><input type="reset" name="reset" value="Reset" id= "button" ></td>
						<td height="5%" width="22%"><span id="spanbtn"></span></td>
                      </tr>
                 </table>
		   </form>


  </div>		  
</div>

	 	<?php 
			include 'footer.php';
		?>	
		
 </div>
 </body>
 </html>
