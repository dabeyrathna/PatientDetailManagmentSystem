
<?php
	require_once("DBAccess.php");
	
	$db = new DBAccess();
	$dbConnection = $db->initConnection();
	
if($_GET['no'] == 1)
{
	$pid = $_GET['pid'];
	$queryString="SELECT name,gender,bloodgroup,YEAR(NOW())-YEAR(dob) As age FROM patient WHERE pid='".$pid."'";         
	
	$query = mysql_query($queryString,$dbConnection);
	$noOfRaws = mysql_num_rows($query); 
	$str = "";
	if($noOfRaws==1)
	{            
		$rows = mysql_fetch_assoc($query);	
		
		$str .="<p><table border='0' align='center'>
					<tr>
						<td><b>Patient Name</b> : </td>
						<td>".$rows["name"]."</td>
						<td><b>&emsp;&emsp;Patient Age</b> : </td>
						<td>".$rows["age"]."</td>
						<td><b>&emsp;&emsp;Gender</b> : </td>
						<td>".$rows["gender"]."</td>
						<td><b>&emsp;&emsp;Blood group</b> : </td>
						<td>".$rows["bloodgroup"]."</td>
					</tr>	
					
		</table></p>
		<br>
		<table>
			<tr>
				<td><form id='prescription' target='_blank'><p align='center'><a class='button-link' style='cursor:pointer;padding: 3px 10px;' onClick='ajaxPending(2);'>Prescription</a></p></td> </form>
				<td>
					<form method='POST' action='patientHistoryList.php' id='historyPost' target='_blank'>
							<p align='center'>
								<a class='button-link' style='cursor:pointer;padding: 3px 10px;' onClick='ajaxPending(3);'>
									Patient History
								</a>
							</p>
						<input type='hidden' value='".$pid."' name='pId'> 
					</form>
				</td>
			</tr>
		</table>";
		
		$queryString2= "delete from prescription_temp";         
		$query2 = mysql_query($queryString2,$dbConnection);
		
		echo $str;
	}
	else
	{
	   echo '<p style="color:red;">Invalid Patient ID</p>';
	}
}

else if($_GET['no'] == 2){
	
			$diag = '';
			if(isset($_GET['diagnosis'])){
				$diag = $_GET['diagnosis'];  
			}
			if(isset($_GET['issue'])){
				$issueId = $_GET['issue'];
			}
			else{
				$issueId = 0;
			}
	

			$str = "";
			
			$str .= '	
			
			Diagnosis :<br>
			<textarea id = "diagnosis" rows="4" cols="50">'.$diag.'</textarea>
			<br>
			Issue
			<br>
			';
			include 'dbread.php';
			$str .= healthIssueList($issueId); 
			
			$str .= '
			<br><br>
			<table width="200" border="0" style="background-color:green">
		
					<tr>
						<td>Medicine</td>
						<td>Dosage</td>
						<td>Frequency</td>
						<td>Duration</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>';
					
						
						$str .= healthMedicineList(0); 
					
						$str .= '</td>
						<td><input type="text" id="dosage" /></td>
						<td>';
					
					
						$str .= frequencyList(0); 
					
						$str .= '</td>
						<td><input type="text" id="duration" /></td>
						<td><input type="button" value="Add" onclick="ajaxPending(2);" /></td>
					
				  </tr>
				<tr>
				</tr>
				<tr>
				</tr>
				</table>
				
				<br><p align="center"><a class="button-link" style="cursor:pointer;padding: 3px 10px;" onClick="popUpPrescription();">Finish</a></p>';	
			
			
			
		if(isset($_GET['mid']) && isset($_GET['dosage']) && isset($_GET['frequencyId']) && isset($_GET['did']) && isset($_GET['pid']) && isset($_GET['duration'])){
				$pid = $_GET['pid'];
				$did = $_GET['did'];
				$mid = $_GET['mid'];
				$dosage = $_GET['dosage'];
				$freq = $_GET['frequencyId'];
				$duration = $_GET['duration'];
				$issueId = $_GET['issue'];

				$queryString="INSERT INTO `prescription_temp`(`pid`, `did`, `mid`, `dosage`, `frequencyId`, `date`,`diagnosis`,`duration`,`issueId`) VALUES ('".$pid."','".$did."','".$mid."','".$dosage."','".$freq."',now(),'".$diag."','".$duration."','".$issueId."')";
				$query = mysql_query($queryString,$dbConnection);
				
				
				$queryString2="SELECT presId, medicine, dosage, did, frequency, duration
										FROM prescription_temp, medicine, frequency_med
												WHERE medicine.`mid` = prescription_temp.`mid` 
															AND frequency_med.`frequencyId` = prescription_temp.`frequencyId`";
				$query1=mysql_query($queryString2,$dbConnection);
				$diagnosis = '';
				$str .= "<br><br><table align='center' width='550px'><th>Medicine</th><th>Dosage</th><th>Frequency</th><th>Duration</th><th></th>";
				while($rows=mysql_fetch_array($query1))
				{	
				$str .= "<tr>
						<td align='center'>".$rows["medicine"]."</td>
						<td align='center'>".$rows["dosage"]."</td>
						<td align='center'>".$rows["frequency"]."</td>
						<td align='center'>".$rows["duration"]."</td>
						<td align='center'><input type='button' value='Remove' onclick='ajaxPending(10+parseInt(".$rows["presId"]."))' ><input type='hidden' id='presId' value='".$rows["presId"]."'></td>
						</tr>";
				}
				$str .= "</table>";
			}
			echo($str);
}

