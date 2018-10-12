<?php  

require("class.phpmailer.php"); // path to the PHPMailer class
require("class.smtp.php");


function sendMailPRA($email,$name, $pid, $dfPass){
	
	$mail = new PHPMailer();  
	 
	$mail->IsSMTP();  // telling the class to use SMTP
	$mail->Mailer = "smtp";
	$mail->Host = "ssl://smtp.gmail.com";
	$mail->Port = 465;
	$mail->SMTPAuth = true; // turn on SMTP authentication
	$mail->Username = "info.otmis@gmail.com"; // SMTP username
	$mail->Password = "medicine@111"; // SMTP password 
	
	$mail->From     = "info.otmis@gmail.com";
	$mail->AddAddress($email);  
	 
	$mail->Subject  = "Health information email";
	$mail->IsHTML(true);
	$mail->Body     = "Dear <b>".$name."</b>, <br><br>      You have successfully registerd as a\n <i>patient</i>.<br><br> Thank you<br> <br>footer note<br>
	
						<br><br>Your patient id is ".$pid."<br>Your password is ".$dfPass;
	
	 
	$mail->WordWrap = 50;  
	$mail->SMTPDebug  = 1;
	if(!$mail->Send()) {
		return 1;
	} else {
		return 0;
	}

}

function sendMailDRA($email,$name,$did,$dfPass){
	
	$mail = new PHPMailer();  
	 
	$mail->IsSMTP();  // telling the class to use SMTP
	$mail->Mailer = "smtp";
	$mail->Host = "ssl://smtp.gmail.com";
	$mail->Port = 465;
	$mail->SMTPAuth = true; // turn on SMTP authentication
	$mail->Username = "info.otmis@gmail.com"; // SMTP username
	$mail->Password = "medicine@111"; // SMTP password 
	
	$mail->From     = "info.otmis@gmail.com";
	$mail->AddAddress($email);  
	 
	$mail->Subject  = "Health information email";
	$mail->IsHTML(true);
	$mail->Body     = "Dear Dr. <b>".$name."</b> <br><br>      You have successfully registerd as a\n <i>doctor</i> in the online system.<br><br> Thank you<br> <br>
	
						<br><br>Your Doctor id is ".$did."<br>Your password is ".$dfPass."<br>footer note<br>";
	
	 
	$mail->WordWrap = 50;  
	$mail->SMTPDebug  = 1;
	if(!$mail->Send()) {
		return 1;
	} else {
		return 0;
	}

}


function sendMailDRR($email,$name){
	
	$mail = new PHPMailer();  
	 
	$mail->IsSMTP();  // telling the class to use SMTP
	$mail->Mailer = "smtp";
	$mail->Host = "ssl://smtp.gmail.com";
	$mail->Port = 465;
	$mail->SMTPAuth = true; // turn on SMTP authentication
	$mail->Username = "info.otmis@gmail.com"; // SMTP username
	$mail->Password = "medicine@111"; // SMTP password 
	
	$mail->From     = "info.otmis@gmail.com";
	$mail->AddAddress($email);  
	 
	$mail->Subject  = "Health information email";
	$mail->IsHTML(true);
	$mail->Body     = "Dear Dr. <b>".$name."</b> <br><br>  Your request is rejected. Please try again with necessary information.<br><br> Thank you<br> <br>";

	
	 
	$mail->WordWrap = 50;  
	$mail->SMTPDebug  = 1;
	if(!$mail->Send()) {
		return 0;
	} else {
		return 1;
	}

}


