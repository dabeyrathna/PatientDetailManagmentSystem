<?php

		session_start();
 
?>

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
  		$man = selectMenu($user);
		echo $man;
	?>
        
		<br class="clearfix" />
		
        <div id="page">
        	<div id = "content_wrapper">
   
            	<form name="form2" method="#" action="#" id="regForm" class="hospital_form" > 
                <div align="center"><img src="Images/vector_hand_heart_logo.png"></div>
               <p style="font-size:19px">
You can get a “snapshot” of the quality of hospitals in your area and across the nation by looking at the following
aspects of healthcare:<br>
                            
General Information: Name, address, telephone number, type of hospital, and other general information about the 
hospital.
Patients’ experiences: How recently discharged patients responded to a national survey about their hospital experience. 
For example, how well did a hospital’s doctors and nurses communicate with patients and manage their pain?
Timely & effective care: How often and quickly each hospital gives recommended treatments for certain conditions like 
heart attack, heart failure, pneumonia, children’s asthma, stroke, influenza, and blood clots, and follows best 
practices to prevent surgical complications.<br><br>
Complications:
How likely patients will suffer from complications while in the hospital or after having certain inpatient surgical 
procedures.
How often patients in the hospital get certain serious conditions that could have been prevented if the hospital 
followed procedures based on best practices and scientific evidence.
Readmissions & deaths: How each hospital’s performance on the readmission and death (mortality) measures compares to 
the national rate.<br><br>
Use of medical imaging: How a hospital uses outpatient medical imaging tests (like CT scans and MRIs).
Payment & value of care:<br>
How each hospital’s payment for heart attack patients, payment for heart failure patients, and payment for pneumonia 
patients compares to the national average payment for each condition.<br><br>
Information on measures of payments and patient outcomes together allows for an assessment of a hospital’s value of 
care.
Medicare Spending per Beneficiar
</p>
			</form>

            </div>
        </div>

		<?php 
			include 'footer.php';
		?>	
 </div>
 </body>
 </html>
