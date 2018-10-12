<?php
	require_once("DBAccess.php");
	
function getStatisticsList(){
			$db = new DBAccess();
			$dbConnection = $db->initConnection();
			$str = "";
			$sql = "SELECT `statisticsId`,`uploader`,`title`,`description`,`date` FROM `statistics`";	
			


	 	$str .='<h3 align="center">Statistics Histry List</h3><br><br><table id="table" class="example table-autopage:10 table-stripeclass:alternate" style="width: 100%;" align="">
		<thead>
		<tr>
			<th class="Topic">Title</th>
			<th class="filterable">Date</th>
			<th class="filterable">Uploader</th>
			<th class="filterable">Description</th>
			<th align="center" class="filterable">Download</th>
		</tr>
		<tr>
			<th><input size="30px" align="center" name="filter" onkeyup="Table.filter(this,this)"></th>
			<th><input size="10px" align="center" name="filter" onkeyup="Table.filter(this,this)"></th>
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
							<td>".$rows["title"]."</td>
							<td>".$rows["uploader"]."</td>
							<td>".$rows["date"]."</td>
							<td>".$rows["description"]."</td>
							<td><a href='uploads/".$rows["statisticsId"].".pdf'>Link</a></td>
						<tr>";
			}
			
			
			$str=$str.'<tbody><tfoot>
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
	
	
	
		$str=$str.'</tfoot></table><br><br><br><br>';
			echo $str;
}