else if($_GET['no'] == 3){
	/*$pid = $_GET['pid'];
	$queryString="SELECT * FROM patient_history WHERE pid='".$pid."'";         
	
	$query = mysql_query($queryString,$dbConnection);
	$noOfRaws = mysql_num_rows($query); 
	$str = "";
	
	$str .='<br><br><br><br><br><table border="0" id="table" class="example table-autopage:5 table-stripeclass:alternate" style="width: 500px;" align="center">
		<thead>
		<tr>
			<th align="center" class="Hist Id">appNo</th>
			<th class="Topic">Date</th>
			<th class="filterable">Hospital</th>
			<th class="filterable">Doctor</th>
			<th align="center" class="filterable">More</th>
		</tr>
		<tr>
			<th><input size="5px" align="center" name="filter" onkeyup="Table.filter(this,this)"></th>
			<th><input size="10px" align="center" name="filter" onkeyup="Table.filter(this,this)"></th>
			<th><input align="center" name="filter" size="15" onkeyup="Table.filter(this,this)"></th>
			<th><input align="center" name="filter" size="15" onkeyup="Table.filter(this,this)"></th>
			<th></th>
		</tr>
	</thead>
	<tbody>';
	
	
			$query=mysql_query($queryString,$dbConnection);
			while($rows=mysql_fetch_array($query)){	

			$str .="<tr>
							<td align='center'>".$rows["historyNo"]."</td>
							<td align='center'>".$rows["date"]."</td>
							<td align='center'>".$rows["hId"]."</td>
							<td align='center'>".$rows["dId"]."</td>
							<td align='center'><a href='viewHistoryDetails.php?no=".$rows["historyNo"]."'>More..</a></td>
						<tr>";
			}
			
			
			$str=$str.'<tbody><tfoot>
					<td align="center" colspan="5">
						<a style="cursor:pointer;font-size:9px;font-weight:100;" class="paging-link" onclick="pageexample(\'previous\'); return false;">&lt;&lt;&nbsp;Previous</a>
						<a style="cursor:pointer;font-size:9px;font-weight:100;" id="page1" class="pagelink paging-link" onclick="pageexample(0); return false;">1</a>
						<a style="cursor:pointer;font-size:9px;font-weight:100;" id="page2" class="pagelink paging-link" onclick="pageexample(1); return false;">2</a>
						<a style="cursor:pointer;font-size:9px;font-weight:100;" id="page3" class="pagelink paging-link" onclick="pageexample(2); return false;">3</a>
						<a style="cursor:pointer;font-size:9px;font-weight:100;" id="page4" class="pagelink paging-link" onclick="pageexample(3); return false;">4</a>
						<a style="cursor:pointer;font-size:9px;font-weight:100;" id="page5" class="pagelink paging-link" onclick="pageexample(4); return false;">5</a>
						<a style="cursor:pointer;font-size:9px;font-weight:100;" id="page6" class="pagelink paging-link" onclick="pageexample(5); return false;">6</a>
						<a style="cursor:pointer;font-size:9px;font-weight:100;" class="paging-link" onclick="pageexample(\'next\'); return false;">Next&nbsp;&gt;&gt;
					</td>';
	
	
	
		$str=$str.'</tfoot></table><br>';
			echo $str;
			
			*/
	
}

