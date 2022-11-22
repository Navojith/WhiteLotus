
document.getElementById("newpwd").addEventListener("keyup", validation2);
document.getElementById("newpwd").addEventListener("keyup", checkCharacterCount2);

function validation2()
{
	var newpwd = document.getElementById('newpwd').value;

	var lowercase2 = /[a-z]/g;

	var uppercase2 = /[A-Z]/g;

	var number2 = /[0-9]/g;

	//lowercase check
	if( newpwd.match(lowercase2))
	{
		document.getElementById('lowercase2').style.color = "green";
	}
	else
	{
		document.getElementById('lowercase2').style.color = "red";
	}


	//uppercase check
	if( newpwd.match(uppercase2))
	{
		document.getElementById('uppercase2').style.color = "green";
	}
	else
	{
		document.getElementById('uppercase2').style.color = "red";
	}


	//number check
	if( newpwd.match(number2))
	{
		document.getElementById('number2').style.color = "green";
	}
	else
	{
		document.getElementById('number2').style.color = "red";
	}

}

//character count check
function checkCharacterCount2() 
{
	var pwd = document.getElementById('newpwd').value;
	var count = pwd.length;

	if(count >= 8)
	{
		document.getElementById('letterCount2').style.color = "green";
	}
	else
	{
		document.getElementById('letterCount2').style.color = "red";
	}
}

//display validation block

document.getElementById("newpwd").onfocus = function(){
	document.getElementById("pwdHiddenValidation").style.display = "block";
}

//hide validation block
document.getElementById("newpwd").onblur = function(){
	document.getElementById("pwdHiddenValidation").style.display = "none";
}

