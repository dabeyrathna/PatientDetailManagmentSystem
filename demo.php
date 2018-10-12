


<html>
<head>
<link rel="stylesheet" type="text/css" href="css/sty.css" />
<link rel="stylesheet" type="text/css" href="css/menustyle.css" />
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
		  <td>
           
			 
            <?php
	require_once("DBAccess.php");  
			$db = new DBAccess();
			$dbConnection = $db->initConnection();
			$str = "";
			$sql = "SELECT * FROM doctor";	
			$employee="Business Admin";

				  
   	$query=mysql_query($sql,$dbConnection) or die("SQL Error ".mysql_error());
			while($rows=mysql_fetch_array($query))
   {
  
      echo 
				
				"<table width='100%'>".
				
					"<tr width='100%'>". "<th width='50%'>"."DOCTOR ID :". "</th>". "<td width='50%'>"."{$rows['dId']}". "<td>". "</tr>".
					"<tr>". "<th width='50%'>"."NAME :". "</th>". "<td width='50%'>". "{$rows['name']}"."<td>". "</tr>". 
					"<tr>". "<th width='50%'>"."NIC  :". "</th>". "<td width='50%'>"."{$rows['nic']}"."<td>". "</tr>".
					"<tr>". "<th width='50%'>"."GENDER  :". "</th>". "<td width='50%'>". "{$rows['gender']}". "<td>". "</tr>".
					"<tr>". "<th>"."ADDRESS  :". "</th>". "<td>". " {$rows['add']}". "<td>". "</tr>".
					"<tr>". "<th>"."CONTACT NO :". "</th>". "<td>"."{$rows['telNo']}". "<td>". "</tr>".
					"<tr>". "<th>"." E-MAIL :". "</th>". "<td>"." {$rows['email']}". "<td>". "</tr>". 
					"<tr>". "<th>"."<a href='http://www.w3schools.com'>Edit Details</a>". "</th>". "<td>". "<td>". "</tr>"."</table>";
   }  
  
?>
 
</td>             
         <td> 
<form name="form3" method="post" id="" enctype="multipart/form-data" action="uploadImage.php" class="">
                 <h1>Upload an Image<span></span>
            		</h1>
                   
                          <label for="article">Select an Image</label>
                       <input type="file" name="ImageToUpload" id="ImageToUpload">
					  
                         
                          <input type="submit" name="submit" value="Submit" id= "button">
                       
                        <input type="reset" name="reset" value="Reset" id= "button">
					 
                      
        </table>
		  </form>
		  </td>
 </tr>

</table>
			
			<table width="90%"border="0" height="60%">
			<tr>
			<td>
                <div style=" width:90%; height:90%; border: 3px solid #73AD21;; background-color:green;box-shadow: 10px 10px 5px #000000;opacity: 0.5;">
              
                	<p><a class="button-link" style="cursor:pointer;padding: 12px 18px;" href="articalUpload.php">Artical Upload&nbsp;&nbsp;</a>&nbsp;
           		 </div>
				 </td>
				 <td>
				  <div style=" width:90%; height:90%;  border: 3px solid #73AD21;; background-color:green;box-shadow: 10px 10px 5px #000000;opacity: 0.5;">
					<a class="button-link" style="cursor:pointer;padding: 12px 15px;" href="articleLsit.php"> &nbsp; &nbsp; &nbsp; Artical List &nbsp;   &nbsp; </a>&nbsp;
					 </div>
					 </td>
					<td> 
				<div style="width:90%; height:90%;  border: 3px solid #73AD21;; background-color:green;box-shadow: 10px 10px 5px #000000;opacity: 0.5;">
                <a class="button-link" style="cursor:pointer;padding: 12px 30px;" onClick="ajaxPending(1);">FAQ Que&nbsp;&nbsp;</a>&nbsp;
           		 </div>
				 </td>
				 </tr>
				 
				 <tr>
				 <td>
				<div style=" width:90%; height:90%;  border: 3px solid #73AD21;; background-color:green;box-shadow: 10px 10px 5px #000000;opacity: 0.5;">
					<a class="button-link" style="cursor:pointer;padding: 12px 22px;" onClick="ajaxPending(2);">Edit Account&nbsp;&nbsp;</a>&nbsp;
            	</div>
				</td>
				<td colspan="2">
				<div style="width:60%; height:60%;  border: 3px solid #73AD21;; background-color:green;box-shadow: 10px 10px 5px #000000;opacity: 0.5;">
					<a class="button-link" style="cursor:pointer;padding: 12px 22px;"  href="prescription.php">Prescription&nbsp;&nbsp;</a>&nbsp;</p>
					</div>
					</td>
                </tr>
         
          </table>
       
        </div>

		<?php 
			include 'footer.php';
		?>	
 </div>
 
 </body>
 </html>
