<?php
	require_once("DBAccess.php");
	


function getRosterList(){
			$db = new DBAccess();
			$dbConnection = $db->initConnection();
			$str = "";
			$sql = "SELECT rosterId, date, department from rosters";	
			






	 	$str .='<h3 align="center">Roster list</h3><br><br><table id="table" class="example table-autopage:5 table-stripeclass:alternate" style="width: 100%;" align="">
		<thead>
		<tr>
			
			<th class="rosters">AVAILABLE ROSTERS</th>
			<th class="filterable">DATE</th>
			<th class="filterable">DEPARTMENT</th>
			
		</tr
		<tr>
			
			<th><input align="center" name="filter" size="18" onkeyup="Table.filter(this,this)"></th>
			<th><input align="center" name="filter" size="18" onkeyup="Table.filter(this,this)"></th>
			<th align="center"><input id="appNo" size="5px" align="center" name="filter" onkeyup="Table.filter(this,this)"></th>
			<th>&nbsp;&nbsp;&nbsp;</th>
		</tr>
	</thead>
	<tbody>';
	
	
			$query=mysql_query($sql,$dbConnection) or die("SQL Error ".mysql_error());
			while($rows=mysql_fetch_array($query)){	

			$str .="<tr>
							<td align='center'>".$rows["rosterId"]."</td>
							<td>".$rows["date"]."</td>
							<td>".$rows["department"]."</td>
							<td><a href='viewRosterDetails.php?no=".$rows["rosterId"]."'>Details</a></td>
						<tr>";
			}
			
			
			$str=$str.'<tbody><tfoot>
					<td align="center" colspan="5">
						<a style="cursor:pointer;font-size:9px;font-weight:100;" class="paging-link" onclick="pageexample(\'previous\'); return false;">&lt;&lt;&nbsp;Previous</a>
						<a style="cursor:pointer;font-size:9px;font-weight:100;" id="page1" class="pagelink paging-link" onclick="pageexample(0); return false;">1</a>
						<a style="cursor:pointer;font-size:9px;font-weight:100;" id="page2" class="pagelink paging-link" onclick="pageexample(1); return false;">2</a>
						<a style="cursor:pointer;font-size:9px;font-weight:100;" class="paging-link" onclick="pageexample(\'next\'); return false;">Next&nbsp;&gt;&gt;
					</td>';
	
	
	
		$str=$str.'</tfoot></table><br><br><br><br>';
			echo $str;
}