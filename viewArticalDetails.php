<?php
session_start();
if(isset($_GET['no']))
	$id=$_GET['no'];
else
	echo 'Something wrong';

?>


<html>
<head>
<link rel="stylesheet" type="text/css" href="css/sty.css" />
<link rel="stylesheet" type="text/css" href="css/menustyle.css" />
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>

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
        
		  <table border="0" width="100%"> 
		  <tr>
		  <td width="70%">
      
			 
            <?php
	require_once("DBAccess.php");  
			$db = new DBAccess();
			$dbConnection = $db->initConnection();
			$str = "";
			$sql = "SELECT * FROM article where artId = '$id' ";	
			

				  
   	$query=mysql_query($sql,$dbConnection) or die("SQL Error ".mysql_error());
			while($rows=mysql_fetch_assoc($query))
   {
 
      echo 
				
				"<table width='100%'>
				
					<tr width='50%'><th width='25%'>ARTICLE ID :</th><td width='25%'>"."{$rows['artId']}"."<hr style='border:solid 1px #99FF00;'><td></tr>
					<tr><th width='25%'>TOPIC :</th><td width='25%'>". "{$rows['topic']}"." <hr style='border:solid 1px #99FF00;'><td></tr>
					<tr><th width='25%'>DESCRIPTION  :</th><td width='25%'>"."{$rows['description']}"."<hr style='border:solid 1px #99FF00;'><td></tr>
					<tr><th width='25%'>DATE  :</th><td width='25%'>". "{$rows['date']}". "<hr style='border:solid 1px #99FF00;'><td></tr>
					</table>";
   }  
  
?>
 
</td> 
</tr>
<tr>
           
         <td width="30%"> 
		 <hr style="border:solid 1px #99FF00;"> 
		  <object data="uploads/<?php echo $id?>.pdf" type="application/pdf" width="100%" height="700px">
			<p> <a href="<?php echo $id?>.pdf"></a></p>
			</object>
		  </td>
		
 </tr>

</table>


			<br/>
			
	
		    


       
        </div>
		
  


		<?php 
			include 'footer.php';
		?>	
 </div>
 
 </body>
 </html>
