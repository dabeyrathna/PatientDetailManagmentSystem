 <?php
 function getDoctorsList(){
	require_once("DBAccess.php");  
			$db = new DBAccess();
			$dbConnection = $db->initConnection();
			$str = "";
			$sql = "SELECT dId, slmcRegNo, doctor.name, doctor.telNo, doctor.district, spName, hName
FROM doctor, specialization, hospital
WHERE doctor.spId = specialization.spId
AND doctor.hId = hospital.hId";	
			

				  
   
 
 
	 	$str .='<h2 align="center">Doctors list</h1><br><br><table border="5"  style="width: 100%; border-style: solid; border-color: #99FF00 #CCFF00; " align="center">
		<thead>
		<tr >
			<th align="center" class="Doctor Id">Doctor Id</th>
			<th align="center" class="slmc">SLMC Registration No</th>
			<th class="Topic"> Doctor Name</th>
			<th class="filterable">District</th>
			<th class="filterable">Contact Number</th>
			<th class="filterable">Specialization</th>
			<th class="filterable">Hospitat</th>
			
		
		</tr>
		<tr>
			<th><input size="5px" align="center" name="filter" onkeyup="Table.filter(this,this)"></th>
			<th><input size="5px" align="center" name="filter" onkeyup="Table.filter(this,this)"></th>
			<th><input size="5px" align="center" name="filter" onkeyup="Table.filter(this,this)"></th>
			<th colspan ="2"></th>
			<th><input size="5px" align="center" name="filter" onkeyup="Table.filter(this,this)"></th>
		
			
		</tr>
	</thead>
	<tbody>';
	
	
			$query=mysql_query($sql,$dbConnection) or die("SQL Error ".mysql_error());
			while($rows=mysql_fetch_array($query)){	

			$str .="<tr>
							<td align='center'>".$rows["dId"]."</td>
							<td align='center'>".$rows["slmcRegNo"]."</td>
							<td>".$rows["name"]."</td>
							<td>".$rows["district"]."</td>
							<td>".$rows["telNo"]."</td>
							<td>".$rows["spName"]."</td>
							<td>".$rows["hName"]."</td>
							
						<tr>";
			}
			
			
			
	
	
	
		$str=$str.'</tfoot></table><br><br><br><br>';
			echo $str;
}
?> 

