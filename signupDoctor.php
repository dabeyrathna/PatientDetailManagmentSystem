
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
		var add=document.getElementById('dAddress').value;
		var district=document.getElementById('district').value; 
		var nic=document.getElementById('nic').value;
		var telno=document.getElementById('telno').value;
		var pId=document.getElementById('pId').value;
		var slmc=document.getElementById('slmc').value;
		var flag = 0;
		
		
		
		if(name=="")
		{
			document.getElementById('spanname').innerHTML="Required";
			document.getElementById('spanname').style.color="red";
			document.getElementById('spanname').style.fontSize="11px";
			flag = 1;
		} 
		else
		{
			document.getElementById('spanname').innerHTML="*";
			document.getElementById('spanname').style.color="red";
			document.getElementById('spanname').style.fontSize="12px";
		}
		
		if(email=="")
		{
			document.getElementById('spanemail').innerHTML="Required";
			document.getElementById('spanemail').style.color="red";
			document.getElementById('spanemail').style.fontSize="11px";
			flag = 1;
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
		else{
			document.getElementById('spanemail').innerHTML="*";
			document.getElementById('spanemail').style.color="red";
			document.getElementById('spanemail').style.fontSize="12px";
		}

		if(add=="")
		{
			document.getElementById('spanaddress').innerHTML="Required";
			document.getElementById('spanaddress').style.color="red";
			document.getElementById('spanaddress').style.fontSize="11px";
			flag = 1;
		}
		else{
			document.getElementById('spanaddress').innerHTML="*";
			document.getElementById('spanaddress').style.color="red";
			document.getElementById('spanaddress').style.fontSize="12px";
		}
		
		if(district=="")
		{
			document.getElementById('spandistrict').innerHTML="Required";
			document.getElementById('spandistrict').style.color="red";
			document.getElementById('spandistrict').style.fontSize="11px";
			flag = 1;
		}
		else{
			document.getElementById('spandistrict').innerHTML="*";
			document.getElementById('spandistrict').style.color="red";
			document.getElementById('spandistrict').style.fontSize="12px";
		}
	
		if(telno=="")
		{
			document.getElementById('spantelno').innerHTML="Required";
			document.getElementById('spantelno').style.color="red";
			document.getElementById('spantelno').style.fontSize="11px";
			flag = 1;
		}
		else{
			document.getElementById('spantelno').innerHTML="*";
			document.getElementById('spantelno').style.color="red";
			document.getElementById('spantelno').style.fontSize="12px";
		}
		
		if(pId=="")
		{
			document.getElementById('spanPid').innerHTML="Required  ";
			document.getElementById('spanPid').style.color="red";
			document.getElementById('spanPid').style.fontSize="11px";
			document.getElementById('nevSignPid').style.fontSize="11px";			
			flag = 1;
		}
		else{
			document.getElementById('spanPid').innerHTML="*";
			document.getElementById('spanPid').style.color="red";
			document.getElementById('spanPid').style.fontSize="12px";
			document.getElementById('nevSignPid').style.fontSize="12px";
		}
		
		if(nic=="")
		{
			document.getElementById('spannic').innerHTML="Required";
			document.getElementById('spannic').style.color="red";
			document.getElementById('spannic').style.fontSize="11px";
			flag = 1;
		}
		else{
			document.getElementById('spannic').innerHTML="*";
			document.getElementById('spannic').style.color="red";
			document.getElementById('spannic').style.fontSize="12px";
		}
		
		if(slmc=="")  
		{
			document.getElementById('spanslmc').innerHTML="Required";
			document.getElementById('spanslmc').style.color="red";
			document.getElementById('spanslmc').style.fontSize="11px";
			flag = 1;
		}
		else{
			document.getElementById('spanslmc').innerHTML="*";
			document.getElementById('spanslmc').style.color="red";
			document.getElementById('spanslmc').style.fontSize="12px";
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
		
		for (var i=1900; i <= currentYear - 15;++i){			
			addOption(document.getElementById("dobYear"), i , i);
			document.getElementById("dobYear").selectedIndex = "90";
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
	
	function yearChanged(){
		document.getElementById("dobMonth").selectedIndex = "0";   // when year change month will reset
		document.getElementById("dobDate").selectedIndex = "0";       // date drop downl will reset
		
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
		<br class="clearfix" />
		<div id="page"> 
		<div style="width:980px;" align="center">
		<div style="width:750px;height:auto;float:none;" align="center" >
				<form name="form2" method="post" action="signupDoctorContraller.php" id="regForm" class="hospital_form" onSubmit="return userValidate();">
                 <h1>Register As a Doctor
               <span>Please fill the application with correct details</span>
            		</h1>
                    <table id="printTable" width="100%" height="50%"  border="0" cellpadding="5" style="align:center;">
                    <tr>
                        <td height="5%" width="29%" ><label for="name">Name</label></td>
                        <td width="13%" height="5%" ><input type="text" name="name" id="name" /></td>
						<td><span id="spanname">*</span></td>
                      </tr>
					   <tr>
                        <td height="5%" width="29%" ><label for="pId">Patient ID</label></td>
                        <td height="5%">  <input type="text" name="pId" id="pId" /></td>
						<td><span id="spanPid">*</span><a id='nevSignPid' href="signupPatient.php">No PID?</a></td>
                      </tr>
					   <tr>
                        <td height="5%" width="29%" ><label for="slmc">SLMC Registration No </label></td>
                        <td height="5%"><input type="text" name="slmc" id="slmc" /></td>
						<td><span id="spanslmc">*</span></td>
                      </tr>
                      <tr>
                        <td height="5%" width="29%"><label for="address">Address</label></td>
                        <td height="5%"><textarea name="dAddress" id="dAddress" cols="45" rows="5" ></textarea></td>
						<td height="5%" width="36%"><span id="spanaddress">*</span></td>
                      </tr>
                      <tr>
                        <td height="5%" width="29%"><label for="gender"> Gender</label></td>
                        <td height="5%">
                        	<input type="radio" name="gender" CHECKED id="gender" value="f">Female
							<input type="radio" name="gender" value="m">Male
                        </td>
                        <td height="5%"><span id="spangender" style='color:red;fontSize:30px;'> </span></td>
					
                      </tr>
					  <tr>
                        <td height="5%" width="29%"><label for="mStatus">Marital Status</label></td>
                        <td height="5%"><input type="radio" name="mStatus" CHECKED id="mStatus" value="S">Single
						<input type="radio" name="mStatus" value="M">Married</td>
                        <td height="5%"><span id="spanMStatus" style='color:red;fontSize:30px;'></span></td>
					
                      </tr>
                      <tr>
                        <td height="5%" width="29%"><label for="nic">NIC</label></td>
                        <td height="5%" ><input type="text" name="nic" id="nic"/></td>
						<td height="5%" width="36%"><span id="spannic">*</span></td>
                       
                      </tr>
                    
					  <tr>
                       <td height="5%" width="29%"><label for="dob">Date of Birth</label></td>
                        <td height="5%" >
                        
                        
						<?php /*************************    comented serverside implementation ************************
						
						$str = '<select id = "" name="" style="width:55px">';
						$count = 1900;
						while($count <2015)
						{	
							if($count == 2010)
								$str .=	'<option value="'.$count.'" selected>'.$count.'</option>';
							else
								$str .=	'<option value="'.$count.'">'.$count.'</option>';
							
                            $count++;
                        }
						 $str .= '</select>';
						 echo $str;
						?>
						<?php
						
						$str1 = '<select id = "dobMonth" name="" style="width:35px">';
						$count1 = 1;
						while($count1 <13)
						{	
						
								$str1 .=	'<option value="'.$count1.'">'.$count1.'</option>';
							
                            $count1++;
                        }
						 $str1 .= '</select>';
						 echo $str1;
						?>
						
						<?php
						
						$str2 = '<select id = "" name="" style="width:35px"> ';
						$count2 = 1;
						while($count2 <30)
						{	
						
								$str2 .=	'<option value="'.$count2.'">'.$count2.'</option>';
							
                            $count2++;
                        }
						 $str2 .= '</select>';
						 echo $str2;
						*/ ?>
						
                          <!-- client side implementation of date --> 
                          
                          
                        <select id = "dobYear" name="dobYear" onChange="yearChanged();" style="width:55px"> </select>                        
                        <select id = "dobMonth" name="dobMonth" onChange="getDates();" style="width:85px" ></select> 
                        <select id = "dobDate" name="dobDate" style="width:35px"> </select> 
                        
                        
						</td>
						<td height="5%" width="36%"><span id="spandob">*</span></td>
                       
                      </tr>
                           <tr>
                        <td height="5%" width="29%"><label for="specialization">Specialization</label></td>
                        <td height="5%" id="specialization">
						<?php
						include 'dbread.php';
						$Specialization = specializationList(0); 
						echo $Specialization;
						?> </td>
						<td height="5%" width="36%"><span id="spanspl" >*</span></td>
                       
                      </tr>
					  <tr>
                        <td height="5%" width="29%"><label for="MOIC">MOIC</label></td>
                        <td height="5%">
						<input type="radio" name="MOIC"  id="MOIC1" value="1">Yes
						<input type="radio" name="MOIC" CHECKED value="0">No</td>
                        <td height="5%"><span id="spanMoic" style='color:red;fontSize:30px;'>* </span></td>				
                      </tr>
					  <tr>
                        <td height="5%" width="29%"><label for="nationality">Nationality</label></td>
                        <td height="5%">
						<input type="radio" name="nationality" CHECKED id="nationality" value="S">Srilankan
						<input type="radio" name="nationality"   value="F">Foreigner</td>
                        <td height="5%"><span id="spanNationality" style='color:red;fontSize:30px;'> </span></td>
                      </tr>
                        <tr>
                          <td height="5%" width="29%"><label for="email">Email</label></td>
                        <td height="5%"><input type="text" name="email" id="email"  /></td>
						<td height="5%" width="36%"><span id="spanemail">*</span></td>
                      </tr>
                        <tr>
                          <td height="5%" width="29%"><label for="contactNumber">Contact Number</label></td>
                        <td height="5%"><input type="text" name="telno" id="telno"  /></td>
						<td height="5%" width="36%"><span id="spantelno">*</span></td>
                      </tr>
					   <tr>
                          <td height="5%" width="29%"><label for="district"> District </label></td>
                        <td height="5%"><input type="text" name="district" id="district"  /></td>
						<td height="5%" width="36%"><span id="spandistrict">*</span></td>
                      </tr>
					    <tr>
                          <td height="5%" width="29%"><label for="workingHospital">Working Hospital</label></td>
                        <td height="5%" id="hospital">
						<?php
						
						$hospital = hospitalList(0); 
						echo $hospital;
						?> </td>
						<td height="5%" width="36%"><span id="spanhospital">*</span></td>
                      </tr>
					    <br>
                       <tr>
                          <td height="5%" width="29%"> </td>
                        <td height="5%" colspan="2">
						
                         <input type="submit" name="signupvalidate" value="Request for registration" id= "button" >                                   
                         <input type="reset" name="reset" value="Reset" id= "button"></td>
                     
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