function sendMailPRR($email,$name){
	
	$mail = new PHPMailer();  
	 
	$mail->IsSMTP();  // telling the class to use SMTP
	$mail->Mailer = "smtp";
	$mail->Host = "ssl://smtp.gmail.com";
	$mail->Port = 465;
	$mail->SMTPAuth = true; // turn on SMTP authentication
	$mail->Username = "info.otmis@gmail.com"; // SMTP username
	$mail->Password = "medicine@111"; // SMTP password 
	
	$mail->From     = "info.otmis@gmail.com";
	$mail->AddAddress($email);  
	 
	$mail->Subject  = "Health information email";
	$mail->IsHTML(true);
	$mail->Body     = "Dear Dr. <b>".$name."</b> <br><br>  Your request is rejected. Please try again with necessary information.<br><br> Thank you<br> <br>";

	
	 
	$mail->WordWrap = 50;  
	$mail->SMTPDebug  = 1;
	if(!$mail->Send()) {
		return 0;
	} else {
		return 1;
	}

}

function sendMailDCP($email,$name,$did,$dfPass){
	
	$mail = new PHPMailer();  
	 
	$mail->IsSMTP();  // telling the class to use SMTP
	$mail->Mailer = "smtp";
	$mail->Host = "ssl://smtp.gmail.com";
	$mail->Port = 465;
	$mail->SMTPAuth = true; // turn on SMTP authentication
	$mail->Username = "info.otmis@gmail.com"; // SMTP username
	$mail->Password = "medicine@111"; // SMTP password 
	
	$mail->From     = "info.otmis@gmail.com";
	$mail->AddAddress($email);  
	 
	$mail->Subject  = "Health information email";
	$mail->IsHTML(true);
	$mail->Body     = "Dear Dr. <b>".$name."</b> <br><br>      You have successfully changed your password in the online system.<br><br> Thank you<br> <br>
	
						<br><br>Your Doctor id is ".$did."<br>Your password is ".$dfPass."<br>footer note<br>";
	
	 
	$mail->WordWrap = 50;  
	$mail->SMTPDebug  = 1;
	if(!$mail->Send()) {
		return 1;
	} else {
		return 0;
	}

}

function sendMailPCP($email,$name,$pid,$dfPass){
	
	$mail = new PHPMailer();  
	 
	$mail->IsSMTP();  // telling the class to use SMTP
	$mail->Mailer = "smtp";
	$mail->Host = "ssl://smtp.gmail.com";
	$mail->Port = 465;
	$mail->SMTPAuth = true; // turn on SMTP authentication
	$mail->Username = "info.otmis@gmail.com"; // SMTP username
	$mail->Password = "medicine@111"; // SMTP password 
	
	$mail->From     = "info.otmis@gmail.com";
	$mail->AddAddress($email);  
	 
	$mail->Subject  = "Health information email";
	$mail->IsHTML(true);
	$mail->Body     = "Dear <b>".$name."</b> <br><br>      You have successfully changed your password in the online system.<br><br> Thank you<br> <br>
	
						<br><br>Your Doctor id is ".$pid."<br>Your password is ".$dfPass."<br>footer note<br>";
	
	 
	$mail->WordWrap = 50;  
	$mail->SMTPDebug  = 1;
	if(!$mail->Send()) {
		return 1;
	} else {
		return 0;
	}

}

function sendMailRU($email){
	
	$mail = new PHPMailer();  
	 
	$mail->IsSMTP();  // telling the class to use SMTP
	$mail->Mailer = "smtp";
	$mail->Host = "ssl://smtp.gmail.com";
	$mail->Port = 465;
	$mail->SMTPAuth = true; // turn on SMTP authentication
	$mail->Username = "info.otmis@gmail.com"; // SMTP username
	$mail->Password = "medicine@111"; // SMTP password 
	
	$mail->From     = "info.otmis@gmail.com";
	$mail->AddAddress($email);  
	 
	$mail->Subject  = "Health information email";
	$mail->IsHTML(true);
	$mail->Body     = "Dear Doctor this is to inform you, that a new roster have been uploaded <br> Thank you <br>footer note<br>";
	
	 
	$mail->WordWrap = 50;  
	$mail->SMTPDebug  = 1;
	if(!$mail->Send()) {
		return 1;
	} else {
		return 0;
	}

}
?>