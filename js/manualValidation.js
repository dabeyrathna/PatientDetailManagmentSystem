
function userNameVali(){

	var owName=document.getElementById('owName').value;
	
	if(owName=="")
	{
		document.getElementById('userName').innerHTML="*"+"<br>"+ "Required";
		document.getElementById('userName').style.color="red";
		document.getElementById('userName').style.fontSize="11px";
	}
	else
	{
		document.getElementById('userName').innerHTML="*";
		document.getElementById('userName').style.color="red";
		document.getElementById('userName').style.fontSize="11px";
	}
}

function initialNameVali(){
	
	var initialName=document.getElementById('initialName').value;
	
	
	if(initialName=="")
	{
		
		document.getElementById('initName').innerHTML="*"+"<br>"+ "Required";
		document.getElementById('initName').style.color="red";
		document.getElementById('initName').style.fontSize="11px";
	}
	else
	{
		document.getElementById('initName').innerHTML="*";
		document.getElementById('initName').style.color="red";
		document.getElementById('initName').style.fontSize="11px";
	}
}

function nationalityVali(){
	
	var nationality=document.getElementById('nationality').value;
	
	
	if(nationality=="")
	{
		
		document.getElementById('spanNationality').innerHTML="*"+"<br>"+ "Required";
		document.getElementById('spanNationality').style.color="red";
		document.getElementById('spanNationality').style.fontSize="11px";
	}
	else
	{
		document.getElementById('spanNationality').innerHTML="*";
		document.getElementById('spanNationality').style.color="red";
		document.getElementById('spanNationality').style.fontSize="11px";
	}
}


function perAddVali(){
	
	var perAdd=document.getElementById('perAdd').value;
	
	
	if(perAdd=="")
	{
		
		document.getElementById('addNo').innerHTML="*"+"<br>"+ "Required";
		document.getElementById('addNo').style.color="red";
		document.getElementById('addNo').style.fontSize="11px";
	}
	else
	{
		document.getElementById('addNo').innerHTML="*";
		document.getElementById('addNo').style.color="red";
		document.getElementById('addNo').style.fontSize="11px";
	}
}


function streetVali(){
	
	var street=document.getElementById('street').value;
	
	
	if(street=="")
	{
		
		document.getElementById('addStreet').innerHTML="*"+"<br>"+ "Required";
		document.getElementById('addStreet').style.color="red";
		document.getElementById('addStreet').style.fontSize="11px";
	}
	else
	{
		document.getElementById('addStreet').innerHTML="*";
		document.getElementById('addStreet').style.color="red";
		document.getElementById('addStreet').style.fontSize="11px";
	}
}

function townVali(){
	
	var town=document.getElementById('town').value;
	
	
	if(town=="")
	{
		
		document.getElementById('addTown').innerHTML="*"+"<br>"+ "Required";
		document.getElementById('addTown').style.color="red";
		document.getElementById('addTown').style.fontSize="11px";
	}
	else
	{
		document.getElementById('addTown').innerHTML="*";
		document.getElementById('addTown').style.color="red";
		document.getElementById('addTown').style.fontSize="11px";
	}
}


function nicVali(){
	
	var nic=document.getElementById('nic');
	
	
	if(nic.value=="_________V")
	{
		
		document.getElementById('spanNic').innerHTML="*"+"<br>"+ "Required";
		document.getElementById('spanNic').style.color="red";
		document.getElementById('spanNic').style.fontSize="11px";
	}
	else
	{
		document.getElementById('spanNic').innerHTML="*";
		document.getElementById('spanNic').style.color="red";
		document.getElementById('spanNic').style.fontSize="11px";
	}
}

function emailVali(){
	
	var email=document.getElementById('email').value;
	var regVal= /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/;
	
	if(email=="")
	{
		
		document.getElementById('spanEmail').innerHTML="*"+"<br>"+ "Required";
		document.getElementById('spanEmail').style.color="red";
		document.getElementById('spanEmail').style.fontSize="11px";
	}
	else if(!regVal.test(email))
	{
		document.getElementById('spanEmail').innerHTML="* " + "<br>" + "Invalid Email address";
		document.getElementById('spanEmail').style.color="red";
		document.getElementById('spanEmail').style.fontSize="11px";
	}
	else
	{
		document.getElementById('spanEmail').innerHTML="*";
		document.getElementById('spanEmail').style.color="red";
		document.getElementById('spanEmail').style.fontSize="11px";
	}
}


