<?php

	require_once("DBAccess.php");
	
function getForumList(){
			$db = new DBAccess();
			$dbConnection = $db->initConnection();
			$str = "";
			$sql = "SELECT forumquest.qid, forumquest.uid as uid, forumquest.topic,forumquest.question,health_issue.issue,forumquest.time FROM forumquest,health_issue WHERE forumquest.issueId = health_issue.issueId ORDER BY forumquest.time DESC";
	


	 	$str .='<div align="center"><h3 align="center">Forum Question List</h3><br><br><table id="table" align="center" class="example table-autopage:20 table-stripeclass:alternate" style="width: 940px;" >
		<thead>
		<tr>
			<th align="center" class="filterable">Topic</th>
			<th class="filterable">Health Issue</th>
			<th></th>
		</tr>
		<tr>
			<th width="70px"><input size="65px" align="center" name="filter" onkeyup="Table.filter(this,this)"></th>
			<th width="70px"><input size="20px" align="center" name="filter"  onkeyup="Table.filter(this,this)"></th>
			<th style="text-align:center;" >Replies</th>
		</tr>
	</thead>
	<tbody>';
	
	
			$query=mysql_query($sql,$dbConnection) or die("SQL Error ".mysql_error());
		
			while($rows=mysql_fetch_array($query)){	
				
				$sql2 = "SELECT ansid, count(ansid) as count, max(time) as time FROM forumans WHERE qid = '".$rows['qid']."' ORDER BY time DESC";

				if($rows["uid"][0] == 'D' || $rows["uid"][0] == 'd'){
					$sql3 = "SELECT CONCAT('Dr. ',name) as uname FROM doctor WHERE did = '".$rows['uid']."'";
				}
				else
				{
					$sql3 = "SELECT name as uname FROM patient WHERE pid = '".$rows["uid"]."'";
				}
				
				
				$query2 = mysql_query($sql2,$dbConnection) or die("MySql Error".mysql_error());
				$noOfRaws = mysql_num_rows($query2); 
				
				if($noOfRaws>0)
				{            
					$replyDetails = mysql_fetch_assoc($query2);
					
					$count = $replyDetails['count'];
					$lastReply = $replyDetails['time'];
				}
				else
				{
					$count = 0;
					$lastReply = "";
				}
				
				$query3=mysql_query($sql3,$dbConnection) or die("SQL Error ".mysql_error());
				$userDetail=mysql_fetch_assoc($query3);
				
				$str .="<tr>
						<td style='font-size:14px; color:Blue'>
							<a href='forumDiscussion.php?qid=".$rows["qid"]."'>
									".substr($rows["topic"],0,60)."
							</a>
							<br>
							<p style='font-size:11px; color:REd'>
								by : <i>".$userDetail['uname']." </i> >> ".$rows["time"]."
							</p>
						</td>
						<td>".$rows["issue"]."</td>
						<td>
							<b>Replys &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</b> ".$count." <br><b>Last reply on :</b> ".$lastReply." 
						</td>
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
	
	
	
		$str=$str.'</tfoot></table></div><br><br><br>';
			echo $str;
}