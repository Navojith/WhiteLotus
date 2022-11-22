

document.getElementById("pwdInput").addEventListener("keyup", validation);
document.getElementById("pwdInput").addEventListener("keyup", checkCharacterCount);

function validation()
{
	var pwdInput = document.getElementById('pwdInput').value;

	var lowercase = /[a-z]/g;

	var uppercase = /[A-Z]/g;

	var number = /[0-9]/g;

	//lowercase check
	if( pwdInput.match(lowercase))
	{
		document.getElementById('lowercase').style.color = "green";
	}
	else
	{
		document.getElementById('lowercase').style.color = "red";
	}


	//uppercase check
	if( pwdInput.match(uppercase))
	{
		document.getElementById('uppercase').style.color = "green";
	}
	else
	{
		document.getElementById('uppercase').style.color = "red";
	}


	//number check
	if( pwdInput.match(number))
	{
		document.getElementById('number').style.color = "green";
	}
	else
	{
		document.getElementById('number').style.color = "red";
	}

}

//character count check
function checkCharacterCount() 
{
	var pwd = document.getElementById('pwdInput').value;
	var count = pwd.length;

	if(count >= 8)
	{
		document.getElementById('letterCount').style.color = "green";
	}
	else
	{
		document.getElementById('letterCount').style.color = "red";
	}
}


//display validation block

document.getElementById("pwdInput").onfocus = function(){
	document.getElementById("pwdValidation").style.display = "block";
}

//hide validation block
document.getElementById("pwdInput").onblur = function(){
	document.getElementById("pwdValidation").style.display = "none";
}



