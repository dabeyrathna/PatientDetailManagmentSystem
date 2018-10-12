<?php

		session_start();
 		if (!isset($_SESSION["uid"]))
        {
        	header("Location: errorPage.php?info=7");
        }
		else if($_SESSION["uid"][0] != 'D' && $_SESSION["uid"][0] != 'd' && $_SESSION["uid"][0] != 'P' && $_SESSION["uid"][0] != 'p'){
			header("Location:errorPage.php?info=10");
		}
		else{   
			require_once("timeout.php");
			isTimedOut();    
		}  
		
		$pId = '';
		if($_SESSION["uid"][0] == 'P' || $_SESSION["uid"][0] == 'p')
			$pId = $_SESSION["uid"];
		else if(($_SESSION["uid"][0] == 'D' || $_SESSION["uid"][0] == 'd') && isset($_POST['pId']))
				$pId = $_POST['pId'];
		else
			$pId = '';
		
		
		if($pId != ''){
			require_once("DBAccess.php");  
			$db = new DBAccess();
			$dbConnection = $db->initConnection();
			$str1 = "";
			$sql = "SELECT  patient_history.pId as pid,
							patient_history.date as historydate,
							patient_history.presId as prescripId,
							patient.name as pname,
							patient.imageType as imgType,
							hospital.hName as hname,
							doctor.name as dname,
							patient_history.description as desctrption,
							patient_history.reportNo as reportno
					FROM   `patient_history`,
						   `patient`,
						   `hospital`,
						   `doctor`
					WHERE   patient_history.pId= '".$pId."' AND
							patient_history.pId = patient.pId AND
							hospital.hId = patient_history.hId AND
							doctor.dId = patient_history.dId";
			

$str1 .='<h3 align="center">Histry List</h3><table id="table1" class="example table-autopage:10 table-stripeclass:alternate" style="width: 850px;" align="middle">
		<thead>
		<tr>
			<th align="center" class="Date">Date</th>
			<th class="Prescription">Prescription</th>
			<th align="center" class="Doctor">Doctor</th>
			<th class="Hospital">Hospital</th>
			<th align="center" class="filterable">Reports</th>
			
		</tr>
		<tr>

			<th><input align="center" name="filter" size="20" onkeyup="Table.filter(this,this)"></th>
			<th><input align="center" name="filter" size="8" onkeyup="Table.filter(this,this)"></th>
			<th><input align="center" name="filter" size="15" onkeyup="Table.filter(this,this)"></th>
			<th><input align="center" name="filter" size="23" onkeyup="Table.filter(this,this)"></th>
			<th>&nbsp;&nbsp;</th>
			
		</tr>
	</thead>
	<tbody>';
	
			$query=mysql_query($sql,$dbConnection);
			while($rows=mysql_fetch_array($query))
			{	
				$str1 .="<tr>
		
					<td>".$rows['historydate']."</td>	
					<td align='center'>".$rows['prescripId']."</td>	
					<td>".$rows['dname']."</td>	
					<td>".$rows['hname']."</td>	
					<td align='center'><a href='#' onClick='popUpHistoryDescription(".$rows['prescripId'].");' >Reports</a></td>	    
				<tr>";	
	
				$empId = $rows['pid'];
				$pname = $rows['pname'];
				//$desctrption = $rows['desctrption'];
				//$reportno = $rows['reportno'];
				
				$imgName = "defaultEmployee.jpg";
				
				if($rows['imgType'] != "")
					$imgName = $pId.".".$rows['imgType'];
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
				  
   	
?>


<html>
<head>
<link rel="stylesheet" type="text/css" href="css/sty.css" />
<link rel="stylesheet" type="text/css" href="css/menustyle.css" />
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/tables.js"></script>
<script type="text/javascript">

function view(){

		document.getElementById("myDetails").style.height="auto";
		document.getElementById("myDetails").style.visibility="visible";
		document.getElementById("hide").style.visibility="visible";
		document.getElementById("view").style.visibility="hidden";
	}
	
function hide(){

		document.getElementById("myDetails").style.height="0";
		document.getElementById("myDetails").style.visibility="hidden";
		document.getElementById("hide").style.visibility="hidden";
		document.getElementById("view").style.visibility="visible";
	}		
	
	
	function popUpHistoryDescription(presId){
		
		var left = (screen.width/2)-(550);
 		var top = (screen.height/2)-(400);
  		window.open("patientHistoryDescription.php?pres="+presId+"", '_blank', 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width=1000, height=650, top='+top+', left='+left);
		
	}
</script>

<style type="text/css">

	

	.paging-link {
		text-decoration: none;
		padding: 2px 5px;
		background: #4479BA;
		color: #FFF;-webkit-border-radius: 4px;
		-moz-border-radius: 4px;
		border-radius: 4px;
		border: solid 1px #20538D;
		text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.4);
		-webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.4), 0 1px 1px rgba(0, 0, 0, 0.2);
		-moz-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.4), 0 1px 1px rgba(0, 0, 0, 0.2);
		box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.4), 0 1px 1px rgba(0, 0, 0, 0.2);
	}

	.paging-link:hover, .paging-link:focus {
		background: #356094;
		border: solid 1px #2A4E77;
		text-decoration: none;   
		-webkit-transition-duration: 0.2s;
		-moz-transition-duration: 0.2s;
		transition-duration: 0.2s;
	}

	
	#table,#table1 {
		border: 1px solid #339900;
	
		background-color:#99CC00;
		box-shadow: 0px 5px 5px #000000;
		width: 100%;
		-moz-border-radius: 10px;
		-webkit-border-radius: 10px;
		border-radius: 3px;
		font-family: Arial,"Bitstream Vera Sans",Helvetica,Verdana,sans-serif;
		color: #000000;
	}
	#table td, #table th, #table1 td, #table1 th  {
		border-top-color: black;
		border-bottom: 1px solid #DFDFDF;
		color: #000;
	}
	#table th,#table1 th {
		text-shadow: rgba(255, 255, 255, 0.796875) 0px 1px 0px;
		font-family: Georgia,"Times New Roman","Bitstream Charter",Times,serif;
		font-weight: normal;
		padding: 7px 7px 8px;
		text-align: left;
		line-height: 1.3em;
		font-size: 14px;
	}
	#table td,#table1 td, {
		font-size: 12px;
		padding: 4px 7px 2px;
		vertical-align: top;
	}
	

		.rounded-corners {
			 -moz-border-radius: 40px;
			-webkit-border-radius: 40px;
			-khtml-border-radius: 40px;
			border-radius: 40px;
		}
		.rounded-corners-top {
			 -moz-border-top-radius: 40px;
			-webkit-border-radius: 40px;
			-khtml-border-radius: 40px;
			border-radius: 40px;
		}
		
		#register-form {
			background: url("form-fieldset.gif") repeat-x scroll left bottom #F8FDEF;
			border: 1px solid #DFDCDC;
			border-radius: 15px 15px 15px 15px;
			display: inline-block;
			margin-bottom: 30px;
			margin-left: -20px;
			margin-top: 10px;
			padding: 25px 50px 10px;
			width: 350px;
		}		

