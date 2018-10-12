<?php
	session_start();
	require_once("DBAccess.php");
	
	$db = new DBAccess();
	$dbConnection = $db->initConnection();
	
	
	$str = "";
	
	
if(isset($_GET['no']))	
{
	if($_GET['no'] == 1){
		$str .= '<div align="center"> 
				<h3>General Statistics</h3>
                    <table id="printTable" width="80%" height="50%"  border="0" cellpadding="5" style="align:center;">

                       <td height="5%">Select Option</td>
                        <td height="10%" align="center">
							<select id = "generalStatList" name="generalStatList" style="width:400px" onChange="ajaxPending(7);">
								<option value="0" selected>--- Select an Option ---</option>
								<option value="1">Health Issues with Districts</option>
								<option value="2">Health Issues with Gender per Year</option>;
								<option value="3">Health Issues with Months of a year</option>;
								<option value="4">Health Issues with Year range</option>;
								<option value="5">Health Issues with Gender per Months</option>;
                			</select>
						 </td>
                      </tr>
                 </table><hr><br></div>
				 
				 <div id="secondOptionSelectionList">
				</div>';
		
	}
	else if($_GET['no'] == 2){
		/*$str .='<div align="center"> 
				<h3>General Statistics</h3>
                    <table id="printTable" width="80%" height="50%"  border="0" cellpadding="5" style="align:center;">

                       <td height="5%">Select Option</td>
                        <td height="10%" align="center">
							<select id = "alertList" name="alertList" style="width:400px" onChange="ajaxPending(6);">
								<option value="0" selected>--- Select an Option ---</option>
								<option value="1">Issue Alerts</option>
								<option value="2">Reporting Alerts</option>
								<option value="3">Country wise Alerts</option>
                			</select>
						 </td>
                      </tr>
                 </table><hr><br></div>
				 
				 <div id="secondOptionSelectionList">
					 <img align="middle" src="Images/map.jpg" width="405" height="625"/>
				 
				</div>'; */
	}
	else if($_GET['no'] == 7)
	{		
		if($_GET['opt'] == 1)
		{
				$str .= ' <form name="form2" method="post" id="regForm1" action="statistics.php"> 
							<table id="printTable" width="80%"  border="0" cellpadding="5" style="align:center;">
								<tr height="100%">
                          			<td height="100%" width="29%">Select Issues from List<br>(Hold down the Ctrl)</td>
                        			<td height="100%">';
						
				include 'dbread.php';
				$str .= healthIssueList(0); 
					
				$str .= '</td>                     
                      </tr>
					  <tr>
                          <td width="29%">District List</td>
                        		<td >';
			
				$str .= districtList();
						
					
				$str .= '</td>                
                      	</tr>
					 	<tr>
                        	<td width="29%"></td>
                        	<td >
							<input type="hidden" name="chartType" value="1" />
								<br><p align="center"><input type="submit" class="button-link1" value="Generate"></input></p>&nbsp;
							</td>
                     
                      	</tr>
					  
				</table></form>';
		}
		else if($_GET['opt'] == 2)
		{
			$str .= ' <form name="form2" method="post" id="regForm1" action="statistics.php"> 
						<table id="printTable" width="80%"  border="0" cellpadding="5" style="align:center;">
								<tr height="100%">
                          			<td height="100%" width="29%">Select Issues from List<br>(Hold down the Ctrl)</td>
                        			<td height="100%">';
						
				include 'dbread.php';
				$str .= multiSelectionHealthIssueList(); 
					
				$str .= '</td>                     
                      </tr>
					  <tr>
                          <td  width="29%">Year Range</td>
                        		<td>';
			
				$str .= 'From : <select id = "yearLowerLimit" name="yearLowerLimit" style="width:80px">';
						$count = 1950;
						while($count <= date("Y"))
						{	
							if($count == date("Y")-5)
								$str .=	'<option value="'.$count.'" selected>'.$count.'</option>';
							else
								$str .=	'<option value="'.$count.'">'.$count.'</option>';
							
                            $count++;
                        }
						 $str .= '</select>';
						 
				$str .= 'To : <select id = "yearUpperLimit" name="yearUpperLimit" style="width:80px">';
						$count = 1950;
						while($count <= date("Y"))
						{	
							if($count == date("Y"))
								$str .=	'<option value="'.$count.'" selected>'.$count.'</option>';
							else
								$str .=	'<option value="'.$count.'">'.$count.'</option>';
							
                            $count++;
                        }
						 $str .= '</select>';
					
				$str .= '</td>                
                      	</tr>
					 	 	<tr>
                        	<td  width="29%"></td>
                        	<td >
							<input type="hidden" name="chartType" value="2" />
								<br><p align="center"><input type="submit" class="button-link1" value="Generate"></input></p>&nbsp;
							</td>
                     
                      	</tr>
					  
				</table></form>';	
		}
		else if($_GET['opt'] == 3)
		{
			$str .= ' <form name="form2" method="post" id="regForm1" action="statistics.php"> 
						<table id="printTable" width="80%" height="50%"  border="0" cellpadding="5" style="align:center;">
								<tr height="100%">
                          			<td height="100%" width="29%">Select Issues from List<br>(Hold down the Ctrl)</td>
                        			<td height="100%">';
						
				include 'dbread.php';
				$str .= multiSelectionHealthIssueList(); 
					
				$str .= '</td>                     
                      </tr>
					  <tr>
                          <td width="29%">Year</td>
                        		<td>';
			
				$str .= '<select id = "yearLowerLimit" name="yearLowerLimit" style="width:80px">';
						$count = 1950;
						while($count <= date("Y"))
						{	
							if($count == date("Y"))
								$str .=	'<option value="'.$count.'" selected>'.$count.'</option>';
							else
								$str .=	'<option value="'.$count.'">'.$count.'</option>';
							
                            $count++;
                        }
						 $str .= '</select>';
						
					
				$str .= '</td>                
                      	</tr>
					  	<tr>
                        	<td width="29%"></td>
                        	<td >
							<input type="hidden" name="chartType" value="3" />
								<br><p align="center"><input type="submit" class="button-link1" value="Generate"></input></p>&nbsp;
							</td>
                     
                      	</tr>
					  
				</table></form>';	
		}
		
		else if($_GET['opt'] == 4)
		{
				$str .= ' <form name="form2" method="post" id="regForm1" action="statistics.php"> 
					<table id="printTable" width="80%" border="0" cellpadding="5" style="align:center;">
								<tr height="100%">
                          			<td height="100%" width="29%">Select Issues from List<br>(Hold down the Ctrl)</td>
                        			<td height="100%">';
						
				include 'dbread.php';
				$str .= multiSelectionHealthIssueList(); 
					
				$str .= '</td>                     
                      </tr>
					  <tr>
                          <td width="29%">Year Range</td>
                        		<td>';
			
				$str .= 'From : <select id = "yearLowerLimit" name="yearLowerLimit" style="width:80px">';
						$count = 1950;
						while($count <= date("Y"))
						{	
							if($count == date("Y")-5)
								$str .=	'<option value="'.$count.'" selected>'.$count.'</option>';
							else
								$str .=	'<option value="'.$count.'">'.$count.'</option>';
							
                            $count++;
                        }
						 $str .= '</select>';
						 
				$str .= 'To : <select id = "yearUpperLimit" name="yearUpperLimit" style="width:80px">';
						$count = 1950;
						while($count <= date("Y"))
						{	
							if($count == date("Y"))
								$str .=	'<option value="'.$count.'" selected>'.$count.'</option>';
							else
								$str .=	'<option value="'.$count.'">'.$count.'</option>';
							
                            $count++;
                        }
						 $str .= '</select>';
						
					
				$str .= '</td>                
                      	</tr>
					 	<tr>
                        	<td width="29%"></td>
                        	<td >
							<input type="hidden" name="chartType" value="4" />
								<br><p align="center"><input type="submit" class="button-link1" value="Generate"></input></p>&nbsp;
							</td>
                     
                      	</tr>
					  
				</table></form>';	
		}
		else if($_GET['opt'] == 5)
		{
				$str .= ' <table id="printTable" width="80%" border="0" cellpadding="5" style="align:center;">
								<tr height="100%">
                          			<td height="100%" width="29%">Select Issues from List<br>(Hold down the Ctrl)</td>
                        			<td height="100%">';
						
				include 'dbread.php';
				$str .= multiSelectionHealthIssueList(); 
					
				$str .= '</td>                     
                      </tr>
					  <tr>
                          <td  width="29%">Year</td>
                        		<td >';
			
				$str .= '<select id = "yearLowerLimit" name="yearLowerLimit" style="width:80px">';
						$count = 1950;
						while($count <= date("Y"))
						{	
							if($count == date("Y"))
								$str .=	'<option value="'.$count.'" selected>'.$count.'</option>';
							else
								$str .=	'<option value="'.$count.'">'.$count.'</option>';
							
                            $count++;
                        }
						 $str .= '</select>';
						
					
				$str .= '</td>                
                      	</tr>
					  	<tr>
                        	<td width="29%"></td>
                        	<td >
							<input type="hidden" name="chartType" value="5" />
								<br><p align="center"><input type="submit" class="button-link1" value="Generate"></input></p>&nbsp;
							</td>
                     
                      	</tr>
					  
				</table>';	
		}
	}
}

if(isset($_GET['district']))
{
		$popupStr = "District : ".$_GET['district']."\n";
		$sql = "SELECT health_issue.issueId as issue, count(*) as c FROM prescription, health_issue, hospital, patient_history where district='".$_GET['district']."' AND hospital.hId = patient_history.hId AND prescription.issueId = health_issue.issueId AND hospital.hId = patient_history.hId GROUP BY health_issue.issueId ORDER BY count(*) DESC limit 5";
		
		$query=mysql_query($sql,$dbConnection);
		while($rows=mysql_fetch_array($query)){	
			$popupStr .= "\n".$rows['issue']."  :  ".$rows['c'];
		}
		echo $popupStr;  
		
		
	}
	echo $str;


?>