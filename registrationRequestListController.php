<?php
	require_once("DBAccess.php");
	


function getRequestList(){
			$db = new DBAccess();
			$dbConnection = $db->initConnection();
			$str1 = "";
			$str2 = "";
			$sql1 = "SELECT `dRequestId`,`name` FROM `temp_doctor`";	
			$sql2 = "SELECT `pRequestId`,`name` FROM `temp_patient`";
	
	 	$str1 .='<h3 align="center">Doctor Request list</h3><br><br><table id="table1" class="example table-autopage:10 table-stripeclass:alternate" style="width: 850px;" align="middle">
		<thead>
		<tr>
			<th align="center" class="Request Id">Request Id</th>
			<th class="Topic">Name</th>
			<th align="center" class="filterable">More</th>
			
		</tr>
		<tr>

			<th><input align="center" name="filter" size="18" onkeyup="Table.filter(this,this)"></th>
			<th><input align="center" name="filter" size="18" onkeyup="Table.filter(this,this)"></th>
			<th>&nbsp;&nbsp;</th>
			
		</tr>
	</thead>
	<tbody>';
	
	
			$query1=mysql_query($sql1,$dbConnection) or die("SQL Error ".mysql_error());
			while($rows=mysql_fetch_array($query1)){	

			
			
			$str1 .="<tr>
							
							<td align='center'>".$rows["dRequestId"]."</td>						
							<td align='center'>".$rows["name"]."</td>
							<td><a href='viewdRequest.php?no=".$rows["dRequestId"]."'>Details</a></td>
							
						<tr>";
			}
			
			
			$str1=$str1.'</tbody><tfoot>
					<td align="center" colspan="5">
						<a style="cursor:pointer;font-size:9px;font-weight:100;" class="paging-link" onclick="pageexample(\'previous\',\'table1\'); return false;">&lt;&lt;&nbsp;Previous</a>
						<a style="cursor:pointer;font-size:9px;font-weight:100;" id="page1" class="pagelink paging-link" onclick="pageexample(0,\'table1\'); return false;">1</a>
						<a style="cursor:pointer;font-size:9px;font-weight:100;" id="page2" class="pagelink paging-link" onclick="pageexample(1,\'table1\'); return false;">2</a>
						<a style="cursor:pointer;font-size:9px;font-weight:100;" id="page3" class="pagelink paging-link" onclick="pageexample(2,\'table1\'); return false;">3</a>
						<a style="cursor:pointer;font-size:9px;font-weight:100;" id="page4" class="pagelink paging-link" onclick="pageexample(3,\'table1\'); return false;">4</a>
						<a style="cursor:pointer;font-size:9px;font-weight:100;" id="page5" class="pagelink paging-link" onclick="pageexample(4,\'table1\'); return false;">5</a>
						<a style="cursor:pointer;font-size:9px;font-weight:100;" id="page6" class="pagelink paging-link" onclick="pageexample(5,\'table1\'); return false;">6</a>
						<a style="cursor:pointer;font-size:9px;font-weight:100;" class="paging-link" onclick="pageexample(\'next\' ,\'table1\'); return false;">Next&nbsp;&gt;&gt;
					</td>';
	
	
	
		$str1=$str1.'</tfoot></table><br><br><br><br> <hr style="border:solid 1px #99FF00;">';
		
		
			$str2 .='<h3 align="center">Patient Request list</h3><br><br><table id="table" class="example table-autopage:10 table-stripeclass:alternate" style="width: 850px;" align="middle">
		<thead>
		<tr>
			<th align="center" class="Request Id">Request Id</th>
			<th class="Topic">Name</th>
			<th align="center" class="filterable">More</th>
			
		</tr>
		<tr>

			<th><input align="center" name="filter" size="18" onkeyup="Table.filter(this,this)"></th>
			<th><input align="center" name="filter" size="18" onkeyup="Table.filter(this,this)"></th>
			<th>&nbsp;&nbsp;</th>
			
		</tr>
	</thead>
	<tbody>';
	
			$c = 0;
			$query2=mysql_query($sql2,$dbConnection) or die("SQL Error ".mysql_error());
			while($rows=mysql_fetch_array($query2)){	

			$c++;
			
			$str2 .="<tr>
							
							<td align='center'>".$rows["pRequestId"]."</td>						
							<td align='center'>".$rows["name"]."</td>
							<td><a href='viewPRequest.php?no=".$rows["pRequestId"]."'>Details</a></td>
							
						<tr>";
			}
			
			
			$str2=$str2.'</tbody><tfoot>
					<td align="center" colspan="5">
						<a style="cursor:pointer;font-size:9px;font-weight:100;" class="paging-link" onclick="pageexample(\'previous\',\'table\'); return false;">&lt;&lt;&nbsp;Previous</a>
						<a style="cursor:pointer;font-size:9px;font-weight:100;" id="page1" class="pagelink paging-link" onclick="pageexample(0,\'table\'); return false;">1</a>
						<a style="cursor:pointer;font-size:9px;font-weight:100;" id="page2" class="pagelink paging-link" onclick="pageexample(1,\'table\'); return false;">2</a>
						<a style="cursor:pointer;font-size:9px;font-weight:100;" id="page3" class="pagelink paging-link" onclick="pageexample(2,\'table\'); return false;">3</a>
						<a style="cursor:pointer;font-size:9px;font-weight:100;" id="page4" class="pagelink paging-link" onclick="pageexample(3,\'table\'); return false;">4</a>
						<a style="cursor:pointer;font-size:9px;font-weight:100;" id="page5" class="pagelink paging-link" onclick="pageexample(4,\'table\'); return false;">5</a>
						<a style="cursor:pointer;font-size:9px;font-weight:100;" id="page6" class="pagelink paging-link" onclick="pageexample(5,\'table\'); return false;">6</a>
						<a style="cursor:pointer;font-size:9px;font-weight:100;" class="paging-link" onclick="pageexample(\'next\',\'table\'); return false;">Next&nbsp;&gt;&gt;
					</td>';
	
	
	
		$str2=$str2.'</tfoot></table><br><br><br><br>';
		
			echo $str1;
			echo $str2;

}