<?php

		session_start();
 		if (!isset($_SESSION["uid"]))
        {
        	Header("Location: errorPage.php?info=7");
        }
		else if($_SESSION["uid"][0] != 'S' && $_SESSION["uid"][0] != 's' ){
				Header("Location:errorPage.php?info=7");
		}
		else{   
			require_once("timeout.php");
			isTimedOut();    
		}  
		
		
		require_once("DBAccess.php");  
		$db = new DBAccess();
		$dbConnection = $db->initConnection();
		$str = "";
		$sql = "SELECT * FROM statistician where sId = '".$_SESSION["uid"]."'";	
			
				  
		$query=mysql_query($sql,$dbConnection) or die("SQL Error ".mysql_error());
		$rows=mysql_fetch_assoc($query);
		
		$imgName = "defaultStatist.jpg";
		$name = $rows['name'];
		$nic = $rows['nic'];
		$gender = $rows['gender'];
		$add = $rows['add'];
		$telNo = $rows['telNo'];
		$email = $rows['email'];
		$spId = $rows['regDate'];
		
	
		if($rows['imageType'] != "")
			$imgName = $_SESSION['uid'].".".$rows['imageType'];
			
			
?>


<html>
<head>
<link rel="stylesheet" type="text/css" href="css/sty.css" />
<link rel="stylesheet" type="text/css" href="css/menustyle.css" />
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript">


	var currElement = "";
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
	
	function popUpTital(element, district){
		xmlHttp=GetXmlHttpRequest();
		if(xmlHttp==null)
		{
			alert("Your browser does not support Http request");
			return;
		}	
		else if(district != ""){
			currElement = element;
			var url="chartOptionsContraller.php?district="+district;
			xmlHttp.open("GET",url);
			xmlHttp.onreadystatechange=getResponse3;
		}
		xmlHttp.send(null);
	}
	
	function ajaxPending(x)
	{			
		xmlHttp=GetXmlHttpRequest();
		if(xmlHttp==null)
		{
			alert("Your browser does not support Http request");
			return;
		}	
		else if(x == 1){
			var url="chartOptionsContraller.php?no="+x;
			xmlHttp.open("GET",url);
			xmlHttp.onreadystatechange=getResponse1;
			document.getElementById('districtMap').style.visibility= "hidden";
			document.getElementById('chartSettings').style.visibility= "visible";
			document.getElementById('secondOptionSelectionList').style.visibility= "visible";
			
			document.getElementById("chartSettings").style.height="auto";
			document.getElementById("secondOptionSelectionList").style.height="auto";
			
			document.getElementById("districtMap").style.height="0";
		}
		else if(x == 2){
			/*var url="chartOptionsContraller.php?no="+x;
			document.getElementById("chartSettings").innerHTML = "two clicked";
			xmlHttp.open("GET",url);
			xmlHttp.onreadystatechange=getResponse1;
			*/
			document.getElementById('secondOptionSelectionList').style.visibility= "hidden";
			document.getElementById("secondOptionSelectionList").style.height="0";
			
			document.getElementById('chartSettings').style.visibility= "hidden";
			document.getElementById("chartSettings").style.height="0";
			
			document.getElementById('districtMap').style.visibility= "visible";
			document.getElementById("districtMap").style.height="auto";
			
		}	
		else if(x == 6){
			var url="chartOptionsContraller.php?no="+x+"&opt="+document.getElementById('alertList').value;
			xmlHttp.open("GET",url);
			xmlHttp.onreadystatechange=getResponse2;
		}
		else if(x == 7){
			var url="chartOptionsContraller.php?no="+x+"&opt="+document.getElementById('generalStatList').value;
			xmlHttp.open("GET",url);
			xmlHttp.onreadystatechange=getResponse2;
		}
		
		xmlHttp.send(null);
	}
	
		
	function getResponse1()
	{
	
		if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
		{
			document.getElementById("chartSettings").innerHTML=xmlHttp.responseText;
		}
	}
	
	function getResponse2()
	{
		if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
		{
			document.getElementById("secondOptionSelectionList").innerHTML=xmlHttp.responseText;
		}
	}
	
	function getResponse3()
	{
		if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
		{
			currElement.title= xmlHttp.responseText;
		}
	}
	
	function popUpPrescription(){
		
		var left = (screen.width/2)-(220);
 		var top = (screen.height/2)-(280);
  		window.open("prescriptionForm.php?pid="+document.getElementById("pid").value+"&did=<?php echo $_SESSION["uid"]?>", '_blank', 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width=440, height=560, top='+top+', left='+left);
		
	}
		

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
	

</script>
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
         <div id="myDetails" style="visibility:hidden; height:0; ">
		  <table border="0" width="100%"> 
		  <tr>
		  <td width="69%" height="259">
      
 
 		<table border='0' width='100%'>				
					<tr width='50%'>
					  <th width='10%'>&nbsp;</th>
					  <th width='28%'><div align="left">Statist ID </div></th>
					  <td width='4%'>:                                            
					  <td width='50%'><?php echo $_SESSION['uid']; ?><td width="8%"></tr>
					<tr>
					  <th width='10%'>&nbsp;</th>
					  <th width='28%'><div align="left">NAME </div></th>
					  <td width='4%'>:                                            
					  <td width='50%'><?php echo $name ; ?><td></tr>
					<tr>
					  <th width='10%'>&nbsp;</th>
					  <th width='28%'><div align="left">NIC  </div></th>
					  <td width='4%'>:                                            
					  <td width='50%'><?php echo  $nic; ?><td></tr>
					<tr>
					  <th width='10%'>&nbsp;</th>
					  <th width='28%'><div align="left">GENDER</div></th>
					  <td width='4%'> :                                            
					  <td width='50%'><?php echo  $gender; ?><td></tr>
					<tr>
					  <th width='10%'>&nbsp;</th>
					  <th width='28%'><div align="left">ADDRESS  </div></th>
					  <td width='4%'>:                                            
					  <td width='50%'><?php echo $add;  ?><td></tr>
					<tr>
					  <th width='10%'>&nbsp;</th>
					  <th width='28%'><div align="left">CONTACT NO </div></th>
					  <td width='4%'>:                                            
					  <td width='50%'><?php echo $telNo ; ?><td></tr>
					<tr>
					  <th width='10%'>&nbsp;</th>
					  <th width='28%'><div align="left">E-MAIL </div></th>
					  <td width='4%'>:                                            
					  <td width='50%'><?php echo $email;  ?><td></tr>
					<tr>
					  <th>&nbsp;</th>
					  <th colspan="3">&nbsp;</th>
					  <td>                    
		    		</tr>
					<tr>
					  <th width='10%'>&nbsp;</th>
					  <th colspan="3"><a class='button-link' style='cursor:pointer;padding: 2px 2px;' href='editDDetails.php'>Edit Details</a>
                    </th><td></tr>
		</table>
 
        </td>             
                 <td width="31%">
                   <p><img class="profile-photo" align="middle" src="imgUploads/<?php echo $imgName; ?>" width="210" height="275"/></p>
            </td>
         </tr>

		</table>

	</div>
<hr style="border:solid 1px #99FF00;"><br>

		  <div align="right">        
            <a class="button-link1" href="#" onClick="view();" id="view" style="visibility:visible;" >View My Details</a>&nbsp; 
		  	<a class="button-link1" href="#" onClick="hide();" id="hide" style="visibility:hidden;">Hide My Details</a>&nbsp;
			
            <a class="button-link1" href="statisticsUpload.php">Upload Generated Report</a>&nbsp;  
            <a class="button-link1" href="statisticsList.php">Generated Report List</a>&nbsp;      
		  	<a class="button-link1" href="statisticsReportsPending.php">Pending List</a>&nbsp; 
          </div>

<hr style="border:solid 1px #99FF00;">
				<br/>
			
		<div>
<table width="100%"border="0" height="80%">
			
			<tr>

				 <td height="15%" >
				<div align="center">
				    <a class="button-link" style="margin-top:100px;cursor:pointer;padding: 12px 22;" onClick="ajaxPending(1);"> &nbsp; &nbsp; &nbsp; General statistics &nbsp;   &nbsp; </a>&nbsp;&nbsp;
                    
                    
                    <a class="button-link" style="cursor:pointer;padding: 12px 22;" onClick="ajaxPending(2);"> &nbsp; &nbsp; &nbsp; District Map &nbsp;   &nbsp; </a>&nbsp;
                    
                   
				   <div>
				  <!--    <table width="100%" border="0">
				      <tr>
				        <td width="50%" scope="row"><div align="center">
				          <p><a class="button-link" style="cursor:pointer;padding: 8px 30px;" onClick="ajaxPending(2);">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Disease Profile&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></p>
				          <p>&nbsp;</p>
				        </div></td>
				        <td width="50%" colspan="2" scope="row"><div align="center">
				          <p><a class="button-link" style="cursor:pointer;padding: 8px 30px;" onClick="ajaxPending(3);">Regional Disease Profiles</a></p>
				          <p>&nbsp;</p>
				        </div></td>
		          </tr>
				      <tr>
				        <td scope="row"><div align="center">
				          <p><a class="button-link" style="cursor:pointer;padding: 8px 10;" onClick="ajaxPending(4);">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Death Profiles&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></p>
				          <p>&nbsp;</p>
				        </div></td>
				        <td colspan="2" scope="row"><div align="center">
				          <p><a class="button-link" style="cursor:pointer;padding: 8px 22;" onClick="ajaxPending(5);">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Alerts&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></p>
				          <p>&nbsp;</p>
				        </div></td>
		          </tr>
				      <tr>
				        <td colspan="3" scope="row"><div align="center">
				          <p><a class="button-link" style="cursor:pointer;padding: 8px 22;" onClick="ajaxPending(6);"`>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Statistics&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></p>
				          <p>&nbsp;</p>
				        </div></td>
                      </tr>
			        </table>
                    -->

            </div>
			  </div></td>
				 </tr>

				  <tr>
				    
				    <td >		
				      
				      <div style ="width:95%; min-height:400px;background-color:#339900;box-shadow: 10px 10px 5px #000000;">
				      <br>
                      
				       <div id="chartSettings" align="center">
				        
			          </div>	
				     <!-- <div id='appointmentDisplay' style="color:#06F;font-size:18px">
                      	
                      
                      </div>  -->
                      
                      
                      <div align="center"> 
						</div>
				 
				 <div align="center" id="secondOptionSelectionList"></div>
                 
                 <div align="center" id="districtMap">
                 <h3>General Statistics</h3>                    
                 
                 <img src="Images/map.jpg" width="570" height="716" border="0" align="middle" usemap="#Map" /></div>
			        </td>
			    </tr>
          </table>
		  </div>
          
          <div id='displayDistrict'>
          
          </div>
       
        </div>

		<?php 
			include 'footer.php';
		?>	
 </div>



<map name="Map">
  <area shape="poly" coords="218,514,223,514,229,518,233,525,239,529,242,526,242,518,239,511,236,507,238,504,244,504,250,500,255,499,261,499,264,493,266,489,268,485,270,482,270,474,272,469,273,475,279,480,285,485,291,482,298,479,305,480,313,478,314,465,310,457,308,447,307,441,307,432,303,432,298,435,292,438,285,437,279,442,274,441,268,438,265,442,262,447,252,446,245,442,241,438,237,435,232,438,229,443,226,445,221,444,219,446,219,450,215,453,213,456,218,461,221,466,225,470,229,477,231,484,231,487,225,494,220,499,221,502,220,508,219,512" href="#" alt="Kandy" id="kandy" onMouseOver="popUpTital(this,'kandy');">
  <area shape="poly" coords="263,692,259,687,256,683,259,679,262,674,261,669,256,666,255,662,251,659,248,655,251,648,253,642,255,637,261,638,268,642,278,644,285,645,290,649,294,649,299,649,301,646,300,641,306,636,309,633,316,627,316,624,323,621,332,622,340,623,348,626,353,631,361,626,368,626,381,621,389,618,392,616,392,607,396,602,404,599,411,595,413,589,416,585,421,592,427,599,436,597,429,605,425,612,421,613,416,617,414,622,408,625,405,626,397,631,395,636,389,639,383,641,377,648,371,651,361,654,355,657,347,659,337,663,330,668,318,669,314,675,304,677,298,680,283,685,277,687,274,690,264,694" onMouseOver="popUpTital(this,'hambanthota');" href="#" alt="hambanthota">
  <area shape="poly" coords="299,640,295,634,293,628,288,626,285,620,285,614,282,609,282,600,288,595,289,588,295,582,297,578,303,579,308,583,310,588,313,592,316,596,321,591,323,588,324,580,324,576,324,570,324,565,322,562,325,555,332,551,335,547,335,543,342,538,345,532,347,529,351,523,350,514,352,505,346,502,343,501,338,495,337,484,343,482,350,478,356,474,360,468,367,457,373,448,378,441,383,437,390,443,392,456,395,465,399,471,398,480,394,488,398,496,404,502,411,504,415,514,416,528,418,543,416,554,415,567,415,578,412,585,411,591,404,598,397,603,391,614,385,619,374,625,361,629,352,634,347,627,338,624,328,620,318,625,314,634,307,639,299,643" href="#" alt="Monaragala" onMouseOver="popUpTital(this,'Monaragala');">
  <area shape="poly" coords="295,577,292,585,287,592,281,600,281,607,287,618,291,628,294,633,299,641,299,646,294,648,283,646,272,643,262,638,254,633,249,630,242,628,248,625,240,621,232,623,224,625,213,621,205,615,199,610,194,600,191,594,190,589,187,582,184,578,180,572,178,566,174,557,172,547,171,535,177,528,181,533,184,539,197,542,201,540,211,540,217,543,222,545,225,552,231,554,238,555,250,559,260,560,265,557,276,554,281,554,286,563,293,571,297,575" href="#" alt="Rathnapura" onMouseOver="popUpTital(this,'Rathnapura');">
  <area shape="poly" coords="176,526,175,520,171,518,169,512,167,506,170,498,168,493,163,488,174,479,175,474,187,465,191,459,198,453,201,449,211,452,220,463,225,471,231,481,230,489,221,497,221,504,218,514,218,521,220,528,223,535,226,542,226,547,216,543,206,538,195,542,188,541,181,536" href="#" alt="Kegalla" onMouseOver="popUpTital(this,'Kegalla');">
  <area shape="poly" coords="302,480,305,485,306,489,305,498,304,503,301,509,297,512,293,521,284,525,279,531,276,531,280,539,280,543,278,550,270,554,260,557,245,560,239,556,227,551,223,550,227,547,227,540,225,535,221,529,218,519,220,515,228,517,233,524,234,529,238,529,243,528,244,522,243,512,239,509,238,505,246,505,252,501,258,501,263,502,266,495,270,489,271,482,271,478,272,475,278,479,280,485,290,485,296,483,298,481" href="#" alt="Nuwaraeliya" onMouseOver="popUpTital(this,'nuwaraeliya');">
  <area shape="poly" coords="295,577,294,570,289,564,285,559,280,553,274,553,278,549,279,543,279,539,277,534,279,530,287,524,296,518,300,513,302,509,305,502,305,494,305,486,305,481,312,479,313,473,313,469,312,459,308,447,308,439,306,431,307,420,307,415,308,409,312,411,313,421,315,423,317,424,321,425,324,417,336,416,340,416,347,417,348,424,345,430,343,439,342,442,344,450,348,454,351,462,353,468,353,474,348,480,341,481,339,490,342,499,343,502,348,506,350,515,350,519,343,530,341,536,333,546,325,553,318,568,322,564,323,572,323,582,322,587,316,593,310,584" href="#" alt="badulla" onMouseOver="popUpTital(this,'badulla');">
  <area shape="poly" coords="237,432,233,421,236,414,233,402,233,397,230,388,224,380,232,369,243,367,250,358,254,349,265,339,271,346,280,347,285,352,279,364,279,372,272,380,271,389,275,394,279,395,286,392,296,389,303,391,311,396,310,405,308,412,306,421,305,429,299,435,288,438,277,440,270,441,266,446,252,449,245,441" href="#" alt="mathale" onMouseOver="popUpTital(this,'mathale');">
  <area shape="poly" coords="193,458,183,462,174,468,168,463,162,458,153,462,144,461,138,464,131,465,130,457,130,439,126,422,128,406,136,391,138,380,150,365,161,354,169,343,169,327,162,322,159,312,171,311,184,321,197,326,208,337,216,350,219,361,221,373,224,383,231,395,233,406,235,421,235,431,235,436,228,442,226,445,219,442,217,448,217,456,210,453,200,448,198,454" href="#" alt="kurunagala" onMouseOver="popUpTital(this,'kurunagala');">
  <area shape="poly" coords="434,599,439,590,447,581,447,575,454,558,454,549,459,533,462,517,461,503,454,492,459,472,461,457,457,445,451,435,439,435,432,441,422,445,420,434,411,428,401,428,392,418,384,412,387,403,377,401,366,391,358,387,351,381,350,393,348,399,350,405,341,399,330,392,321,389,309,390,313,397,310,406,312,412,313,419,322,423,335,417,345,417,349,428,344,437,346,447,350,454,354,460,354,471,363,462,375,447,382,439,391,440,396,454,395,465,399,469,399,478,397,486,398,493,410,499,415,504,414,517,414,534,416,554,416,575,416,586,423,593,429,597" href="#" alt="ampara" onMouseOver="popUpTital(this,'ampara');">
  <area shape="poly" coords="172,544,165,546,160,546,157,553,156,547,148,546,143,548,136,550,132,553,124,552,121,558,119,552,115,540,114,531,114,523,117,519,128,524,141,524,147,526,148,529,156,528,156,524,168,518,175,520,173,527" href="#" alt="colombo" onMouseOver="popUpTital(this,'colombo');">
  <area shape="poly" coords="117,521,117,510,113,499,110,493,107,482,114,489,118,490,112,479,112,470,119,464,139,464,151,462,161,462,170,468,181,464,189,464,183,472,174,478,167,483,166,493,169,499,169,509,168,516,162,519,156,526,152,533,139,526,128,526,122,526" href="#" alt="gampaha" onMouseOver="popUpTital(this,'gampaha');">
  <area shape="poly" coords="232,623,224,629,225,635,219,639,211,636,209,641,217,650,212,655,209,661,208,673,212,676,208,691,208,696,220,699,232,700,242,700,251,697,265,694,255,686,260,681,262,673,259,669,250,658,248,650,255,636,252,631,244,631,247,625,238,622" href="#" alt="mathara" onMouseOver="popUpTital(this,'mathara');">
  <area shape="poly" coords="140,615,142,625,146,638,146,650,151,658,162,670,170,677,180,687,191,691,201,694,212,693,212,684,212,677,208,666,210,656,214,652,214,645,208,639,213,634,216,635,223,638,225,629,219,625,210,619,198,617,191,623,190,631,182,628,172,628,160,625,150,619" href="#" alt="galle" onMouseOver="popUpTital(this,'galle');">
  <area shape="poly" coords="140,614,136,611,136,605,136,597,133,589,129,578,126,567,122,557,140,551,151,547,161,553,166,550,168,549,174,560,181,573,189,589,195,603,201,614,198,622,193,625,190,632,178,629,165,630,154,622,143,619" href="#" alt="kaluthara" onMouseOver="popUpTital(this,'kaluthara');">
</map>
</body>
 </html>