<?php

		session_start();
 		if (!isset($_SESSION["uid"]))
        {
        	Header("Location: errorPage.php?info=7");
        }
		else if($_SESSION["uid"][0] != 'P' && $_SESSION["uid"][0] != 'p' ){
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
		$sql = "SELECT * FROM patient where pId ='".$_SESSION["uid"]."'";	
		$employee="Business Admin";

			  
		$query=mysql_query($sql,$dbConnection) or die("SQL Error ".mysql_error());
		$rows=mysql_fetch_assoc($query);
		
			$pid = $rows['pId'];
			$name = $rows['name'];
			$nic = $rows['nic'];
			$gender = $rows['gender'];
			$bloodGroup = $rows['bloodGroup'];
			$add = $rows['add'];
			$telNo = $rows['telNo'];
			$email = $rows['email'];

			if($rows['imageType'] != "")
				$imgName = $_SESSION['uid'].".".$rows['imageType'];
			else
				$imgName = 'defaultPatient.jpg';
				
		
		$forumQSql = "SELECT * FROM forumQuest ORDER BY time DESC LIMIT 6";	
		$artSql = "SELECT * FROM article ORDER BY date DESC LIMIT 6";	
		$presSql = "SELECT * FROM prescription WHERE pid = ".$pid." ORDER BY date DESC LIMIT 6";
		
		$artList = '';
		$forumQList  = '';
		$presList = '';
		
		$query=mysql_query($artSql,$dbConnection) or die("SQL Error 1".mysql_error());
		while($rows=mysql_fetch_array($query))
   		{
      		$artList .= "&nbsp;&nbsp;<a href='articleList.php?artId=".$rows["artId"]."' style=' color: black;'>"."{$rows['topic']}"."</a><br/><br/>";
		}
		
		
		$query=mysql_query($forumQSql,$dbConnection) or die("SQL Error 2".mysql_error());
		while($rows=mysql_fetch_array($query))
   		{
      		$forumQList .= "&nbsp;&nbsp;<a href='forumDiscussion.php?qid=".$rows["qId"]."' style=' color: black;'>"."{$rows['topic']}"."</a><br/><br/>";
  		} 
		
		$query=mysql_query($presSql,$dbConnection) or die("SQL Error 3".mysql_error());
		while($rows=mysql_fetch_array($query))
   		{
      		$presList .= $rows['diagnosis']."&nbsp;&nbsp;<a href='patientHistoryDescription.php?pres=".$rows["presId"]."' style=' color: black;'>more</a><br/><br/>";
  		} 
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
</script>
</head>

<body>
<div id="wrapper">
	<?php 
		include 'header.php';
    	include 'menu.php';
		$user = "";
		if(isset($_SESSION['uid']))
		{
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
      
				<table width='95%'>	
						<tr width='50%'>
						  <th width='12%'>&nbsp;</th>
					    <th width='29%'><div align="left">PATIENT ID </div></th>
					    <td width='3%'>:                                                
					    <td width='35%'><?php echo $pid;?><td width="21%"></tr>
						<tr>
						  <th width='12%'>&nbsp;</th>
					    <th width='29%'><div align="left">YOUR NAME </div></th>
					    <td width='3%'>:                                                
					    <td width='35%'><?php echo $name;?><td></tr>
						<tr>
						  <th width='12%'>&nbsp;</th>
					    <th width='29%'><div align="left">NIC  </div></th>
					    <td width='3%'>:                                                
					    <td width='35%'><?php echo $nic;?><td></tr>
						<tr>
						  <th width='12%'>&nbsp;</th>
					    <th width='29%'><div align="left">GENDER  </div></th>
					    <td width='3%'>:                                                
					    <td width='35%'><?php echo $gender;?><td></tr>
						<tr>
						  <th width='12%'>&nbsp;</th>
					    <th width='29%'><div align="left">BLOOD GROUP </div></th>
					    <td width='3%'>:                                                
					    <td width='35%'><?php echo $bloodGroup;?><td></tr>
						<tr>
						  <th width='12%'>&nbsp;</th>
					    <th width='29%'><div align="left">ADDRESS  </div></th>
					    <td width='3%'>:                                                
					    <td width='35%'><?php echo $add;?><td></tr>
						<tr>
						  <th width='12%'>&nbsp;</th>
					    <th width='29%'><div align="left">CONTACT NO </div></th>
					    <td width='3%'>:                                                
					    <td width='35%'><?php echo $telNo;?><td></tr>
						<tr>
						  <th width='12%'>&nbsp;</th>
					    <th width='29%'><div align="left">E-MAIL </div></th>
					    <td width='3%'>:                                                
					    <td width='35%'><?php echo $email;?><td></tr>
						<tr>
						  <th width='12%'>                          
						  <th colspan="3"><br>
						<a class='button-link' style='cursor:pointer;padding: 2px 9px;' href='editPDetails.php'>Edit details</a>                          </tr>
				</table>" ;

</td>             
         <td width="30%"> 
		 <img class="profile-photo" align="middle" src="imgUploads/<?php echo $imgName; ?>" width="210" height="275"/>
		
		  </td>
		
 </tr>

</table>
              	</div>
<hr style="border:solid 1px #99FF00;"><br>

		<div align="right">           
            <a class="button-link1" href="#" onClick="view();" id="view" style="visibility:visible;" >View My Details</a>&nbsp;&nbsp;
		  	<a class="button-link1" href="#" onClick="hide();" id="hide" style="visibility:hidden;">Hide My Details</a>&nbsp;&nbsp; 
            <a class="button-link2" href="hospitalDetails.php"> &nbsp;&nbsp;&nbsp;&nbsp; Hospitals &nbsp;&nbsp;&nbsp;&nbsp;</a>&nbsp;&nbsp;
            <a class="button-link2" href="patientHistoryList.php" >&nbsp; My History&nbsp;&nbsp;</a>   &nbsp;&nbsp;
            <a class="button-link2" href="forumNewQ.php"> &nbsp;&nbsp; Ask Question&nbsp; &nbsp;</a>&nbsp;&nbsp;
            <a class="button-link2" style="cursor:pointer;" href="articleLsit.php">&nbsp; Artical List &nbsp; </a>&nbsp;&nbsp;
		  	<a class="button-link1" href="forumQList.php">&nbsp;&nbsp;Forum&nbsp;&nbsp;</a>&nbsp; 
          </div>

<hr style="border:solid 1px #99FF00;">
				<br/>
			
		<div>
<table width="100%"border="0" height="100%">
			
			<tr>
			
				 <td width="40%" height="50%" >
				  <div style=" width:95%; height:95%;  background-color:#339900;box-shadow: 10px 10px 5px #000000;">
					<a class="button-link" style="cursor:pointer;padding: 12px 22;" href="articleLsit.php"> &nbsp; &nbsp; &nbsp; Artical List &nbsp;   &nbsp; </a>&nbsp; <br/> <br/>
					    <div>   
                        
         <marquee bgcolor="#339900" scrollamount="2" direction="down" loop="true" height="80%" width="100%"> <font color="#ffffff">
         
         <?php 
			echo $artList;				
		?>
        </font></marquee>
                          
					

					</div>
					 </div>
					 </td>
					<td width="40%" height="50%">
				<div style="width:95%; height:95%;  background-color:#339900;box-shadow: 10px 10px 5px #000000;">
                <a class="button-link" style="cursor:pointer;padding: 12px 22;"  href='forumQList.php'>FAQ Que&nbsp;&nbsp;</a>&nbsp;<br/> <br/>
				<div>     
             <marquee bgcolor="#339900" scrollamount="2" direction="down" loop="true" height="80%" width="100%"> <font color="#000000">

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
					<a class="button-link" style="cursor:pointer;padding: 12px 22px;" href="rosterList.php" >Prescription History</a>
					<br/><br/><br/>
					
					<marquee bgcolor="#339900" scrollamount="2" direction="down" loop="true" height="80%" width="100%"> <font color="#000000">

						 <?php 
                        echo $presList;				
                        ?>
                </font></marquee>
                 
											
            	</div>
				</td>
				
				<td>
				<div>
				<br><H2></H2>
                <div align="right">
				
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
