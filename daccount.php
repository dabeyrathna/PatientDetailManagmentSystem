<?php

		session_start();
 		if (!isset($_SESSION["uid"]))
        {
        	Header("Location: errorPage.php?info=7");
        }
		else if($_SESSION["uid"][0] != 'D' && $_SESSION["uid"][0] != 'd' ){
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
		$sql = "SELECT * FROM doctor where dId = '".$_SESSION["uid"]."'";	
			

				  
		$query=mysql_query($sql,$dbConnection) or die("SQL Error ".mysql_error());
		$rows=mysql_fetch_assoc($query);
		
		$imgName = "defaultDoctor.jpg";
		$did = $rows['dId'];
		$name = $rows['name'];
		$nic = $rows['nic'];
		$gender = $rows['gender'];
		$add = $rows['add'];
		$telNo = $rows['telNo'];
		$email = $rows['email'];
		$spId = $rows['spId'];
		$hId = $rows['hId'];
		$slmcRegNo = $rows['slmcRegNo'];
		
	
		if($rows['imageType'] != "")
				$imgName = $_SESSION['uid'].".".$rows['imageType'];
		else
			$imgName = 'defaultDoctor.jpg';
			
		/////////////////////////////////////////////////////////////////////////////////////////////
		
		$forumQList = "";
		$artList = "";
		$forumQSql = "SELECT * FROM forumQuest ORDER BY time DESC LIMIT 6";	
		$artSql = "SELECT * FROM article ORDER BY date DESC LIMIT 6";	
		$appSql = "SELECT * FROM appointment ORDER BY date DESC LIMIT 6";
		
		$artList = '';
		$forumQList  = '';
		$appList = '';
		
		$query=mysql_query($artSql,$dbConnection) or die("SQL Error 1".mysql_error());
		while($rows=mysql_fetch_array($query))
   		{
      		$artList .= "<a href='viewArticalDetails.php?no=".$rows["artId"]."' style=' color: black;'>"."    {$rows['topic']}"."</a><br/><br/>";
		}
		
		$query=mysql_query($forumQSql,$dbConnection) or die("SQL Error 2".mysql_error());
		while($rows=mysql_fetch_array($query))
   		{
      		$forumQList .= "<a href='forumDiscussion.php?qid=".$rows["qId"]."' style=' color: black;'>"."{$rows['topic']}"."</a><br/><br/>";
  		} 
?>


<html>
<head>
<link rel="stylesheet" type="text/css" href="css/sty.css" />
<link rel="stylesheet" type="text/css" href="css/menustyle.css" />
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript">

	var xmlHttp=null;											<!-- Ajax-->
	function GetXmlHttpRequest(){
		try{
			xmlHttp=new XMLHttpRequest();
		}
		catch(e)
		{
			try
			{
				xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
			}
			catch(e)
			{
				xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
			}
		}
		return xmlHttp;
	}
	
	
	function ajaxPending(x)
	{			
		xmlHttp=GetXmlHttpRequest();
		if(xmlHttp==null)
		{
			alert("Your browser does not support Http request");
			return;
		}	
		else if(x == 1){
			var url="appointmentContraller.php?no="+x+"&date="+document.getElementById("date2").value+"&tital="+document.getElementById('tital').value+"&desc="+document.getElementById('desc').value+"";
			document.getElementById("appointmentDisplay").innerHTML = ":";
			xmlHttp.open("GET",url);
			xmlHttp.onreadystatechange=getResponse1;
		}
		else if(x == 2){
			var url="appointmentContraller.php?no="+x+"&date="+document.getElementById("date2").value;
			document.getElementById("appointmentDisplay").innerHTML = ":";
			xmlHttp.open("GET",url);
			xmlHttp.onreadystatechange=getResponse2;
		}
		
		xmlHttp.send(null);
	}
	
		
	function getResponse1()
	{
		if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
		{
			document.getElementById("appointmentDisplay").innerHTML=xmlHttp.responseText;
		}
	}
	
	function getResponse2()
	{
		if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
		{
			document.getElementById("appointmentDisplay").innerHTML="You have : "+xmlHttp.responseText;
		}
	}
	
	
	function popUpPrescription(){
		
		var left = (screen.width/2)-(220);
 		var top = (screen.height/2)-(280);
  		window.open("prescriptionForm.php?pid="+document.getElementById("pid").value+"&did=<?php echo $_SESSION["uid"]?>", '_blank', 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width=440, height=560, top='+top+', left='+left);
		
	}
		

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
					  <th width='28%'><div align="left">DOCTOR ID </div></th>
					  <td width='4%'>:                                            
					  <td width='50%'><?php echo $did; ?><td width="8%"></tr>
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
					  <th width='10%'>&nbsp;</th>
					  <th width='28%'><div align="left">SPECIALIZATION </div></th>
					  <td width='4%'>:                                            
					  <td width='50%'><?php echo $spId;  ?><td></tr>
					<tr>
					  <th width='10%'>&nbsp;</th>
					  <th width='28%'><div align="left">HOSPITAL ID </div></th>
					  <td width='4%'>:                                            
					  <td width='50%'><?php echo $hId;  ?><td></tr>
					<tr>
					  <th width='10%'>&nbsp;</th>
					  <th width='28%'><div align="left">SLMC NUMBER </div></th>
					  <td width='4%'>:                                            
					  <td width='50%'><?php echo $slmcRegNo;?><td></tr>
					<tr>
					  <th>&nbsp;</th>
					  <th colspan="3">&nbsp;</th>
					  <td>                    
		    </tr>
					<tr>
					  <th width='10%'>&nbsp;</th>
					  <th colspan="3"><a class='button-link' style='cursor:pointer;padding: 2px 2px;' href='editDDetails.php'>Edit Details</a>
                    </th><td></tr>
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
            <a class="button-link1" href="prescription.php">Prescription</a>&nbsp; 
            <a class="button-link1" href="prescription.php">Patient History</a>&nbsp;
            <a class="button-link1" href="ArticalUpload.php"> Upload New Artical </a>&nbsp;
            <a class="button-link1" href="forumQList.php">&nbsp; Forum&nbsp; </a>&nbsp;      

		  	<a class="button-link1" href="rosterList.php">Rosters</a>&nbsp; 
          </div>

<hr style="border:solid 1px #99FF00;">
				<br/>
			
		<div>
<table width="100%"border="0" height="100%">
			
			<tr>
			
				 <td width="40%" height="50%" >
				  <div style=" width:70%; height:80%;  background-color:#339900;box-shadow: 10px 10px 5px #000000; padding:0px 0px 0px 25px;">
					<a class="button-link" style="cursor:pointer;padding: 12px 22;" href="articleLsit.php"> &nbsp; &nbsp; &nbsp; Artical List &nbsp;   &nbsp; </a>&nbsp; <br/> <br/>
					    <div>   
                        
         <marquee bgcolor="#339900" scrollamount="2" direction="down" loop="true" height="80%" width="80%"> <font color="#ffffff">
         
         <?php 
			echo $artList;				
		?>
        </font></marquee>
                          
					

					</div>
					 </div>
					 </td>
					<td width="40%" height="50%">
				<div style="width:70%; height:80%;  background-color:#339900;box-shadow: 10px 10px 5px #000000; padding:0px 0px 0px 25px;">
                <a class="button-link" style="cursor:pointer;padding: 12px 22;"  href='forumQList.php'>FAQ Que&nbsp;&nbsp;</a>&nbsp;<br/> <br/>
				<div>     
             <marquee bgcolor="#339900" scrollamount="2" direction="down" loop="true" height="80%" width="80%"> <font color="#000000">

						<?php 
                        echo $forumQList;				
                        ?>
                </font></marquee>
					</div>
           		 </div>
				 </td>
				 </tr>

				  <tr>

				 <td rowspan="2"  width="20%" >		
			 
				<div style ="width:95%; height:95%;  background-color:#339900;box-shadow: 10px 10px 5px #000000;">
					<a class="button-link" style="cursor:pointer;padding: 12px 22px;" href="rosterList.php" >Add an Appointment</a>
					<br/><br/><br/>
                    <table width="98%" height="80%" border="0" align="center">
                    <tr>
                    <td colspan="2" ><div align="center"><h4>First select appointment date and time</h4></div></td>
                    <td >&nbsp;</td>
                    </tr>
                    <tr>
                    <td>Reason</td><td><input type="text" id="tital" name="tital"></td>
                    <td>&nbsp;</td>
                    </tr>
                    <tr>
                    <td>Description</td><td rowspan="2"><textarea id="desc" name="desc" rows="3"></textarea></td>
                    <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                    <td>&nbsp;</td><td> <a class="button-link" style="cursor:pointer;padding: 7px 12;" onClick="ajaxPending(1);"  >&nbsp;Add&nbsp;</a>&nbsp;&nbsp;<a class="button-link" style="cursor:pointer;padding: 7px 12;"  href='forumQList.php'>&nbsp;Reset&nbsp;</a></td>
                    <td>&nbsp;</td>
                    </tr>
                    </table>
											
            	</div>
				</td>
				
				<td>
				<div>
				<br><H2></H2>
                <div align="right">
					<script type="text/javascript" src="js/jquery.simple-dtpicker.js"></script>
                    <link type="text/css" href="css/jquery.simple-dtpicker.css" rel="stylesheet" />
                <input type="text" name="date2" id="date2" onChange="ajaxPending(2);" value="new Date().toLocaleString();">
                <script type="text/javascript">
                        $(function(){
                            $('*[name=date2]').appendDtpicker({"inline": true});
                        });
                    </script>
                   </div>
		</div>	
			</td>
                </tr>
                <tr>
                
                <td>
                <div id='appointmentDisplay' style="color:#06F;font-size:18px"></div>
                </td>

                </tr>
         
          </table>
		  </div>
       
        </div>

		<?php 
			include 'footer.php';
		?>	
 </div>
 
 </body>
 </html>