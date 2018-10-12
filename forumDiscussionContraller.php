
<?php
	session_start();
	require_once("DBAccess.php");
	
	$db = new DBAccess();
	$dbConnection = $db->initConnection();

if(isset($_GET['no']) && isset($_GET['uid']) && isset($_GET['qid']))
{
	if($_GET['no'] == 0)
	{		
		initialDiscussion();
	}
	else if($_GET['no'] == 1){
		
		$comment = "";
		if(isset($_GET['comment'])){
			$comment = mysql_real_escape_string($_GET['comment']);
		}
		insertAnswer($comment);
		initialDiscussion();
	}
	else if($_GET['no'] == 2){
		$answerNo = $_GET['ansId'];
		deleteAnswer($answerNo);
		initialDiscussion();
	}
	
	else if($_GET['no'] == 3){
		$questNo = $_GET['qid'];
		deleteQuestion($questNo);
		initialDiscussion();
	}
	else if($_GET['no'] == 4){
		$questNo = $_GET['qid'];
		$answerNo = $_GET['ansId'];
		likeAnswer($answerNo);
		initialDiscussion();
	}
	
	else if($_GET['no'] == 5){
		$questNo = $_GET['qid'];
		likeQuestion($questNo);
		initialDiscussion();
	}
	
	
	else
	{
		echo "Error";	
	}
}

function deleteAnswer($answerNo){
	$db = new DBAccess();
	$dbConnection = $db->initConnection();
	
	if($answerNo != ""){
		$sql1 = "DELETE FROM forumAns WHERE ansId ='".$answerNo."'";
		$queryQ = mysql_query($sql1,$dbConnection);	
	}
}

function deleteQuestion($questNo){
	$db = new DBAccess();
	$dbConnection = $db->initConnection();
	
	if($questNo != ""){
		$sql1 = "DELETE FROM forumQuest WHERE qId ='".$questNo."'";
		$queryQ = mysql_query($sql1,$dbConnection);	
	
		$sql2 = "DELETE FROM forumAns WHERE qId ='".$questNo."'";
		$queryQ = mysql_query($sql2,$dbConnection);	
	
		header("location:forumQList.php");
	}
	
}

function likeAnswer($answerNo){
	$db = new DBAccess();
	$dbConnection = $db->initConnection();
	
	if($answerNo != ""){
		$sql1 = "UPDATE forumAns SET likes = (likes+1) WHERE ansId ='".$answerNo."'";
		$queryQ = mysql_query($sql1,$dbConnection);	
	}
}

function likeQuestion($answerNo){
	$db = new DBAccess();
	$dbConnection = $db->initConnection();
	
	if($answerNo != ""){
		$sql1 = "UPDATE forumquest SET likes = (likes+1) WHERE qId ='".$answerNo."'";
		$queryQ = mysql_query($sql1,$dbConnection);	
	}
	
}


function insertAnswer($comment){
	$db = new DBAccess();
	$dbConnection = $db->initConnection();
	
	if($comment != ""){
		$sql1 = "INSERT INTO `forumans`(`uid`, `answer`, `time`,`qid`) VALUES ('".$_GET['uid']."','".$comment."',now(),'".$_GET['qid']."')";
		$queryQ = mysql_query($sql1,$dbConnection);	
	}
}

