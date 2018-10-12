 <?php
 function getHospitalList(){
	require_once("DBAccess.php");  
			$db = new DBAccess();
			$dbConnection = $db->initConnection();
			$str = "";
			$sql = "SELECT * FROM hospital";	
			$employee="Business Admin";

				  
   
 
 
	 	$str .='<h2 align="center">Hospital list</h1><br><br><table border="5"  style="width: 100%; border-style: solid; border-color: #99FF00 #CCFF00; " align="center">
		<thead>
		<tr >
			<th align="center" class="Article Id">Hospital Id</th>
			<th class="Topic"> Hospital Name</th>
			<th class="filterable">Add</th>
			<th class="filterable">Contact Number</th>
			<th class="filterable">Description</th>
			<th class="filterable">Distric</th>
		
		</tr>
		<tr>
			<th><input size="5px" align="center" name="filter" onkeyup="Table.filter(this,this)"></th>
			<th colspan ="4"></th>
			
			<th align="center"><input id="appNo" size="5px" align="center" name="filter" onkeyup="Table.filter(this,this)"> <span> <img src ="" /></span></th>
			
		</tr>
	</thead>
	<tbody>';
	
	
			$query=mysql_query($sql,$dbConnection) or die("SQL Error ".mysql_error());
			while($rows=mysql_fetch_array($query)){	

			$str .="<tr>
							<td align='center'>".$rows["hId"]."</td>
							<td>".$rows["hName"]."</td>
							<td>".$rows["add"]."</td>
							<td>".$rows["telNo"]."</td>
							<td>".$rows["description"]."</td>
							<td>".$rows["district"]."</td>
							
						<tr>";
			}
			
			
			
	
	
	
		$str=$str.'</tfoot></table><br><br><br><br>';
			echo $str;
}
?> 

