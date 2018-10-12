<?php
/** generate patient Id when pass bdate and gender */

function generatePid($bdate,$gender){   // date format =>  Mounth/date/year => (MM/dd/YYYY) , gender => male = 0, female = 1

	$time = strtotime($bdate); // string date to date 

	$year = date('y',$time)%100;   // get year with two digits 
	if($year < 10) 
		$year = "0".$year;
		
	$noOfDates = floor(($time - strtotime('01/01/'.date('y',$time)))/(60*60*24)); // no of dates from jan 01

	if($gender == 1)		// if female add 500 (just like in national ID card number)
		$noOfDates += 500;
	
	return "P".$year.$noOfDates.mt_rand(1000,9999);
} 


?>