function initialDiscussion()
{
		$uid = $_GET['uid'];
		$qid = $_GET['qid'];
		
		$db = new DBAccess();
		$dbConnection = $db->initConnection();
	
		$queryQuesDetails="SELECT uid,qId,topic,question,time,issueId,likes FROM forumquest WHERE forumquest.qId = ".$qid."";
		$queryQ = mysql_query($queryQuesDetails,$dbConnection);
		$noOfRaws = mysql_num_rows($queryQ);
		$str = '';
		$del_like_buttons = "";
		
		if($noOfRaws < 1){
			echo "Error";
			return;
		}
		else{
		
				$rowQ = mysql_fetch_assoc($queryQ);
				if($rowQ["uid"][0] == 'D' || $rowQ["uid"][0] == 'd'){
					$queryQuesUserDetails = "SELECT name as uname, imageType FROM doctor WHERE did = '".$rowQ['uid']."'";
				}
				else
				{
					$queryQuesUserDetails  = "SELECT name as uname, imageType FROM patient WHERE pid = '".$rowQ["uid"]."'";
				}
				
				
				
				$queryQU = mysql_query($queryQuesUserDetails,$dbConnection);
				$recQU = mysql_fetch_assoc($queryQU);
				
				$qImage = "";
				
				if($recQU['imageType']=="" && ($rowQ["uid"][0] == 'D' || $rowQ["uid"][0] == 'd')){
					$qImage = "defaultDoctor.jpg";
				}
				else if($recQU['imageType']!="" && ($rowQ["uid"][0] == 'D' || $rowQ["uid"][0] == 'd')){
					$qImage = trim($rowQ['uid']," ").'.'.$recQU['imageType'];
				}
				
				if($recQU['imageType']=="" && ($rowQ["uid"][0] == 'P' || $rowQ["uid"][0] == 'p')){
					$qImage = "defaultPatient.jpg";
				}
				else if($recQU['imageType']!="" && ($rowQ["uid"][0] == 'P' || $rowQ["uid"][0] == 'p')){
					$qImage = trim($rowQ['uid']," ").'.'.$recQU['imageType'];
				}
				
				$del_like_buttons = "";
				if(strcasecmp(trim($rowQ["uid"]," "),$_SESSION['uid']) == 0){
					$del_like_buttons = '<a onClick="ajaxPending(3,'.$rowQ["qId"].');"><img src="images/del_icon.png" width="27" height="27"/></a>&nbsp;&nbsp;&nbsp;&nbsp;';

				}
	
				$str .= '<table width="100%" border="0"><tr>
    						<td height="24" colspan="4" bgcolor="#3AC6E2">'.$rowQ['time'].'</td>
						</tr>
					  	<tr>
							<td height="176" width="300" colspan="2" valign="top" bgcolor="#E6FAFA">
								<div align="center" >
						  			<p>'.$recQU['uname'].'</p>
						  			<p><img src="imgUploads/'.$qImage.'" width="100" height="110" /></p>
						  			<p>&nbsp;</p>
								</div>
							</td>
							<td colspan="1" rowspan="2" bgcolor="#55FF55"><p><h2>'.$rowQ['topic'].'</h2><br><br>'.$rowQ['question'].'</p>
							</td>
					  </tr>
					  <tr>
					<td height="33" colspan="1" bgcolor="#F5F0EF" align="center">'.$rowQ['time'].'</td><td colspan="3" bgcolor="#F5F0EF" align="right"><br />'.$del_like_buttons.'<a onClick="ajaxPending(5,'.$rowQ["qId"].');"><img src="images/like_icon.png" width="27" height="27"/></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;      Likes : '.$rowQ['likes'].'  </td>
				  </tr>
				 </table><br>';
	
				$queryAnsDetails = "SELECT uid,ansId, answer,time,likes FROM forumans WHERE forumans.qId = ".$qid."";
				$queryA = mysql_query($queryAnsDetails,$dbConnection);
				
				$str .= '<table align="right" width="50%">';
				$count =1;
				while($rowA=mysql_fetch_array($queryA)){	
				
					if($rowA["uid"][0] == 'D' || $rowA["uid"][0] == 'd')
					{
						$queryAnsUserDetails = "SELECT name as uname, imageType FROM doctor WHERE did = '".$rowA['uid']."'";
					}
					else
					{
						$queryAnsUserDetails  = "SELECT name as uname, imageType FROM patient WHERE pid = '".$rowA["uid"]."'";
					}
					
					$queryAU = mysql_query($queryAnsUserDetails,$dbConnection);
					$recAU = mysql_fetch_assoc($queryAU);
	
					$aImage = "";
				
					if($recAU['imageType']=="" && ($rowA["uid"][0] == 'D' || $rowA["uid"][0] == 'd')){
						$aImage = "defaultDoctor.jpg";
					}
					else if($recAU['imageType']!="" && ($rowA["uid"][0] == 'D' || $rowA["uid"][0] == 'd')){
						$aImage = trim($rowA["uid"]," ").'.'.$recAU['imageType'];
					}
					
					if($recAU['imageType']=="" && ($rowA["uid"][0] == 'P' || $rowA["uid"][0] == 'p')){
						$aImage = "defaultPatient.jpg";
					}
					else if($recAU['imageType']!="" && ($rowA["uid"][0] == 'P' || $rowA["uid"][0] == 'p')){
						$aImage = trim($rowA["uid"]," ").'.'.$recAU['imageType'];
					}
	
	
				if(trim($rowA["uid"]," ") == $_SESSION['uid']){
					$del_like_buttons = '<a onClick="ajaxPending(2,'.$rowA["ansId"].');"><img src="images/del_icon.png" width="27" height="27"/></a>&nbsp;&nbsp;&nbsp;&nbsp;';

				}

				$str .= '<tr bgcolor="#00CC66">
    						<td height="24" colspan="4"><p><b>Respond #'.$count++.'</td>
						</tr>
					  	<tr>
							<td height="176" width="170" colspan="1" valign="top" bgcolor="#E3F9DE"> 
								<div id="user details" align="center">
						  			<p>'.$recQU['uname'].'</p>
						  			<p><img src="imgUploads/'.$aImage.'" width="80" height="96" /></p>
						  			
								</div>
							</td>
							<td colspan="3" rowspan="1" valign="top" bgcolor="#55FF55"><br><br>'.$rowA['answer'].'</td>
					  </tr>
					  <tr>
						<td height="33" colspan="2" bgcolor="#F5F0EF" align="center">'.$rowQ['time'].'</td><td bgcolor="#F5F0EF" align="right"><br>'.$del_like_buttons.'<a onClick="ajaxPending(4,'.$rowA["ansId"].');"><img src="images/like_icon.png" width="27" height="27"/></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;      Likes : '.$rowA['likes'].'  </td>
				  	</tr>' ;
				
				}
		
				$str .= '<tr>
							<td height="180" colspan="4" >
								<textarea name="commentBox" id ="commentBox" cols="100" rows="10">
								</textarea>
								<br>
											
							</td>
						</tr>
						</table>
						<br>
							<div id="areabox" align="center" style="padding-top: 50px;">
								<br><br>
							</div>
							<p align="center"><a class="button-link" style="cursor:pointer;padding: 12px 18px;" onClick="ajaxPending(1,0);">Comment</a></p>							
						<br><br>';
				
				echo $str;
			
		}	
}
?>