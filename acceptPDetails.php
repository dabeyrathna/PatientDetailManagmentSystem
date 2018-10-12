<?php


	require_once("DBAccess.php");  
	$db = new DBAccess();
	$dbConnection = $db->initConnection();
	$sql = "SELECT * FROM temp_patient WHERE pRequestId ='".$_POST['requestNo']."'";	
			
    $query=mysql_query($sql,$dbConnection) or die("SQL Error ".mysql_error());
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

	$genPid = generatePid($dob,$gender);
	
	// save the data to the database
	$sql1 = "INSERT INTO patient(`pid`,`name`, `add`, `gender`, `nic`, `dob`, `email`, `telNo`, `district`,`bloodGroup`,`regDate`) 
	VALUES ('".$genPid ."','".$name."','".$add."','".$gender."','".$nic."','".$dob."','".$email."','".$telNo."','".$district."','".$bloodGroup."','".date("Y-m-d")."')";
	
	
	
	// save the data to the database
	//$sql3 = "DELETE FROM temp_patient WHERE pRequestId ='".$_POST['requestNo']."'";
	//$query=mysql_query($sql3,$dbConnection) or die("SQL Error yyyyyyyyyyyyyyyyyyyyyyyyyyyyyy".mysql_error());
	
	include("Mailing/mail.php");
	sendMailPR($email,$name, $genPid, "123");
	
	
		
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

if($query=mysql_query($sql1,$dbConnection)){
	Header("Location:successPage.php?info=2");
	} 
		else{
		Header("Location:errorOage.php?info=8");
		}
?>

