
<?php

		session_start();
 		if (!isset($_SESSION["uid"]))
        {
        	Header("Location: errorPage.php?info=7");
        }
		else if($_SESSION["uid"][0] != 'D' && $_SESSION["uid"][0] != 'd' ){
				Header("Location:errorPage.php?info=7");
		}
		else{   
			require_once("timeout.php");
			isTimedOut();    
		} 
		
		
?>

<html>
<head>
<link rel="stylesheet" type="text/css" href="css/sty.css" />
<link rel="stylesheet" type="text/css" href="css/menustyle.css" />
<script type="text/javascript" src="js/tables.js"></script>
<script type="text/javascript">
	var count = 0;

	var xmlHttp=null;											<!-- Ajax-->
	function GetXmlHttpRequest(){
		try{
			xmlHttp=new XMLHttpRequest();
		}
		catch(e)
		{
			try
			{
				xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
			}
			catch(e)
			{
				xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
			}
		}
		return xmlHttp;
	}
	
	
	function ajaxPending(x)
	{			
		xmlHttp=GetXmlHttpRequest();
		
		if(xmlHttp==null)
		{
			alert("Your browser does not support Http request");
			return;
		}		
		
		if(x == 1){
			count = 0;
			var url1="prescriptionContraller.php?no="+x+"&pid="+document.getElementById("pid").value;
			document.getElementById("pdata").innerHTML = "";
			document.getElementById("prescriptionDiv").innerHTML = "";
			xmlHttp.open("GET",url1);
			xmlHttp.onreadystatechange=getResponse1;
		}
		else if(x == 2){
			var url2 ="";
			
			if(count<1)
			{
				url2="prescriptionContraller.php?no="+x+"&pid="+document.getElementById("pid").value;
				count++;
			}
			else
			{
				if(document.getElementById("pid").value == "" || document.getElementById("frequency").value == "" || document.getElementById("dosage").value == ""|| document.getElementById("duration").value == "" && x < 10){
					return;
				}
				else{
					url2="prescriptionContraller.php?no="+x+"&pid="+document.getElementById("pid").value+"&did=<?php echo $_SESSION["uid"]?>"+"&frequencyId="+document.getElementById("frequency").value+"&dosage="+document.getElementById("dosage").value+"&mid="+document.getElementById("mid").value+"&diagnosis="+document.getElementById('diagnosis').value+"&duration="+document.getElementById('duration').value+"&issue="+document.getElementById('issue').value;
				}			
			}
			xmlHttp.open("GET",url2);
			xmlHttp.onreadystatechange=getResponse2;
		}
		else if(x == 3){
			
			document.getElementById("historyPost").submit();
			
			/*count = 0;
			var url2="prescriptionContraller.php?no="+x+"&pid="+document.getElementById("pid").value;
	
			xmlHttp.open("GET",url2);
			xmlHttp.onreadystatechange=getResponse2;
			
			*/
		}
		else if(x>10){                       // press remove
			url2="prescriptionContraller.php?no="+x+"&pid="+document.getElementById("pid").value+"&did=<?php echo $_SESSION["uid"]?>"+"&frequencyId="+document.getElementById("frequency").value+"&dosage="+document.getElementById("dosage").value+"&mid="+document.getElementById("mid").value+"&diagnosis="+document.getElementById('diagnosis').value+"&duration="+document.getElementById('duration').value+"&issue="+document.getElementById('issue').value;
			
			xmlHttp.open("GET",url2);
			xmlHttp.onreadystatechange=getResponse2;
		}
		xmlHttp.send(null);
	}
	
		
	function getResponse1()
	{
		if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
		{
			document.getElementById("pdata").innerHTML=xmlHttp.responseText;
		}
	}
	
	function getResponse2()
	{
		if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
		{
			document.getElementById("prescriptionDiv").innerHTML=xmlHttp.responseText;
		}
	}
	
	function popUpPrescription(){
		
		var left = (screen.width/2)-(220);
 		var top = (screen.height/2)-(280);
  		window.open("prescriptionForm.php?pid="+document.getElementById("pid").value+"&did=<?php echo $_SESSION["uid"]?>", '_blank', 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width=440, height=560, top='+top+', left='+left);
		
	}
	
	
	function s(){
		$("#pid").keyup(function(event){
			if(event.keyCode == 13){
				ajaxPending(1);
			}
		});
	}
	
		
</script>

<style type="text/css">

#table {
		border: 1px solid #DFDFDF;
		background-color: #F9F9F9;
		width: 118.3%;
		margin: -51px;
		-moz-border-radius: 3px;
		-webkit-border-radius: 3px;
		border-radius: 3px;
		font-family: Arial,"Bitstream Vera Sans",Helvetica,Verdana,sans-serif;
		color: #333;
	}
	#table td, #table th {
		border-top-color: white;
		border-bottom: 1px solid #DFDFDF;
		color: #555;
	}
	#table th {
		text-shadow: rgba(255, 255, 255, 0.796875) 0px 1px 0px;
		font-family: Georgia,"Times New Roman","Bitstream Charter",Times,serif;
		font-weight: normal;
		padding: 7px 7px 8px;
		text-align: left;
		line-height: 1.3em;
		font-size: 14px;
	}
	#table td {
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
		
        <div id="page" style="min-height:400px">  
        
    		<table align="center">
            	<tr>
                	<td><input type="text" id="pid" onkeyup="s();"/></td>
                	<td><p align="center"><a class="button-link" style="cursor:pointer;padding: 3px 10px;" onClick="ajaxPending(1);">Search</a></p></td>
                    <td><span id='errorPid'></span></td>
                </tr>
            </table>   
           <hr><br>
          <div id='pdata' align="center"></div>
          <br><hr>
          <div id='prescriptionDiv' align="center" style="height:auto"></div>
        </div>
        

		<?php 
			include 'footer.php';
		?>	
 </div>
 </body>
 </html>