function telnoVali(){
	
	var telno=document.getElementById('telno');
	
	
	if(telno.value=="(___) _______")
	{
		
		document.getElementById('spanTel').innerHTML="*"+"<br>"+ "Required";
		document.getElementById('spanTel').style.color="red";
		document.getElementById('spanTel').style.fontSize="11px";
	}
	else
	{
		
		document.getElementById('spanTel').innerHTML="*";
		document.getElementById('spanTel').style.color="red";
		document.getElementById('spanTel').style.fontSize="11px";
	}
}


function biNameVali(){
	
	var biName=document.getElementById('biName');
	
	
	
	if(biName.value=="")
	{
		
		document.getElementById('bizName').innerHTML="*"+"<br>"+ "Required";
		document.getElementById('bizName').style.color="red";
		document.getElementById('bizName').style.fontSize="11px";
	}
	else
	{
		
		document.getElementById('bizName').innerHTML="*";
		document.getElementById('bizName').style.color="red";
		document.getElementById('bizName').style.fontSize="11px";
	}
}


function bizCatVali(){
	
	var bizCat=document.getElementById('bizCat');
	
	
	if(bizCat.value=="0")
	{
		
		document.getElementById('bizCatSpan').innerHTML="*"+"<br>"+ "Sellect a category";
		document.getElementById('bizCatSpan').style.color="red";
		document.getElementById('bizCatSpan').style.fontSize="11px";
	}
	else
	{
		
		document.getElementById('bizCatSpan').innerHTML="*";
		document.getElementById('bizCatSpan').style.color="red";
		document.getElementById('bizCatSpan').style.fontSize="11px";
	}
}

function natureVali(){
	
	var nature=document.getElementById('nature');
	
	
	if(nature.value=="")
	{
		
		document.getElementById('bizNature').innerHTML="*"+"<br>"+ "Required";
		document.getElementById('bizNature').style.color="red";
		document.getElementById('bizNature').style.fontSize="11px";
	}
	else
	{
		
		document.getElementById('bizNature').innerHTML="*";
		document.getElementById('bizNature').style.color="red";
		document.getElementById('bizNature').style.fontSize="11px";
	}
}

function placeVali(){
	
	var place=document.getElementById('place');
	
	
	if(place.value=="")
	{
		
		document.getElementById('bizPlace').innerHTML="*"+"<br>"+ "Required";
		document.getElementById('bizPlace').style.color="red";
		document.getElementById('bizPlace').style.fontSize="11px";
	}
	else
	{
		
		document.getElementById('bizPlace').innerHTML="*";
		document.getElementById('bizPlace').style.color="red";
		document.getElementById('bizPlace').style.fontSize="11px";
	}
}


function divisionVali(){
	
	var division=document.getElementById('division');
	
	if(division.value=="0")
	{
		
		document.getElementById('gnDiv').innerHTML="*"+"<br>"+ "Sellect a category";
		document.getElementById('gnDiv').style.color="red";
		document.getElementById('gnDiv').style.fontSize="11px";
	}
	else
	{
		
		document.getElementById('gnDiv').innerHTML="*";
		document.getElementById('gnDiv').style.color="red";
		document.getElementById('gnDiv').style.fontSize="11px";
	}
}

function dateVali(){
	
	var startDate=document.getElementById('startDate');
	
	
	if(startDate.value=="____/__/__")
	{
		
		document.getElementById('spanDate').innerHTML="*"+"</br>"+"Required";
		document.getElementById('spanDate').style.color="red";
		document.getElementById('spanDate').style.fontSize="11px";
	}
	else
	{
		
		document.getElementById('spanDate').innerHTML="*";
		document.getElementById('spanDate').style.color="red";
		document.getElementById('spanDate').style.fontSize="11px";
	}
}

