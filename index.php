<?php
	session_start();
	$user = "";
	if(isset($_SESSION['uid'])){
			$user = $_SESSION['uid'];
	 
			require_once("timeout.php");
			isTimedOut();    
	}  
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
        
		<?php
			include 'slider.php';
		?>

		<div id="page">
        <div id = 'news'>
      		<iframe frameborder='0' width="1000px" height="100px" src="news.php"></iframe>
        </div>
  <table width="900" border="0">
  <tr>
    <td width="600">
    <div style="border:2px solid;border-radius:25px;box-shadow: 10px 10px 5px #000000;width:700px;" id="content1">
		  <p align="center" style="font-size:20px">Register Today...</p>
		  <p align="center" style="font-size:18px;background-color:#3F9">Our Vision...</p>
		  <p align="center" style="font-size:15px;font-family:'Times New Roman', Times, serif;font-style:italic;">&quot;To be the excellent government institution in health sector to help the life styles of the community in a beneficial way to the society...&quot;</p>
		  
          <br class="clearfix" />
      
		  <p align="center" style="font-size:18px;background-color:#0CF;">Our Mission...</p>
		  <p align="center" style="font-size:15px;font-family:'Times New Roman', Times, serif;font-style:italic;">&quot;To provide a service in line with the government health policies, uplift the lifestyles of the society through a healthy, efficient lifestyle process consisting of proper medical resources...&quot;      </p>
	  </div>
    </td>
    <td width="175">
    <div style="height:370px;">
			<div align="center" class="box">
				<h3></h3>
                <br><br><br><br><br>
                <a class="button-link" style="cursor:pointer;padding: 12px 50px;box-shadow: 10px 10px 5px #000000;" href="hospitalDetails.php" >Hospitals</a>
                <br><br><br><br><br>
				<a class="button-link" style="cursor:pointer;padding: 12px 52px;box-shadow: 10px 10px 5px #000000;" href="articleLsit.php">Articals</a>
                <br><br><br><br><br>
                <a class="button-link" style="cursor:pointer;padding: 12px 55px;box-shadow: 10px 10px 5px #000000;" href='forumQList.php'>Forum</a>
		

		</div>
    </td>
  </tr>
</table>

        
		
		
		<br class="clearfix" />
        <div id = 'bmi'>
       
        </div>
        </div>

		<?php 
			include 'footer.php';
		?>	
</div>
 </body>
 </html>
