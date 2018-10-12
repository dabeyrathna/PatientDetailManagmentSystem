<?php 
session_start();
	if(!isset($_GET['qid']) || !isset($_SESSION['uid'])){
				Header("Location: errorPage.php?info=7");
	}
	else if($_SESSION["uid"][0] != 'D' && $_SESSION["uid"][0] != 'd' && $_SESSION["uid"][0] != 'P' && $_SESSION["uid"][0] != 'p' ){
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
	
	
	function ajaxPending(x,y)
	{			
		xmlHttp=GetXmlHttpRequest();
		
		if(xmlHttp==null)
		{
			alert("Your browser does not support Http request");
			return;
		}		
		
		if(x == 0){

			var url1="forumDiscussionContraller.php?no="+x+"&uid=<?php echo $_SESSION['uid'];?>+&qid=<?php echo $_GET['qid']; ?>";
			document.getElementById("discussion").innerHTML = "";
			xmlHttp.open("GET",url1);
			xmlHttp.onreadystatechange=getResponse1;
		}
		else if(x == 1){      // add an answer
			var url2 ="";
				url2="forumDiscussionContraller.php?no="+x+"&uid=<?php echo $_SESSION['uid'];?>+&qid=<?php echo $_GET['qid']; ?>&comment="+document.getElementById("commentBox").value;
				count++;
			
			xmlHttp.open("GET",url2);
			xmlHttp.onreadystatechange=getResponse2;
		}
		else if(x == 2){     // answer delete button
			var url2 ="";
				url2="forumDiscussionContraller.php?no="+x+"&uid=<?php echo $_SESSION['uid'];?>+&qid=<?php echo $_GET['qid']; ?>&ansId="+y;
				count++;
			
			xmlHttp.open("GET",url2);
			xmlHttp.onreadystatechange=getResponse2;
		}
		else if(x == 3){    // question delete button
			var url2 ="";
			url2="forumDiscussionContraller.php?no="+x+"&uid=<?php echo $_SESSION['uid'];?>+&qid=<?php echo $_GET['qid']; ?>";
			count++;
			
			xmlHttp.open("GET",url2);
			xmlHttp.onreadystatechange=getResponse2;
		}
		else if(x == 4){    // answer like button
			var url2 ="";
			url2="forumDiscussionContraller.php?no="+x+"&uid=<?php echo $_SESSION['uid'];?>+&qid=<?php echo $_GET['qid']; ?>&ansId="+y;
			count++;
			
			xmlHttp.open("GET",url2);
			xmlHttp.onreadystatechange=getResponse2;
		}
		else if(x == 5){    // question like button
			var url2 ="";
			url2="forumDiscussionContraller.php?no="+x+"&uid=<?php echo $_SESSION['uid'];?>+&qid=<?php echo $_GET['qid']; ?>";
			count++;
			
			xmlHttp.open("GET",url2);
			xmlHttp.onreadystatechange=getResponse2;
		}
		xmlHttp.send(null);
	}
	
		
	function getResponse1()
	{
		if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
		{
			document.getElementById("discussion").innerHTML=xmlHttp.responseText;
			document.getElementById("commentBox").innerHTML="";
		}
	}
	
	function getResponse2()
	{
		if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
		{
			document.getElementById("discussion").innerHTML=xmlHttp.responseText;
			document.getElementById("commentBox").innerHTML="";
		}
	}
	
	
	function initialAjaxCall(){
			ajaxPending(0);
		}
	

		
</script>

<style type="text/css">

#table {
		border: 1px solid #DFDFDF;
		background-color: #99CC00;
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

<body onLoad="initialAjaxCall();">
<div id="wrapper">
	<?php 
		include 'header.php';
    	include 'menu.php';
		$user = "";
		if(isset($_SESSION['uid'])){
			$user = $_SESSION['uid'];
		}
  		$men = selectMenu($user);
		echo $men;
	?>
        
		<br class="clearfix" />
		
        <div id="page" style="min-height: 400px;">
        	<div id='content' > </div>
            
			<div id ="discussion" style="border: 0px solid; width: 100%;min-height: 800px;"></div><br><br><br><br><br><br>
        </div>

		<?php 
			include 'footer.php';
		?>	
 </div>
 </body>
 </html>
