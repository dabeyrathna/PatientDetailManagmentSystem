<?php

	session_start();
	if (!isset($_SESSION["uid"]))
	{
		Header("Location: errorPage.php?info=7");
	}
	else if($_SESSION["uid"][0] != 'E' && $_SESSION["uid"][0] != 'e' ){
			Header("Location:errorPage.php?info=7");
	}
	else{   
		require_once("timeout.php");
		isTimedOut();    
	} 

	require_once("DBAccess.php");  
	
	
	
	if(isset($_GET['info']) && $_GET['info'] == 'd' && isset($_POST['btnDoctorAccept']) && isset($_POST['drequestId'])){	
		acceptDoctor($_POST['drequestId']);
	}
	else if(isset($_GET['info']) && $_GET['info'] == 'd' && isset($_POST['btnDoctorReject']) && isset($_POST['drequestId'])){
		rejectDoctor($_POST['drequestId']);
	}
	else if(isset($_GET['info']) && $_GET['info'] == 'p' && isset($_POST['btnPatientAccept']) && isset($_POST['pRequestId'])){
		echo "came";
		acceptPatient($_POST['pRequestId']);
	}
	else if(isset($_GET['info']) && $_GET['info'] == 'p' && isset($_POST['btnPatientReject'])&& isset($_POST['pRequestId'])){
		rejectPatient($_POST['pRequestId']);
	}
	
	
	function acceptPatient($pRequestId)
	{
			$db = new DBAccess();
			$dbConnection = $db->initConnection();
			$sql1 = "SELECT * FROM temp_patient WHERE pRequestId ='".$pRequestId."'";	
			
			$query=mysql_query($sql1,$dbConnection) or die("SQL Error ".mysql_error());
			$rows=mysql_fetch_assoc($query);
	

				$name = $rows['name'];
				$nic = $rows['nic'];
				$gender = $rows['gender'];
				$dob = $rows['dob'];
				$add = $rows['add'];
				$telNo = $rows['telNo'];
				$email = $rows['email'];
				$bloodGroup = $rows['bloodGroup'];
				$district = $rows['district'];
				$gid = $rows['gId'];

				$genPid = generatePid($dob,$gender);
				$pPass = generatePassword();
	
	$sql2 = "INSERT INTO patient(`pId`,`name`,`nic`, `gender`, `add`, `regDate`, `dob`, `pPass`, `bloodGroup`, `email`, `telNo`, `district`, `gId`) VALUES ('".$genPid ."','".$name."','".$nic."','".$gender."','".$add."','".date("Y-m-d")."','".$dob."','".md5($pPass)."','".$bloodGroup."','".$email."','".$telNo."','".$district."','".$gid."')";
	
	
			$query=mysql_query($sql2,$dbConnection) or die("SQL Error ".mysql_error());
	

		$sql3 = "DELETE FROM temp_patient WHERE pRequestId ='".$pRequestId."'";
		$query=mysql_query($sql3,$dbConnection);
		
		include("Mailing/mail.php");

		if(sendMailPRA($email,$name, $genPid, $pPass)){
			Header("Location:eaccount.php?info=2");       // successfully added
		} 
		else{
				Header("Location:eaccount.php?info=8");				
		}
	}


	function rejectPatient($pRequestId)
	{
		$db = new DBAccess();
		$dbConnection = $db->initConnection();

		$sql3 = "DELETE FROM temp_patient WHERE pRequestId ='".$pRequestId."'";
		$query=mysql_query($sql3,$dbConnection);
		
		include("Mailing/mail.php");

		if(sendMailDRR($email,$name)){
			Header("Location:eaccount.php?info=2");       // successfully rejected
		} 
		else{
				Header("Location:eaccount.php?info=8");				
		}
	}
	
	function acceptDoctor($drequestId)
	{
		$db = new DBAccess();
		$dbConnection = $db->initConnection();
		$sql1 = "SELECT * FROM temp_doctor where dRequestId = '".$drequestId."'";
			
			$query=mysql_query($sql1,$dbConnection) or die("SQL Error ".mysql_error());
			$rows=mysql_fetch_assoc($query);
				
				$name = $rows['name'];
				$nic = $rows['nic'];
				$gender = $rows['gender'];
				$spId = $rows['spId'];
				$hId = $rows['hId'];
				$MOIC = $rows['MOIC'];
				$dob = $rows['dob'];
				$add = $rows['add'];
				$telNo = $rows['telNo'];
				$email = $rows['email'];
				$district = $rows['district'];
				$maritalStatus = $rows['maritalStatus'];
				$nationality = $rows['nationality'];
				$slmcRegNo = $rows['slmcRegNo'];
				
				$did = generateDid($dob,$gender);
				$dPass = generatePassword();
				
	
	$sql2 = "INSERT INTO `doctor`(`dId`, `MOIC`, `name`, `gender`, `dPass`, `add`, `spId`, `hId`, `email`, `telNo`, `nic`, `dob`, `district`,`maritalStatus` ,`nationality`,`slmcRegNo`) VALUES ('".$did."',".$MOIC.",'".$name."','".$gender."','".md5($dPass)."','".$add."','".$spId."','".$hId."','".$email."','".$telNo."','".$nic."','".$dob."','".$district."','".$maritalStatus."','".$nationality."',".$slmcRegNo.")";
	

			$query=mysql_query($sql2,$dbConnection) or die("SQL Error ".mysql_error());
	

		$sql3 = "DELETE FROM temp_doctor WHERE dRequestId ='".$drequestId."'";
		$query=mysql_query($sql3,$dbConnection);
		
		include("Mailing/mail.php");

		if(sendMailDRA($email,$name, $did, $dPass)){
			Header("Location:eaccount.php?info=2");       // successfully added
		} 
		else{
				Header("Location:eaccount.php?info=8");				
		}
	}
	
	function rejectDoctor($drequestId)
	{
		$db = new DBAccess();
		$dbConnection = $db->initConnection();

		$sql3 = "DELETE FROM temp_doctor WHERE dRequestId ='".$drequestId."'";
		$query=mysql_query($sql3,$dbConnection);
		
		include("Mailing/mail.php");

		if(sendMailDRR($email,$name)){
			Header("Location:eaccount.php?info=2");       // successfully rejected
		} 
		else{
				Header("Location:eaccount.php?info=8");				
		}
	}
	
	function generatePid($bdate,$gender){   // date format =>  Mounth/date/year => (MM/dd/YYYY) , gender => male = 0, female = 1

		$time = strtotime($bdate); // string date to date 
	
		$year = date('y',$time)%100;   // get year with two digits 
		if($year < 10) 
			$year = "0".$year;
			
		$noOfDates = floor(($time - strtotime('01/01/'.date('y',$time)))/(60*60*24)); // no of dates from jan 01
	
		if($gender == 'f')		// if female add 500 (just like in national ID card number)
			$noOfDates += 500;
		
		return "P".$year.$noOfDates.mt_rand(1000,9999);
	} 
	
	function generatePassword(){
		  $alphabet = "abcdefghijklmnopqrstuwxyzABCDEFGHIJKLMNOPQRSTUWXYZ0123456789";
			$pass = array(); //remember to declare $pass as an array
			$alphaLength = strlen($alphabet) - 1; //put the length -1 in cache
			for ($i = 0; $i < 8; $i++) {
				$n = rand(0, $alphaLength);
				$pass[] = $alphabet[$n];
			}
			return implode($pass); //turn the array into a string
	}
	
	function generateDid($bdate,$gender){
		$time = strtotime($bdate); // string date to date 
	
		$year = date('y',$time)%100;   // get year with two digits 
		if($year < 10) 
			$year = "0".$year;
			
		$noOfDates = floor(($time - strtotime('01/01/'.date('y',$time)))/(60*60*24)); // no of dates from jan 01
	
		if($gender == 'f')		// if female add 500 (just like in national ID card number)
			$noOfDates += 500;
		
		return "D".$year.$noOfDates.mt_rand(1000,9999);
	}

?>

