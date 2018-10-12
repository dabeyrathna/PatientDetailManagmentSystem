
<?php

		session_start();
 		if (!isset($_SESSION["uid"]))
        {
        	header("Location:errorPage.php?info=7");
        }
		else if($_SESSION["uid"][0] != 'D' && $_SESSION["uid"][0] != 'd' && $_SESSION["uid"][0] != 'P' && $_SESSION["uid"][0] != 'p'){
			header("Location:errorPage.php?info=7");
		}
		else{   
			require_once("timeout.php");
			isTimedOut();    
		}  

		$passError = "";
		$userError = "";
		$str = '';
		if(isset($_GET["pres"])){
			
			require_once("DBAccess.php");  
			$db = new DBAccess();
			$dbConnection = $db->initConnection();
			
			$sql = "SELECT  patient_history.pId as pid,
							patient_history.date as historydate,
							patient_history.presId as prescripId,
							hospital.hName as hname,
							doctor.name as dname,
							patient_history.description as desctrption,
							patient_history.reportNo as reportno
					FROM   `patient_history`,
						   `patient`,
						   `hospital`,
						   `doctor`
					WHERE   patient_history.presId= '".$_GET["pres"]."' AND 
							patient_history.pId = patient.pId AND
							hospital.hId = patient_history.hId AND
							doctor.dId = patient_history.dId";
							
				$query=mysql_query($sql,$dbConnection);
				while($rows=mysql_fetch_array($query))
				{	
					$pid = $rows['pid'];
					$pressId = $rows['prescripId'];
									
					 $str .= ' <table width="77%" height="256" align="center" border="0"><tr>
						<th width="49%" rowspan="7" scope="row"><img width="250" height="300" src="uploads\patient_reports\\'.$rows['reportno'].'"</th>
						<td width="12%">Report ID</td>
						<td width="3%">:</td>
						<td width="36%">'.$rows['reportno'].'</td>
					  </tr>
					  <tr>
						<td>Date</td>
						<td>:</td>
						<td>'.$rows['historydate'].'</td>
					  </tr>
					  <tr>
						<td>Doctor</td>
						<td>:</td>
						<td>'.$rows['dname'].'</td>
					  </tr>
					  <tr>
						<td>Hospital</td>
						<td>:</td>
						<td>'.$rows['hname'].'</td>
					  </tr>
					  <tr>
						<td>Description</td>
						<td>:</td>
						<td rowspan="3" align="left" valign="top"><br>'.$rows['desctrption'].'</td>
					  </tr>
					  <tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					  </tr>
					  <tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					  </tr></table><br>
					  ';
				}
				
				
				$strHeading = '<div align="center">
							<p style="font-size:160%;"><b>Patient ID</b> : '.$pid.'</p>
							<p style="font-size:160%;"> <b>Prescription ID</b> : '.$pressId.'</p>
						</div><br>';
			
		}		
		else{
			header("Location:patientHistoryList.php?info=1");
		}
	
?>

<html>
<head>
<link rel="stylesheet" type="text/css" href="css/sty.css" />
<link rel="stylesheet" type="text/css" href="css/menustyle.css" />
</head>

<body>
<div id="wrapper">
		<br class="clearfix" />
		<?php echo $strHeading; ?>
        
        <div align="center">              
                <a class="button-link1" href="#" onClick="window.print();">&nbsp;&nbsp;Print&nbsp;&nbsp;</a>&nbsp;&nbsp;  
                <a class="button-link1" href="#" onClick="window.close();">&nbsp;&nbsp;Close&nbsp;&nbsp;</a>&nbsp;&nbsp;  
          </div>
          
          
        <div id="page">  
        <?php echo "<hr>".$str; ?>
        </div>

		<?php 
			include 'footer.php';
		?>	
 </div>
 </body>
 </html>
