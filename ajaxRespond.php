<?php

if($_GET['list']==1)
{
	if(isset($_SESSION['uid']))
	{
		
		$eid=$_SESSION['users']['eid'];
		$str="";
		
		if($eid[0]=='P' || $eid[0]=='p')
		{
			$sql = "SELECT * FROM Artical";	
			$employee="Business Admin";
		}
	
	
	 	$str .='<h3 align="center">Pending List for '.$employee.'</h3><br><br><table id="table" class="example table-autopage:5 table-stripeclass:alternate">
		<thead>
		<tr>
			<th align="center" class="filterable">appNo</th>
			<th class="filterable">Name</th>
			<th class="filterable">&nbsp;&nbsp;&nbsp;&nbsp;BusinessName</th>
			<th class="filterable">GN Division</th>
			<th class="filterable">Rack</th>
			<th align="center" class="filterable">Details</th>
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
	
			
			$query=mysql_query($sql,$con) or die("SQL Error ".mysql_error());
			while($rows=mysql_fetch_array($query)){	
		
			$str .="<tr>
							<td align='center'>".$rows["appNo"]."</td>
							<td>".$rows["initName"]."</td>
							<td>".$rows["bisName"]."</td>
							<td>".$rows["gnDivision"]."</td>
							<td align='center'>".$rows["rack"]."</td>
							<td><a href='viewUserDetails.php?no=".$rows["appNo"]."'>Details</a></td>
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
	
	
	
		$str=$str.'</tfoot></table>';
			echo $str;
		
	}
	else
	{
		echo "Please Login again...";	
	}
	
}




?>