<?php


    require_once("DBAccess.php");
	

	function healthIssueList($id){
			$db = new DBAccess();
			$dbConnection = $db->initConnection();
			$queryString="SELECT * FROM health_issue order by issue";         
			$query = mysql_query($queryString,$dbConnection) or die("MySql Error".mysql_error());		
		
			$str =	'<select id = "issue" name="issue" style="width:300px">';
			
			while($rows=mysql_fetch_array($query)){	
			
				if($id == $rows["issueId"])
				{
					$str .=	'<option value="'.$rows["issueId"].' " selected>'.$rows["issue"].'</option>';
				}
				else{
					$str .=	'<option value="'.$rows["issueId"].'">'.$rows["issue"].'</option>';
                }       
                         
			}
			$str.=  '</select>';
	
			return $str;
	}
	
	function multiSelectionHealthIssueList(){
		$db = new DBAccess();
		$dbConnection = $db->initConnection();
		$queryString="SELECT * FROM health_issue order by issue";         
		$query = mysql_query($queryString,$dbConnection) or die("MySql Error".mysql_error());		
		$count = 1;
		$str =	'<select id = "multiSelectIssue" name="multiSelectIssue[]" style="width:300px" size="8" height="300px" multiple>';
		
		while($rows=mysql_fetch_array($query)){	
		
			if($count == 1)
			{
				$str .=	'<option value="'.$rows["issueId"].' " selected>'.$rows["issue"].'</option>';
			}
			else{
				$str .=	'<option value="'.$rows["issueId"].'">'.$rows["issue"].'</option>';
			}       
			$count++;    
		}
		$str.=  '</select>';

		return $str;
}


	function districtList(){
		$str =	'<select id = "districtList" name="districtList[]" style="width:300px" size="8" height="300px" multiple>
			<option value="Ampara">Ampara
			<option value="Anuradhapura">Anuradhapura
			<option value="Badulla">Badulla
			<option value="Batticaloa">Batticaloa
			<option value="Colombo">Colombo
			<option value="Galle">Galle
			<option value="Gampaha">Gampaha
			<option value="Hambantota">Hambantota
			<option value="Jaffna">Jaffna
			<option value="Kalutara">Kalutara
			<option value="Kandy" selected>Kandy
			<option value="Kegalle">Kegalle
			<option value="Kilinochchi">Kilinochchi
			<option value="Kurunegala">Kurunegala
			<option value="Mannar">Mannar
			<option value="Matale">Matale
			<option value="Matara">Matara
			<option value="Moneragala">Moneragala
			<option value="Mullaitivu">Mullaitivu
			<option value="Nuwara Eliya">Nuwara Eliya
			<option value="Polonnaruwa">Polonnaruwa
			<option value="Puttalam">Puttalam
			<option value="Ratnapura">Ratnapura
			<option value="Trincomalee">Trincomalee
			<option value="Vavuniya">Vavuniya
		</select>';
		
		return $str;
	}

	function healthMedicineList($id){
			$db = new DBAccess();
			$dbConnection = $db->initConnection();
			$queryString="SELECT * FROM `medicine` order by medicine";         
			$query = mysql_query($queryString,$dbConnection) or die("MySql Error".mysql_error());		
		
			$str =	'<select id = "mid" name="medicine" style="width:200px;height:20px">';
			
			while($rows=mysql_fetch_array($query))
			{	
		
				if($id == $rows["mid"])
				{
					$str .=	'<option value="'.$rows["mid"].'" selected>'.$rows["medicine"].'</option>';
				}
				else{
					$str .=	'<option value="'.$rows["mid"].'">'.$rows["medicine"].'</option>';
                }             
			}
			$str.=  '</select>';
	
			return $str;
	}
	
	function frequencyList($id){
			$db = new DBAccess();
			$dbConnection = $db->initConnection();
			$queryString="SELECT * FROM `frequency_med` ";         
			$query = mysql_query($queryString,$dbConnection) or die("MySql Error".mysql_error());		
		
			$str =	'<select id = "frequency" name="frequency" style="width:150px;height:20px">';
			
			while($rows=mysql_fetch_array($query)){	
				
				
                 if($id == $rows["frequencyId"])
				{
					$str .=	'<option value="'.$rows["frequencyId"].'" selected>'.$rows["frequency"].'</option>';
				}
				else{
					$str .=	'<option value="'.$rows["frequencyId"].'">'.$rows["frequency"].'</option>';
                }              
                         
			}
			$str.=  '</select>';
	
			return $str;
	}

	function specializationList($spId){
			$db = new DBAccess();
			$dbConnection = $db->initConnection();
			$queryString="SELECT * FROM `specialization` order by spId";         
			$query = mysql_query($queryString,$dbConnection) or die("MySql Error".mysql_error());		
		
			$str =	'<select id = "specialization" name="specialization" style="width:300px">';
			
			while($rows=mysql_fetch_array($query)){	
				if($spId == $rows["spId"])
				{
					$str .=	'<option value="'.$rows["spId"].'" selected>'.$rows["spName"].'</option>';
                }
				else
				{
					$str .=	'<option value="'.$rows["spId"].'">'.$rows["spName"].'</option>';			
				}
			}
			$str.=  '</select>';
	
			return $str;
	}	
			
				 
	function hospitalList($hpId){
			$db = new DBAccess();
			$dbConnection = $db->initConnection();
			$queryString="SELECT * FROM `hospital` order by hId";         
			$query = mysql_query($queryString,$dbConnection) or die("MySql Error".mysql_error());		
		
			$str =	'<select id = "hospital" name="hospital" style="width:300px">';
			
			while($rows=mysql_fetch_array($query)){	
				
                if($hpId == $rows["hId"])
				{
					$str .=	'<option value="'.$rows["hId"].'" selected>'.$rows["hName"].'</option>';
                }
				else
				{
					$str .=	'<option value="'.$rows["hId"].'">'.$rows["hName"].'</option>';			
				}         
                         
			}
			$str.=  '</select>';
	
			return $str;
	}	
	
	
?>