function  provinceVali(){
	
	var province=document.getElementById('province');
	
	
	if(province.value=="")
	{
		
		document.getElementById('spanProvince').innerHTML="* Required";
		document.getElementById('spanProvince').style.color="red";
		document.getElementById('spanProvince').style.fontSize="11px";
	}
	else
	{
		
		document.getElementById('spanProvince').innerHTML="*";
		document.getElementById('spanProvince').style.color="red";
		document.getElementById('spanProvince').style.fontSize="11px";
	}
}

function  passVali(){
	
	var cPass=document.getElementById('cPass');
	
	
	if(cPass.value=="")
	{
		
		document.getElementById('spanPass').innerHTML="* Required";
		document.getElementById('spanPass').style.color="red";
		document.getElementById('spanPass').style.fontSize="11px";
	}
	else if(cPass.value.length < 5)
	{
		document.getElementById('spanPass').innerHTML="*"+"</br>"+ "Passwords length should more than 5 characters";
		document.getElementById('spanPass').style.color="red";
		document.getElementById('spanPass').style.fontSize="11px";
	}
	else
	{
		
		document.getElementById('spanPass').innerHTML="*";
		document.getElementById('spanPass').style.color="red";
		document.getElementById('spanPass').style.fontSize="11px";
	}
}

function  repassVali(){
	
	var rePass=document.getElementById('rePass');
	var cPass=document.getElementById('cPass');
	
	if(rePass.value=="")
	{
		
		document.getElementById('spanRePass').innerHTML="* Required";
		document.getElementById('spanRePass').style.color="red";
		document.getElementById('spanRePass').style.fontSize="11px";
	}
	else if(rePass.value != cPass.value)
	{
		document.getElementById('spanRePass').innerHTML="*"+"</br>"+ "Passwords are not match";
		document.getElementById('spanRePass').style.color="red";
		document.getElementById('spanRePass').style.fontSize="11px";
	}
	else
	{
		
		document.getElementById('spanRePass').innerHTML="*";
		document.getElementById('spanRePass').style.color="red";
		document.getElementById('spanRePass').style.fontSize="11px";
	}
}

function submitValidation()
{


	var owName=document.getElementById('owName').value;
	var initialName=document.getElementById('initialName').value;
	var nationality=document.getElementById('nationality').value;
	var perAdd=document.getElementById('perAdd').value;
	var street=document.getElementById('street').value;
	var town=document.getElementById('town').value;
	var nic=document.getElementById('nic').value;
	var email=document.getElementById('email').value;
	var telno=document.getElementById('telno').value;
	var biName=document.getElementById('biName').value;
	var bizCat=document.getElementById('bizCat').value;
	var nature=document.getElementById('nature').value;
	var place=document.getElementById('place').value;
	var division=document.getElementById('division').value;
	var startDate=document.getElementById('startDate').value;
	var province=document.getElementById('province').value;
	var rePass=document.getElementById('rePass').value;
	var cPass=document.getElementById('cPass').value;
	
	var regVal= /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/;
	
	if(owName == "" || initialName=="" ||nationality == "" || perAdd=="" ||street == "" || town=="" ||nic == "_________V" || regVal.test(email)==false || email=="" ||telno == "(___) _______" || biName=="" || bizCat=="0" ||nature == "" || place=="" ||division == "0" || startDate=="____/__/__" || province =="" || rePass =="" || cPass =="" || cPass != rePass || cPass.length < 5 )
	{
		alert('Please fill all the required fields correctly..');
		return false;	
	}
	else
	{
		return true;	
	}
	
}



///////////////////////////////////////////////////////////////////////////////////////////////////////

//cancelation validation


function  valiReg(){
	
	var regNo=document.getElementById('regNo');
	
	
	if(regNo.value=="")
	{
		
		document.getElementById('spanReg').innerHTML="*"+"</br>"+ "Required";
		document.getElementById('spanReg').style.color="red";
		document.getElementById('spanReg').style.fontSize="11px";
	}
	else if(regNo.value.length < 6)
	{
		document.getElementById('spanReg').innerHTML="*"+"</br>"+ "Invalid Registration number";
		document.getElementById('spanReg').style.color="red";
		document.getElementById('spanReg').style.fontSize="11px";
	}
	else
	{
		
		document.getElementById('spanReg').innerHTML="*";
		document.getElementById('spanReg').style.color="red";
		document.getElementById('spanReg').style.fontSize="11px";
	}
}



