<?php  
 
require("class.phpmailer.php"); // path to the PHPMailer class
require("class.smtp.php");

sendMail();

function sendMail(){
	
	$mail = new PHPMailer();  
	 
	$mail->IsSMTP();  // telling the class to use SMTP
	$mail->Mailer = "smtp";
	$mail->Host = "ssl://smtp.gmail.com";
	$mail->Port = 465;
	$mail->SMTPAuth = true; // turn on SMTP authentication
	$mail->Username = "info.otmis@gmail.com"; // SMTP username
	$mail->Password = "medicine@111"; // SMTP password 
	
	$mail->From     = "info.otmis@gmail.com";
	$mail->AddAddress("dilanga198@gmail.com");  
	 
	$mail->Subject  = "Health information email";
	$mail->IsHTML(true);
	$mail->Body     = "Dear <b>xxxxxx</b> <br><br>      You have successfully registerd as a\n <i>patient</i>.<br><br> Thank you<br> <br>footer note<br>";
	
	 
	$mail->WordWrap = 50;  
	$mail->SMTPDebug  = 1;
	if(!$mail->Send()) {
		echo 'Message was not sent.';
		echo 'Mailer error: ' . $mail->ErrorInfo;
	} else {
		echo 'Message has been sent.';
	}

}
?>