</style>

</head>

<body>
<div id="wrapper">
	<?php 
		include 'header.php';
    	include 'menu.php';
		$user = "";
		if(isset($_SESSION['uid'])){
			$user = $_SESSION['uid'];
		}
  		$man = selectMenu($user);
		echo $man;
	?>
        
		<br class="clearfix" />
		
        <div id="page">
     		<table align="center" width="58%" height="172" border="0">
			  <tr>
				<th width="25%" scope="row"><div align="left">Patient ID</div></th>
				<td width="39%"><?php echo $pId; ?></td>
				<td width="36%" rowspan="3"><img src="imgUploads/<?php echo $imgName; ?>" width="120" height="175" align="middle" class="profile-photo" /></td>
			  </tr>
			  <tr>
				<th scope="row"><div align="left">Patient Name</div></th>
				<td><?php echo $pname; ?></td>
			  </tr>
			  <tr>
				<th height="116" colspan="2" scope="row">&nbsp;</th>
			  </tr>
	    </table>

			<hr style="border:solid 1px #99FF00;">
        	<div style="height:outo; Align:right;font:Times New Roman, serif;" id='reqList'>
                <?php
                    echo $str1;   
                ?>  
                    
         	</div>
 	</div>
    
    <?php  include 'footer.php'; ?>
 </div>
 
 </body>
 </html>
 
 <?php
		}
		else{
			
			echo "<body onLoad='window.close();'></body>"; 
			}
?>
