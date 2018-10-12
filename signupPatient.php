<?php
	session_start();
?>

<html>
<head>
<link rel="stylesheet" type="text/css" href="css/sty.css" />
<link rel="stylesheet" type="text/css" href="css/menustyle.css" />
<style>
  span { color: red; }
</style>

<script type="text/javascript">
 	function userValidate()
	{
		
		var name=document.getElementById('name').value;
		var email=document.getElementById('email').value;
		var add=document.getElementById('paddress').value;
		var district=document.getElementById('district').value; 
		var nic=document.getElementById('nic').value;
		var telno=document.getElementById('telno').value;
		var gardianPId = document.getElementById('gardianPId').value;
		var flag = 0;
		
		 if(name=="")
		{
			document.getElementById('spanname').innerHTML="Required";
			document.getElementById('spanname').style.color="red";
			document.getElementById('spanname').style.fontSize="11px";
			flag =1;
		} 
		else{
			document.getElementById('spanname').innerHTML="*";
			document.getElementById('spanname').style.color="red";
			document.getElementById('spanname').style.fontSize="12px";
		}
		
		if(add=="")
		{
			
			document.getElementById('spanaddress').innerHTML="Required";
			document.getElementById('spanaddress').style.color="red";
			document.getElementById('spanaddress').style.fontSize="11px";
			flag =1;
			
		}
		else{
			document.getElementById('spanaddress').innerHTML="*";
			document.getElementById('spanaddress').style.color="red";
			document.getElementById('spanaddress').style.fontSize="12px";
		}
		
		if(document.getElementById("dobDate").selectedIndex == -1 ||
								   document.getElementById("dobMonth").selectedIndex == -1 ||
								   document.getElementById("dobYear").selectedIndex == -1 )
		{
			document.getElementById('spandob').innerHTML="Required";
			document.getElementById('spandob').style.color="red";
			document.getElementById('spandob').style.fontSize="11px";
			flag =1;
		}
		else{
			document.getElementById('spandob').innerHTML="*";
			document.getElementById('spandob').style.color="red";
			document.getElementById('spandob').style.fontSize="12px";
		}
		
		if(document.getElementById("elder").style.visibility=="hidden"){					//age 18-
			
			if(gardianPId = ""){
				document.getElementById('spanpId').innerHTML="Required";
				document.getElementById('spanpId').style.color="red";
				document.getElementById('spanpId').style.fontSize="11px";
				flag = 1;
			}
			else
			{
				document.getElementById('spanpId').innerHTML="*";
				document.getElementById('spanpId').style.color="red";
				document.getElementById('spanpId').style.fontSize="12px";
			}
		}
		else{																				// age 18+
				var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;  
				if(email != "" && !email.match(mailformat))  
				{
					document.getElementById('spanemail').innerHTML="Invalid Email address";
					document.getElementById('spanemail').style.color="red";
					document.getElementById('spanemail').style.fontSize="11px";
					flag = 1;
					/*
					var x = document.getElementById(email);
					var atpos = x.indexOf("@");
					var dotpos = x.lastIndexOf(".");
					if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length) {
						alert("Not a valid e-mail address");
						return false;
					}*/
					
				}
				else{
					document.getElementById('spanemail').innerHTML="optional";
					document.getElementById('spanemail').style.color="blue";
					document.getElementById('spanemail').style.fontSize="11px";
				}
				if(district=="")
				{
					document.getElementById('spandistrict').innerHTML="Required";
					document.getElementById('spandistrict').style.color="red";
					document.getElementById('spandistrict').style.fontSize="11px";
					flag =1;
				}
				else{
					document.getElementById('spandistrict').innerHTML="*";
					document.getElementById('spandistrict').style.color="red";
					document.getElementById('spandistrict').style.fontSize="12px";
				}
		}
		

		if(flag == 1)
			return false;
	}

	function addOption(selectbox,text,value )
	{
		var optn = document.createElement("OPTION");
		optn.text = text;
		optn.value = value;
		selectbox.options.add(optn);
	}

	function addOption_list(){
		
		var dt=new Date();
		var currentYear=dt.getFullYear();
		var month = new Array("January","February","March","April","May","June","July","August","September","October","November","December");
		document.getElementById("dobDate").disabled = true;
		
		for (var i=1900; i <= currentYear;++i){			
			addOption(document.getElementById("dobYear"), i , i);
			document.getElementById("dobYear").selectedIndex = "95";
		}

		for (var i=0; i < month.length;++i){
			addOption(document.getElementById("dobMonth"), month[i], i+1);
		}
	}

	function getDates(){
		
			var month = document.getElementById("dobMonth").selectedIndex + 1;
			var year = document.getElementById("dobYear").selectedIndex;
			document.getElementById("dobDate").disabled = false;

			var d;
			if(month%2 == 0 && month != 2)
				d = 30;
			else if(month == 2 && (year+1900)%4 == 0)				// a leap year and feb
				d = 29;
			else if(month == 2 && (year+1900)%4 != 0)				// not a leap year and feb
				d = 28;
			else
				d = 31;

		for (var i=1; i <= d;++i){
				addOption(document.getElementById("dobDate"), i, i);
		}
	}
	
	function isAdult(){
		var d = document.getElementById("dobYear").value;
		document.getElementById("dobMonth").selectedIndex = "0";   // when year change month will reset
		document.getElementById("dobDate").selectedIndex = "0";       // date drop downl will reset
		
		document.getElementById("elder").style.height="auto";
		document.getElementById("gardian").style.height="auto";
		if(2015-d < 18) 
		{
				document.getElementById("gardian").style.visibility ="visible";
				document.getElementById("elder").style.visibility="hidden";
				document.getElementById("elder").style.height="0";
		}
		else
		{
			document.getElementById("elder").style.visibility="visible";
			document.getElementById("gardian").style.visibility ="hidden";
			document.getElementById("gardian").style.height="0";
		}
	}	