else if($_GET['no'] > 10){
	
	
			$presId = (int)$_GET['no'] - 10;
			$diag = '';
			
			if(isset($_GET['diagnosis'])){
				$diag = $_GET['diagnosis'];  
			}
			if(isset($_GET['issueId'])){
				$issueId = $_GET['issue'];
			}
			else{
				$issueId = 0;
			}

			$str = "";
			
			$str .= '
		
			
			Diagnosis :<br>
			<textarea id = "diagnosis" rows="4" cols="50">'.$diag.'</textarea>
			<br>
			Issue
			<br>
			';
			include 'dbread.php';
			$str .= healthIssueList($issueId); 
			
			$str .= '
			<br><br>
			<table width="200" border="0" style="background-color:green">
		
					<tr>
						<td>Medicine</td>
						<td>Dosage</td>
						<td>Frequency</td>
						<td>Duration</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>';

						$str .= healthMedicineList(0); 
					
						$str .= '</td>
						<td><input type="text" id="dosage" /></td>
						<td>';
					
					
						$str .= frequencyList(0); 
					
						$str .= '</td>
						<td><input type="text" id="duration" /></td>
						<td><input type="button" value="Add" onclick="ajaxPending(2);" /></td>
						<br>
				  </tr>
		
				</table>
				
				<br><p align="center"><a class="button-link" style="cursor:pointer;padding: 3px 10px;" onClick="popUpPrescription();">Finish</a></p>';	
				
				
				
				
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			
			$queryStringDel= "delete from prescription_temp where presId = '".$presId."'";  
			$query = mysql_query($queryStringDel,$dbConnection);
			
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			
		if(isset($_GET['mid']) && isset($_GET['dosage']) && isset($_GET['frequencyId']) && isset($_GET['did']) && isset($_GET['pid']) && isset($_GET['duration'])){
							
				$queryString2="SELECT presId, medicine, dosage, did, frequency, duration
										FROM prescription_temp, medicine, frequency_med
												WHERE medicine.`mid` = prescription_temp.`mid` 
															AND frequency_med.`frequencyId` = prescription_temp.`frequencyId`";
				$query1=mysql_query($queryString2,$dbConnection);
				$diagnosis = '';
				$str .= "<br><br><table align='center' width='550px'><th>Medicine</th><th>Dosage</th><th>Frequency</th><th>Duration</th><th></th>";
				while($rows=mysql_fetch_array($query1))
				{	
				$str .= "<tr>
						<td align='center'>".$rows["medicine"]."</td>
						<td align='center'>".$rows["dosage"]."</td>
						<td align='center'>".$rows["frequency"]."</td>
						<td align='center'>".$rows["duration"]."</td>
						<td align='center'><input type='button' value='Remove' onclick='ajaxPending(10+parseInt(".$rows["presId"]."))' ><input type='hidden' id='presId' value='".$rows["presId"]."'></td>
						</tr>";
				}
				$str .= "</table>";
			}
			echo($str);
}

?>