<?php
	require_once("DBAccess.php");
	


function getArticleList(){
			$db = new DBAccess();
			$dbConnection = $db->initConnection();
			$str = "";
			$sql = "SELECT article.artId,article.topic, article.date,doctor.name,health_issue.issue FROM `article`,doctor,health_issue WHERE doctor.dId = article.dId AND health_issue.issueId = article.issueId";	
			


	 	$str .='<h3 align="center">Article list</h3><br><br><table id="table" class="example table-autopage:10 table-stripeclass:alternate" style="width: 100%;" align="">
		<thead>
		<tr>
			<th align="center" class="Article Id">appNo</th>
			<th class="Topic">Name</th>
			<th class="filterable">Date</th>
			<th class="filterable">Doctor</th>
			<th class="filterable">Issue</th>
			<th align="center" class="filterable">More</th>
		</tr>
		<tr>
			<th><input size="5px" align="center" name="filter" onkeyup="Table.filter(this,this)"></th>
			<th><input size="25px" align="center" name="filter" onkeyup="Table.filter(this,this)"></th>
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
							<td align='center'>".$rows["artId"]."</td>
							<td>".$rows["topic"]."</td>
							<td>".$rows["date"]."</td>
							<td>".$rows["name"]."</td>
							<td align='center'>".$rows["issue"]."</td>
							<td><a href='viewArticalDetails.php?no=".$rows["artId"]."'>Details</a></td>
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