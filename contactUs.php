
<?php

		session_start();
 
?>

<html>
<head>
<link rel="stylesheet" type="text/css" href="css/table_style.css" />
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

	
		<div  align="center" id="">
				<form id="form1" name="form1" method="post" action="">
                    <table id="table" width="678" height="1091" border="0">
                      <tr >
                        <td height="176" colspan="2"><p align="center">Health Information System</p>
                          <p align="center">Colombo Rd,</p>
                          <p align="center">Kandy,</p>
                        <p align="center">Sri Lanka </p></td>
                      </tr>
                      <tr>
                        <td height="45">Tel: 0812323232</td>
                        <td height="45">email address: Info.otmis@gmail.com</td>
                      </tr>
                      <tr>
                        <td height="45"><label for="yrname">Your Name</label></td>
                        <td height="45"><input type="text" name="yrname" id="yrname" /></td>
                      </tr>
                      <tr>
                        <td width="253"><label for="yremail">Your Email</label></td>
                        <td width="415"><input type="text" name="yremail" id="yremail" /></td>
                      </tr>
                      <tr>
                        <td>Your Subject</td>
                        <td><label for="yrsub"></label>
                        <input type="text" name="yrsub" id="yrsub" /></td>
                      </tr>
                      <tr>
                        <td>Your Message</td>
                        <td><label for="yrmess"></label>
                        <textarea name="yrmess" id="yrmess" cols="45" rows="5"></textarea></td>
                      </tr>
                                            <tr align="center">
                        <td height="69" colspan="2"><input type="button" value="SEND" id="button"/><br><hr></td>
                      </tr>
                      <tr style="background-color:#F0FAE0" align="center">
                        <td height="400" colspan="2">
                        
                        <!-- http://www.map-embed.com/ -->
                        <p>&nbsp;</p>
                        <p>&nbsp;</p>
                        <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
						<div style="overflow:hidden;height:500px;width:600px;"><div id="gmap_canvas" style="height:500px;width:600px;"></div><style>#gmap_canvas img{max-width:none!important;background:none!important}</style><a class="google-map-code" href="http://www.themecircle.net/personal-blog/" id="get-map-data">themecircle</a></div><script type="text/javascript"> function init_map(){var myOptions = {zoom:18,center:new google.maps.LatLng(7.2905715,80.63372619999996),mapTypeId: google.maps.MapTypeId.ROADMAP};map = new google.maps.Map(document.getElementById("gmap_canvas"), myOptions);marker = new google.maps.Marker({map: map,position: new google.maps.LatLng(7.2905715, 80.63372619999996)});infowindow = new google.maps.InfoWindow({content:"<b>kandy</b><br/>kandy<br/> Kandy." });google.maps.event.addListener(marker, "click", function(){infowindow.open(map,marker);});infowindow.open(map,marker);}google.maps.event.addDomListener(window, 'load', init_map);</script>
                        
                        </td>
                      </tr>
                 </table>
			</form>
  			</div>  
        
		<?php 
			include 'footer.php';
		?>	
 </div>
 </body>
 </html>






  