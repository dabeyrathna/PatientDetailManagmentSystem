<?php
    require_once("DBAccess.php");
	$db = new DBAccess();
	$dbConnection = $db->initConnection();
				
				$queryString2="SELECT presId, medicine, dosage,duration, doctor.name as doctorName,issue,health_issue.issueId as issueId, frequency, patient.name as patientName, diagnosis from prescription_temp, medicine, doctor, patient, frequency_med, health_issue where medicine.mid = prescription_temp.mid AND doctor.did = prescription_temp.did AND patient.pid = prescription_temp.pid AND prescription_temp.frequencyId = `frequency_med`.`frequencyId` AND health_issue.issueId = prescription_temp.issueId";		
				
				$query1=mysql_query($queryString2,$dbConnection);
				
				if(mysql_num_rows($query1) < 1){
					echo 'Please add prescriptions';
				}
				else{
						$diag = '';
						$str = "<div id = 'prescriptionForm'><h2>&emsp;&emsp;&emsp;&emsp;Prescription Report</h2><br><hr><br>
						<table align='center' width='420px' border='0'>
							<tr align='center'>
								<td>Patient ID  : ".$_GET['pid']."</td>
								
								<td>&emsp;&emsp;Doctor id :".$_GET['did']."</td>
							</tr>
						
						</table>
						
						<br><hr><br><table align='center' width='420px' border='1'><th>Medicine</th><th>Duration</th><th>Dosage</th><th>frequency</th>";
						while($rows=mysql_fetch_array($query1))
						{	
		
						$str .= "<tr>
								<td align='center'>".$rows["medicine"]."</td>
								<td align='center'>".$rows["duration"]."</td>
								<td align='center'>".$rows["dosage"]."</td>
								<td align='center'>".$rows["frequency"]."</td>
								</tr>";
						$diag =  $rows["diagnosis"];
						}
						$str .= "</table><hr>
						
											
						<p><b>Diagnosis : </b><br><i>
						".$diag."
						</i></p>
						
						<hr>
						<br>
						Date : " .date("Y/m/d")."&emsp;&emsp;&emsp;&emsp;Doctor's Signature : ____________
						
						<br> <hr></div> <br>
						&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
						<input type= 'button' id='print' value = 'Print' onClick='ajaxPending();'>&emsp;
						<input type= 'button' id='print' value = 'Cancel' onClick='window.close();'>";
						echo $str;
				}		
				
				
			if(isset($_GET['info'])){
						
				$sql1 = "SELECT * FROM prescription_temp order by date DESC";
				$query1=mysql_query($sql1,$dbConnection);
				
				$flag = 0;
				$diagnosisId = 1;
				while($rows=mysql_fetch_assoc($query1))
				{
					if($flag == 0){
					
						$diagnosisId = $rows['presId'];
						
						$sql2 = "INSERT INTO `prescription`(`pid`, `did`,`date`, `diagnosis`,`issueId`, `diagnosisNo`)
												VALUES ('".$rows['pid']."',
																 '".$rows['did']."',
																 '".$rows['date']."',
																 '".$rows['diagnosis']."',
																 '".$rows['issueId']."',
																 '".$diagnosisId."')";
												
						
						$query2=mysql_query($sql2,$dbConnection);
						
						$flag = 1;
					}
				
					$sql3 = "INSERT INTO `diagnosis`(`diagnosisNo`, `medicine`, `dosage`, `frequency`, `duration`)
												VALUES ('".$diagnosisId."',
														'".$rows['mid']."',
														'".$rows['dosage']."',
														'".$rows['frequencyId']."',
														'".$rows['duration']."')";
												
					echo $sql3;							
					$query3=mysql_query($sql3,$dbConnection);

				}
				
				$sql4 = "DELETE FROM prescription_temp";
				$query4=mysql_query($sql4,$dbConnection);
			}

?>
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
	
	
	function ajaxPending()
	{			
		xmlHttp=GetXmlHttpRequest();
		if(xmlHttp==null)
		{
			alert("Your browser does not support Http request");
			return;
		}	
		else{
			var url="prescriptionForm.php?info=1&pid=<?php echo $_GET['pid']; ?>&did=<?php echo $_GET['did']; ?>";
			xmlHttp.open("GET",url);
			xmlHttp.onreadystatechange=getResponse1;
		}		
		xmlHttp.send(null);
	}
	
		
	function getResponse1()
	{
		if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
		{
			PrintElem();
		}
	}
	
	function PrintElem()
    {
		
        Popup($('#prescriptionForm').html());
    }

    function Popup(data) 
    {
        var mywindow = window.open('', 'Prescription form', 'height=400,width=600');
        mywindow.document.write('<html><head><title></title>');
        /*optional stylesheet*/ //mywindow.document.write('<link rel="stylesheet" href="main.css" type="text/css" />');
        mywindow.document.write('</head><body >');
        mywindow.document.write(data);
        mywindow.document.write('</body></html>');

        mywindow.document.close(); // necessary for IE >= 10
        mywindow.focus(); // necessary for IE >= 10

        mywindow.print();
        mywindow.close();

        return true;
    }

</script>