</script>
</head>

<body onLoad="addOption_list();">
<div id="wrapper">
	<?php 
		include 'header.php';
    	include 'menu.php';
		$user = "";
  		$man = selectMenu($user);
		echo $man;
		
	?>
	<div id="page"> 
		<br class="clearfix" />
		<div style="width:980px;" align="center">
		<div style="width:750px;height:outo;float:none;" align="center" id="form" >
				<form name="form2" method="post" action="signupPatientContraller.php" id="regForm" class="hospital_form" onSubmit="return userValidate();">
                 <h1>Register As a Patient
               		<span>Please fill the application with correct details</span>
            		</h1>
                    <table id="printTable" width="100%" height="auto"  border="0" cellpadding="5" style="align:center;">
                    <tr>
                        <td height="5%" width="29%" ><label for="name">Name</label></td>
                        <td height="5%" colspan="2"><input type="text" name="name" id="name" /></td>
						<td><span id="spanname">*</span> </td>
                      </tr>
                      <tr>
                        <td height="5%" width="29%"><label for="address"> Address</label></td>
                        <td height="5%" colspan="2"><textarea name="paddress" id="paddress" cols="30" rows="3" ></textarea></td>
						<td height="5%" width="22%"><span id="spanaddress" >*</span></td>
                      </tr>
                      <tr>
                        <td height="5%" width="29%"><label for="gender"> Gender</label></td>
                        <td height="5%" colspan="2">
                        	<input type="radio" name="gender" CHECKED id="gender" value="female">Female
							<input type="radio" name="gender" value="male">Male
                        </td>
						<td height="5%" width="22%"><span id="spangender" style='color:red;fontSize:30px;'> </span></td>
                      </tr>
                      
					   <tr>
                          <td height="5%" width="29%"><label for="bloodGroup">Blood Group</label></td>
                        <td height="5%" colspan="2">
                        	<select style="width:100px" id = "bgrp" name="bgrp" id="bgrp">
                              <option value="A+">A+</option>
                              <option value="A-">A-</option>
                              <option value="B+">B+</option>
                              <option value="B-">B-</option>
                              <option value="O+">O+</option>
                              <option value="O-">O-</option>
							  <option value="AB+">AB+</option>
							  <option value="AB-">AB-</option>
                         </select>                        
                       </td>
						<td height="5%" width="22%"><span id="spanblood" style='color:red;fontSize:30px;'></span></td>
                      </tr>
					  <tr>
                       <td height="5%" width="29%"><label for="dob">Date of Birth</label></td>
                        <td height="5%" colspan="2">
						<?php /*************  for date client side implementation is better than serverside***********
						
						$str = '<select id = "dobYear" onChange="display();" style="width:55px">';
						$count = 1900;
						while($count <2015)
						{	
							if($count == 1990)
								$str .=	'<option value="'.$count.'" selected>'.$count.'</option>';
							else
								$str .=	'<option value="'.$count.'">'.$count.'</option>';
							
                            $count++;
                        }
						 $str .= '</select>';
						 echo $str;

						$str1 = '<select id = "dobMonth" style="width:35px">';
						$count1 = 1;
						while($count1 <13)
						{						
								$str1 .=	'<option value="'.$count1.'">'.$count1.'</option>';
                            	$count1++;
                        }
						 $str1 .= '</select>';
						 echo $str1;
						
						$str2 = '<select id = "dobDate" style="width:35px"> ';
						$count2 = 1;
						
						while($count2 <32)
						{						
								$str2 .=	'<option value="'.$count2.'">'.$count2.'</option>';
                            	$count2++;
                        }
						 $str2 .= '</select>';
						 echo $str2;
						*/ 
						?>
						
                        
                        <!-- client side implementation of date -->
                        
                        <select id = "dobYear" name="dobYear" onChange="isAdult();" style="width:55px" > </select> 
                        <select id = "dobMonth" name="dobMonth" onChange="getDates();" style="width:85px" > </select>                      
                        <select id = "dobDate" name="dobDate"  style="width:35px" > </select> 

						</td>
						<td height="5%" width="22%"><span id="spandob">*</span></td>   
						
                      </tr>
					</table>
					
					<div id = "elder">
					
					<table id="printTable" width="100%" height="auto"  border="0" cellpadding="5" style="align:center;">
                       <tr>
                        <td height="5%" width="29%"><label for="nic"> NIC</label></td>
                        <td height="5%" colspan="2"><input type="text" name="nic" id="nic" /></td>
						<td height="5%" width="22%"><span id="spannic" >* </span></td>
                       
                      </tr>
					  <tr>
                        <td height="5%" width="29%"><label for="mStatus">Marital Status</label></td>
                        <td height="5%" colspan="2"><input type="radio" name="mStatus" CHECKED id="mStatus" value="S">Single
						<input type="radio" name="mStatus" value="M">Married</td>
						<td height="5%" width="22%"><span id="spanMStatus" style='color:red;fontSize:30px;'>*</span></td>
                      </tr>
                        <tr>
                          <td height="5%" width="29%"><label for="email"> Email</label></td>
                        <td height="5%" colspan="2"><input type="text" name="email" id="email"  /></td>
						<td height="5%" width="22%"><span id="spanemail"></span></td>
                      </tr></tr>
                        <tr>
                          <td height="5%" width="29%"><label for="contactNumber"> Contact Number</label></td>
                        <td height="5%" colspan="2"><input type="text" name="telno" id="telno" /></td>
						<td height="5%" width="22%"><span id="spantelno"> </span></td>
                      </tr>
					   <tr>
                          <td height="5%" width="29%"><label for="district"> District </label></td>
                        <td height="5%" colspan="2"><input type="text" name="district" id="district"  /></td>
						<td height="5%" width="22%"><span id="spandistrict">*</span></td>
                        
                      </tr>
					  
					      </table>
				 </div>
				 
				 <div id = "gardian" style="visibility:hidden;position:relative; height:0;" >
				 <hr style="border:solid 1px #99FF00;"><br>
					<table id="printTable" width="100%" height="auto"  border="0" cellpadding="5" style="align:center;">
					  <tr>
                        <td height="5%" width="29%"><label for="pId"> Gardian Patient Id</label></td>
                        <td height="5%" colspan="2"><input type="text" name="gardianPId" id="gardianPId" /></td>
						<td height="5%" width="22%"><span id="spanpId" ><a href="signupPatient.php">No PID?</a></span></td>
                       
                      </tr>		
                      <tr>
                        <td height="5%" width="29%"><label for="pId"> Gardian Email</label></td>
                        <td height="5%" colspan="2"><input type="text" name="gardianEmail" id="gardianEmail" /></td>
						<td height="5%" width="22%"><span id="spangEmail" ></span></td>
                       
                      </tr>	  
				    </table>
				 </div>
                        <tr>
                          <td height="5%" width="29%"> </td>
                        <td height="5%" width="13%">
						
                          <input type="submit" name="signupvalidate" value="Request for registration" id= "button" >
                        </td>
                        <td width="36%"><input type="reset" name="reset" value="Reset" id= "button"></td>
						<td height="5%" width="22%"><span id="spanbtn"></span></td>
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
